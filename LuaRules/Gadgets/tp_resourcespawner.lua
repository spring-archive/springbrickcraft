function gadget:GetInfo()
  return {
    name      = "rock spawner",
    desc      = "Spawns rocks on the map, as defined in the map",
    author    = "knorke",
    date      = "28 Oct 2010",
    license   = "GNU GPL, v2 or later or horse",
    layer     = 0,
    enabled   = true,  --  loaded by default?
  }
end

if not gadgetHandler:IsSyncedCode() then
  return false -- no unsynced code
end

---config---
local resource_name = "tptetra"					--starting resource to be found on the map
--local mapconfig_fn = Game.mapName .. "_res.lua"		--name of map config files
local mapconfig_fn = Game.mapName .. "\\res.lua"		--name of map config files
local metalmapstep = 50							--step size in "mapunits" (tooltip coordinates) when scanning map to place resources on metalspots
------------

if (VFS.FileExists(mapconfig_fn)) then 
	Spring.Echo ("tp_resourcespawner: found" .. mapconfig_fn .." in mod root folder or map")
	gamesettings = VFS.Include(mapconfig_fn)
else
	if (VFS.FileExists("mapconfigs\\" .. mapconfig_fn)) then 
		Spring.Echo ("tp_resourcespawner: found " .. mapconfig_fn .. " in mod mapconfigs folder")
		gamesettings = VFS.Include("mapconfigs\\" .. mapconfig_fn)
	else
		Spring.Echo ("tp_resourcespawner: " .. mapconfig_fn .. " not found at all")
	end
end

--if (gamesettings == nil) then
--Spring.Echo ("tp_resourcespawner: no config in map found, looking in mod folder")
--	gamesettings = VFS.Include("mapconfigs\\" .. Game.mapName .. "_res.lua")
--end

local mins = {}	--all spawned minerals, so they can be Spring.SetUnitAlwaysVisible(res, false) after a short delay
--[[
local function SpawnResource (sx,sz, unitname)
	if (sx == nil or sz == nil) then
		Spring.Echo ("tp_resourcespawner: sx or sz was NIL in SpawnResource (sx,sz)")
		return
	end
	if (not unitname) then unitname = resource_name end
	Spring.Echo ("tp_resourcespawner: spawning resource at " .. sx ..":"..sz)
	local sh = Spring.GetGroundHeight(sx, sz)
	local res = Spring.CreateUnit(unitname, sx, sh, sz, math.random(0,3), Spring.GetGaiaTeamID())
	Spring.GiveOrderToUnit(res, CMD.ONOFF, { 0 }, {} )
	mins[#mins+1]=res
	--	Spring.SetUnitNeutral (res, true)
	Spring.SetUnitAlwaysVisible(res, true)	
	--Spring.SetUnitMaxHealth (res, 250) --does nothing?
	--Spring.SetUnitHealth (res,200) --does nothing?
end--]]

--replace with something better
local function PutResoucesOnMetal ()	
local mspots = 0

	for mx = 1, Game.mapSizeX, metalmapstep do
		for mz = 1, Game.mapSizeZ, metalmapstep do
			local _, metal = Spring.GetGroundInfo(mx, mz)
			if (metal > 0) then mspots = mspots + 1 end		
		end
	end
	
	local mmrescounter = 0
	Spring.Echo ("tp_resourcespawner: placing resources by metal map")
	if (mspots > 200) then metalmapstep = 750 end
	for mx = metalmapstep, Game.mapSizeX-metalmapstep, metalmapstep do
		for mz = metalmapstep, Game.mapSizeZ-metalmapstep, metalmapstep do
		local _, metal = Spring.GetGroundInfo(mx, mz)
			if (metal > 0) then
				GG.SpawnResource (mx, mz)
				mmrescounter = mmrescounter + 1
			end
		end
	end
	Spring.Echo ("tp_resourcespawner: placed " .. mmrescounter .. " resources by metal map")
end

local function PutResourcesOnMap ()
	if (gamesettings == nil) then 
		Spring.Echo ("tp_resourcespawner: gamesettings==nil") 
		--PutResoucesOnMetal ()
		return 
	end
	Spring.Echo ("tp_resourcespawner: ----PutResourcesOnMap ()----")
	if (gamesettings.res) then
		for resID in pairs(gamesettings.res) do
			Spring.Echo ( "res #" .. resID .. " at " ..  gamesettings.res[resID].x  .. ":"..gamesettings.res[resID].y )			
			if (gamesettings.res[resID].unitname and gamesettings.res[resID].unitname == "tpoilpump") then
				GG.SpawnOilPump (gamesettings.res[resID].x, gamesettings.res[resID].y)				
			else			
				GG.SpawnResource (gamesettings.res[resID].x, gamesettings.res[resID].y, gamesettings.res[resID].unitname)
			end
		end
	end
end

--handle features with metal: remove or replace
function FeatureHandling ()
	local featurehandling = "remove" --
	if (gamesettings==nil) then return end
	if (gamesettings.featurehandling) then featurehandling = gamesettings.featurehandling end
	if (string.find (Game.mapName, "CT_") ~= nil) then featurehandling = "donothing" end --dont remove rocks on CT_Eureka & CT_Fishboneridge****hack
	if (featurehanding == "donothing") then return end
	local all_features = Spring.GetAllFeatures ()
	for i in pairs(all_features) do
		local RemainingMetal, maxMetal, RemainingEnergy, maxEnergy, reclaimLeft = Spring.GetFeatureResources(all_features[i])
		if (maxMetal) then
			if (maxMetal > 0) then
				local fx,fy,fz = Spring.GetFeaturePosition (all_features[i])
				if (featurehandling=="replace") then 
					GG.SpawnResource (fx,fz) 
					Spring.DestroyFeature (all_features[i])
					--Spring.Echo ("tp_resourcespawner: feature replaced")
				end
				if (featurehandling=="remove") then 				
					Spring.DestroyFeature (all_features[i])
					--Spring.Echo ("tp_resourcespawner: feature removed")
				end
			end
		end
	end
end


function gadget:GameStart()
	Spring.Echo ("tp_resourcespawner: Hey I am the resource spawn gadget")
	PutResourcesOnMap ()
	FeatureHandling ()	
end

function gadget:GameFrame (f)
	if (f==60) then
		for i=1,#mins do
		    --for _,allyTeam in ipairs(Spring.GetAllyTeamList()) do
				--Spring.SetUnitLosMask(mins[i], allyTeam, {prevLos=true,})
			--end
			Spring.SetUnitAlwaysVisible(mins[i], false)
		end
	end
end

function gadget:Initialize()
Spring.Echo ("tp_resourcespawner: Game.mapName=" .. Game.mapName)
end