local pieces = {}
local unblownpieces = pieces
local unitDef = UnitDefs[Spring.GetUnitDefID(unitID)]
local maxhealth = unitDef.health
local	maxpieces = 0
local blowstepdamage = 10-- maxhealth / maxpieces
local	blowdamage = 0
local	blownpieces = {}

function script.Create()
	for i=1,9 do 
		local tname = "c" .. i	
		pieces[i] = {}
		pieces[i] = piece (tname)	
	end
	--Spring.Echo ("unit " .. unitID .. " was created!")	
	for i=1,9 do 
		local pos1 = math.random (-2, 2)
		local pos2 = math.random (-2, 2)
		Move (pieces[i], z_axis, pos1*13)
		Move (pieces[i], x_axis, pos2*13)
		--Turn (pieces[i], y_axis, math.rad(math.random(0,360)))
	end
	Spring.SetUnitBlocking(unitID, false)
	maxpieces = table.getn (pieces)
	blowstepdamage = maxhealth / maxpieces
	blowdamage = 0
	blownpieces = {}
end

------react to enemy fire-----
function script.HitByWeapon (x, z, weaponDefID, damage)
	blowdamage = blowdamage + damage
	if (blowdamage < blowstepdamage) then return end
	blowdamage = 0	
	if (table.getn(unblownpieces) > 0) then
		local exploID = math.random(table.getn(unblownpieces))
		local explo = unblownpieces [exploID]
		if (explo) then
			--Spring.UnitScript.Explode (explo, SFX.SHATTER)
			Spring.UnitScript.Explode (explo, SFX.SHATTER)
			Spring.UnitScript.Hide (explo)			
			table.remove (unblownpieces, exploID)
			table.insert (blownpieces, explo)			
		end
	end
end
--[[
------------------------------

function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return turret end

function script.AimWeapon1( heading, pitch )

	return true
end

function script.FireWeapon1()
--	EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)	       
	Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	Sleep(30)
end

--]]