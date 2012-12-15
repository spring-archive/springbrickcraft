local flare = piece "base"
local beamemit = piece "flarelow"
local base = piece "base"
local beam = SFX.CEG
local flarelow = piece "flarelow"
local flaretop = piece "flaretop"
local outter = piece "outter"
local inner = piece "inner"
--------BLOW OFF PIECES------
pieces = {}
--b_sep63 .. b_sep94
for i=63,94,1 do 
	local tname = "b_sep" .. i	
	table.insert (pieces, piece (tname))
end
exploType = SFX.FALL + SFX.NO_HEATCLOUD + SFX.SMOKE
include "tpdamagepieces.lua"
-----------

function script.Create()
	--Spring.Echo ("flying saucer " .. unitID .. " was created!")	
	Turn (beamemit, x_axis,-math.rad(90))
	Turn (beamemit, y_axis,0)
	Turn (beamemit, z_axis,0)
	Spin (outter, y_axis,6)	
	Spin (inner, y_axis,-3)
end


---SHOTING ---
function script.QueryWeapon1()  
	Turn (base, x_axis, 0)
	Turn (base, z_axis, 0)
return flare end

function script.AimFromWeapon1() return flare end

function script.AimWeapon1( heading, pitch )
	Turn (base, x_axis, 0)
	Turn (base, z_axis, 0)
	--Turn (flare, y_axis, heading,2)
	--Turn (flare, x_axis, pitch,2)
	--Turn (beamemit, y_axis, heading)
	--Turn (beamemit, x_axis, math.rad(90)-pitch)	
	return true
end

--function script.FireWeapon()
	--Spring.Echo ("pzzt!" .. unitID)	
	--Spring.SpawnCEG ("tpbeamcone", x,y+100,z,0,1,0)
	--
	--
	--Turn (base, x_axis,-90)
	--EmitSfx(beamemit, beam)
	--Turn (beamemit, x_axis, 0)	
--	EmitSfx(flare, orc_machinegun_muzzle)	
	--Sleep(30)
--end
-----

function script.QueryWeapon2()  
	return inner 
end

function script.AimFromWeapon2() 
	return inner 
end

function script.AimWeapon2( heading, pitch )
	return true
end

function script.Killed(recentDamage, maxHealth)
	--for id,piece in pairs(unblownpieces) do
--		Spring.UnitScript.Explode (piece, SFX.SHATTER)
--	end
	Sleep(30)
end
------------------------------