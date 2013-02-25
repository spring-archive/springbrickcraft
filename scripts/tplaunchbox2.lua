--in dieser version sind die seitlichen waffen werfer für zielmarkierungsdinger

local hipr = piece "hipr"
local legr = piece "legr"
local hipl = piece "hipl"
local legl = piece "legl"
local body = piece "body"
local base = piece "base"
local hatch = {}
	hatch[1] = piece "hatch1"
	hatch[2] = piece "hatch2"
	hatch[3] = piece "hatch3"
	hatch[4] = piece "hatch4"
local flare = {}
	flare[1] = piece "flare1"--"flare1"
	flare[2] = piece "flare2"--"flare2"
	flare[3] = piece "flare3"--"flare3"
	flare[4] = piece "flare4"--"flare4"
local shotfrom = 1
--side barrels--
local flareR = piece "flarer"
local turretR = piece "turretr"
local barrelR = piece "barrelr"
local flareL = piece "flarel"
local turretL = piece "turretl"
local barrelL = piece "barrell"
local toleranceA = math.rad(20)	--how many degrees the semi circle fire range is expanded to each side

--walk animation variables
local mspeed = 25				--walk animation move speed
local tspeed = math.rad (90)	--' ' turn '
local wa = math.rad(30)			--wie weit die beine schwingen
local btspeed = tspeed/4		--body rock speed
local ba = wa/4			--body rock angle
local SIG_WALK = 2
local SIG_WALKSTOP = 4
local SIG_AIM_R = 8
local SIG_AIM_L = 16
-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD
for i=1,12 do
		table.insert (pieces, piece ("b" .. i))
	end
	for i=1,3 do
		table.insert (pieces, piece ("hipr" .. i))
		table.insert (pieces, piece ("hipl" .. i))
		table.insert (pieces, piece ("footr" .. i))
		table.insert (pieces, piece ("footl" .. i))
	end	
include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
-----------------------------


local muzzleflash = SFX.CEG+0

function script.Create()
	StartThread(blockBuildingAnimation)
	Turn (barrelL, z_axis, -math.rad(45))
	Turn (barrelR, z_axis, math.rad(45))
end

local function RestoreAfterDelay(unitID)

end

---WALKING----
function walk()
	Signal(SIG_WALK)
	SetSignalMask(SIG_WALK)	
	while (true) do
		Turn (body, x_axis, -ba, btspeed)
		Turn (hipr, x_axis, -wa, tspeed)
		Turn (hipl, x_axis, wa, tspeed)
		Move (legr, y_axis,10, mspeed)
		Move (legl, y_axis,0, mspeed)		 
		 WaitForMove (legr, y_axis)
		 WaitForMove (legl, y_axis)
		 WaitForTurn (body, y_axis)
		 WaitForTurn (hipr, x_axis)
		 WaitForTurn (hipl, x_axis)
		Move (legr, y_axis, 0, mspeed)
		Move (legl, y_axis, 10, mspeed)
		Turn (body, x_axis, ba, btspeed)
		Turn (hipr, x_axis, wa, tspeed)
		Turn (hipl, x_axis, -wa, tspeed)
		 WaitForMove (legr, y_axis)
		 WaitForMove (legl, y_axis)
		 WaitForTurn (body, y_axis)
		 WaitForTurn (hipr, x_axis)
		 WaitForTurn (hipl, x_axis)
		Sleep (5)
	end	
end

function stopwalk()
	Signal(SIG_WALK) --stop the walk thread
	Sleep (5)
	Move (legl, y_axis, 0, mspeed)
	Move (legr, y_axis, 0, mspeed)
	--Turn (body, x_axis, 0, btspeed)
	Turn (hipr, x_axis, 0, tspeed)
	Turn (hipl, x_axis, 0, tspeed)
end

function script.StartMoving()
	Turn (body, x_axis, 0, math.rad(180))
	Move (body, y_axis, 0, 10)
	StartThread(walk)
end
	
function script.StopMoving()
	StartThread(stopwalk)
	Turn (body, x_axis, math.rad(-90), math.rad(180))
	Move (body, y_axis, -15, 10)
end
-------------

--CRUISE MISSILES
function launchMissiles (targetX,targetY,targetY)
	StartThread (launchMissilesThread, targetX,targetY,targetY)
end

function launchMissilesThread (targetX,targetY,targetY)
	SetSignalMask(8)
	local teamID = Spring.GetUnitTeam (unitID)
	for launches =1,4 do
		--local x,y,z = Spring.GetUnitPosition (unitID)
		local x,y,z = Spring.GetUnitPiecePosDir (unitID, flare[launches])
		local missile = Spring.CreateUnit ("tpabfang", x,y,z, math.random(1,4), teamID)
		--Spring.SetUnitNoSelect (missile, true)
		Spring.GiveOrderToUnit(missile, CMD.FIRE_STATE , { 0 }, {}) --hold fire
		Spring.GiveOrderToUnit(missile, CMD.ATTACK  , {targetX,targetY,targetY}, {CMD.OPT_INTERNAL}) 
		
		if (launches < 3) then
			Turn (hatch[launches], x_axis,-math.rad(90), math.rad(720))
		else
			Turn (hatch[launches], x_axis,math.rad(90), math.rad(720))	
		end		
		Sleep (800)
		--Spring.Echo ("go!")
	end
	StartThread (closehatches)
end

------SHOOTING--------
---target marker---
function script.QueryWeapon1() return flare[shotfrom] end

function script.AimFromWeapon1() return flare[shotfrom] end

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)	
	
	--Turn (turretL, x_axis, pitch)
	--Turn (barrelL, x_axis, pitch+math.rad(20))
	--Turn (turretR, x_axis, pitch)
	--Turn (barrelR, x_axis, pitch-math.rad(20))
	
	--Turn (body, x_axis, -math.rad(90), math.rad(180))
	
	--if (math.abs (math.deg(heading)) > 90) then pitch=math.rad(180)-pitch end	--heading ist scheinbar worldcoordinates	
	--Turn (body, x_axis, math.rad(-90), math.rad(180))
	--WaitForTurn (body, x_axis)	
	
	
	--Turn(flare[shotfrom], y_axis, heading)
	
	--Turn(flare[shotfrom], x_axis, pitch)
	
	return true
end

function script.EndBurst1 ()	
	--StartThread (closehatches)	
end

function closehatches ()
	Sleep (1000)
	for i=1,4,1 do
		Turn (hatch[i], x_axis,0, math.rad(90+math.random(0,90)))
	end	
end

function script.Shot1 ()
	--[[
	EmitSfx(flare [shotfrom], muzzleflash)
	if (shotfrom < 3) then
		Turn (hatch[shotfrom], x_axis,-math.rad(90), math.rad(720))
	else
		Turn (hatch[shotfrom], x_axis,math.rad(90), math.rad(720))	
	end
	--]]
	shotfrom=shotfrom+1
	if (shotfrom > 4) then shotfrom = 1 end	
end

--[[
----FLAME THROWERS---
function script.QueryWeapon3() return flareR end
function script.AimFromWeapon3() return turretR end
function script.AimWeapon3( heading, pitch )
	--Signal(SIG_AIM_R)
	--SetSignalMask(SIG_AIM_R)
	--Spring.Echo (math.deg (heading))
	--if   (heading > math.rad(180+20) and heading < math.rad (340)) then return false end
	Turn (turretR, x_axis, pitch)
	Turn (barrelR, y_axis, heading-math.rad(90))
	return true
end

function script.Shot2 ()
	--EmitSfx(flareR, muzzleflash)
end

function script.QueryWeapon2() return flareL end
function script.AimFromWeapon2() return turretL end
function script.AimWeapon2( heading, pitch )	
	--Signal(SIG_AIM_L)
	--SetSignalMask(SIG_AIM_L)
	--if  (heading < math.rad(180-20) and heading > math.rad(20)) then return false end
	Turn (turretL, x_axis, pitch)
	Turn (barrelL, y_axis, heading+math.rad(90))
	--Turn (turretL, x_axis, pitch)
	--Turn (barrelL, y_axis, heading)
	return true
end

function script.Shot3 ()
	--EmitSfx(flareL, muzzleflash)
end
---------------------
--]]

------react to enemy fire-----
function script.Killed(recentDamage, maxHealth)

end
------------------------------