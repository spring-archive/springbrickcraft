pieces = {}
local rotor1 = piece "rotor1"
local rotor2 = piece "rotor2"
local base = piece "base"
local flare1 = piece "pod1"
local flare2 = piece "pod4"
local fan1 = piece "enginel3"
local fan2 = piece "enginer3"

---blow off pieces defs--
exploType = SFX.FALL--SFX.SHATTER
	for i=1,12 do
		table.insert (pieces, piece ("base" .. i))
	end
	for i=1,4 do
		table.insert (pieces, piece ("cp" .. i))
	end
	table.insert (pieces, piece ("pod1"))
	table.insert (pieces, piece ("pod3"))
	table.insert (pieces, piece ("pod4"))
	table.insert (pieces, piece ("pod6"))
	table.insert (pieces, piece ("enginer1"))
	table.insert (pieces, piece ("enginel1"))
	table.insert (pieces, fan1)
	table.insert (pieces, fan2)
include "tpdamagepieces.lua"
include("Configs/tp_crashtypes.lua")
------------

local blacksmoke = SFX.CEG

function script.Create()
	blockBuildingAnimation(-300, 60)

	Turn (rotor1, y_axis, math.rad(45))
	Spin (rotor1, y_axis, 10)
	Spin (rotor2, y_axis, -10)
	Spin (fan1,z_axis, -5)
	Spin (fan2,z_axis, 5)
	--Turn (flare1, y_axis, math.rad (90))
	--Turn (flare2, y_axis, -math.rad (90))
end

local function RestoreAfterDelay(unitID)

end



local fireFrom = 1
function script.QueryWeapon()
	if (fireFrom == 1) then
		return flare1
	else
		return flare2
	end
end

function script.AimFromWeapon() return base end

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

----------------------------
local isCrashing = false
function script.Killed(recentDamage, maxHealth)
	
	--Spring.MoveCtrl.Enable (unitID)
	--Spring.MoveCtrl.SetRotationVelocity (unitID, 0, 4, 0)
	--Sleep (9000)
	
	isCrashing = true	--call from gadget?
	--GG.crashUnit (unitID, 1, {fallSpeed=5})
	--GG.crashUnit (unitID, CrashLand, {fallSpeed = math.random (2,4), horizontalSpeed=math.random (0,3)})
	GG.crashUnit (unitID, HeliCrash, {fallSpeed = math.random (2,4), tumbleSpin=0.1})
	local crashSpin = math.random (-2,2)
	--Spin (base, y_axis, crashSpin * math.rad (100))
	if (crashSpin == 2) then StopSpin (rotor2, y_axis, 0.1) end
	if (crashSpin == 1) then Explode (rotor2, SFX.FALL) Hide (rotor2) end
	if (crashSpin == -1) then Explode (rotor1, SFX.SHATTER) Hide (rotor1) end
	if (crashSpin == -2) then StopSpin (rotor1, y_axis, 0.1) end
	while (isCrashing) do
		if (crashSpin > 0) then EmitSfx (rotor2, blacksmoke) end
		if (crashSpin < 0) then EmitSfx (rotor1, blacksmoke) end
		if (crashSpin == 0) then EmitSfx (base, blacksmoke) end
		Sleep (75)
	end
	if (crashSpin == -1) then Explode (rotor2, SFX.FALL) Hide (rotor2) end
	if (crashSpin == 1) then Explode (rotor1, SFX.FALL) Hide (rotor1) end
	Explode (fan1, SFX.FIRE+SFX.SMOKE)
	Explode (fan2, SFX.FIRE+SFX.SMOKE)
	for id,piece in pairs(unblownpieces) do
		Spring.UnitScript.Explode (piece, SFX.FALL)
	end
end

function startCrashing ()
	--Spring.Echo ("startCrashing ()")
end

function endCrashing ()
	--Spring.Echo ("endCrashing ()")
	isCrashing = false
end
------------------------------



function startDiggingDown ()
	Turn (rotor1, x_axis, math.rad (90), math.rad (90))
	Turn (rotor2, x_axis, math.rad (90), math.rad (90))
end

function startDiggingUp ()
	Turn (rotor1, x_axis, -math.rad (0), math.rad (90))
	Turn (rotor2, x_axis, math.rad (0), math.rad (90))
	--StartThread (wiggleThread)	--do it for the dirtspray effect
end

function FinishedDiggingUp ()
	--Turn (base, x_axis, math.rad (0), math.rad (90))
	
end


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