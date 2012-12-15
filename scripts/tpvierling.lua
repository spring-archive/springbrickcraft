pieces = {}
--center pieces
local body = piece "basecenter"

--wheels
local wheel1 = piece "wheel1"		table.insert (pieces, wheel1)
local wheel2 = piece "wheel2"		table.insert (pieces, wheel2)
local wheel3 = piece "wheel3"		table.insert (pieces, wheel3)
local wheel4 = piece "wheel4"		table.insert (pieces, wheel4)
--rounder wheel
local wheel1b = piece "wheel1b"
local wheel2b = piece "wheel2b"
local wheel3b = piece "wheel3b"
local wheel4b = piece "wheel4b"
--flares
local flares = {}
flares [1] = piece "flare_lol"
flares [2] = piece "flare_lor"
flares [3] = piece "flare_hil"
flares [4] = piece "flare_hir"

local flare_lol = piece "flare_lol"
local flare_lor = piece "flare_lor"
local flare_hil = piece "flare_hil"
local flare_hir = piece "flare_hir"
--aiming pieces
local turret = piece "turret2"
local pivot_low = piece "pivot_low"

---blowoffable pieces BASE
local base1 = piece "base1" --lang unten quer
local base2 = piece "base2" --lang unten quer
local base3 = piece "base3"--lang unten quer
local base4 = piece "base4" --lang unten quer
local base5 = piece "base5" table.insert (pieces, base9)
local base6 = piece "base6" table.insert (pieces, base6)
local base7 = piece "base7" table.insert (pieces, base7)
local base8 = piece "base8" table.insert (pieces, base8)
local base9 = piece "base9" table.insert (pieces, base9)
local base10 = piece "base10" table.insert (pieces, base10)
local base11 = piece "base11" table.insert (pieces, base11)
local base12 = piece "base12" table.insert (pieces, base12)
local base13 = piece "base13" table.insert (pieces, base13)
local base14 = piece "base14" table.insert (pieces, base14)
local base15 = piece "base15" table.insert (pieces, base15)
local base16 = piece "base16" table.insert (pieces, base16)
--local base17 = piece "base17" table.insert (pieces, base17) --gibts wohl nicht
local base18 = piece "base18" table.insert (pieces, base18)
local base19 = piece "base19" table.insert (pieces, base19)
local base20 = piece "base20" table.insert (pieces, base20)
local base21 = piece "base21" table.insert (pieces, base21)
--blowoffable pieces TURRET
--turret--
--local turret1 = piece "turret1"  table.insert (pieces, turret1)
--local turret3 = piece "turret3" table.insert (pieces, turret3)
--local turret4 = piece "turret4" table.insert (pieces, turret4)
--local turret5 = piece "turret5" table.insert (pieces, turret5)
--local turret6 = piece "turret6" table.insert (pieces, turret6)
local turret7 = piece "turret7" table.insert (pieces, turret7)
local turret8 = piece "turret1"  table.insert (pieces, turret8)
local turret9 = piece "turret2" table.insert (pieces, turret9)
local turret10 = piece "turret3" table.insert (pieces, turret10)
local turret11 = piece "turret4" table.insert (pieces, turret11)
local turret12 = piece "turret5" table.insert (pieces, turret12)
--barrels

--local barrel_lol =piece "barrel_lol"
--local barrel_lor =piece "barrel_lor"
--local barrel_hir =piece "barrel_hir"
--local barrel_hil =piece "barrel_hil"
local pivot_high  =piece "pivot_high"
local barrels = {}
barrels[1] = piece "barrel_lol"
barrels[2] = piece "barrel_lor"
barrels[3] = piece "barrel_hir"
barrels[4] = piece "barrel_hil"

---blow off pieces defs--
notifyDamaged = true
exploType = SFX.FALL + SFX.NO_HEATCLOUD
include "tpdamagepieces.lua"
-------------------------
local barrelsn = 2		--2 für normal, 4 für upgradet. used for QueryWeapon
local shotfrom = 1		--which barrel will be shot from. [1,2] für normal, [1,4] für upgradet
local hasUpgrade = false
local muzzleflash = SFX.CEG
local ejectshell = SFX.CEG+1

--signals
local SIG_SHOT = 1
local SIG_AIM = 2

-------DRIVING-----
function script.StartMoving()
	Spin(wheel1, x_axis, 3)
	Spin(wheel2, x_axis, 3)
	Spin(wheel3, x_axis, 3)
	Spin(wheel4, x_axis, 3)
end
function script.StopMoving()
	StopSpin (wheel1,x_axis, 3)
	StopSpin (wheel2,x_axis, 3)
	StopSpin (wheel3,x_axis, 3)
	StopSpin (wheel4,x_axis, 3)
end
-------------------------

function script.Create()
	--hide the round wheels
	Hide (wheel1b)
	Hide (wheel2b)
	Hide (wheel3b)
	Hide (wheel4b)
	Hide (pivot_high)
	--Hide (piece "barrel_hil")
	--Hide (barrel_hir)
	Hide (barrels[3])
	Hide (barrels[4])
	--extra barrels nebeneinder statt überaeinander 	oo	oo 		o	o
	--													oo	oo		o	o
	local a = 6
	--Move (barrel_hil, z_axis, -a)
	--Move (barrel_hir, z_axis, -a)
	--Spin (barrel_lol,z_axis, 12)
	--Spin (barrel_lor,z_axis, -12)
end

local function RestoreAfterDelay(unitID)
	Sleep(1000)
	StopSpin (barrels[1],z_axis, 0.2)
	StopSpin (barrels[2],z_axis, 0.2)
	StopSpin (barrels[3],z_axis, 0.2)
	StopSpin (barrels[4],z_axis, 0.2)
	Turn(turret, y_axis, 0, math.rad(45))
	Turn(pivot_low, x_axis, 0, math.rad(20))
end

----Shooting---
function script.QueryWeapon1() 
	--shotfrom = math.random (barrelsn)
	return flares [shotfrom]
end

function script.AimFromWeapon1() return turret end


function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(270))
	--if (math.deg(pitch) < 0) then pitch = 0 end  --do not aim turret too low
	Turn(pivot_low, x_axis, -pitch, math.rad(360))
	WaitForTurn(turret, y_axis)
	WaitForTurn(pivot_low, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end


function script.FireWeapon1()	
	Spin (barrels[1],z_axis, 12)
	Spin (barrels[2],z_axis, -12)
	Spin (barrels[3],z_axis, -12)
	Spin (barrels[4],z_axis, 12)
	EmitSfx(flares [shotfrom], muzzleflash)
	--EmitSfx(flares [shotfrom], lolololo)
	EmitSfx(barrels [shotfrom], ejectshell)
	shotfrom=shotfrom+1
	if (shotfrom > barrelsn) then shotfrom =1 end	
end
------

function upgradegun ()
	--Spring.Echo ("unlocking extra barrels!")
--	local newgun = {}
--	newgun["reloadTime"] = 0.08 --0.17
--	Spring.SetUnitWeaponState(unitID, 0, newgun)--now done in gadget
	barrelsn = 4
	Show (pivot_high)
	Show (barrels[3])
	Show (barrels[4])
	hasUpgrade = true
end

function script.Killed(recentDamage, maxHealth)

end

function explodeBarrel ()
	if (barrelsn>1) then
		Explode (barrels[barrelsn], SFX.FIRE)
		Hide (barrels[barrelsn])
		barrelsn=barrelsn-1
		local newgun = {} 
		if (barrelsn==1) then newgun["reloadTime"] = 0.215 end
		if (barrelsn==2) then 
			newgun["reloadTime"] = 0.17
			Explode (pivot_high, SFX.FALL + SFX.NO_HEATCLOUD)
			Hide (pivot_high)			
		end
		if (barrelsn==3) then newgun["reloadTime"] = 0.125 end
		--if (barrelsn==4) then newgun["reloadTime"] = 0.08 end
		Spring.SetUnitWeaponState(unitID, 0, newgun)
	end
end

function damaged (damage)
	local h,mh = Spring.GetUnitHealth (unitID)
	local p = (h-(damage or 0))/mh
	--Spring.Echo ("p="..p)
	if (barrelsn==4 and p < 0.75) then explodeBarrel ()	end
	if (barrelsn==3 and p < 0.5) then explodeBarrel ()	end
	if (barrelsn==2 and p < 0.25) then explodeBarrel ()	end
end
------------------------------