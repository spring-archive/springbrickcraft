function gadget:GetInfo()
    return {
        name    = "Horst AI",
        desc    = "the gayest of them all, based on CT's schwarm AI",
        author  = "knorke",
        date    = "Jan 2011",
        license = "goodbye hooorses",
        layer   = 82, --yo
        version = "v1",
		enabled = true
    }
end

if (not gadgetHandler:IsSyncedCode()) then return end
---------FIGHT UNITS: units that will react to attack or defend---------
--use unitDefID***
fightUnits = {
["tptank"]=true,
["tpjeep"]=true,
["tpdude"]=true,
["tpheavydude"]=true,
["tpheavytank"]=true,
}


------SYNCED--------
-----STAGE SYSTEM--------
local unitOnMission = {} --[unitID] = wieviele frames in ruhe gelassen werden
stages = {}
--skipMetal: if we have that much metal, then this stage is autocomplete/skipped

stages[1]= {
	["unitNumbers"]={
		["tpsmallfac"]=2,
		["tpdude"]=4,
		},
	skipMetal = math.huge,
	}

stages[2]= {
	["unitNumbers"]={
		["tpfactory2"]=1,
		["tpgripper"]=1,
		["tpdude"]=10,
		},
	skipMetal = math.huge,
	}

stages[3]= {
	["unitNumbers"]={
		["tpfactory2"]=1,
		["tpgripper"]=1,
		["tpdude"]=10,
		},
	skipMetal = math.huge,
	}
	
stages[4]= {
	["unitNumbers"]={
		["tpjeep"]=3,		
		["tpheavydude"]=10,		
		},
	skipMetal = 2000,
	}
	
stages[5]= {
	["unitNumbers"]={
		["tpgripper"]=2,
		["tptank"]=5,
		["tpsmallfac"]=3,
		["tpfactory2"]=2,
		},
	skipMetal = math.huge,
	}
stages[6]= {
	["unitNumbers"]={		
		["tpturretcenter"]=1,
		["tpgripper"]=3,
		["tpsmallfac"]=4,
		["tpheavydude"]=4,
		},
	skipMetal = math.huge,
	}
stages[7]= {
	["unitNumbers"]={
		["tpgunturret"]=1,
		["tpdude"] = 15,
		},
	skipMetal = math.huge,
	}
	
stages[8]= {
	["unitNumbers"]={
		["tpwarpantenne"]=1,		
		},
	skipMetal = math.huge,
	}
stages[9]= {
	["unitNumbers"]={
		["tpplatefactory"]=1,
		},
	skipMetal = math.huge,
	}
stages[10]= {
	["unitNumbers"]={
		["tpheliport"]=1,
		["tpheavytank"]=5,
		},
	skipMetal = math.huge,
	}
stages[11]= {
	["unitNumbers"]={
		["tphubschrauber"]=1,
		},
	skipMetal = math.huge,
	}
--unused/unimplented
local delayedOrder = {} -- [frameWhenToExecute] "Spring.GiveOrder blablabla"
	
--funzt!
function printStages ()
	Spring.Echo ("--printing stages table *START*--")
	for i=1, #stages do
		Spring.Echo ("stages [" .. i  .. "]")
		Spring.Echo ("skipMetal=" .. stages[i].skipMetal)
		for name, amount in pairs (stages[i]["unitNumbers"]) do
			Spring.Echo ("unitNumbers:" .. name .. " - " .. stages[i]["unitNumbers"][name])
		end
	end
	Spring.Echo ("--printing stages table *DONE*--")
end

-----REVENGE-------
revengeMe = {}	-- [unitID]=p --if unit is destroyed, p percent of all AIs unit will fight-move to its last position
--idea: r=radius: only units in this radius react (eg for defenders or when turrets get destroyed)
--idea: sowas ähnliches, aber helpMeWhenAttacked

--funzt!
--return: isComplete, missing table
function stageComplete (teamID, stage)
	--alle einheiten da die wir brauchen?
	local missing = {}	--[unitname] = wie viele davon noch gebraucht werden
	for name, amount in pairs (stage["unitNumbers"]) do
		--Spring.Echo ("enough " .. name .. "?")
		local unitDefID =UnitDefNames[name].id
		--Spring.Echo (unitDefID)
		local have = Spring.GetTeamUnitDefCount (teamID, unitDefID)
		local shouldHave = stage["unitNumbers"][name]
		if (have < shouldHave) then missing[name] = shouldHave-have end
	end
	if (next(missing) == nil) then return true end
	--genug metal da? dann autocomplete!
	if (Spring.GetTeamResources (teamID, "metal") > stage.skipMetal) then return true, missing end	--ich kauf den ganzen laden!
	return false, missing
end

--return: stagei, missing table
function getHighestCompleteStage (teamID)	
	for i=1, #stages do
		local complete, missing = stageComplete (teamID, stages[i])
		if (complete == false) then return i-1,missing end
	end
	return #stages, nil
end

--job: ["unitname"] = amount
--***problem: es wird alles mehrfach gebaut weil es im nächsten frame%30 wieder vergeben wird
--braucht also ein inProgress array.
function makeSomeUnits (teamID, job)
local all_units = Spring.GetTeamUnits (teamID)
if (all_units == nil) then return end
	for name, amount in pairs (job) do
		--Spring.Echo ("team " .. teamID .." wants to build " .. amount .. "x " ..name)
		local assigned = 0
		for i,unitID in pairs(all_units) do
			--if (job[name] <= 0) then break end --if the job is already split between builders, break
			if (assigned >= amount) then break end
			local canDo = canUnitBuildThis (unitName (unitID), name)
			if (canDo) then 
				local msg = unitID .. " can do it"
				local wantDo = doesUnitWantBuildJob (unitID, name)
				if (wantDo) then
					msg = msg .. " and wants to do it!"
					--job[name] = job[name] -1
					assigned = assigned +1					
					buildUnit (unitID, name)
					if (assigned >= amount) then break end
				else
					msg = msg .. " but is busy!"
				end
			--else
				--Spring.Echo ("nobody can do it")
			end
		end
	end
end

--naja
function canUnitBuildThis (parentName, childName)
	if (parentName == "tpplatefactory") then
	--Spring.Echo (childName)
		if (childName == "tpheavytank") then return true end
		if (childName == "tppioneer") then return true end		
	end
	if (parentName == "tphq") then
		if (childName == "tpsmallfac") then return true end
		if (childName == "tpfactory2") then return true end
		if (childName == "tpturretcenter") then return true end
		if (childName == "tpwarpantenne") then return true end
		if (childName == "tpplatefactory") then return true end
		if (childName == "tpheliport") then return true end
	end
	
	if (parentName == "tpsmallfac") then
		if (childName == "tpdude") then return true end
		if (childName == "tpheavydude") then return true end
	end
	
	if (parentName == "tpturretcenter") then
		if (childName == "tpgunturret") then return true end
	end
	
	if (parentName == "tpfactory2") then
		if (childName == "tpgripper") then return true end
		if (childName == "tpjeep") then return true end
		if (childName == "tptank") then return true end
	end
	if (parentName == "tpheliport") then
		if (childName == "tphubschrauber") then return true end
	end
	
	return false
end

function doesUnitWantBuildJob (unitID, childname)
	local _, _, _, _, buildProg = Spring.GetUnitHealth(unitID)
	if buildProg < 1 then return false end
	
	--if ((unitOnMission[unitID] and unitOnMission[unitID] >0) and unitIsMobile(unitID)) then return false end
	--if ((unitOnMission[unitID] and unitOnMission[unitID] >0) ) then return false end
	
	if (#Spring.GetFullBuildQueue  (unitID) == 0) then return true end --nur eine sache pro fabrik gleichzeitig bauen
	
	return false
end

function buildUnit (unitID, jobname)
	--if (unitName (unitID) ==  "kdroneminingtower" and jobname == "kdroneengineer") then undeploy (unitID) end
	
	if (unitName (unitID) == "tpsmallfac") then
		Spring.GiveOrderToUnit(unitID, -UnitDefNames[jobname].id, {}, {}) --bauen
		moveAway (unitID, 1000)	--waypoint
		return
	end
	
	if (unitName (unitID) == "tpfactory2") then
		Spring.GiveOrderToUnit(unitID, -UnitDefNames[jobname].id, {}, {}) --bauen
		moveAway (unitID, 1000)	--waypoint
		return
	end
	
	if (unitName (unitID) == "tpplatefactory") then
		Spring.GiveOrderToUnit(unitID, -UnitDefNames[jobname].id, {}, {}) --bauen
		moveAway (unitID, 1000)	--waypoint
		return
	end
	
	if (unitName (unitID) == "tpheliport") then
		Spring.GiveOrderToUnit(unitID, -UnitDefNames[jobname].id, {}, {}) --bauen
		moveAway (unitID, 1000)	--waypoint
		return
	end
	
	if (unitName (unitID) == "tphq") then
			local ux,uy,uz = Spring.GetUnitPosition (unitID)
			local x,y,z = getBuildSpot (ux,uy,uz, jobname, 800, 50)
			Spring.GiveOrderToUnit(unitID, -UnitDefNames[jobname].id, {x,y,z}, {}) --bauen
		return
	end	
	
	if (unitName (unitID) == "tpturretcenter") then 
			local ux,uy,uz = Spring.GetUnitPosition (unitID)
			local x,y,z = getBuildSpot (ux,uy,uz, jobname, 200, 10)
			Spring.GiveOrderToUnit(unitID, -UnitDefNames[jobname].id, {x,y,z}, {}) --bauen
		return
	end
end

function unitName (unitID)
	if (not Spring.ValidUnitID (unitID)) then return "!invalid unitID in unitName()!" end
	local udID =Spring.GetUnitDefID(unitID)
	local uDef = UnitDefs [udID]
	return uDef.name
end

--returns how many kdroneengineer and kdroneminingtowers a team has
--function countTowersAndEngineer (teamID)
--	return #Spring.GetTeamUnitsByDefs (teamID, {UnitDefNames["kdroneminingtower"].id}) + Spring.GetTeamUnitsByDefs (teamID, {UnitDefNames["kdroneengineer"].id})
--end

function unitCount (teamID, unitName)
	return #Spring.GetTeamUnitsByDefs (teamID, {UnitDefNames[unitName].id}) or 0
end
------------


myTeam = {} --enthält alle teamids für die wir spielen, [1]=3, [2]=7 etc
local data = {} -- [teamID].threatmap etc
 
function gadget:Initialize()
	counter = 0
    -- Initialise AI for all teams that are set to use it
    for _,t in ipairs(Spring.GetTeamList()) do
        local _,_,_,ai,side = Spring.GetTeamInfo(t)
        if ai and Spring.GetTeamLuaAI(t) == gadget:GetInfo().name then
            --log(t, " assigned to "..gadget:GetInfo().name)
            local pos = {}
            local home_x,home_y,home_z = Spring.GetTeamStartPosition(t)
			myTeam[t] = t
			data[t] = {}			
			Spring.Echo ("Horst AI will play for team  " .. t .." GetTeamLuaAI: " ..  Spring.GetTeamLuaAI(t))
		end
    end
	if (myTeam == nil) then 
		Spring.Echo ("Horst AI: not used, byebye.")
		gadgetHandler:RemoveGadget()
	end
--	printStages ()	
end

--do stuff with the start units at gamestart (actually a bit later so that startunits,resources etc are all in place)
function orderStartUnits ()
	for _,t in pairs(myTeam) do
	local all_units = Spring.GetTeamUnits (t)
		if (all_units) then
			for i,unitID in pairs(all_units) do
				--moveAway (unitID, 100)
				if (unitName (unitID)=="tpgripper") then GG.cmd_go_mining (unitID) end	--send startunit miners to mine
			end
		end
	end	
end


function think (teamID, data)
	return data
end

function gadget:UnitIdle(unitID, unitDefID, teamID)
	unitOnMission[unitID] = nil	
	--moveAway (unitID, 100)
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID)
	if (isTeamCBM (teamID)) then
		if (revengeMe[unitID]) then  --gebäude auch nicht!+++
			local x,y,z = Spring.GetUnitPosition (unitID)
			doAttackSpot (teamID,x,y,z, revengeMe[unitID])
			revengeMe[unitID] = nil
		end
	unitOnMission[unitID] = nil
	end
end	
	
function gadget:GameFrame(frame)
--delayed orders--
	--if (delayedOrder[frame]) then
		
		--delayedOrder[frame] = nil
	--end

-----------------
	if (frame == 90) then orderStartUnits() end
	for i in pairs(unitOnMission) do
		unitOnMission[i] = unitOnMission[i] -1
		if (unitOnMission[i] < 0) then unitOnMission[i] = 0 end
	end

	if (frame % 45 ~=0) then return end -- %30
	--Spring.Echo ("läuft")
	for _,t in pairs(myTeam) do
		--Spring.Echo ("SchwarmAI is playing for team " .. myTeam[t])		
		local h, missing = getHighestCompleteStage (myTeam[t])
		--Spring.Echo ("team " .. myTeam[t] .. " is at stage " .. h)
		if (missing) then
			makeSomeUnits (myTeam[t], missing)
		end
		
	--data = think (teamID, data[teamID]
		--
		
		--clonetest(myTeam[t])
	end
end

---------ACTIONS/COMMANDS-----------------
function machGo (teamID) --alle rushen mit
	Spring.Echo ("LETS MOVE IT!")
	local all_units = Spring.GetTeamUnits (teamID)
	if (all_units == nil) then return end		
	for i,unitID in pairs(all_units) do
		if (Spring.ValidUnitID (unitID) and unitname~="tpgripper") then
			local x = math.random(Game.mapSizeX)
			local z = math.random(Game.mapSizeZ)
			Spring.GiveOrderToUnit(unitID, CMD.FIGHT , {x, Spring.GetGroundHeight (x,z), z  }, {})
		end
	end
end

--send p percent of all units to x y z
function doAttackSpot (teamID,x,y,z, p, params)
	p = (p or 0.25) * 100
	local all_units = Spring.GetTeamUnits (teamID)
	if (all_units == nil) then return end
	for i,unitID in pairs(all_units) do
		if (Spring.ValidUnitID (unitID) and fightUnits[unitName(unitID)]==true) then
			if (math.random (0,100) > p) then
				Spring.GiveOrderToUnit(unitID, CMD.FIGHT , {x, Spring.GetGroundHeight (x,z), z  }, {params})
			end
		end
	end
end

--send unit across map, other units will avenge its death!
function doRevengeScouting (unitID, p, params)
	revengeMe[unitID] = p or 0.25
	local d = 1000
	Spring.GiveOrderToUnit(unitID, CMD.MOVE , {Game.mapSizeX/2, 0, Game.mapSizeZ/2  }, {params})
	Spring.GiveOrderToUnit(unitID, CMD.PATROL , {Game.mapSizeX-d, 0, d  }, {"shift"})
	Spring.GiveOrderToUnit(unitID, CMD.PATROL , {Game.mapSizeX-d, 0, Game.mapSizeZ-d}, {"shift"})
	Spring.GiveOrderToUnit(unitID, CMD.PATROL , {d, 0, d}, {"shift"})
	Spring.GiveOrderToUnit(unitID, CMD.PATROL , {d, 0, Game.mapSizeZ-d}, {"shift"})
end

function moveTo (unitID, tx, tz, keys)
	Spring.GiveOrderToUnit(unitID, CMD.MOVE , {tx, Spring.GetGroundHeight (tx,tz), tz  }, {keys})
end

--move away from current position
function deployNearRes (unitID, keys)
	local nearest_resID, rx,ry,rz, nearest_res_distance  = nearestResFromUnit (unitID)
	--local ux,uy,uz = Spring.GetUnitPosition (unitID)
	local x,y,z = getBuildSpot (rx,ry,rz, "kdroneminingtower", 20, 5)
	deployAt (unitID,  x,z , keys)
end

--engineer geht zu x:z und morpht sich zum mining tower
--funzt!
function deployAt (unitID, tx,tz, keys)
	Spring.GiveOrderToUnit(unitID, CMD.MOVE , {tx, Spring.GetGroundHeight (tx,tz), tz  }, {keys})
	Spring.GiveOrderToUnit(unitID, 31210,{UnitDefNames["kdroneminingtower"].id},{"shift"})
end

function undeploy (unitID)
	Spring.GiveOrderToUnit(unitID, 31210,{UnitDefNames["kdroneengineer"].id},{})
end

function do_attacknearest (unitID)
	local enemy = Spring.GetUnitNearestEnemy (unitID)
	if (enemy) then 
		Spring.GiveOrderToUnit(unitID, CMD.ATTACK  , { enemy  }, {}) 
	end
end

function cloneUnit (unitID, cloneDef)
	if Spring.ValidUnitID (unitID) then
		Spring.GiveOrderToUnit(unitID, 33333,{cloneDef},{})
	end
end

function undeployRandomMiningTowers (teamID, n)
end
---military logic
function moveAway (unitID, r, keys)
	local x,y,z = Spring.GetUnitPosition (unitID)
	if (x and y and z) then
		local a = math.rad (math.random (0,360))
		x = x + (math.sin (a) * r)
		z = z + (math.cos (a) * r) 
		moveTo (unitID, x, z, keys)
	end
end

function patrolAway (unitID, r, keys)
	local x,y,z = Spring.GetUnitPosition (unitID)
	if (x and y and z) then
		local a = math.rad (math.random (0,360))
		tx = x + (math.sin (a) * r)
		tz = z + (math.cos (a) * r) 
		Spring.GiveOrderToUnit(unitID, CMD.PATROL , {tx, Spring.GetGroundHeight (tx,tz), tz  }, {keys})
	end
end


function guardRandomHarvester (unitID)
	local t = Spring.GetUnitTeam (unitID)
	local miners = Spring.GetTeamUnitsByDefs (t, UnitDefNames["tpgripper"].id)
	if (miners) then
		if (#miners==1) then
			guardedUnit=miners[1]
		end
		if (#miners>1) then
			guardedUnit = miners[math.random (1, #miners)]
		end	
		if (guardedUnit	and	Spring.ValidUnitID (guardedUnit)) then		
			Spring.GiveOrderToUnit(unitID, CMD.GUARD  , {guardedUnit}, {})
		end
	end	
end


----------TICK TACK LOGIC (gets executed check every nth frame)------
function undeployEmptyMiningTowers (teamID)
	local mtowers = Spring.GetTeamUnitsByDefs (teamID, {UnitDefNames["kdroneminingtower"].id})
	--Spring.Echo ("#mtowers:" .. #mtowers)
	for i in pairs (mtowers) do
		local nearest_resID, rx,ry,rz, nearest_res_distance  = nearestResFromUnit (mtowers[i])
		if ((nearest_res_distance or 0) > 150) then undeploy (mtowers[i]) end
	end
end

--[[
function sendOutIdleEngineers (teamID)
	local engs = Spring.GetTeamUnitsByDefs (teamID, {UnitDefNames["kdroneengineer"].id})
	if (engs == nil) then return end
	--Spring.Echo ("#mtowers:" .. #mtowers)
	for i in pairs (engs) do
		if (Spring.ValidUnitID (engs[i])) then		
			if (not Spring.GetCommandQueue(engs[i])) then 
				Spring.Echo ("engineer " .. engs[i] .. " has nothing to do and runs away, lol")
				moveAway (engs[i], 1000)
				deployNearRes (engs[i], "shift")
			end
		end
	end
end
--]]

function clonetest (teamID)
	local munits = Spring.GetTeamUnitsByDefs (teamID, {UnitDefNames["kdroneengineer"].id})
	for i in pairs (munits) do
		cloneUnit (munits[i], UnitDefNames["kdroneengineer"].id)
	end
end
------------------------------------------------------
--function gadget:UnitFromFactory(unitID, unitDefID, unitTeam, factID, factDefID, userOrders)
--	if (factID) then unitOnMission [unitID] = 30 end
--end

function gadget:UnitFinished(unitID, unitDefID, teamID)		
	if (isTeamCBM (teamID)) then
		Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, { 2 }, {})
		if (unitName (unitID)=="tpjeep") then
			local x,y,z = Spring.GetUnitPosition(unitID)
			Spring.GiveOrderToUnit(unitID, CMD.LOAD_UNITS , {x,y,z,500}, {})			 
			if (math.random (1,100) > 80) then
				guardRandomHarvester (unitID, "shift")
				revengeMe[unitID] = 0.75
			else			
				doRevengeScouting (unitID, 0.2, "shift")
			end
			return
		end
		
		if (unitName (unitID)=="tpdude") then
			local what = math.random (1,100)
			if (what > 80) then
				doRevengeScouting (unitID, 0.75)
			elseif (what > 50) then
				guardRandomHarvester (unitID)
				revengeMe[unitID] = 0.5
			else
				patrolAway (unitID, 500)
			end
			return
		end
		
		if (unitName (unitID)=="tphubschrauber") then
			doRevengeScouting (unitID, 0.75)
		end
		
		if (unitName (unitID)=="tpgripper") then
			--Spring.GiveOrderToUnit(unitID, 70703 , {}, {})  --use constant
			--Spring.Echo ("AI uses GG.cmd_go_mining (unitID)")
			GG.cmd_go_mining (unitID)
			revengeMe[unitID] = 0.8
			return
		end
		moveAway (unitID, 200)
		--unitOnMission [unitID] = 30
	end
end



------HELPER functions-----------
--is team controlled by me?
function isTeamCBM (teamID)
	--for t in pairs(myTeam) do
		--if (teamID == myTeam[t]) then return true end
	--end
	--return false
	if (myTeam[teamID]) then return true end
	return false
end

function unitIsMobile(unitID)
	local udID =Spring.GetUnitDefID(unitID)
	local uDef = UnitDefs [udID]	
	return (uDef.maxVelocity or 0) > 0
end

function getBuildSpot (ux, uy, uz, buildingname, r, rgrow)	
	--Spring.MarkerAddPoint (ux,uy,uz, "trying to find a spot here")
	local blocked = 0
	if (r == nil) then r = 200 end
	if (rgrow == nil) then rgrow = 200 end
	try = 0
	while (blocked ~=2 and try < 20) do
		x = ux + math.random (-r, r)
		z = uz + math.random (-r, r)
		y = Spring.GetGroundHeight (x,z)
		--blocked =Spring.TestBuildOrder (UnitDefNames[buildingname].id, x,y,z,0)
		r = r +rgrow
		try = try +1
	end	
	--Spring.MarkerAddPoint (x,y,z, "found this after " .. try .. " tries")
	return x,y,z
end

function units_allied (unitID1, unitID2)
	return Spring.GetUnitAllyTeam (unitID1) == Spring.GetUnitAllyTeam (unitID2)
end

--funzt aber irgendwie naja
function nearestResFromUnit (uID)
	local nearest_resID = nil
	local nearest_res_distance = 9999999999
	local x,y,z = Spring.GetUnitPosition(uID)
	if (not x or not z) then return end
	res=Spring.GetUnitsInCylinder (x,z, 5000, Spring.GetGaiaTeamID())
	if (res == nil) then return nil end	--no near units at all :/
	--Spring.Echo ("#res:" .. #res)
	for i in pairs (res) do
		if Spring.ValidUnitID (res[i]) then
			--Spring.Echo ("jo:"..res[i])
			--Spring.Echo ("vergleiche" .. res[i])
			--if (isResourceType (Spring.GetUnitDefID(res[i])) == true) then			
			if (true) then
				local d = Spring.GetUnitSeparation (uID, res[i])
				if (d < nearest_res_distance) then
					nearest_res_distance = d
					nearest_resID = res[i]
				end
			end
		end
	end
	if (nearest_resID~=nil) then 		
		local rx,ry,rz=Spring.GetUnitPosition(nearest_resID)
		return nearest_resID, rx,ry,rz, nearest_res_distance 
		else return 666,666,666,666,666,666,666
	end
end

--funzt!
function isResourceType (unitDefID)	
	if (UnitDefID == nil) then return false end
	local udef = UnitDefs[unitDefID]
	if (udef) then
		local cp = udef.customParams
		if (cp) then
			if (cp.is_mineable) then return true end
		end
	end
	return false
end
---------------------------------

--2         3        4   5   6   7   
--playerID, cmdType, px, py, pz, label
function gadget:RecvLuaMsg(msg, playerID)
	--Spring.Echo ("AI: look what i got " .. msg)
	if (msg:find("MapDrawCmd",1,true)) then
		local p = explode ("|", msg)
		if (p[3] == "point") then
			local x = p[4]
			local y = p[5]
			local z = p[6]
			local label = p[7]
		end
	end
	
end

--unused
function addDelayedOrder (frame, s)
	while (true) do
		if (not delayedOrder[f]) then 
			f=f+1
			delayedOrder[f] = s
		end
	end
end



-- explode(seperator, string)
function explode(d,p)
  local t, ll
  t={}
  ll=0
  if(#p == 1) then return {p} end
	while true do
	  l=string.find(p,d,ll,true) -- find the next d in the string
	  if l~=nil then -- if "not not" found then..
		table.insert(t, string.sub(p,ll,l-1)) -- Save it in our array.
		ll=l+1 -- save just after where we found it for searching next time.
	  else
		table.insert(t, string.sub(p,ll)) -- Save what's left in our array.
		break -- Break at end, as it should be, according to the lua manual.
	  end
	end
  return t
end