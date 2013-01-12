--  http://code.google.com/p/zero-k/source/browse/trunk/mods/zk/LuaRules/Gadgets/typemap_options.lua
function gadget:GetInfo()
  return {
    name      = "Typemap Eraser",
    desc      = "Edit's the map's typemap at the start of the game.",
    author    = "Google Frog, simplyfied by knorke",
    date      = "Feb, 2010",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end


if (not gadgetHandler:IsSyncedCode()) then
  return false  --  no unsynced code
end

local spGetGroundInfo = Spring.GetGroundInfo
local spSetTerrainTypeData = Spring.SetTerrainTypeData
local spSetMapSquareTerrainType = Spring.SetMapSquareTerrainType
local spGetGameFrame = Spring.GetGameFrame

function gadget:Initialize()
	Spring.Echo ("tp_notypemaps.lua")
	local override = {}	
	
	for i = 0,256,1 do
			Spring.SetMapSquareTerrainType(0,0,i)
			local name,_,_,t,b,v,s = Spring.GetGroundInfo(0,0)
			if (t == 1 and b == 1 and v == 1 and s == 1) then
					override[i] = false
			else
					override[i] = true
			end
	end
	
	for i = 0,256,1  do
			if override[i] then
					Spring.Echo("replaced typemap " .. i)
					spSetTerrainTypeData(i,1,1,1,1)
			end
	end
	--gadgetHandler:RemoveGadget()
end

--no water damage
--function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, attackerID, attackerDefID, attackerTeam)
	--if weaponDefID and weaponDefID==-5 then return 0.01 end
--end