--FIXME: merge with featureexploder.lua?
function gadget:GetInfo()
  return {
    name      = "trees n stuff",
    desc      = "regrowing trees",
    author    = "knorke",
    date      = "April 2011, 2011",
    license   = "horse has fallen over",
    layer     = -2,
    enabled   = true
  }
end

if (not gadgetHandler:IsSyncedCode()) then return end

local treeUnit =  UnitDefNames["tptree"].id
local treeFeature =  FeatureDefNames["f_tptree"].id


--local feature_name = "f_tptree"
local GaiaTeamID  = Spring.GetGaiaTeamID ()
local regrow = {} --[frame] x,z,unitname
local gameframe = 0
local growingTrees = {} --to diff. between growing and falling trees (if a falling trees dies again, no new tree should be spawned as that is already done)

function gadget:GameFrame (f)
	gameframe = f
	if (regrow[f] == nil) then return end
	for i in pairs(regrow[f]) do		
		local x,z=regrow[f][i].x, regrow[f][i].z
		if (not Spring.GetGroundBlocked (x,z)) then
			local uID = Spring.CreateUnit ("tptree",x, Spring.GetGroundHeight (x, z), z, math.random(0,7),GaiaTeamID)
			env = Spring.UnitScript.GetScriptEnv(uID)
			if (env) then Spring.UnitScript.CallAsUnit(uID, env.grow) end
			--Spring.SetUnitBlocking (uID, false)
			Spring.SetUnitBlocking (uID, true, true, true) --crushable!
			Spring.SetUnitNeutral (uID, true)
			Spring.SetUnitNoSelect (uID, true)
			growingTrees[uID] = true
			local groundHeight = Spring.GetGroundHeight (x,z)
			Spring.SpawnCEG ("tpdirtdigging", x,groundHeight,z) --FIXME: use unique ceg
		end
	end
	regrow[f] = nil
end



function GG.growTree (frame, x,z, unittname)
	if (regrow[frame] == nil) then 
		regrow[frame] = {}
	end
	local newRegrow = {}
	newRegrow.x=x
	newRegrow.z=z
	newRegrow.unittname = unitname
	table.insert (regrow[frame], newRegrow)	
end

function fallingTree(x,y,z)
	local uID = Spring.CreateUnit ("tptree",x,y,z, GaiaTeamID, GaiaTeamID)
	updateUnitLOS (uID)
	Spring.SetUnitBlocking (uID, false)
	Spring.SetUnitNeutral (uID, true)
	Spring.SetUnitNoSelect (uID, true)
	env = Spring.UnitScript.GetScriptEnv(uID)
	if (env) then Spring.UnitScript.CallAsUnit(uID, env.fall) end
end


--growing tree got destroyed?
function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	--Spring.Echo (attackerID or "nil")
	if growingTrees[unitID] and unitID~=attackerID then		
		local x,y,z = Spring.GetUnitPosition  (unitID)
		env = Spring.UnitScript.GetScriptEnv(unitID)
		if (env) then Spring.UnitScript.CallAsUnit(unitID, env.shatter) end
		Spring.SetUnitBlocking (unitID, false)
		Spring.SetUnitNeutral (unitID, true)
		GG.growTree (gameframe+90+math.random (900), x,z, "tptree")
		growingTrees[unitID] = nil
	end
end

function gadget:FeatureDestroyed(featureID, allyTeam)
	if (gameframe > 60 and Spring.GetFeatureDefID (featureID) == treeFeature) then
		local x,y,z = Spring.GetFeaturePosition  (featureID)
		fallingTree(x,y,z)
		GG.growTree (gameframe+90+math.random (900), x,z, "tptree")
	end
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


--gets rid of the delay until engine refreshes LOS :)
--but tree becomes visible outside los too :/
function updateUnitLOS (unitID)
	local teamList = Spring.GetTeamList ()
	for _, team in ipairs(teamList) do
		--_,_,_,_,teamside = Spring_GetTeamInfo(team)
		local _,leader, isDead,isAiTeam, side , allyTeam = Spring.GetTeamInfo (team)
		local x,y,z = Spring.GetUnitPosition (unitID)
		local canSee = Spring.IsPosInLos (x,y,z, allyTeam)
		if (canSee) then Spring.SetUnitLosState (unitID, allyTeam, 1) end
	end
end