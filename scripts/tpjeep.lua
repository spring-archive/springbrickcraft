--Spring.UnitScript.SetUnitValue(COB.MAX_SPEED, 0)
--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0)

--local pieces = {}
--center pieces
local body = piece "basecenter"
local turret = piece "weaponcenter" 
local barrel = piece "weaponcenter"		
local flare = piece "flare"
--wheels
local wheel1 = piece "wheel1"
local wheel2 = piece "wheel2"
local wheel3 = piece "wheel3"
local wheel4 = piece "wheel4"
--rounder wheel
local wheel1b = piece "wheel1b"
local wheel2b = piece "wheel2b"
local wheel3b = piece "wheel3b"
local wheel4b = piece "wheel4b"

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD
exploType = SFX.EXPLODE
for i=1,14 do
	local pname = "base" .. i
	table.insert (pieces, piece (pname))
end
table.insert (pieces, wheel1)
table.insert (pieces, wheel2)
table.insert (pieces, wheel3)
table.insert (pieces, wheel4)
table.insert (pieces, barrel1) 
table.insert (pieces, turret)
healthmulti=1.5
include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
-----------------------------

local wheelsn = 4

--signals
local SIG_AIM = 2
local gunflash = SFX.CEG


-------DRIVING-----
function script.StartMoving()
--	StartThread(drive)
	Spin(wheel1, x_axis, 7) Spin(wheel1b, x_axis, 7)
	Spin(wheel2, x_axis, 7) Spin(wheel2b, x_axis, 7)
	Spin(wheel3, x_axis, 7) Spin(wheel3b, x_axis, 7)
	Spin(wheel4, x_axis, 7) Spin(wheel4b, x_axis, 7)
	--Turn (body, x_axis, math.rad(20), math.rad(180))
end
function script.StopMoving()
--	StartThread(stopdrive)
	StopSpin (wheel1,x_axis, 3) StopSpin (wheel1b,x_axis, 3)
	StopSpin (wheel2,x_axis, 3) StopSpin (wheel2b,x_axis, 3)
	StopSpin (wheel3,x_axis, 3) StopSpin (wheel3b,x_axis, 3)
	StopSpin (wheel4,x_axis, 3) StopSpin (wheel4b,x_axis, 3)
	--Turn (body, x_axis, math.rad(20),math.rad(180))
end

local function rockspeed ()
local lastspeed = 0
while (true) do
	local sx,sy,sz = Spring.GetUnitVelocity (unitID)
	if (sx and sy and sz) then
		local speed = (math.abs (sx)+ math.abs (sy) + math.abs (sz))*10
		local speeddiff = speed - lastspeed
		if (speeddiff < -3) then 
			--Spring.Echo ("unit " .. unitID .. " slowing down " .. speeddiff)
			Turn (body, x_axis, math.rad(20), math.rad(180))
			WaitForTurn (body, x_axis)
		
		else if (speeddiff > 3) then 
			Turn (body, x_axis, math.rad(-20),math.rad(180))
			WaitForTurn (body, x_axis)
			--Spring.Echo ("unit " .. unitID .. " going faster" .. speeddiff) 
			local x,y,z=Spring.GetUnitPosition (unitID) 
			Spring.SpawnCEG("tpsmallsmoke", x, y, z)   --tpsmokecloud
		else
		Turn (body, x_axis, 0,math.rad(360))
		WaitForTurn (body, x_axis)
		end
		end
	lastspeed=speed
	end
	Sleep (100)
	end
end
-------------------------
function upgradewheels ()
	Spring.UnitScript.Hide (wheel1)
	Spring.UnitScript.Hide (wheel2)
	Spring.UnitScript.Hide (wheel3)
	Spring.UnitScript.Hide (wheel4)
	Spring.UnitScript.Show (wheel1b)
	Spring.UnitScript.Show (wheel2b)
	Spring.UnitScript.Show (wheel3b)
	Spring.UnitScript.Show (wheel4b)
	--Spring.UnitScript.SetUnitValue(COB.MAX_SPEED, 10)	--original ist 5
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 300) --now done in gadget
	StartThread (rockspeed)
end


-------Transporting-----
function script.BeginTransport(passengerID)
end

function script.QueryTransport(passengerID)
	return weaponcenter
end

function script.EndTransport(each, passengerID)
end

function script.TransportPickup (passengerID)
	--Spring.Echo ("hey passenger " .. passengerID)
	Spring.UnitScript.AttachUnit (turret, passengerID)
	

--Spring.SetUnitNoDraw (passengerID,true)
	--upgradewheels ()
end
------------------------


--AllowUnitBuildStep() --> "builderID, builderTeam, unitID, unitDefID, part" 
--end

function script.Create()

	local p = Spring.GetUnitPieceMap (unitID)
		
	Spring.Echo ("p= " .. (p["weaponcenter"] or "nil"))
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0)
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate",0)
	
	Sleep (100)	
	--15
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0) --http://springrts.com/mantis/view.php?id=2877
	
	--StartThread (setSpeed)
	
	--local mt = Spring.GetUnitMoveTypeData(unitID)
	--local ospeed = mt.maxSpeed
	--Spring.Echo ("ospeed ="..ospeed)
	--hide round wheels
	Hide (wheel1b)
	Hide (wheel2b)
	Hide (wheel3b)
	Hide (wheel4b)
		--Spring.UnitScript.Hide (wheel1)
		--Spring.UnitScript.Hide (wheel2)
		--Spring.UnitScript.Hide (wheel3)
		--Spring.UnitScript.Hide (wheel4)
	--getTogether (300,200)
end

function setSpeed ()
--Spring.Echo ("setSpeed")
Sleep (100)
Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0)
end

local function RestoreAfterDelay(unitID)
	Sleep(2500)
	Turn(turret, y_axis, 0, math.rad(90))
	Turn(barrel, x_axis, 0, math.rad(50))
end

function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return turret end

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(360))
	if (math.deg(pitch) < 0) then pitch = 0 end
	Turn(barrel, x_axis, -pitch, math.rad(360)) --rad(50)
	WaitForTurn(turret, y_axis)
	WaitForTurn(barrel, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.Shot1()
	EmitSfx (flare, gunflash)	
end

------react to enemy fire-----
function script.Killed(recentDamage, maxHealth)
	disintegrateUnit (300, 50)
	Sleep (500)
	--for id,piece in pairs(unblownpieces) do
--		Spring.UnitScript.Explode (piece, SFX.FIRE)
	--end
end
------------------------------