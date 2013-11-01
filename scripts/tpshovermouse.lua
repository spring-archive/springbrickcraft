local base = piece "base" --piece on ground
local unit = piece "unit" --bops up+down
local gun = piece "gun"
local flare = piece "flare"
local door1= piece "door1"
local door2= piece "door2"
local redlight = SFX.CEG

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD
exploType = SFX.EXPLODE
for i=1,13 do
	local pname = "frame" .. i
	table.insert (pieces, piece (pname))
end
table.insert (pieces, piece "body1")
table.insert (pieces, piece "body2")
table.insert (pieces, piece "body3")
table.insert (pieces, piece "body4")
healthmulti=1.25
include "tpdamagepieces.lua"
notifyDamaged = true
------------------------------

function script.Create ()
	StartThread (hover)
end

function hover ()
	while (true) do
		EmitSfx (base, redlight)
		Move (unit, y_axis, math.random (30,40), 20)
		WaitForMove (unit, y_axis)
		Move (unit, y_axis, math.random (0,10), 10)
		Sleep (50)
		Spring.Echo (#Spring.GetUnitCommands (unitID))
	end	
end

function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return flare end

function script.AimWeapon1( heading, pitch )
	Turn (door1, z_axis, -math.rad(90), math.rad(360))
	Turn (door2, z_axis, math.rad(90), math.rad(360))
	return true
end

function script.Shot1()
	Move (gun,y_axis, -4)
	Move (gun,y_axis, 0, 20)
end

function script.EndBurst1()
	Move (gun,y_axis, -4)
	Move (gun,y_axis, 0, 20)
	
	Turn (door1, z_axis, -math.rad(0), math.rad(math.random(360,720)))
	Turn (door2, z_axis, math.rad(0), math.rad(math.random(360,720)))
end

function script.Killed(recentDamage, maxHealth)
	Spin (unit, z_axis, math.rad (360))
	Spin (unit, y_axis, math.rad (720))
	for i=1, 20, 1 do
		EmitSfx (math.random (1,15), redlight)
		Sleep (50)		
	end
end

function damaged (damage)
	if (damage or 0) > 50 then
		getTogether (10,15)
	end
	--StartThread (damageSmoke, "blacksmoke", "tpdamagefire_s")
end