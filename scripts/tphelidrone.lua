--include "tpdamage.lua"
pieces = {}
local flare = piece "flare_low"
local rotor = piece "rotor"
local muzzleflash = SFX.CEG
----------blow off pieces-------
exploType = SFX.FALL + SFX.NO_HEATCLOUD + SFX.FIRE
table.insert(pieces, (piece "wing1"))
table.insert(pieces, (piece "wing2"))
table.insert(pieces, (piece "wing3"))
table.insert(pieces, (piece "wing4"))
table.insert(pieces, (piece "main"))
include "tpdamagepieces.lua"
-------------------------------
function script.Create()
	--Spring.Echo ("helidrone! " .. unitID .. " was created!")
	Spin (rotor, y_axis, math.rad(540))
	StartThread (rotorpump)
end


function rotorpump ()
	while (true) do
		Turn (rotor, x_axis, 0.2, 0.2)
		WaitForTurn (rotor, x_axis)
		Sleep (50)
		Turn (rotor, x_axis, -0.2, 0.2)
		WaitForTurn (rotor, x_axis)
		Sleep (50)
	end
end


---SHOOTING---
function script.QueryWeapon() return flare end

function script.AimFromWeapon() return flare end

function script.AimWeapon( heading, pitch )	
	Turn (flare, x_axis, pitch)
	Turn (flare, y_axis, heading)
	return true
end

function script.FireWeapon()
	--EmitSfx(flare, muzzleflash)	
end