local base = piece "base"
local flare_tail = piece "flare_tail"
local body3 = piece "body3"
local body4 = piece "body4"
local body5 = piece "body5"
local body6 = piece "body6"

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD
	for i=1,6 do
		table.insert (pieces, piece ("body" .. i))
		table.insert (pieces, piece ("leg" .. i))
	end	
	table.insert (pieces, piece ("clawL"))
	table.insert (pieces, piece ("clawR"))
healthmulti = 1.5
include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
---------------------------

local SIG_WALK = 1	--signal for the walk animation thread
local SIG_WIGGLE = 2
local legs = {}
for i=1,6 do	
	legs[i] = piece ("leg" .. i)
end


function script.Create()
	--Spring.Echo ("scorpion " .. unitID .. " was created!")
end


function script.QueryWeapon1() return flare_tail end

function script.AimFromWeapon1() return flare_tail end

function script.AimWeapon1( heading, pitch )
	--tailUp (math.rad(180))
	tailTo ((pitch+math.rad(130)), math.rad(180))
	waitForTail ()
	return true
end

function script.FireWeapon1()
	--tailDown (math.rad(45))
	Sleep (2000)
	tailTo (math.rad(0), math.rad(45))
	--	EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)
end

function script.Killed(recentDamage, maxHealth)
	Sleep(30)
end


function tailUp (speed)
	Turn (body3, x_axis, math.rad(45),speed)
	Turn (body4, x_axis, math.rad(45),speed)
	Turn (body6, x_axis, math.rad(45),speed)
	Turn (body5, x_axis, math.rad(45),speed)
end

function tailDown (speed)
	Turn (body3, x_axis, math.rad(0),speed)
	Turn (body4, x_axis, math.rad(0),speed)
	Turn (body6, x_axis, math.rad(0),speed)
	Turn (body5, x_axis, math.rad(0),speed)
end

function tailTo (a, speed)
	a=a/4
	Turn (body3, x_axis, a,speed)
	Turn (body4, x_axis, a,speed)
	Turn (body6, x_axis, a,speed)
	Turn (body5, x_axis, a,speed)
end

function waitForTail ()
	WaitForTurn (body3, x_axis)
	WaitForTurn (body4, x_axis)
	WaitForTurn (body6, x_axis)
	WaitForTurn (body5, x_axis)
end

---WALKING---
local legA = math.rad (45)
local legS = math.rad (500)
local function walk()
	Signal(SIG_WALK)
	SetSignalMask(SIG_WALK)
	while (true) do		
		for i=1,6 do			
			Turn (legs[i], z_axis, math.random(-1,1)*legA, legS)
		end		
		Sleep (100)
	end
end

----WIGGLE a few moments, after coming to surface
local function wiggleThread()
	Signal(SIG_WIGGLE)
	SetSignalMask(SIG_WIGGLE)
	local x,y,z=Spring.GetUnitPosition (unitID)
	local groundHeight = Spring.GetGroundHeight (x,z)
	for m = 1, 10 do
		for i=1,6 do			
			Turn (legs[i], z_axis, math.random(-1,1)*legA, legS)
		end	
		Spring.SpawnCEG ("tpdirtdigging", x,groundHeight,z)
		Sleep (100)
	end
	for i=1,6 do			
		Turn (legs[i], z_axis, 0, legS)
	end
	--not so nice to put here but sometimes unit remained on its head
	Turn (base, x_axis, math.rad (0))
end


function script.StartMoving()
	StartThread (walk)
end

function script.StopMoving()
	Signal(SIG_WALK)
	for i=1,6 do
		Turn (legs[i], z_axis, 0, legS)		
	end
end


function startDiggingDown ()
	Turn (base, x_axis, math.rad (90), math.rad (90))
	StartThread (wiggleThread)
end

function startDiggingUp ()
	Turn (base, x_axis, -math.rad (90), math.rad (90))
	--StartThread (wiggleThread)	--do it for the dirtspray effect
end

function FinishedDiggingUp ()
	Turn (base, x_axis, math.rad (0), math.rad (90))
	StartThread (wiggleThread)
end

