--taken out of XTA v6.66
function widget:GetInfo()
  return {
    name      = "Brickcraft | center camera at gamestart",
    desc      = "Selects and centers the Commander at the start of the game.",
    author    = "quantum",
    date      = "22/06/2007",
    license   = "GNU GPL, v2 or later",
    layer     = 5,
    enabled   = true  --  loaded by default?
  }
end
local center = true
local select = false
local unitList = {}

function widget:Update()

local t = Spring.GetGameSeconds()
  if t > 10 then
    widgetHandler:RemoveWidget()
    return
  end
  if  center 
  and t > 0 then
    --Spring.Echo("center")
    unitList = Spring.GetTeamUnits(Spring.GetMyTeamID())
	if #unitList>1 then
		local x, y, z = Spring.GetUnitPosition(unitList[1])
		Spring.SetCameraTarget(x, y, z)
		center = false
	end
  end
  if  select 
  and t > 0 then
    --Spring.Echo("select")
    Spring.SelectUnitArray({unitList[1]})
    select = false
  end
end
