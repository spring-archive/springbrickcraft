--base
--body1 .. body8
--wing1 .. wing8
--rotor1, rotor2

--include "tpdamage.lua"
pieces = {}
local flare = piece "flare_low"
local rotor1 = piece "rotor1"
local rotor2 = piece "rotor2"
local muzzleflash = SFX.CEG
----------blow off pieces-------
exploType = SFX.FALL + SFX.NO_HEATCLOUD + SFX.FIRE
for i=1,8 do
	table.insert (pieces, piece ("wing" .. i))
end
include "tpdamagepieces.lua"
-------------------------------
function script.Create()
	--Spring.Echo ("helidrone! " .. unitID .. " was created!")
	Spin (rotor1, y_axis, math.rad(540))
	Spin (rotor2, y_axis, math.rad(-540))	
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
	EmitSfx(flare, muzzleflash)	
end