local wheel1 = piece "wheel1"
local wheel2 = piece "wheel2"
local wheel3 = piece "wheel3"
local wheel4 = piece "wheel4"
local wheel5 = piece "wheel5"
local wheel6 = piece "wheel6"
local wheelspeed = math.rad (240)
local base = piece "base"

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.EXPLODE + SFX.NO_HEATCLOUD
for i=1,8 do
		table.insert (pieces, piece ("b" .. i))
	end
	for i=1,4 do
		table.insert (pieces, piece ("w5_" .. i))
		table.insert (pieces, piece ("w6_" .. i))
	end
	table.insert (pieces, wheel1)
	table.insert (pieces, wheel2)
	table.insert (pieces, wheel3)
	table.insert (pieces, wheel4)
healthmulti = 1.5
include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
----------------------------

local flare = piece "flare"
local SIG_DIRT = 1

function script.Create()
--	Spring.Echo ("unit BIGWHEEL" .. unitID .. " was created!")	
	StartThread(blockBuildingAnimation,50)
	--Spring.SetUnitCloak (unitID, 2, 150)
end

local function RestoreAfterDelay(unitID)

end

function script.QueryWeapon() return flare end

function script.AimFromWeapon(n) return flare end

function script.AimWeapon( heading, pitch )
	if (GG.GetMana (unitID) >= 2) then		
		return true
	else
		return false
	end
end

function script.FireWeapon()
	GG.AdjustMana (unitID, -1.5)
end

function script.Killed(recentDamage, maxHealth)
	Sleep(30)
end

function script.StartMoving()	
	spinWheels()
end

function script.StopMoving()
	stopWheels()
end

function spinWheels ()
	Spin (wheel1, x_axis,wheelspeed)
	Spin (wheel2, x_axis,wheelspeed)
	Spin (wheel3, x_axis,wheelspeed)
	Spin (wheel4, x_axis,wheelspeed)
	Spin (wheel5, x_axis,wheelspeed/2)
	Spin (wheel6, x_axis,wheelspeed/2)
end

function stopWheels ()
	StopSpin (wheel1, x_axis)
	StopSpin (wheel2, x_axis)
	StopSpin (wheel3, x_axis)
	StopSpin (wheel4, x_axis)
	StopSpin (wheel5, x_axis)
	StopSpin (wheel6, x_axis)
end-------Transporting-----
function script.BeginTransport(passengerID)
end

function script.QueryTransport(passengerID)
	return base
end

function script.EndTransport(each, passengerID)
end

function script.TransportPickup (passengerID)
	Spring.UnitScript.AttachUnit (base, passengerID)
end

----- digging -----
function startDiggingDown ()
	Spin (base, y_axis, math.rad (360), math.rad (45))
	--Turn (base, x_axis, math.rad (90), math.rad (90))
	StartThread (dirtSpray)
end

function startDiggingUp ()
	StartThread (dirtSpray)
	Spin (base, y_axis, math.rad (360), math.rad (45))
	--Turn (base, x_axis, -math.rad (90), math.rad (90))
	--StartThread (dirtSpray)	--do it for the dirtspray effect
end

function FinishedDiggingUp ()
	StopSpin (base, y_axis, math.rad (45))
	Turn (base, y_axis, math.rad (360))
	Turn (base, y_axis, math.rad (0), math.rad (90))
	StartThread (dirtSpray)
end

function DigUp ()
	local x,y,z=Spring.GetUnitPosition (unitID)
	local groundHeight = Spring.GetGroundHeight (x,z)	
	Spring.SpawnCEG ("tpdirtdigging", x+math.random(-30,30),groundHeight,z+math.random(-30,30))
end

----WIGGLE a few moments, after coming to surface
function dirtSpray()
	Signal(SIG_DIR)
	SetSignalMask(SIG_DIRT)
	local x,y,z=Spring.GetUnitPosition (unitID)
	local groundHeight = Spring.GetGroundHeight (x,z)
	for m = 1, 30 do
		Spring.SpawnCEG ("tpdirtdigging", x+math.random(-30,30),groundHeight,z+math.random(-30,30))
		Sleep (100)
	end
end