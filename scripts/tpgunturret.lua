local turret = piece "turret"
local barrel = piece "barrel"
local flare = piece "flare"
--antenna
local rotor = piece "rotor"
local ant1 = piece "ant1"
local ant2 = piece "ant2"

local SIG_AIM = 2
local muzzleflash = SFX.CEG
-------damage pieces-------
exploType = SFX.FALL + SFX.NO_HEATCLOUD
pieces = {}
for i=1,16 do
	table.insert (pieces, piece ("b" .. i))
end
table.insert (pieces, piece "t1")
table.insert (pieces, piece "t2")
table.insert (pieces, piece "t3")
table.insert (pieces, piece "t4")
table.insert (pieces, piece "ant1")
table.insert (pieces, piece "ant2")
include "tpdamagepieces.lua"
---------------------------

function script.Create()
	--Spring.Echo ("GUNTURRET: unit " .. unitID .. " was created!")	
	StartThread(blockBuildingAnimation, -50,20)
	Spin (rotor, y_axis, math.rad (90))
	Spin (ant1, y_axis, math.rad (270))
	Spin (ant2, y_axis, -math.rad (270))	
	
	--Spring.SetUnitRotation (unitID, 0,math.pi,0)
	
	--Spring.SetUnitDirection (unitID, 0,1,0)
	
	--Spring.SetUnitDirection (unitID, 0,0,0)
	--Spring.MoveCtrl.Enable (unitID)
	--Spring.MoveCtrl.SetHeading (unitID, 65536)
	--Spring.MoveCtrl.Disable (unitID)
end

local function RestoreAfterDelay(unitID)

end

----SHOOTING-------
function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return flare end

local pickNewTarget = false --somewhatish working attempt at http://springrts.com/mantis/view.php?id=4491
function script.AimWeapon1( heading, pitch )
--Spring.Echo ("AimWeapon" .. Spring.GetGameFrame())
	Spring.Echo ("pitch="..math.deg(pitch))
	if (math.deg(pitch) > 10) then 
		pickNewTarget = true 
		UnitScript.SetUnitValue(COB.CHANGE_TARGET, 1)
		return false
	end
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(180))
	if (math.deg(pitch) < 0) then pitch = 0 end
	Turn(barrel, x_axis, -pitch, math.rad(90))
	WaitForTurn(turret, y_axis)
	WaitForTurn(barrel, x_axis)
	return true
end

--[[
function script.BlockShot1 ( targetUnitID, userTarget )
	--Spring.Echo ("BlockShot" .. Spring.GetGameFrame() )
	if pickNewTarget then
		pickNewTarget = false
		Spring.Echo ("blocked")		
		return true
	else
		return false
	end
end
--]]

function script.FireWeapon1()
--	EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)	       
	--Sleep(30)
	Move (barrel, z_axis, -3)
	Move (barrel, z_axis, 0,10)
	EmitSfx(flare, muzzleflash)
end

function script.Killed(recentDamage, maxHealth)
	for id,piece in pairs(unblownpieces) do
		Spring.UnitScript.Explode (piece, SFX.SHATTER)--+SFX.NO_HEATCLOUD)
		Hide (piece)
		Sleep (100)
	end
end
---------------