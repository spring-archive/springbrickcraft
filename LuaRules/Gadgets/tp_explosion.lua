function gadget:GetInfo()
        return {
                name                    = "do things when weapons explode",
                desc                    = "test lol",
                author          		= "knorke",
                date                    = "Nov 2011",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true, --      loaded by default?
        }
end



if (gadgetHandler:IsSyncedCode()) then

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
		Spring.SpawnCEG("tpsmokeflare", px, py, pz)
		env = Spring.UnitScript.GetScriptEnv(ownerID)
		if (env) then Spring.UnitScript.CallAsUnit(ownerID, env.launchMissiles, px, py, pz) end
--	else
		--Spring.Echo ("some other weapon"..weaponID)
	end
	return false
 end
 
 local projs = {}
 function gadget:GameFrame (f)	
 	--funny test of projectiles that get different cegtags during their flight
	for v,k in pairs (projs) do	
		local d = f % 30 
		if d > 20 then
		Spring.SetProjectileCEG (v, "tpeletricblueexplosion2")		
		elseif d > 10 then
		Spring.SetProjectileCEG (v, "tpturretorangehit")	
		else
		Spring.SetProjectileCEG (v, "blacksmoke")
		end
	end
end
 
function gadget: ProjectileDestroyed(proID)
	projs[proID] = nil
end
 

 function gadget:ProjectileCreated(proID, proOwnerID)
--Spring.Echo ("proID="..proID)
--Spring.Echo ("proOwnerID="..proOwnerID)
--Spring.Echo ("proName="..(Spring.GetProjectileName (proID) or "nil!"))
--projs[proID] = true
--if not Spring.GetProjectileType proID then --nil=its a exploded piece
--do something
--SendToUnsynced("MyEvent")
end

else

---unsynced

function gadget:Initialize()
	gadgetHandler:AddSyncAction("MyEvent", MyEvent)
end

end