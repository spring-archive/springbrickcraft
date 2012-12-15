local wheel1 = piece "wheel1"
local wheel2 = piece "wheel2"
local radar = piece "radar1"
local base = piece "base"
local arm1 = piece "arm1"
local arm3 = piece "arm3"
local nano = piece "flare"

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD
for i=272,288 do
	local pname = "b_sep" .. i
	table.insert (pieces, piece (pname))
end
for i=1,8 do
	local pname = "w" .. i
	table.insert (pieces, piece (pname))
end
for i=1,4 do
	local pname = "cockpit" .. i
	table.insert (pieces, piece (pname))
end
table.insert (pieces, piece ("radar3"))
table.insert (pieces, piece ("radar4"))
table.insert (pieces, piece ("arm2"))
table.insert (pieces, piece ("arm4"))
healthmulti=1.2
include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
-----------------------------

--signals
local SIG_AIM = 2
--local isMoving = false
local beam = SFX.CEG


-------DRIVING-----
unitFinished = false	--to prevent the unit from wobbling around in the factory
function script.StartMoving()
	if (unitFinished) then
		Spin(wheel1, x_axis, 6)
		Spin(wheel2, x_axis, 6)
		Turn (base, x_axis, 0, math.rad(180))
	end
end
function script.StopMoving()
	if (unitFinished) then
		StopSpin (wheel1,x_axis, 3)
		StopSpin (wheel2,x_axis, 3)
		if (math.random (1,10) < 5) then a = math.rad(20) else a = math.rad(-20) end
		Turn (base, x_axis, a, math.rad(180))
	end	
end

function script.Create()
	--getTogether (300,200)
	WaitForMove (base, x_axis)
	blockBuildingAnimation(10)
	unitFinished = true
	Spin (radar, y_axis, math.rad (250))
end


function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return turret end

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(360))
	if (math.deg(pitch) < 0) then pitch = 0 end
	Turn(barrel, x_axis, -pitch, math.rad(50))
	WaitForTurn(turret, y_axis)
	WaitForTurn(barrel, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.FireWeapon1()

end

function layMineAnimation ()
	StartThread(layMineAnimationThread)
end

function layMineAnimationThread()
	local st = math.rad (300)
	Turn (arm1, y_axis, -math.rad (60), st)
	Turn (arm3, y_axis, math.rad (60), st)
	WaitForTurn (arm1, y_axis)	WaitForTurn (arm3, y_axis)
	Turn (arm1, z_axis, math.rad (45), st)
	Turn (arm3, z_axis, -math.rad (45), st)
	WaitForTurn (arm1, z_axis)	WaitForTurn (arm3, z_axis)
	Turn (arm1,y_axis,0,st)
	Turn (arm3,y_axis,0,st)
	Turn (arm1,z_axis,0,st)
	Turn (arm3,z_axis,0,st)
	Turn (base, x_axis, 0, math.rad(180))
end


------react to enemy fire-----
--function script.Killed(recentDamage, maxHealth)
	--for id,piece in pairs(unblownpieces) do
		--Spring.UnitScript.Explode (piece, SFX.FIRE)
	--end
--end
------------------------------

--------BUILDING---------
local isBuilding=false
function script.StopBuilding()
    --StopSpin (base, y_axis)
	--Turn (base, y_axis, math.rad (360))
	SetUnitValue(COB.INBUILDSTANCE, 0)
	Spin (radar, y_axis, math.rad (250))
	isBuilding = false
end

function script.StartBuilding(heading, pitch)
	--Spin (base, y_axis, math.rad (360))
	SetUnitValue(COB.INBUILDSTANCE, 1)
	StopSpin (radar, y_axis)
	Turn (radar, y_axis, heading, math.rad (360))
	WaitForTurn (radar, y_axis)
	StartThread (buildAnimation)
	Turn (base, x_axis, 0, math.rad(180))	
end

function buildAnimation ()
	isBuilding = true
	Spin (nano, z_axis, math.rad(90))
	while (isBuilding) do
		EmitSfx (nano, beam)
		Sleep (200)
	end
	StopSpin (nano, z_axis)
end

function script.QueryNanoPiece()
     return nano
end