--center pieces
local body = piece "basecenter"
local turret = piece "turretcenter" 
local barrel = piece "barrel4"
local flare = piece "flare" --"barrel1"
--wheels
local wheel1 = piece "wheel1"
local wheel2 = piece "wheel2"
local wheel3 = piece "wheel3"
local wheel4 = piece "wheel4"
local wheel5 = piece "wheel5"
local wheel6 = piece "wheel6"
-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD
for i=1,24 do
	local pname = "base" .. i
	table.insert (pieces, piece (pname))
end
for i=1,7 do
	local pname = "turret" .. i
	table.insert (pieces, piece (pname))
end

table.insert (pieces, turretcenter)
table.insert (pieces, barrel4)
table.insert (pieces, barrel1)
table.insert (pieces, wheel1)
table.insert (pieces, wheel2)
table.insert (pieces, wheel3)
table.insert (pieces, wheel4)
table.insert (pieces, wheel5)
table.insert (pieces, wheel6)
table.insert (pieces, piece ("barrel1"))

include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
-----------------------------
notifyDamaged = true
--signals
local SIG_AIM = 2
local muzzleCEG = SFX.CEG
--local orc_machinegun_muzzle = SFX.CEG + 1
-------DRIVING-----
local function drive()

end

local function stopdrive ()

end

function script.StartMoving()
--	StartThread(drive)
	Spin(wheel1, x_axis, 5)
	Spin(wheel2, x_axis, 5)
	Spin(wheel3, x_axis, 5)
	Spin(wheel4, x_axis, 5)
	Spin(wheel5, x_axis, 5)
	Spin(wheel6, x_axis, 5)
end
function script.StopMoving()
--	StartThread(stopdrive)
	StopSpin (wheel1,x_axis, 3)
	StopSpin (wheel2,x_axis, 3)
	StopSpin (wheel3,x_axis, 3)
	StopSpin (wheel4,x_axis, 3)
	StopSpin (wheel5,x_axis, 3)
	StopSpin (wheel6,x_axis, 3)
end
-------------------------


function script.Create()
	--StartThread(blockBuildingAnimation,50)
	getTogether (300,200)
	--StartThread (healthRegainedThread)
end

local function RestoreAfterDelay(unitID)
	Sleep(2500)
	Turn(turret, y_axis, 0, math.rad(180))
	Turn(barrel, x_axis, 0, math.rad(50))
end

function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return turret end

--[[
function script.BlockShot ()
Spring.Echo (Spring.GetGameFrame() )
return true
end
--]]

function script.AimWeapon1( heading, pitch )	
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
		Turn(turret, y_axis, heading, math.rad(200)) --90 --75		
		if (math.deg(pitch) < 0) then pitch = 0 end
		Turn(barrel, x_axis, -pitch, math.rad(180))  --50
		WaitForTurn(turret, y_axis)
		WaitForTurn(barrel, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.FireWeapon1()
	EmitSfx(flare, muzzleCEG)
--	EmitSfx(flare, orc_machinegun_muzzle)	       
--	Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	--der fahrer hängt sonst im wreck?
	--return 0
end

function damaged ()
	StartThread (damageSmoke, "blacksmoke", "tpdamagefire_s")
end