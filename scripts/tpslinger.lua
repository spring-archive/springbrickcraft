local flare = piece "flare"
local base = piece "base"
local spinr = piece "spinr"
local spinl = piece "spinl"


local balls = {}
balls[1] = piece "ball1"
balls[2] = piece "ball2"

local SIG_AIM = 2
local ball_s = 10
local ball_d = 15

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD

for i=1,3 do --4
	table.insert (pieces, piece ("spinr"..i))
	table.insert (pieces, piece ("spinl"..i))
end

for i=121,128 do	
	table.insert (pieces, piece ("up_sep"..i))	
end
for i=129,136 do	
	table.insert (pieces, piece ("low_sep"..i))	
end

healthmulti=1.2
include "tpdamagepieces.lua"

function script.Create()
	--Spring.Echo ("unit " .. unitID .. " was created!")	
end


function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return flare end

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)	
	Show (balls[1])
	Turn (base,y_axis, heading, 5)
	Move (balls[1], y_axis, ball_d, ball_s)
	Move (balls[2], y_axis, 0, ball_s)	
	WaitForTurn (base, y_axis)	
	WaitForMove (balls[1], y_axis)
	Spin (spinr, y_axis,15)
	Spin (spinl, y_axis, -15)
	--Sleep (500)
	Hide (balls[1])
	return true
end

function script.FireWeapon1()
	Sleep (100)
	StopSpin (spinr, y_axis,0.2)
	StopSpin (spinl, y_axis,0.2)
	Sleep (50)	
	Move (balls[1], y_axis, 0)
	Move (balls[2], y_axis, -ball_d)	
	Show (balls[1])	
	Show (balls[2])
end

function script.Killed(recentDamage, maxHealth)
	
end