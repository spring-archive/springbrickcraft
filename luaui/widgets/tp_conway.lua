--display for resources
function widget:GetInfo()
  return {
    name      = "Brickcraft | Conways game of life",
    desc      = "gliders gonna glide",
    author    = "knorke",
    date      = "April 2014",
    license   = "weeeeeee iam on horse",
    layer     = -3,
    enabled   = true  --  loaded by default?
  }
end


--thanks to trepan and his "com ends" widget :)
local glPopMatrix      = gl.PopMatrix
local glPushMatrix     = gl.PushMatrix
local glText           = gl.Text

local font = 'FreeMonoBold'
local fontSize = 32
local fontName = LUAUI_DIRNAME..'Fonts/'..font..'_'..fontSize
local fh = fontHandler.UseFont(fontName)
local gameframe = 0

local vsx, vsy = widgetHandler:GetViewSizes()
local UIscale, fontsize = vsy/55
function widget:ViewResize(viewSizeX, viewSizeY)
	vsx = viewSizeX
	vsy = viewSizeY
	UIscale = vsx/75
end

local metal = 0
local energy = 0

function widget:GameFrame(f)
	gameframe = f
	local localplayerID = Spring.GetLocalTeamID()
	--metal = Spring.GetTeamResources (localplayerID ,"metal")
	metal = math.floor (Spring.GetTeamResources (localplayerID ,"metal")+0.5)
	energy = math.floor (Spring.GetTeamResources (localplayerID ,"energy"))
end

function widget:DrawScreen()
glPushMatrix()
if (fh) then
	fh = fontHandler.UseFont(fontName)
	fontHandler.DrawCentered(msg)
else	
	glText("Metal: " .. metal, vsx/2, vsy-UIscale*1.4, UIscale*1.4, "oc")
	glText("Sirup: " .. energy, vsx/1.5, vsy-UIscale*1.4, UIscale*1.4, "oc")
end
glPopMatrix()
end

function Square (x,y)
end


function widget:Initialize()
	Spring.SendCommands ("resbar 0")
	Spring.Echo ("tp_ressourcedisplay.lua: type /resbar 1 to get the engines resource bars back")
end