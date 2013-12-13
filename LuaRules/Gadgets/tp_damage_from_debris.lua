function gadget:GetInfo()
        return {
                name                    = "damage from debris",
                desc                    = "damage from debris is decreased, so less chaining",
                author          		= "knorke",
                date                    = "Sep 2013",
                license  				= "later horses dont be mean.",
                layer            		= -100,
                enabled  = true, --      loaded by default?
        }
end



if (not gadgetHandler:IsSyncedCode()) then return end


--    weaponDefID -1 --> debris collision
function gadget:UnitPreDamaged (unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam) 
	if weaponDefID == -1 then
		--Spring.Echo (damage)
		return 5
	end
	return damage
end