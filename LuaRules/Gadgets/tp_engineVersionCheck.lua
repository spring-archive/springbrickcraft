function gadget:GetInfo()
        return {
                name                    = "engineVersionCheck",
                desc                    = "warn player if wrong spring engine is used",
                author          		= "knorke",
                date                    = "April 2014",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true, --      loaded by default?
        }
end



if (gadgetHandler:IsSyncedCode()) then return end

local correctEngineVersion = "96"

local glPopMatrix      = gl.PopMatrix
local glPushMatrix     = gl.PushMatrix
local glText           = gl.Text

local font = 'FreeMonoBold'
local fontSize = 32
--local fontName = LUAUI_DIRNAME..'Fonts/'..font..'_'..fontSize
--local fh = fontHandler.UseFont(fontName)

function gadget:Initialize()
	if correctEngineVersion ==Game.version then 
		gadgetHandler:RemoveGadget()
	end
end

local vsx, vsy = gl.GetViewSizes ()
local UIscale, fontsize = vsy/55
function gadget:ViewResize(viewSizeX, viewSizeY)
	vsx = viewSizeX
	vsy = viewSizeY
	UIscale = vsx/75
end

function gadget:DrawScreen()
	glText("You are not using correct engine version ".. correctEngineVersion.."!", vsx/2, vsy/2-UIscale*1.4, UIscale*1.4, "oc")
end
