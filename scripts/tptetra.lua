-------FALL OF PIECES--------
--exploType = SFX.SHATTER
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
include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)

function script.Create()	
	--Turn (base, y_axis, math.rad (math.random(0,360)))
	--Spring.Echo ("unit TETRA " .. unitID .. " was created!")	
end

function script.Killed(recentDamage, maxHealth)
	
end