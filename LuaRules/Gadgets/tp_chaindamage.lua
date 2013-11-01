function gadget:GetInfo()
  return {
    name      = "chain damage",
    desc      = "damage that jumps from unit to unit",
    author    = "knorke",
    date      = "Oct 2011",
    license   = "gooooooooooodbye horses",
    layer     = 0,
    enabled   = true--  loaded by default?
  }
end

--WeaponDefs
--WeaponDefNames

local chainWeapons = {}
--chainWeapons[WeaponDefNames["tpjeep_gatling"].id] = true
chainWeapons[WeaponDefNames["tpbigwheel_teslacoil"].id] = true


function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)
	--Spring.Echo ("weapon name: " .. WeaponDefs[weaponID].name)
	if (chainWeapons[weaponID]) then
		--Spring.Echo ("chain damage!")
		local hasChainDamageTech = true  --Spring.GetTeamRulesParam(attackerTeam,"TECHchaindamage") or 0
		if (hasChainDamageTech~=0) then
			local x,y,z = Spring.GetUnitPosition(unitID)
			local nearUnits = Spring.GetUnitsInCylinder (x,z, 500, unitTeam)	--				
			--if (damage > 5 and nearUnits) then
				for i in pairs (nearUnits) do
					if (i > 2) then break end
					if (nearUnits[i]~=unitID) then
						Spring.AddUnitDamage (nearUnits[i], damage/2, 0, attackerID, -1) --weaponID for recursive
						local tx,ty,tz = Spring.GetUnitPosition(nearUnits[i])
						if (tx and ty and tz) then
							SpawnCEGchain ("tpelectrosplash", x,y,z, tx, ty, tz, 5)
						end
					end
				end
			--end
		end
	end
end

function SpawnCEGchain (CEGname, x1,y1,z1,  x2,y2,z2,  stepSize)
	local xstep = (x2-x1)/stepSize
	local ystep = (y2-y1)/stepSize
	local zstep = (z2-z1)/stepSize
	--Spring.Echo ("xstep="..xstep)
	local x=x1
	local y=y1
	local z=z1
	local dx= math.abs (x1-x2)
	local dy= math.abs (y1-y2)
	local dz= math.abs (z1-z2)
	--local d =  math.sqrt ((dx*dx)+(dy*dy)+(dz*dz))
	local neededSteps = math.abs( dx/xstep)--d/stepSize
	--Spring.Echo ("neededSteps="..neededSteps)
	local i = 0
	while (i < neededSteps) do
		--x=x+xstep
		--y=y+ystep
		--z=z+zstep
		--Spring.SpawnCEG (CEGname, x,y,z)
		Spring.SpawnCEG (CEGname, x+(xstep*i),y+(ystep*i),z+(zstep*i))
		i=i+1
		if (i > 500) then
			--Spring.Echo ("500 cancel")
			return
		end
	end
	--Spring.Echo (i)
end