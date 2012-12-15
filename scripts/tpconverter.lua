--wall1 ... wall52
--chim1high, chim1low .. chim4high, chim4low
--groundcenter, groundcenterforward
local pieces = {}


local unblownpieces = pieces
local unitDef = UnitDefs[Spring.GetUnitDefID(unitID)]
local maxhealth = unitDef.health
local maxpieces = table.getn (pieces)
local blowstepdamage = maxhealth / maxpieces
local blowdamage = 0
local blownpieces = {}
-------------------------
SIG_PUMP = 1



------react to enemy fire-----
function script.HitByWeapon (x, z, weaponDefID, damage)	
	blowdamage = blowdamage + damage
	if (blowdamage < blowstepdamage) then return end	
	blownnumber = math.ceil(damage / blowstepdamage)	
	for i = 1, blownnumber , 1 do
		if (table.getn(unblownpieces) > 0) then
			local exploID = math.random(table.getn(unblownpieces))
			local explo = unblownpieces [exploID]
			if (explo) then
				blowdamage = blowdamage - blowstepdamage
				Spring.UnitScript.Explode (explo, SFX.SHATTER)
				Spring.UnitScript.Hide (explo)
				table.remove (unblownpieces, exploID)
				table.insert (blownpieces, explo)			
			else
				blowdamage = 0 
			end
		end
	end	
end
------------------------------

function script.Create(unitID)
	--Spring.Echo ("converter here")
	for i=1,10 do
		Spin (piece ("roll"..i), x_axis, -3)
	end
	local c = piece "cube1"
	Move (c, y_axis, 0)
	Move (c, z_axis, 0)
	Move (c, y_axis, 100, 5)
	Move (c, z_axis, -100, 5)
	Spin (c, x_axis, 1.5)
end

function script.QueryBuildInfo() return pad end

function script.QueryNanoPiece() return nano end

function script.Activate()

end

function script.Deactivate()

end

--[[
local function pump ()
	Signal(SIG_PUMP)
	SetSignalMask(SIG_PUMP)
	while (building) do

	end
end
--]]




---------------------------------

function script.Killed(recentDamage, maxHealth)
	return 0
end