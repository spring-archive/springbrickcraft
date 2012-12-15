function gadget:GetInfo()
        return {
                name                    = "last of the v8 horses",
                desc                    = "test lol",
                author          		= "knorke",
                date                    = "Nov 2011",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true, --      loaded by default?
        }
end



if (not gadgetHandler:IsSyncedCode()) then return end

local clusterWeapon = {}
clusterWeapon[WeaponDefNames["tplaunchbox_targetmarker"].id] = true -- {id=WeaponDefNames["tplaunchbox_cannon"].id,}
clusterWeapon[WeaponDefNames["tpheavydude_rocketlaunchertrack"].id] = true


function gadget:Initialize()
	for v,k in pairs (clusterWeapon) do	
		Script.SetWatchWeapon (v, true)
	end
end

local speed = 5
local interceptors = {}
local interceptorLaunchers = {}

local interceptorLauncherType = UnitDefNames["tpjeep"].id
 
 local verticalProjectiles = {}
 
 function gadget:GameFrame ()
 	for i in pairs(interceptors) do		
		local px,py,pz = Spring.GetProjectilePosition (i)
		local x,y,z=Spring.GetUnitPosition (interceptors[i])
		if (Spring.ValidUnitID (interceptors[i])) then --FIXME: remove from table
			x = approach (x, px , speed)
			y = approach (y, py , speed)
			z = approach (z, pz , speed)		
			--Spring.MarkerAddPoint (x,y,z)
			Spring.MoveCtrl.SetPosition  (interceptors[i], x,y,z)
		end
	end
	----
	local toRemove = {}
	for i in pairs(verticalProjectiles) do
		verticalProjectiles[i].y=verticalProjectiles[i].y+10
		verticalProjectiles[i].t=verticalProjectiles[i].t-1
		Spring.SetProjectilePosition (i, verticalProjectiles[i].x, verticalProjectiles[i].y, verticalProjectiles[i].z)
		if (verticalProjectiles[i].t < 1) then
			Spring.SetProjectileMoveControl (i, false)
			toRemove[i] = true
		end
	end
	
	for i in pairs(toRemove) do
		verticalProjectiles[i] = nil
	end
	
 end
 
 function gadget:UnitFinished(unitID, unitDefID, teamID)
	interceptorLaunchers[unitID] = true
 end
 
function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	interceptorLaunchers[unitID] = nil
end

function gadget:ProjectileCreated(proID, proOwnerID)
	Spring.Echo ("proID="..proID)
	--Spring.Echo ("proOwnerID="..proOwnerID)
	--Spring.Echo ("proName="..(Spring.GetProjectileName (proID) or "nil!"))
	
	if Spring.GetProjectileName (proID) == "tpheavydude_rocketlaunchertrack" then
		local x,y,z = Spring.GetProjectilePosition (proID)
		Spring.SetProjectileMoveControl (proID, true)		
		verticalProjectiles[proID] = {t=15, x=x,y=y,z=z}
			--Spring.SetProjectileSpinVec (proID, x,1,0)
			--Spring.SetProjectileSpinSpeed (proID, 500)
			--Spring.SetProjectileSpinAngle (proID, 100)
			Spring.SetProjectileVelocity (proID, 0,0,0)
		
	end


	if Spring.GetProjectileName (proID) == "tplaunchbox_targetmarker" then
		local x,y,z = Spring.GetProjectilePosition (proID)
		interceptors [proID] = {} -- {x=x, y=y, z=z,}		
		
		for i in pairs(interceptorLaunchers) do		
			local x,y,z=Spring.GetUnitPosition (i)
			--Spring.MarkerAddPoint (x,y,z, "launcher here")
			local unitID = Spring.CreateUnit("tphelidrone", x, y, z, 0, 0)
			Spring.MoveCtrl.Enable (unitID)
			interceptors [proID] = unitID
			return
		end
	end
end

function gadget:ProjectileDestroyed(proID)
	interceptors [proID] = nil
	verticalProjectiles[proID] = nil
end


function approach (currentX, targetX, speed)
	local newX = currentX
	local diff = currentX - targetX
	local hasReached = false
	if (math.abs (diff) < speed) then
		currentX = targetX
		hasReached = true
	else
		if diff < 0 then 
			newX = newX + speed
		else 
			newX = newX - speed
		end
	end
	return newX, hasReached, newX-currentX
end