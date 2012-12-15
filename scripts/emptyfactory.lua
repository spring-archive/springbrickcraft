local pad = piece "padtopcenter"
local nano = piece "padtopcenter"

function script.Create()
	--Spring.Echo ("Heliport " .. unitID .. " was created!")
end

local function RestoreAfterDelay(unitID)

end

function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return turret end

function script.AimWeapon1( heading, pitch )

	return true
end
--------BUILDING---------
function script.QueryBuildInfo() return pad end

function script.QueryNanoPiece() return nano end

function script.Activate()
	SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.BUGGER_OFF, 1)
	return 1
end

function script.Deactivate()
	SetUnitValue(COB.YARD_OPEN, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	SetUnitValue(COB.BUGGER_OFF, 0)
	return 0
end
---------------------
function script.FireWeapon1()

	Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	Sleep(30)
end