--center pieces & aiming pieces
local base = piece "base"
local arm_r = piece "arm_r"
local arm_l = piece "arm_l"
local flare = piece "weapon" --flare1
--other pieces
local head = piece "head"
local leg_r = piece "leg_r"
local leg_l = piece "leg_l"

-------FALL OF PIECES--------
exploType = SFX.FALL + SFX.NO_HEATCLOUD
pieces = {}
for i=1,8 do
	local pname = "belly" .. i
	table.insert (pieces, piece (pname))
end
include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
-----------------------------

local muzzleflash = SFX.CEG
--signals
local SIG_AIM = 2
local SIG_WALK = 1
local walking = false
--local orc_machinegun_flash = SFX.CEG
--local orc_machinegun_muzzle = SFX.CEG + 1

local walkspeed = 30

--AllowUnitBuildStep() --> "builderID, builderTeam, unitID, unitDefID, part" 
--end

-------WALKING-----
local function walk()
	Signal(SIG_WALK)
	SetSignalMask(SIG_WALK)		
	while (walking) do
		Move (leg_r, z_axis, -5, walkspeed)
		Move (leg_l, z_axis, 5, walkspeed)
		Turn(arm_l, x_axis, math.rad(40), math.rad(80))
		Turn(arm_r, x_axis, -math.rad(25), math.rad(40))
		WaitForMove (leg_r, z_axis)
		WaitForMove (leg_l, z_axis)
		Sleep (20)
		Move (leg_r, z_axis, 5, walkspeed)
		Move (leg_l, z_axis, -5, walkspeed)
		Turn(arm_l, x_axis, -math.rad(40), math.rad(80))
		Turn(arm_r, x_axis, math.rad(25), math.rad(40))
		WaitForMove (leg_r, z_axis)
		WaitForMove (leg_l, z_axis)
		Sleep (20)
	end
end

local function stopwalk ()

end

function script.StartMoving()	
	walking = true
	StartThread(walk)
end
function script.StopMoving()
	walking = false
	Signal(SIG_WALK)
end
-------------------------

function script.Create()
	Spring.SetUnitBlocking (unitID, true, true, nil,nil, true) --crushable!
--	StartThread (idleAnimation)
Move (head, x_axis, 20)
end

local function RestoreAfterDelay(unitID)
	Sleep(1500)	
	Turn(arm_r, x_axis, 0, math.rad(50))
	Turn(arm_l, x_axis, 0, math.rad(100))
	Turn(base, y_axis, 0, math.rad(180))
	Move (leg_r, z_axis, 0, walkspeed)
	Move (leg_l, z_axis, 0, walkspeed)
end

function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return head end --base

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
		Turn(base, y_axis, heading, math.rad(360))
		--if (math.deg(pitch) < 0) then pitch = 0 end
		Turn(arm_r, x_axis, -pitch-math.rad(90), math.rad(360)) --180
		WaitForTurn(base, y_axis)
		WaitForTurn(arm_r, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.Shot1()
	EmitSfx(flare, muzzleflash)
	--EmitSfx(arm_r, muzzleflash)
	--Sleep(30)
end

function script.EndBurst1 ( )
	--Turn(arm_l, x_axis, 360, math.rad(720))
end

function script.Killed(recentDamage, maxHealth)
	
end


function idleAnimation ()
	while (true) do
		Sleep (math.random (1000, 3000))
		Turn (head, y_axis, math.rad (math.random(-45,45)), math.rad (90))
		WaitForTurn (head, y_axis)
		Sleep (100)
		Turn (head, y_axis, 0, math.rad (180))
	end
end