function gadget:GetInfo()
        return {
                name                    = "last of the v9 horses",
                desc                    = "test lol",
                author          		= "knorke",
                date                    = "Nov 2011",
                license  				= "later horses dont be mean.",
                layer            		= 100,
                enabled  = false, --      loaded by default?
        }
end

if (not gadgetHandler:IsSyncedCode()) then return end

 projectiles = {}
 fakeunits = {}

local interceptables = {}
interceptables[WeaponDefNames["tplaunchbox_targetmarker"].id] = true
interceptables[WeaponDefNames["tpheavydude_rocketlaunchernotrack"].id] = true
interceptables[WeaponDefNames["tptank_cannon"].id] = true

function gadget:Initialize()
	for v,k in pairs (interceptables) do
		Script.SetWatchWeapon (v, true)
	end
end
 
 function gadget:GameFrame (f) 
 	--Spring.Echo (f)
	for i in pairs(projectiles) do
	Spring.Echo (f .. " projectile on way")
		local px,py,pz = Spring.GetProjectilePosition (i)		
		Spring.MoveCtrl.SetPosition  (projectiles[i], px,py+50,pz)	-- +50 to prevent collision between fakeunit and projectile
	end
	
 end
 
 function gadget:UnitFinished(unitID, unitDefID, teamID)

 end
 
function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	if fakeunits[unitID] then
		local proID = fakeunits[unitID]
		Spring.SetProjectileMoveControl (proID, true)
		Spring.SetProjectilePosition (proID, 1,1,1)
		Spring.SetProjectileMoveControl (proID, false)
		fakeunits[unitID] = nil
		projectiles[proID] = nil
	end
end

function gadget:ProjectileCreated(proID, proOwnerID, weaponDefID)
	Spring.Echo ("proID="..proID)
	--Spring.Echo ("proOwnerID="..proOwnerID)
	--Spring.Echo ("proName="..(Spring.GetProjectileName (proID) or "nil!"))
	if interceptables[weaponDefID] then
		local x,y,z = Spring.GetProjectilePosition (proID)
		local unitID = Spring.CreateUnit("tphelidrone", x, y+50, z, 0, 0)
		Spring.MoveCtrl.Enable (unitID)
		--Spring.SetUnitCollisionVolumeData (unitID,  1,  1, 1,  1, 1,  0,  0,  0 , 0)
		--Spring.MoveCtrl.SetNoBlocking (unitID, true)
		fakeunits[unitID] = proID
		projectiles[proID] = unitID		
	end
end

function gadget:ProjectileDestroyed(proID)
	Spring.DestroyUnit (projectiles[proID])
end