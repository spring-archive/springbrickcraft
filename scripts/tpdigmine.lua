local base = piece "base"
local body = piece "body"
local flare = piece "flare"
local flare_high = piece "flare_high"
local rotor = piece "rotor"

local mt = Spring.GetUnitMoveTypeData(unitID)
local originalspeed = mt.maxSpeed--Spring.MoveCtrl.GetGroundMoveTypeData(unitID, "maxSpeed")  --Spring.UnitScript.GetUnitValue(COB.MAX_SPEED)
local originalturnrate = mt.turnRate  --Spring.UnitScript.GetGroundMoveTypeData(unitID, "RurnRate")

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD
for i=1,4 do
	local pname = "spike" .. i
	table.insert (pieces, piece (pname))
end
healthmulti=1.2
include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
-----------------------------

local digeffect = SFX.CEG
local jumpeffect = SFX.CEG+1

--signals
local SIG_AIM = 2
local SIG_DIRT = 4
local nearEnemy = false

-------DRIVING-----
function script.StartMoving()
StartThread (sprayDirt)
end
function script.StopMoving()
Signal(SIG_DIRT)
end

function script.Create()	
	--Spin (radar, y_axis, math.rad (250))	
	digIn()
	StartThread (checkForEnemy)	
end

function sprayDirt ()
	Signal(SIG_DIRT)
    SetSignalMask(SIG_DIRT)
	while (true) do
		EmitSfx(rotor, digeffect)
		Sleep (50)
	end	
end

function checkForEnemy ()
	while (true) do
		nearEnemy = false
		Sleep (500)
		for i=1,5 do
			Sleep (100)
			--Spring.Echo ("false gemacht")
			if (nearEnemy == false) then
				--Spring.Echo ("war false")
				--Signal(SIG_DIRT) ---****wtf: [f=0024722] LuaRules::RunCallIn: error = 2, GameFrame, [string "LuaGadgets/Gadgets/unit_script.lua"]:745: attempt to index field '?' (a nil value)   
				digIn()				
			else				
				goMobile ()
				break
			end
		end
	end
end

function script.AimWeapon2( heading, pitch )
	--Spring.Echo ("aiming")
	nearEnemy = true
	return false
end

function script.AimFromWeapon2() return flare_high end

function goMobile ()
	EmitSfx(body, digeffect)
	Move (body, y_axis, -5,20)
	Spin (rotor, y_axis, math.rad (720))
	Turn (body, x_axis, math.rad (-90), math.rad (720))
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", originalspeed)
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate",originalturnrate)
end

function digIn ()
	--EmitSfx(body, digeffect)
	Move (body, y_axis, -12,5)
	Spin (rotor, y_axis, math.rad (45))
	Turn (body, x_axis, 0, math.rad (90))
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0)
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate",0)	
end

function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return base end

function script.AimWeapon1( heading, pitch )
	--Turn(base, y_axis, heading)
	--Turn(base, x_axis, pitch)
	return true
end

function script.FireWeapon1()	
	--Sleep(30)
	EmitSfx (body, jumpeffect)
	Spring.DestroyUnit (unitID)
end



------react to enemy fire-----
function script.Killed(recentDamage, maxHealth)
	--for id,piece in pairs(unblownpieces) do
		--Spring.UnitScript.Explode (piece, SFX.FIRE)
	--end
end
------------------------------