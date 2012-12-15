pieces = {}
local flare = piece "flare_front"
local base = piece "base"
local placeholder = piece "b_sep75"

healthmulti = 2
---blow off pieces defs--
exploType = SFX.FALL
	for i=51,76 do
		table.insert (pieces, piece ("b_sep" .. i))
	end

include "tpdamagepieces.lua"
include("Configs/tp_crashtypes.lua")
------------

local blacksmoke = SFX.CEG

function script.Create()
	--blockBuildingAnimation()
	--Turn (flare1, y_axis, math.rad (90))
	--Turn (flare2, y_axis, -math.rad (90))
	Hide (placeholder)
end

local function RestoreAfterDelay(unitID)

end



function script.QueryWeapon()
	return flare
end

function script.AimFromWeapon() return flare end

function script.AimWeapon ( heading, pitch )
	return true
end

function script.Shot()

end
-----------------

----------------------------
local isCrashing = false
function script.Killed(recentDamage, maxHealth)	
	isCrashing = true	--call from gadget?
	--GG.crashUnit (unitID, 1, {fallSpeed=5})
	--GG.crashUnit (unitID, CrashLand, {fallSpeed = math.random (2,4), horizontalSpeed=math.random (0,3)})	
	Spin (base, z_axis, math.rad(math.random (-360,360)), math.rad(45))
	GG.crashUnit (unitID, CrashLand, {fallSpeed = math.random (-5,5), horizontalSpeed=5})
	local n = math.random (50,300)
	while (isCrashing and n > 0) do	
		EmitSfx (base, blacksmoke)
		Sleep (75)
		n = n -1
	end
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