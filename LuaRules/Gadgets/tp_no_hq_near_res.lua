function gadget:GetInfo()
        return {
                name                    = "no hq expansion near resources",
                desc                    = "disallow building drop offs too near to minerals",
                author          		= "knorke",
                date                    = "Feb 2010",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true, --      loaded by default?
        }
end

if (not gadgetHandler:IsSyncedCode()) then return end
local mineral =UnitDefNames["fakeblockunit"].id -- UnitDefNames["tptetra"].id
local dropoff = UnitDefNames["tphq_small"].id

function gadget:AllowUnitCreation(unitDefID, builderID, builderTeam, x, y, z)
--return true

	if (unitDefID ~= dropoff) then return true end
	local nearUnits = Spring.GetUnitsInCylinder (x,z, 600, Spring.GetGaiaTeamID ())	
	for i in pairs(nearUnits) do
		if (Spring.GetUnitDefID (nearUnits[i]) == mineral) then return false end
	end
	return true

end