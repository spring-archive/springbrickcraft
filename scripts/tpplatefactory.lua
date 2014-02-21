pieces = {}

local pad = piece "pad"
---blow off pieces defs--
exploType = SFX.FALL + SFX.NO_HEATCLOUD
for i=1,18 do
	table.insert (pieces, piece ("b"..i))
end

for i=1,6 do
	table.insert (pieces, piece ("bar" .. i))
end

local leftwall = piece "leftwall"
local rightwall = piece "rightwall"
local tip1 = piece "tip1"
local tip2 = piece "tip2"
local bar1=piece "bar1"
local bar2=piece "bar2"
local bar3=piece "bar3"
local bar4=piece "bar4"
local bar5=piece "bar5"
local bar6=piece "bar6"

include "tpdamagepieces.lua"
-------------------------
local building = false

function script.Create()
	--Spring.Echo ("plate factory here")
	--StartThread(blockBuildingAnimation)
	blockBuildingAnimation()
	close()	
end

function script.QueryBuildInfo() return pad end

function script.QueryNanoPiece() return pad end


function script.Activate()
	SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.BUGGER_OFF, 1)
	open()	
	return 1
end

function script.Deactivate()
	SetUnitValue(COB.YARD_OPEN, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	SetUnitValue(COB.BUGGER_OFF, 0)
	close()	
	return 0
end

-----
local slideD = 40
local slideS = 50
function close ()
	StopSpin (tip1, y_axis)
	StopSpin (tip2, y_axis)	
	Move (leftwall, x_axis,slideD,slideS)
	Move (rightwall, x_axis,-slideD,slideS)
	Move (bar1, x_axis, slideD, slideS/3)
	Move (bar2, x_axis, slideD, slideS/2)
	Move (bar3, x_axis, slideD, slideS)
	Move (bar4, x_axis, -slideD, slideS/3)
	Move (bar5, x_axis, -slideD, slideS/2)
	Move (bar6, x_axis, -slideD, slideS)
	Spring.SetUnitCollisionVolumeData (unitID, 120,120,120, 0,-50,0, 3 ,0,0)
end

function open ()
	Move (leftwall, x_axis,0,slideS)
	Move (rightwall, x_axis,0,slideS)
	Move (bar1, x_axis, 0, slideS*3)
	Move (bar2, x_axis, 0, slideS*2)
	Move (bar3, x_axis, 0, slideS)
	Move (bar4, x_axis, 0, slideS*3)
	Move (bar5, x_axis, 0, slideS*2)
	Move (bar6, x_axis, 0, slideS)
	Spin (tip1, y_axis, math.rad(180))
	Spin (tip2, y_axis, math.rad(-180))
	Spring.SetUnitCollisionVolumeData (unitID, 175,175,175, 0,-50,0, 3 ,0,0)
end
-----

local function pump ()
	Signal(SIG_PUMP)
	SetSignalMask(SIG_PUMP)
	while (building) do
		Sleep (100)
	end
end


function script.StartBuilding()	
	--open()
	building = true
	--SetUnitValue(COB.INBUILDSTANCE, 1)
	StartThread (pump)
end
function script.StopBuilding()
	building = false
	--SetUnitValue(COB.INBUILDSTANCE, 0)
	Signal(SIG_PUMP)	
	local x,y,z = Spring.GetUnitPosition (unitID)
	Sleep (100)
	local unitsatfactory = Spring.GetUnitsInCylinder (x,z, 30)
	--Spring.Echo ("unitsatfac:" .. table.getn (unitsatfactory))
	if (table.getn (unitsatfactory) > 1) then 		--was building completed or canceled? lets see if there is someone else beside the fac

	end
	--close()
end

---------------------------------

function script.Killed(recentDamage, maxHealth)
	return 0
end