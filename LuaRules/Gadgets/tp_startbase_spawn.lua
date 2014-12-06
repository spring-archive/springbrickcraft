function gadget:GetInfo()
	return {
		name      = "base spawner",
		desc      = "spawn start units based on config files (rather then on startpos set in lobby)",
		author    = "knorke (inspired by game_spawn.lua by Tobi Vollebregt and reusing parts)",
		date      = "May 2011",
		license   = "GNU GPL, v2 or later or a horse",
		layer     = -9000, --so unitscripts works
		enabled   = true,
	}
end
--------------------------------------------------------------------------------
-- synced only
if (not gadgetHandler:IsSyncedCode()) then
	return false
end
--------------------------------------------------------------------------------
luamsgpre = "tpMSGBOX"
local startpos
--local mapconfig_fn = Game.mapName .. "_startpos.lua"		--name of map config files
local mapconfig_fn = Game.mapName .. "\\startpos.lua"		--name of map config files
if (VFS.FileExists(mapconfig_fn)) then 
	Spring.Echo ("tp_startbase_spawn.lua: found" .. mapconfig_fn .." in mod root folder or map")
	startpos = VFS.Include(mapconfig_fn)
else
	if (VFS.FileExists("mapconfigs\\" .. mapconfig_fn)) then 
		Spring.Echo ("tp_startbase_spawn.lua: found " .. mapconfig_fn .. " in mod mapconfigs folder")
		startpos = VFS.Include("mapconfigs\\" .. mapconfig_fn)
	else
		Spring.Echo ("tp_startbase_spawn.lua: found " .. mapconfig_fn .. " NOT FOUND AT ALL.")
		Spring.Echo ("THIS MAP IS NOT SUPPORTED")
		Spring.SendLuaUIMsg (luamsgpre .. "THIS MAP IS NOT SUPPORTED")
	end
end


function spawn_player (x, z, teamID)
	x, z = 8*math.floor((x+4)/8) , 8*math.floor((z+4)/8)
	y = Spring.GetGroundHeight(x, z)
	local facing = math.abs(Game.mapSizeX/2 - x) > math.abs(Game.mapSizeZ/2 - z)
		and ((x>Game.mapSizeX/2) and "west" or "east")
		or ((z>Game.mapSizeZ/2) and "north" or "south")
	Spring.CreateUnit("tphq", x, y, z, facing, teamID)
	local dx,dz=0,0
	if (facing=="north") then dz=-200 end
	if (facing=="south") then dz=200 end
	if (facing=="west") then dx=-200 end
	if (facing=="east") then dx=200 end
	local miner = Spring.CreateUnit("tpgripper", x+dx, y, z+dz, facing, teamID)
	--env = Spring.UnitScript.GetScriptEnv(miner)
	--if (env) then Spring.Echo ("miner animation") Spring.UnitScript.CallAsUnit(miner, env.getTogether, 300, 200) end
	Spring.SetTeamResource(teamID, "ms", 99999999999999999999999)
	local startingmetal=4000
	local modOptions = Spring.GetModOptions()
	if (modOptions) then startingmetal = modOptions.startingmetal or 4000 end
	Spring.SetTeamResource(teamID, "m", startingmetal)
end

--function gadget:GameStart()
function gadget:Initialize()
	--Spring.SendCommands ("cheat")	--***
	if (startpos == nil) then Spring.Echo ("tp_startbase_spawn.lua: Did not find startpositions. No units are spawned.") return end
	local gaiaTeamID = Spring.GetGaiaTeamID()
	local i = 1
	local gm = get_game_mode ()
	if (not startpos[gm]) then 	
		Spring.Echo ("NO SUPPORT FOR THIS MATCH SETUP:" .. gm)
		Spring.SendLuaUIMsg (luamsgpre .. "NO SUPPORT FOR THIS MATCH SETUP:" .. gm)
		gm = "random"
		--FIXME: if playernumbers is an amount for which no startpos config exists, then do not crash
	else	
		if gm == "random" then
			startpos[gm] = shuffleStartPositions (startpos[gm])
		end
	end
	
	local allyTeamList = Spring.GetAllyTeamList()
	for _,allyTeamID in ipairs (allyTeamList) do
		for _,teamID in ipairs(Spring.GetTeamList(allyTeamID)) do
			if teamID~=gaiaTeamID then -- don't spawn a start unit for the Gaia team
				local teamNum,leader,isDead,isAiTeam,side,allyTeam = Spring.GetTeamInfo(teamID)					
				local x,z = startpos[gm][i].x, startpos[gm][i].z
				spawn_player (x, z, teamID)
				i=i+1
			end
		end
	end
end
--[[
	for _,teamID in ipairs(Spring.GetTeamList()) do
		if teamID~=gaiaTeamID then -- don't spawn a start unit for the Gaia team			
			local teamNum,leader,isDead,isAiTeam,side,allyTeam = Spring.GetTeamInfo(teamID)					
			local x,z = startpos[gm][i].x, startpos[gm][i].z
			spawn_player (x, z, teamID)
			i=i+1
		end
	end	
--]]

function get_game_mode ()
	teamn = #Spring.GetTeamList() -1
	if teamn == 2 then return "1v1" end
	if teamn == 3 then return "1v1v1" end
	if teamn == 4 then return "4" end
	return "random"
end


function shuffleStartPositions (startPos)
	if not startPos then return startPos end
	for x=1,50 do
		local i = math.random (1, #startPos)
		local u = (i % #startPos) + 1
		local swapX = startPos[i].x
		local swapZ = startPos[i].z	
		startPos[i].x = startPos[u].x
		startPos[i].z = startPos[u].z
		startPos[u].x = swapX
		startPos[u].z = swapZ
	end
	return startPos
end