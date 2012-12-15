local turret = piece "turret"
local barrel = piece "barrel"
local flare = piece "flare"
--antenna
local rotor = piece "rotor"
local ant1 = piece "ant1"
local ant2 = piece "ant2"

local SIG_AIM = 2
local muzzleflash = SFX.CEG
-------damage pieces-------
exploType = SFX.FALL + SFX.NO_HEATCLOUD
pieces = {}
for i=1,16 do
	table.insert (pieces, piece ("b" .. i))
end
table.insert (pieces, piece "t1")
table.insert (pieces, piece "t2")
table.insert (pieces, piece "t3")
table.insert (pieces, piece "t4")
table.insert (pieces, piece "ant1")
table.insert (pieces, piece "ant2")
include "tpdamagepieces.lua"
---------------------------

function script.Create()
	--Spring.Echo ("GUNTURRET: unit " .. unitID .. " was created!")	
	StartThread(blockBuildingAnimation, -50,20)
	Spin (rotor, y_axis, math.rad (90))
	Spin (ant1, y_axis, math.rad (270))
	Spin (ant2, y_axis, -math.rad (270))	
end

local function RestoreAfterDelay(unitID)

end

----SHOOTING-------
function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return flare end

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(180))
	if (math.deg(pitch) < 0) then pitch = 0 end
	Turn(barrel, x_axis, -pitch, math.rad(90))
	WaitForTurn(turret, y_axis)
	WaitForTurn(barrel, x_axis)
	return true
end

function script.FireWeapon1()
--	EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)	       
	--Sleep(30)
	Move (barrel, z_axis, -3)
	Move (barrel, z_axis, 0,10)
	EmitSfx(flare, muzzleflash)
end

function script.Killed(recentDamage, maxHealth)
	for id,piece in pairs(unblownpieces) do
		Spring.UnitScript.Explode (piece, SFX.SHATTER)--+SFX.NO_HEATCLOUD)
		Hide (piece)
		Sleep (100)
	end
end
---------------