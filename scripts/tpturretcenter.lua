local base = piece "base"
local rotor = piece "rotor"
local ant1 = piece "ant1"
local ant2 = piece "ant2"
local ant3 = piece "ant3"
local debrisSmoke = SFX.CEG
----damage pieces--------
exploType = SFX.EXPLODE + SFX.NO_HEATCLOUD
pieces = {}
for i=1,12 do
	table.insert (pieces, piece ("b" .. i))
end
for i=1,6 do
	table.insert (pieces, piece ("r" .. i))
end
table.insert (pieces, piece "ant1")
table.insert (pieces, piece "ant2")
table.insert (pieces, piece "ant3")
include "tpdamagepieces.lua"
-------------------------

function script.Create()
	StartThread (onCreate)
end

function onCreate ()	--so that the spinning of pieces does not get overwritten by the build animation
	blockBuildingAnimation()
	--Spring.Echo ("TURRET CENTER " .. unitID .. " was created!")
	Spin (rotor, y_axis, math.rad(45))
	Spin (ant1, y_axis, math.rad(180))
	Spin (ant2, y_axis, -math.rad(180))
	Spin (ant3, y_axis, math.rad(180))
end



--function script.QueryWeapon1() return flare end

--function script.AimFromWeapon1() return turret end

--function script.AimWeapon1( heading, pitch )

--	return true
--end

function script.FireWeapon1()
--	EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)	       
	Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	StartThread (deathRumble)
	Sleep (1000)
	Move (base, y_axis, -200, 80)
	WaitForMove (base,y_axis)
end

function deathRumble ()
	while (true) do
		Move (base, x_axis, math.random (-10,10), 20)
		Move (base, z_axis, math.random (-10,10), 20)
		--EmitSfx (math.random(5,20), debrisSmoke)
		EmitSfx (base, debrisSmoke)
		Sleep (100)
	end
end


---BUILDING-----
function script.StartBuilding(heading, pitch)
	--Spring.Echo ("start building")
	SetUnitValue(COB.INBUILDSTANCE, 1)
	return 1
end

function script.StopBuilding()
	SetUnitValue(COB.INBUILDSTANCE, 0)
	return 0
end

function script.QueryNanopiece ( )
	return rotor
end
---------