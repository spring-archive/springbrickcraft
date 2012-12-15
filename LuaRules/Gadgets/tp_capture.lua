function gadget:GetInfo()
        return {
                name                    = "linked unit exploder",
                desc                    = "if the builder of a unit dies, that unit also dies",
                author          		= "knorke",
                date                    = "Feb 2010",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true, --      loaded by default?
        }
end

local controlledUnits = {}
controllerWeapon[WeaponDefNames["tpjeep_gatling"].id] = true

if (gadgetHandler:IsSyncedCode()) then

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)	

end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID)

end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID,attackerID, attackerDefID, attackerTeam)
	if not (weaponID and controllerWeapon [weaponID]) return end
	if controlledUnits [unitID] then return end
	if (not spValidUnitID(unitID)) or (not weaponID) or (not attritionWeaponDefs[weaponID]) or ((not attackerID) and attritionWeaponDefs[weaponID].noDeathBlast) 
		or (attritionWeaponDefs[weaponID].scaleSlow and damage == 0) then 
		return damage
end












function unitname (unitID)--****
	if (not unitID) then return "unitname () no unitID given" end
	local unitDefID = Spring.GetUnitDefID(unitID)
	if (unitDefID) then
		local unitDef = UnitDefs[unitDefID]
		if (unitDef) then
			return unitDef.name
		end
	end
	return "unitname(): invalid unit id"
end

function marker_on_unit (_uID, _text)
	if (markers == false) then return end
	if (_uID == nil) then return end
	if (_text == nil) then return end
	local x,y,z=Spring.GetUnitPosition (_uID)
	if (x == nil or y == nil or z == nil) then return end
	Spring.MarkerAddPoint (x,y,z, _text .. "id:" .. _uID)
end

end