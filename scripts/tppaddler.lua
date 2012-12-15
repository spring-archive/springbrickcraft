local turret_front = piece "turret_front"
local barrel_front = {}
local flare_front = {}
local pivot_front = piece "pivot_front"
local shotFrom = 1
barrel_front[1] = piece "barrel_front1"
barrel_front[2] = piece "barrel_front2"
flare_front[1] = piece "flare_front1"
flare_front[2] = piece "flare_front2"


local flare_back = piece "flare_back"
local turret_back = piece "turret_back"
local barrel_back = piece "barrel_back"

local wheelR = piece "wheel_R1"
local wheelL = piece "wheel_L1"
local base = piece "base"
local exhaust = piece "exhaust_flare"
local whitesmoke = SFX.CEG
local muzzleflash = SFX.CEG+1

local SIG_AIMfront = 2
local SIG_AIMback = 4
local SIG_SMOKE = 8

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD
for i=1,5 do	
	table.insert (pieces, piece ("wheel_R" .. i))
	table.insert (pieces, piece ("wheel_L" .. i))
end
for i=85,99 do	
	table.insert (pieces, piece ("b_sep" .. i))	
end
for i=0,9 do	
	table.insert (pieces, piece ("plate_sep" .. i))	
end
healthmulti=1.5
include "tpdamagepieces.lua"
-------------------------------

function script.Create()
	--Spring.Echo ("unit " .. unitID .. " was created!")
	StartThread (rock)
end


function script.StartMoving ()
	Spin (wheelR, x_axis, 5)
	Spin (wheelL, x_axis, 5)
	StartThread (smoke)
	--Turn (base, x_axis, -math.rad(10), math.rad(20))
end

function script.StopMoving ()
	StopSpin (wheelR, x_axis, 0.5)
	StopSpin (wheelL, x_axis, 0.5)
	Signal (SIG_SMOKE)
	--Turn (base, x_axis, 0, math.rad(20))
end

--rock on the waves
function rock ()
	while (true) do
		--Turn (base, x_axis, math.rad(5), math.rad(20))
		Move (base, y_axis, -2,5)
		WaitForMove (base, y_axis)	
		Sleep (100)
		--Turn (base, x_axis, -math.rad(5), math.rad(20))
		Move (base, y_axis, 0,5)
		WaitForMove (base, y_axis)	
		Sleep (100)		
		
		EmitSfx( turret_front, SFX.WAKE )
		--EmitSfx( base, SFX.WAKE )
	end
end


function smoke()
        Signal(SIG_SMOKE)
        SetSignalMask(SIG_SMOKE)
        while  true  do
            Sleep(350)
			EmitSfx (exhaust, whitesmoke)
        end
end


--weapon 1 
function script.QueryWeapon1()
	return flare_front [shotFrom]
end

function script.AimFromWeapon1() return pivot_front end

function script.AimWeapon1( heading, pitch )
     Signal( SIG_AIMfront)
     SetSignalMask( SIG_AIMfront)
	Turn(turret_front, y_axis, heading, math.rad(200))
	Turn(pivot_front, x_axis, -pitch, math.rad(200))
	WaitForTurn (turret_front, y_axis)
	return true
end

function script.Shot1()
	EmitSfx(flare_front[shotFrom], muzzleflash)
	Move (barrel_front [shotFrom], z_axis, -5)
	Move (barrel_front [shotFrom], z_axis, 0,10)
	shotFrom = shotFrom +1
	if (shotFrom > 2) then shotFrom = 1 end
end
---
--weapon 2
function script.QueryWeapon2() return flare_back end

function script.AimFromWeapon2() return turret_back end

function script.AimWeapon2( heading, pitch )	
     Signal( SIG_AIMback)
     SetSignalMask( SIG_AIMback)
	Turn(turret_back, y_axis, heading+math.rad(180), math.rad(720))
	Turn(barrel_back, x_axis, pitch, math.rad(200))
	WaitForTurn (turret_back, y_axis)
	return true
end

function script.FireWeapon2()
--	EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)	       
	EmitSfx(flare_back, muzzleflash)
end
---


function script.Killed(recentDamage, maxHealth)
	Spring.SetUnitBlocking (unitID, false)
	Move (base, y_axis, -100, 20)
	Turn (base, x_axis, math.rad (90), math.rad (70))
	WaitForMove (base, y_axis)	
end
