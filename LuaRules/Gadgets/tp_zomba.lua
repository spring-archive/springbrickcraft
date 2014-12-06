--todo: check if buildprogress==100, rotation
function gadget:GetInfo()
        return {
                name                    = "zomba",
                desc                    = "makes zombas",
                author          		= "knorke",
                date                    = "2012",
                license  				= "later horses dont be zomba.",
                layer            		= 0,
                enabled  = true,
        }
end
--when this   kills something, creates this:
--        v                              v
--zomba[attacker]             =       result

--also possible:
--when   this kills this creates this
--          v         v			   v
--zomba [attacker][victim]   =   result

--when something should turn into a new, no matter what killed it:
-- anything kills this creates this
--      v          v            v
--zomba[ZOMBO][victim] =     result

if (not gadgetHandler:IsSyncedCode()) then return end


local ZOMBO = "anything at all"

local zomba = {
--when a scorpion kill a dude, the dude dies so hard he turns into a helicopter and converts to your team:
-- [UnitDefNames["tpscorpion"].id] = {[UnitDefNames["tpdude"].id] = {unit=UnitDefNames["tphubschrauber"].id, killerTeam=true,}, } ,




[ZOMBO] = { 
--when a tank is destroyed (no matter by what) a dude escapes from it, like the technicans in C&C:
[UnitDefNames["tptank"].id] = {unit=UnitDefNames["tpdude"].id, killerTeam=false, hop=false, } ,
[UnitDefNames["tpheavytank"].id] = {unit=UnitDefNames["tpdude"].id, killerTeam=false, hop=false, } ,
},
--pilot from helicopter


--jeep turns everything it kills into a new jeep (for its team)
-- [UnitDefNames["tpjeep"].id] = {unit=UnitDefNames["tpjeep"].id, killerTeam=true,} ,
}

--checking buildprogess==1 in UnitDestroyed does not work
local finishedUnits = {}
function gadget:UnitFinished(unitID, unitDefID, teamID)
	finishedUnits[unitID] = true
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)	
	if (not finishedUnits[unitID]) then return end
	local result = nil
	if (zomba[attackerDefID]) then	
			if zomba[attackerDefID][unitDefID] then
				result = zomba[attackerDefID][unitDefID]		
		else
			result = zomba[attackerDefID]
		end
	end
	
	if (result==nil and zomba[ZOMBO]) then
		result = zomba[ZOMBO][unitDefID]
	end
	
	if (result) then
		local x,y,z = Spring.GetUnitPosition (unitID)
		if (result.killerTeam) then 
			teamID = attackerTeamID
		end
		local newUnit = Spring.CreateUnit (result.unit, x,y,z, 0, teamID)
		if result.hop then 
			GG.addHopper (newUnit, 0, 0, result.hop.h )
		end
	end
	finishedUnits[unitID] = nil
end