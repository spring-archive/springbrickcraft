pieces = {}
local base = piece "base"
local turret = piece "turret"
local barrel1 = piece "barrel1"
local barrel2 = piece "barrel2"
local flare1 = piece "flare1"
local flare2 = piece "flare2"

local engine = {}
engine[1] = piece "pod1_1"
engine[2] = piece "pod2_1"
engine[3] = piece "pod3_1"
engine[4] = piece "pod4_1"
local jet = {}	--emit points for jet exhaust
jet[1] = piece "jet1"
jet[2] = piece "jet2"
jet[3] = piece "jet3"
jet[4] = piece "jet4"

local loadPoint = {}	--pieces transported units get attached to
for i=1,9 do
	loadPoint[i] = piece ("b"..i+2)	
end
	loadPoint[1],loadPoint[5] = loadPoint[5],loadPoint[1]	--so vehicles get transported in middle

local ENGINE_ROCK = 2
local exhaust = SFX.CEG
local crashsmoke = SFX.CEG+1
---blow off pieces defs--
exploType = SFX.SHATTER --SFX.FALL + SFX.NO_HEATCLOUD
	for i=1,13 do
		table.insert (pieces, piece ("b" .. i))
	end
	table.insert (pieces, piece ("pod1_"..math.random(1,2)))
	table.insert (pieces, piece ("pod2_"..math.random(1,2)))
	table.insert (pieces, piece ("pod3_"..math.random(1,2)))
	table.insert (pieces, piece ("pod4_"..math.random(1,2)))
	table.insert (pieces, piece ("cockpit" .. math.random (1,2)))
	table.insert (pieces, piece ("tail2"))
	table.insert (pieces, piece ("tail3"))
	table.insert (pieces, piece ("tail4"))
	healthmulti=1.5
include "tpdamagepieces.lua"
------------
include("Configs/tp_crashtypes.lua")

function script.Create()
	Hide (turret)
	Hide (barrel1)
	Hide (barrel2)
	blockBuildingAnimation(-300, 60)
	StartThread (engineExhaust)
end


local fireFrom = 1
function script.QueryWeapon()
	if (fireFrom == 1) then
		return flare1
	else
		return flare2
	end
end

function script.AimFromWeapon() return turret end

function script.AimWeapon ( heading, pitch )
	--Spring.Echo ("pitch=".. pitch)
	Turn (base, x_axis, math.rad(0))
	return true
	--return true
end

function script.Shot()
	fireFrom = fireFrom +1
	if (fireFrom > 2) then fireFrom = 1 end
end
-----------------


function script.Killed(recentDamage, maxHealth)

end

function randomEngineRock ()
    Signal(ENGINE_ROCK)
    SetSignalMask(ENGINE_ROCK)
	local ts = math.pi/4
	for i =1, 4 do
		local ta = -math.rad (math.random (15, 45))
		--if (math.random (0,10) < 5) then ta=-ta end
		Turn (engine[i], x_axis, ta, ts)
	end
	for i =1, 4 do
		WaitForTurn (engine[i], x_axis)
	end
	--Sleep (800)
	for i =1, 4 do
		Turn (engine[i], x_axis, 0, ts)
	end
end

function engineExhaust ()
	while (true) do
		for i=1,4 do
			EmitSfx (jet[i], exhaust)
			Sleep (25)
		end
	Sleep (80)
	end
end

function script.MoveRate(moveRate)
	--Spring.Echo ("moverate="..moveRate)
	if (moveRate==2) then
		local ts = math.pi/2
		for i =1, 4 do
			Turn (engine[i], x_axis, math.rad(45), ts)
		end
	end
	if (moveRate==0) then
		--Spring.Echo ("StopMoving")
		StartThread(randomEngineRock)
		local ts = math.pi
		for i =1, 4 do
			Turn (engine[i], x_axis, 0, ts)
		end		
	end
end


-------Transporting-----
function script.BeginTransport(passengerID)
--Spring.Echo ("hey passenger " .. passengerID)
	local n = #Spring.GetUnitIsTransporting (unitID)+1
	--Spring.UnitScript.AttachUnit (loadPoint[n], passengerID)
	--Hide (loadPoint[n])
end

function script.QueryTransport(passengerID)
	local n = #Spring.GetUnitIsTransporting (unitID)+1
	return loadPoint[n]
	--return base
end

function script.EndTransport ()
	Spring.Echo ("script.TransportDrop")
	for i,uid in pairs(Spring.GetUnitIsTransporting(unitID)) do
		Spring.Echo (i .." - " .. uid)
		Spring.UnitScript.DropUnit (uid)
	end
end

function script.TransportPickup (passengerID)
	--Spring.Echo ("hey passenger " .. passengerID)
	--Spring.UnitScript.AttachUnit (base, passengerID)
	--upgradewheels ()
end
------------------------

--[[
--0 = on ground
--1 = taking off or landing
--2=in flight
function script.MoveRate(moveRate)
	oldmoveRate = moveRate	
end


--function script.StartMoving()
function script.Activate()
	Spring.Echo ("Activate")
--	StartThread(drive)	
	Spin (rotor1,y_axis, 5)
	Spin (rotor2,y_axis, -5)
	--Turn (rotor1, z_axis, math.rad (45))
end
--function script.StopMoving()
function script.Deactivate ()
	Spring.Echo ("Deactivate")
	StopSpin (rotor1,y_axis, 0.01)
	StopSpin (rotor2,y_axis, 0.01)
	--Turn (rotor1, z_axis, math.rad (0))
end

--]]

function script.Falling ( )

end

---crash/killed---------------------------
local isCrashing = false
function script.Killed(recentDamage, maxHealth)	
	isCrashing = true	--call from gadget?
	--GG.crashUnit (unitID, 1, {fallSpeed=5})
	GG.crashUnit (unitID, CrashLand, {fallSpeed = math.random (2,4), horizontalSpeed=math.random (3,4)})
	--GG.crashUnit (unitID, HeliCrash, {fallSpeed = math.random (2,4), tumbleSpin=0.1})
	p = 250
	while (isCrashing) do
		EmitSfx (pieces[math.random (1,#pieces)], crashsmoke)
		if (p>50) then p=p-20 else EmitSfx (pieces[math.random (1,#pieces)], crashsmoke) end
		--Spring.Echo (p)
		Sleep (p)		
	end

	for id,piece in pairs(unblownpieces) do
		Explode (piece, SFX.SHATTER)
		Explode (piece, SFX.SHATTER)
		Explode (piece, SFX.SHATTER)
	end
end

function startCrashing ()
	--Spring.Echo ("startCrashing ()")
end

function endCrashing ()
	--Spring.Echo ("endCrashing ()")
	isCrashing = false
end