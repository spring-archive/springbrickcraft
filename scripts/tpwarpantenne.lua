local floatCube = piece "float"
local pad = piece "base"
local nano = piece "base"
local panelRotor = piece "panelrotor"
local atomRotor = piece "atomrotor"
local axis = piece "axis"
local flare = piece "flare"

local reactorGlow = SFX.CEG
pieces = {}
---blow off pieces defs--
exploType = SFX.FIRE + SFX.NO_HEATCLOUD
for i=1,10 do
	table.insert (pieces, piece ("pillar"..i))
	table.insert (pieces, piece ("ring"..i))
end
table.insert (pieces, piece ("axis1"))
table.insert (pieces, piece ("axis2"))
table.insert (pieces, piece ("axis3"))
table.insert (pieces, piece ("mount1"))
table.insert (pieces, piece ("mount2"))
table.insert (pieces, piece ("mount3"))

table.insert (pieces, piece ("panel1"))
table.insert (pieces, piece ("panel2"))
table.insert (pieces, piece ("atom1"))
local atom={}
local panel={}
for i=1,4 do
	atom[i] = piece ("atom"..i)
	panel[i] = piece ("panel"..i)	
end
include "tpdamagepieces.lua"

function script.Create(unitID)
	Hide (floatCube)
	blockBuildingAnimation()
	Show (floatCube)
	Spin (atomRotor, y_axis, math.rad (90))
	Spin (panelRotor, y_axis, math.rad (30))
	Spin (axis, y_axis, math.rad (30))
	Spin (floatCube, y_axis, math.rad (30))
	Spin (floatCube, z_axis, math.rad (45))
	Spin (floatCube, x_axis, math.rad (-90))
	for i=1,4 do
		Spin (atom[i], y_axis, math.rad (-180))
	end
	StartThread (adjustPanels)
end

function adjustPanels ()
	local s = 0.25
	while (true) do
		
			local u = math.random (-15,40)			
			local a = math.rad (u)
			
			Turn (panel[1],z_axis, a, s)
			Turn (panel[3],z_axis, -a, s)
			Turn (panel[2],x_axis, -a, s)
			Turn (panel[4],x_axis, a, s)
			if (building) then
				Move (floatCube, y_axis, 30+u*2,s*200)
			else
				Move (floatCube, y_axis, u,s*50)
			end
		for i=1,4 do
			EmitSfx (flare, reactorGlow)
			Sleep (500)
		end
	end
end

function script.QueryBuildInfo() return pad end

function script.QueryNanoPiece() return nano end

function script.Activate()
	SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.BUGGER_OFF, 1)
	return 1
end

function script.Deactivate()
	SetUnitValue(COB.YARD_OPEN, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	SetUnitValue(COB.BUGGER_OFF, 0)
	return 0
end



function script.StartBuilding()	
	building = true
	--SetUnitValue(COB.INBUILDSTANCE, 1)	
end
function script.StopBuilding()
	building = false
end

---------------------------------

function script.Killed(recentDamage, maxHealth)
	Explode (floatCube, SFX.FALL)
	return 0
end