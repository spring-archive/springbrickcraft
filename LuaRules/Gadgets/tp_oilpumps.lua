function gadget:GetInfo()
  return {
    name      = "manage oilpumps",
    desc      = "yup",
    author    = "knorke",
    date      = "Dec 2011",
    license   = "gooooooooooodbye horses",
    layer     = 1,
    enabled   = true,
  }
end

local oilpumpDefID = UnitDefNames["tpoilpump"].id

include("LuaRules/Configs/tp_CMDID.lua")

if (not gadgetHandler:IsSyncedCode()) then return end

--used by resource spawner
function SpawnOilPump (x,z)
	local rotation = math.random(0,math.pi)				
	local unitID= Spring.CreateUnit("tpoilpump", x, 0, z, rotation, Spring.GetGaiaTeamID())
	Spring.GiveOrderToUnit(unitID, CMD.ONOFF, { 0 }, {} )
    Spring.SetUnitAlwaysVisible(unitID, true)
	Spring.SetUnitNeutral(unitID, true)
	--Spring.SetUnitNoSelect(unitID, true)
end
GG.SpawnOilPump = SpawnOilPump

function gadget:Initalize() 
	Spring.Echo ("tp_oilpumps.lua initalize()")
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
	--Spring.Echo ("tp_timewarping.lua: unit created" .. CMD_DO_TIMEWARP)
	--if capturableNames[unitDefID] then
		--Spring.SetUnitNeutral
	--end
end


function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
	if (capture and unitDefID == oilpumpDefID) then
		if (oldTeam == Spring.GetGaiaTeamID() and newTeam~= Spring.GetGaiaTeamID()) then
			Spring.AddTeamResource (newTeam, "metal", 500)
			Spring.Echo ("Captured neutral Pump: 500 Bonus!")
		end
	end
	return true
end