--testing, does not work
function gadget:GetInfo()
  return {
    name      = "transporter death",
    desc      = "passenger from destroyed transports fall down better",
    author    = "knorke",
    date      = "Nov 2011",
    license   = "horse falling!",
    layer     = 0,
    enabled   = false--  loaded by default?
  }
end

if (not gadgetHandler:IsSyncedCode()) then return end



--by unitdestroyed ist GetUnitIsTransporting schon leer.
--if will die then blabla
function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)
	--Spring.Echo ("kaboom")
	local passengers = Spring.GetUnitIsTransporting (unitID)
	--if (passengers) then
--		Spring.Echo ("had passengers:" .. #passengers)
		for _,pID in pairs(passengers) do
		--for i=1,#passengers do
			Spring.Echo ("SetUnitVelocity"..pID)
			--Spring.SetUnitVelocity (pID, 0,0,0)
		end
	--end
end

function gadget:UnitEnteredAir(unitID, unitDefID, teamID)
Spring.Echo ("unitenteretair"..unitID)
end


function gadget:UnitLeftAir(unitID, unitDefID, teamID)
	Spring.Echo ("unitleftair"..unitID)
end

function gadget:GameFrame (f)
if (f%45==0) then Spring.Echo ("lol") end
end

function gadget:UnitUnloaded(unitID, unitDefID, teamID, transportID)	
	Spring.SetUnitVelocity (unitID, 0,0,0)
end