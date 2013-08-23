--------TRACK CONFIGS---------
trackpiecename_pre = "t_copy"
trackpiecename_startnumber = 445
trackpiecename_endnumber = 463
 trackn = 8 
 trackheightoffset = 11 --14
 wheelr = 8						--wheel radius--8
 trackoffsetx = 24					--gauge of the tank, how far apart the tracks run
 D = 27							--distance between center of wheels
 U = (2*math.pi*wheelr) + D+D		--total perimeter/length of track per side
 u1 = D / 2						--several lengths to divide the track into certain parts
 u2 = u1 + (math.pi*wheelr)
 u3 = u2 + D
 u4 = u3 + (math.pi*wheelr)
include "tp_tanktracks.lua"
-----------------------------
-------FALL OF PIECES--------
exploType = SFX.FALL + SFX.NO_HEATCLOUD
pieces = {}
for i=418,441 do
	local pname = "b_sep" .. i
	table.insert (pieces, piece (pname))
end
for i=445,463 do
	if (math.random(0,10) > 6) then
		local pname = "t_copy" .. i
		table.insert (pieces, piece (pname))
	end
end
if (math.random (1,10) > 5) then
	table.insert (pieces, piece "armA1")
	table.insert (pieces, piece "armA2")
else
	table.insert (pieces, piece "armA3")
	table.insert (pieces, piece "armA4")
end

include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
-----------------------------
local flare = piece "armB3"
local base = piece "base"
local armA = piece "armA"
local armB = piece "armB"
local rotor = piece "armB3"
local mineral = piece "tetra"
local claw1 = piece "claw1"
local claw2 = piece "claw2"
local aimpoint = piece "aimpoint"

local SIG_AIM = 2
local SIG_ARMDOWN = 8
local mineeffect = SFX.CEG		--flying mineral shard
local armspeed = math.rad(180)

local cargo = 0

function script.Create()
	Hide (mineral)	
	--if Spring.GetGameFrame () < 5 then
		--getTogether (900, 600)
		--Sleep (3000)
	--end
	initTracks ()
	--Spring.Echo ("unit GRIPPER " .. unitID .. " was created!")
	--Sleep (100)	
end

function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return aimpoint end

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	--Turn (base, y_axis, heading,math.rad(180))
	Turn (base, y_axis,heading, math.rad (90))
	WaitForTurn (base,y_axis)
	Turn (armA, x_axis, math.rad(90),armspeed)
	Turn (armB, x_axis, math.rad(-80),armspeed)	
	WaitForTurn (armA,x_axis)
	WaitForTurn (armB,x_axis)	
	--StartThread (ArmDown)
	return true
end

function script.Shot1()
	--StartThread (ArmDown)
end

function ArmDown ()
	--Sleep (2000)
	Signal(SIG_ARMDOWN)
	SetSignalMask(SIG_ARMDOWN)
	Turn (armA, x_axis, 0,armspeed)
	Turn (armB, x_axis, 0,armspeed)
	WaitForTurn (armA,x_axis)
	WaitForTurn (armB,x_axis)	
end

function claw (a)
	Turn (claw1, y_axis, math.rad(a),armspeed)
	Turn (claw2, y_axis, -math.rad(a),armspeed)
end

function script.FireWeapon1()
--	EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)	       
end

function script.Killed(recentDamage, maxHealth)
	Sleep(30)
end

function miningWork (cargo, addedCargo)
	--Spring.Echo ("i am mining")
	if (cargo > 450) then Show (mineral) end
	claw (110)--90
	Spin (rotor,z_axis,math.rad(180))
	--EmitSfx (flare, mineeffect)
end

function miningEnd ()
	--Spring.Echo ("finished mining")
	--if (cargo==0) then claw (0) else claw (110) end
	StopSpin (rotor,z_axis)
	Turn (rotor,z_axis,0,math.rad(180))
	StartThread (ArmDown)
end

function miningUnload(unloadedCargo)
	--Spring.Echo ("unloading cargo")
	claw (0)
	Explode (mineral, SFX.FALL)
	Hide (mineral)
end

function miningCargo(cargo)
	--Spring.Echo ("my cargo is " .. cargo)
end

--[[
function harvestCargo (cargo)
	if ((oldcargo or 0)> cargo) then Spring.UnitScript.Explode (mineral, SFX.FALL) claw (0) end
	oldcargo=cargo
	if (cargo > 400) then claw (80) Show (mineral) else Hide (mineral) end
end
--]]

----driving----
function script.StartMoving()	
	Turn (base, y_axis,0, math.rad (90))
	driving = true
	StartThread(drive) --move the tracks
end

function script.StopMoving()
	driving = false
	Signal (SIG_DRIVE)	
end
---------------