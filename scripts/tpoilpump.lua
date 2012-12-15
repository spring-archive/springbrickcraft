local crank = piece "crank"
local rocker = piece "rocker"
local piston = piece "piston"
local base = piece "base"


local debrisSmoke = SFX.CEG
-------damage pieces-------
exploType = SFX.FALL + SFX.NO_HEATCLOUD
pieces = {}
for i=1,24 do
		table.insert (pieces, piece ("b" .. i))
	end
for i=0,9 do
	table.insert (pieces, piece ("crank_sep" .. i))
	table.insert (pieces, piece ("rocker_se" .. i))
end
healthmulti=2
include "tpdamagepieces.lua"
---------------------------

function script.Create()
	--Spring.Echo ("GUNTURRET: unit " .. unitID .. " was created!")
	StartThread(pump)
	Spin (crank, x_axis, math.rad (-90))
	Hide (piston)
end

function pump ()
	while (true) do
		Turn (rocker, x_axis, math.rad (15), math.rad(15))
		WaitForTurn (rocker, x_axis)
		Turn (rocker, x_axis, math.rad (-15), math.rad(15))
		WaitForTurn (rocker, x_axis)
	end
end


function script.Killed(recentDamage, maxHealth)
	StopSpin (crank, x_axis)
	StartThread (deathRumble)
	Sleep (2000)
	Move (base, y_axis, -150, 50)
	WaitForMove (base,y_axis)
end

function deathRumble ()
	for i = 1, 4 do
		EmitSfx (math.random(5,20), debrisSmoke)
		Sleep (500)
	end
	
	while (true) do
		Move (base, x_axis, math.random (-20,32), 40)
		Move (base, z_axis, math.random (-20,20), 48)
		EmitSfx (math.random(5,20), debrisSmoke)
		EmitSfx (base, debrisSmoke)
		Sleep (100)
	end
end

---------------