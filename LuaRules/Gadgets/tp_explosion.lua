function gadget:GetInfo()
        return {
                name                    = "do things when weapons explode",
                desc                    = "test lol",
                author          		= "knorke",
                date                    = "Nov 2011",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = false, --      loaded by default?
        }
end



if (not gadgetHandler:IsSyncedCode()) then return end

local clusterWeapon = {}
--chainWeapons[WeaponDefNames["tpjeep_gatling"].id] = true
--clusterWeapon[WeaponDefNames["dualcannon"].id] = {id=WeaponDefNames["dualcannon"].id, cluster=10}


clusterWeapon[WeaponDefNames["tplaunchbox_targetmarker"].id] = true -- {id=WeaponDefNames["tplaunchbox_cannon"].id,}


function gadget:Initialize()
	for v,k in pairs (clusterWeapon) do	
		Script.SetWatchWeapon (v, true)
	end
	--Script.SetWatchWeapon (WeaponDefNames["tpjeep_gatling"].id, true)
end


 function gadget:Explosion(weaponID, px, py, pz, ownerID)
	if (clusterWeapon [weaponID]) then
		env = Spring.UnitScript.GetScriptEnv(ownerID)
		if (env) then Spring.UnitScript.CallAsUnit(ownerID, env.launchMissiles, px, py, pz) end
--	else
		--Spring.Echo ("some other weapon"..weaponID)
	end
	return true
 end
 
 
--[[
 function gadget:ProjectileCreated(proID, proOwnerID)
Spring.Echo ("proID="..proID)
Spring.Echo ("proOwnerID="..proOwnerID)
Spring.Echo ("proName="..(Spring.GetProjectileName (proID) or "nil!"))

--if not Spring.GetProjectileType proID then --nil=its a exploded piece
--do something
end
--]]