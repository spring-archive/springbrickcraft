local wheel1 = piece "w1"
local wheel2 = piece "w2"
local wheel3 = piece "w3"
local wheel4 = piece "w4"


-------DRIVING-----
function script.StartMoving()
--	StartThread(drive)
	Spin(wheel1, x_axis, 7)
	Spin(wheel2, x_axis, 7)
	Spin(wheel3, x_axis, 7)
	Spin(wheel4, x_axis, 7)
end
function script.StopMoving()
--	StartThread(stopdrive)
	StopSpin (wheel1,x_axis, 3)
	StopSpin (wheel2,x_axis, 3)
	StopSpin (wheel3,x_axis, 3)
	StopSpin (wheel4,x_axis, 3)
end


--function script.QueryWeapon1() return flare end

--function script.AimFromWeapon1() return turret end

--[[
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
--]]

function script.FireWeapon1()
	--Emit blabla
	Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	Spring.UnitScript.Explode (wheel1, SFX.FALL)
	Spring.UnitScript.Explode (wheel2, SFX.FALL)
	Spring.UnitScript.Explode (wheel3, SFX.FALL)
	Spring.UnitScript.Explode (wheel4, SFX.FALL)
	Sleep(30)
end