pieces = {}
--center pieces & aiming pieces
local base = piece "base"
local arm_r = piece "arm_r"
local arm_l = piece "arm_l"
local flare = piece "flare" --piece "weapon" --flare1
local weapon = piece "weapon"
--local flare1 = piece "flare"
local grenade = piece "grenade"
--other pieces
local head = piece "head"
local leg_r = piece "leg_r"
local leg_l = piece "leg_l"
local belly1 = piece "belly1" table.insert (pieces, belly1)
local belly2 = piece "belly2" table.insert (pieces, belly2)
local belly3 = piece "belly3" table.insert (pieces, belly3)
local belly4 = piece "belly4" table.insert (pieces, belly4)
local belly5 = piece "belly5" table.insert (pieces, belly5)
local belly6 = piece "belly6" table.insert (pieces, belly6)
local belly7 = piece "belly7" table.insert (pieces, belly7)
local belly8 = piece "belly8" table.insert (pieces, belly8)

-------damage pieces-------
exploType = SFX.FALL + SFX.NO_HEATCLOUD
include "tpdamagepieces.lua"
---------------------------

local muzzleflash = SFX.CEG
--signals
local SIG_AIM = 2
local SIG_WALK = 1
local walking = false
--local orc_machinegun_flash = SFX.CEG
--local orc_machinegun_muzzle = SFX.CEG + 1

local walkspeed = 30

local targetUnitID = nil  --what unit is being targeted

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

function headExplodeTest ()	
	local speed = 100
	local x,y,z=Spring.GetUnitPosition (unitID)
	while (true) do
		Spring.Echo ("jo")
		for a = 1, 360, 10 do
			xs = math.sin (math.rad(a)) * speed
			zs = math.cos (math.rad(a)) * speed
			Spring.MoveCtrl.Enable (unitID)
			--Spring.MoveCtrl.SetVelocity (unitID, xs,0, zs)
			
			
			--Spring.MoveCtrl.SetPosition (unitID, x,y,z)
			
			Spring.MoveCtrl.SetPhysics  (unitID, x,y,z, 
			xs, 0, zs,
			0, 0, 0)		
			Explode (head, SFX.FALL)
			--Spring.MoveCtrl.Disable (unitID) 
			Sleep (100)
		end
	end
end

function script.Create()
	--headExplodeTest()
	--Spin(head, y_axis, 5)
	--Spin(arm_r, x_axis, 5)
	Turn (head, y_axis, math.rad (179))
	Spring.SetUnitBlocking (unitID, true, true, true) --crushable!
	--Turn (flare, y_axis, math.rad(-90))
	--Spring.Echo ("heavy dudy")
end

local function RestoreAfterDelay(unitID)
	Sleep(1500)	
	Turn(arm_r, x_axis, 0, math.rad(50))
	Turn(arm_l, x_axis, 0, math.rad(100))
	Turn(base, y_axis, 0, math.rad(180))
	Move (leg_r, z_axis, 0, walkspeed)
	Move (leg_l, z_axis, 0, walkspeed)
	Show (grenade)
end

local activeWeapon = 1
----------
function script.Activate ( )
	activeWeapon = 1
end
function script.Deactivate ( )
	activeWeapon = 2
end
-----------

-------------------version 1
function script.QueryWeapon2() return flare end
function script.AimWeapon2( heading, pitch )
	--Spring.Echo ("AimWeapon2")	
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(base, y_axis, heading, math.rad(900))--360	
	Turn(arm_r, x_axis, -pitch-math.rad(90), math.rad(900))
	WaitForTurn(base, y_axis)
	WaitForTurn(arm_r, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end
function script.Shot1()
	Spring.SetUnitWeaponState (unitID,1,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
	Spring.SetUnitWeaponState (unitID,2,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
end
function script.Shot2()
	Spring.SetUnitWeaponState (unitID,1,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
	Spring.SetUnitWeaponState (unitID,2,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
end


function script.AimFromWeapon1() return flare end --base--head
function script.AimWeapon1( heading, pitch )
	--Spring.Echo ("AimWeapon1")
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(base, y_axis, heading, math.rad(900))--360
	Turn(arm_r, x_axis, -pitch-math.rad(90), math.rad(900))
	WaitForTurn(base, y_axis)
	WaitForTurn(arm_r, x_axis)	
	Spring.SetUnitWeaponState (unitID,1,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
	Spring.SetUnitWeaponState (unitID,2,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
	StartThread(RestoreAfterDelay)
	return true
end

--------------version 2


--[[
function script.AimFromWeapon1() return flare end --base--head
function script.AimWeapon1( heading, pitch )
	Spring.Echo ("AimWeapon1")

	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)

		Turn(base, y_axis, heading, math.rad(900))--360
		Turn(arm_r, x_axis, -pitch-math.rad(90), math.rad(900))
		WaitForTurn(base, y_axis)
		WaitForTurn(arm_r, x_axis)	

	Spring.SetUnitWeaponState (unitID,1,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
	Spring.SetUnitWeaponState (unitID,2,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
	StartThread(RestoreAfterDelay)
	return true
end
--]]

-----------------version 2
--[[
local function trackableTarget (unit)
	if (not unit) then return false end
	local udefID = Spring.GetUnitDefID (unit)
	if (udefID==UnitDefNames["tpdude"].id) then return false end 
	if (udefID==UnitDefNames["tpheavydude"].id) then return false end
	return true
end

function script.AimFromWeapon1() return flare end --base--head
function script.AimWeapon1( heading, pitch )
	--Spring.Echo ("AimWeapon1")
	Spring.Echo (Spring.GetUnitWeaponState (unitID,1,"reloadFrame"))
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	
		Turn(base, y_axis, heading, math.rad(900))--360
		Turn(arm_r, x_axis, -pitch-math.rad(90), math.rad(900))
		WaitForTurn(base, y_axis)
		WaitForTurn(arm_r, x_axis)		
	if (not trackableTarget (targetUnitID)) then		
		if (Spring.GetUnitWeaponState (unitID,1,"reloadFrame") >= Spring.GetGameFrame()) then
			--Turn(flare, y_axis,heading)
			--Turn(flare, x_axis, pitch)
			EmitSfx(flare, 2048+1)
			Spring.SetUnitWeaponState (unitID,1,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
			Turn(flare, x_axis, 0)
			Turn(flare, y_axis,0)
			return false
		end
	end	
	Spring.SetUnitWeaponState (unitID,1,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
	Spring.SetUnitWeaponState (unitID,2,"reloadState",(1.3*30)+Spring.GetGameFrame()) --1.3=reloadtime***
	StartThread(RestoreAfterDelay)
	return true
end

--function script.TargetWeight1 (targetID)
--targetUnitID = targetID
    --Spring.Echo ("********************************TargetWeight() targetID ")
	--return 0
--end

function script.BlockShot1 (targetID, userTarget )
	--Spring.Echo ("-------------blockshot1"..(targetID or "nil"))
	targetUnitID = targetID
	if (not trackableTarget (targetUnitID)) then return true end
	return false
end
--]]

function script.Killed(recentDamage, maxHealth)
	Spring.UnitScript.Explode (piece "hat", SFX.SMOKE)
end