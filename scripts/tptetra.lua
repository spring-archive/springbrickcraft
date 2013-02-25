-------FALL OF PIECES--------
local exploType = SFX.SHATTER
local base = piece "base"
pieces = {}
local notThis = math.random (1,3)	--one piece should always remain so there are no invisible minerals
for i=1,8 do
	if (i~=notThis) then
		local pname = "b" .. i
		table.insert (pieces, piece (pname))
	end
end
healthmulti=1--0.87

--script.hitbyweapon gets called before unitpredamaged: minerals would lose pieces when being hit by units but not lose health
--so tpdamagepieces.lua can not be used
include "tpdamagepieces_tetra.lua"

function script.Create()	
	--Turn (base, y_axis, math.rad (math.random(0,360)))
	--Spring.Echo ("unit TETRA " .. unitID .. " was created!")	
end

function script.Killed(recentDamage, maxHealth)
	--Spring.Echo ("a tetra was killed")
end
