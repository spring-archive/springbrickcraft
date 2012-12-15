function gadget:GetInfo()
	return {
	name                    = "unit death explosions",
	desc                    = "spawn cegs for destroyed units",
	author                  = "knorke",
	date                    = "Aug 2012",
	license                 = "later horses dont be mean.",
	layer                   = 1,
	enabled  = true, --      loaded by default?
	}
end
 
if (not gadgetHandler:IsSyncedCode()) then return end
local udn = UnitDefNames

local explosion = {}


explosion [udn["tptank"].id] = {"tporangeimpact"}
explosion [udn["tpvierling"].id] = {"tpblackcone"}
explosion [udn["tpheavytank"].id] = {"tpblackcone"}
explosion [udn["tpbigwheel"].id] = {"tpeletricblueexplosion", "tpeletricblueexplosion2"}

--place holders until something better:
explosion [udn["tpjeep"].id] = {"tpblackcone"}
explosion [udn["tpgripper"].id] = {"tpblackcone"}
explosion [udn["tplaunchbox"].id] = {"tpblackcone"}
explosion [udn["tpheliport"].id] = {"tpblackcone"}
explosion [udn["tppioneer"].id] = {"tpblackcone"}
explosion [udn["tpplatefactory"].id] = {"tpblackcone", "tpeletricblueexplosion2"}
 
function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID)	
	if explosion [unitDefID] then
		local i = math.random(1, #explosion [unitDefID])
		local x,y,z=Spring.GetUnitPosition (unitID) --FIXME: ,true oder so, damit center of model		
		Spring.SpawnCEG(explosion [unitDefID][i], x, y+10, z)
--		--Spring.PlaySoundFile ("bla", x,y,z, "battle")
	end
end