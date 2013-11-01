--include "tpdamage.lua"
pieces = {}
local flare = 1--piece "gun"
local base = piece "base"
local body = piece "body"
local rotor = piece "rotor"
local smoke = SFX.CEG
----------blow off pieces-------
exploType = SFX.FALL + SFX.NO_HEATCLOUD + SFX.FIRE
for i=1,4 do
	local pname = "spike" .. i
	table.insert (pieces, piece (pname))
end

include "tpdamagepieces.lua"

-------------------------------
function script.Create()
	--Spring.Echo ("helidrone! " .. unitID .. " was created!")
	Spin (rotor, y_axis, math.rad (720))
	Turn (base, x_axis, math.rad(180))
	StartThread (engineSmoke)
	Turn (base, x_axis, -math.rad(90),math.rad(60))
	StartThread (selfkill)	--selfdestruct when having reached target in decent time
end

function selfkill ()
	Sleep (10000)
	Spring.DestroyUnit (unitID)
end

function engineSmoke ()
	while (true) do
		EmitSfx(rotor, smoke)
		Sleep (50)
	end
end

---SHOOTING---
function script.QueryWeapon() return flare end

function script.AimFromWeapon() return flare end

function script.AimWeapon( heading, pitch )	
	--Turn (flare, x_axis, pitch)
	--Turn (flare, y_axis, heading)
	return true
end

local shots = 0
function script.FireWeapon()
	shots=shots +1
	if shots > 5 then Spring.DestroyUnit (unitID) end
	--EmitSfx(flare, muzzleflash)	
end

function script.Killed(recentDamage, maxHealth)	
	Spring.UnitScript.Explode (body, SFX.SHATTER)	
	Spring.UnitScript.Explode (body, SFX.SHATTER)
end