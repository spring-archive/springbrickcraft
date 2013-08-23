local base = piece "base"
----damage pieces--------
exploType = SFX.EXPLODE + SFX.NO_HEATCLOUD
pieces = {}
for i=1,8 do
	table.insert (pieces, piece ("b" .. i))
end

include "tpdamagepieces.lua"
-------------------------

function script.Create()
	--FIXME: how comes EVRYTHING can crush walls?
	--Spring.SetUnitBlocking (unitID, true, true, true) --crushable!
	Spin (base, y_axis, math.rad (900))
	Spring.SetUnitNeutral (unitID, true)
	Spring.SetUnitNoSelect (unitID, true)
	--StartThread (blockBuildingAnimation)
	blockBuildingAnimation(-75)
	StopSpin (base, y_axis)
	Turn (base, y_axis, 0, math.rad (900))
	Spring.SetUnitBlocking (unitID, false,false,false) --TEST
end

function script.Killed(recentDamage, maxHealth)
	for id,piece in pairs(unblownpieces) do
		Spring.UnitScript.Explode (piece, SFX.FALL+SFX.NO_HEATCLOUD)
	end
end