function gadget:GetInfo()
        return {
                name                    = "freezer weapon",
                desc                    = "freezes movement but not the weapon",
                author          		= "knorke",
                date                    = "Nov 2011",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true, --      loaded by default?
        }
end



if (not gadgetHandler:IsSyncedCode()) then return end

local freezerWeapon = {}
--chainWeapons[WeaponDefNames["tpjeep_gatling"].id] = true
--clusterWeapon[WeaponDefNames["dualcannon"].id] = {id=WeaponDefNames["dualcannon"].id, cluster=10}


freezerWeapon[WeaponDefNames["empspark"].id] = true -- {id=WeaponDefNames["tplaunchbox_cannon"].id,}

local frozenUnitsPerFrame = {} --  [frameWhenUnfreeze] = {unitID1, unitID2, ...}
local frozenUnits = {} --  [unitID] 
local frame = 0

function gadget:Initialize()

end



function gadget:UnitPreDamaged (unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam) 
	if weaponID and freezerWeapon[weaponID] then
		freezeUnit (unitID, 300)
		return 0
	end
return damage
end

function freezeUnit (unitID, freezeTime)
	--Spring.Echo ("freeze: " .. unitID)
	if not frozenUnitsPerFrame[frame+freezeTime] then frozenUnitsPerFrame[frame+freezeTime] = {} end
	frozenUnitsPerFrame[frame+freezeTime][unitID] = true
	frozenUnits[unitID] = true
	Spring.MoveCtrl.Enable (unitID)
	local x,y,z=Spring.GetUnitPosition (unitID)
	
	Spring.SetUnitPosition (unitID, x,y+50,z)
	--Spring.MoveCtrl.SetPosition (unitID, x,y+50,z) --no difference as i see
	local a = 4
	Spring.MoveCtrl.SetRotationVelocity(unitID, 0, math.random (-a,a)/10, 0)
end

function unfreezeUnit (unitID)	
	--Spring.Echo ("UNfreeze: " .. unitID)
	Spring.MoveCtrl.Disable (unitID)	
end

function gadget:GameFrame (f)
	frame = f
	if frozenUnitsPerFrame[f] then
		for unitID in pairs(frozenUnitsPerFrame[f]) do
			unfreezeUnit (unitID)
			frozenUnits[unitID] = nil
		end
	frozenUnitsPerFrame[f] = nil
	end
end