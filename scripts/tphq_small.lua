local SIG_BUILD= 1

local p = piece "1"
local a = x_axis
local mp = piece "1"
local ma = x_axis
local moved = 30

---------------------------
pieces = {}
exploType = SFX.SHATTER
for i=1,27 do
	table.insert (pieces, piece (tostring(i)))
end
healthmulti=1.5
include "tpdamagepieces.lua"
---------------------------


function script.Create()
	--Spring.Echo ("created")
	--StartThread (randomSpins)
	--StartThread (randomMoves)
	--createAnim ()
	StartThread(blockBuildingAnimation)
end

function script.Killed()
	for id,piece in pairs(unblownpieces) do
		Spring.UnitScript.Explode (piece, SFX.FIRE)
	end
	return 0
end

--------BUILDING---------
function script.QueryBuildInfo() 
	return 1	--the unit will be constructed at the position of this piece
end

function script.QueryNanoPiece()
	return 1	
end

--[[
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
--]]

function script.StartBuilding()	
	--SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.BUGGER_OFF, 1)
	StartThread (randomSpins)
	StartThread (randomMoves)
	return 1
end

function script.StopBuilding()
	--SetUnitValue(COB.YARD_OPEN, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	SetUnitValue(COB.BUGGER_OFF, 0)
	Signal(SIG_BUILD)
	StopSpin (p, a)
	Turn (p, a, 0,5)
	Move (mp, ma, 0,60)
	return 0
end

function randomSpins ()
	--Signal(SIG_BUILD)
	SetSignalMask(SIG_BUILD)
	while (true) do
		p = piece ( tostring(math.random (1,27)))
		a = math.random (1,2)
		Spin (p, a, 9)--3
		Sleep (1000)
		StopSpin (p, a)
		Turn (p, a, 0,9)
	end	
end

function randomMoves ()
	--Signal(SIG_BUILD)
	SetSignalMask(SIG_BUILD)
	while (true) do
		mp = piece ( tostring(math.random (1,27)))
		ma = math.random (1,3)
		local d = math.random (0,1)
		if d == 1 then d = moved else d = -moved end
		Move (mp, ma, d, 60)
		WaitForMove (mp,ma)
		Move (mp, ma, 0,60)
	end
end