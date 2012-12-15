--works, problem: repeat:on
function gadget:GetInfo()
  return {
    name      = "only build once",
    desc      = "prevents multiple units of the same type being constructed at the same time (by same player)",
    author    = "knorke",
    date      = "Nov 2011",
    license   = "one horse",
    layer     = 0,
    enabled   = true--  loaded by default?
  }
end

local onceUnits = {}
--onceUnits[UnitDefNames["tpjeep"].id] = true
--onceUnits[UnitDefNames["tptank"].id] = true

for id,unitDef in pairs(UnitDefs) do
	if (string.find (UnitDefs[id].name, "tpupgrade")) then --all units starting with "tpupgrades" should only be buildable once
		onceUnits[id] = true
	end
end

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	if (onceUnits[unitDefID] and Spring.ValidUnitID (builderID)) then
		--Spring.Echo ("once unit"..unitDefID .. "-"..UnitDefNames["tpjeep"].id)
		local builderDefID = Spring.GetUnitDefID (builderID)
		local builders = Spring.GetTeamUnitsByDefs (teamID, builderDefID)
		local units = Spring.GetTeamUnitsByDefs (teamID, unitID)
		
		-----multiple builders started building the unit at the same moment
		if (#units>1) then
			for i=1,#units-1 do		--destroy all units (=0% nanoframes) but one
				Spring.DestroyUnit (units[i])
			end
		end		
		--remove the buildorder from all builders but this one
		for i=1,#builders do
			if (builders[i]~=builderID) then
			Spring.GiveOrderToUnit(builders[i], -unitDefID, {},{"right", "ctrl"} ) --right click while holding ctrl = delete 20 buildorders
			end
		end
		---------
		---------workaround for repeat:on -> check for tech
		if (GG.techTriggerUnits[unitName(unitID)]) then
			local techName = GG.techTriggerUnits[unitName(unitID)]--.techName
			--Spring.Echo ("techName:" .. techName)
			local hasTech = Spring.GetTeamRulesParam(teamID,techName) or 0
			if (hasTech~=0) then
				--Spring.Echo (hasTech or 666)
				Spring.GiveOrderToUnit(builderID, -unitDefID, {},{"right", "ctrl"} )
				Spring.DestroyUnit (unitID)
			end
		end
	end
end

--when a builder is already busy making this unit _right now_, disallow giving the order to other builders
function gadget:AllowCommand(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag, synced)
	if (onceUnits[-cmdID] and not cmdOptions["right"]) then	--allow canceling orders by rightclick
		if ((cmdOptions["ctrl"] or cmdOptions["shift"]) and not cmdOptions["right"]) then return false end	--shift=5x, ctrl=20x bauen, das geht sowieso gar nicht klar.--"not right" muss nochmal rein weil "ctrl right" zum canceln benutzt wird
		--Spring.Echo ("trying to build a once!")
		if (#Spring.GetTeamUnitsByDefs (unitTeam, -cmdID) > 0) then
			--Spring.Echo ("already exists")
			return false				
		end
		
	end
	return true
end

--***needed because stupid teching gadget uses unitnames instead of unitdefids
function unitName (unitID)
	if (not Spring.ValidUnitID (unitID)) then return "!invalid unitID in unitName()!" end
	local udID =Spring.GetUnitDefID(unitID)
	local uDef = UnitDefs [udID]
	return uDef.name
end