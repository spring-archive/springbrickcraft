--  -> defs.lua and this file from kernel panic
--------------------------------------------------------------------------------
-- Don't crash unitsync
--------------------------------------------------------------------------------
local ModOptionsAvailable = Spring and Spring.GetModOptions and Spring.GetModOptions()


Spring.Echo ("--- anydefs_post.lua FROM GAME begins! ---")


-- no nanoframes
for name, ud in pairs(UnitDefs) do
	ud.showNanoFrame = false
end

-- set unused damage types of a weapon = Normal
Spring.Echo ("--weapondefs editing--")
 for _, weaponDef in pairs(WeaponDefs) do
   -- Spring.Echo (weaponDef.name .. " damage.Normal:" .. weaponDef.damage.normal)
	if (not weaponDef.damage.nomineDamage) then
		weaponDef.damage.nominedamage = weaponDef.damage.normal --hä?
	end
	--shield reagiert nur auf default damage(?)
	--krater gehen nur mit default damage
	if weaponDef.damage.normal then	--weapon has no normal damage = is a mining weapon=dont change
		weaponDef.damage.default = weaponDef.damage.normal
		weaponDef.damage.normal = nil
	end
 end
 



 
 
 Spring.Echo ("--unitdefs editing--")
for n,ud in pairs(UnitDefs) do
	Spring.Echo ("now post-editing: " .. (ud.name or "ud.name is nil"))
	--nothing should be reclaimable
	ud.reclaimable  = false
	
	--icon types
	--if (ud.unitname ~= "tptetra" and ud.unitname ~= "tptree" and ud.unitname ~= "fakeunit" and ud.unitname~="fakeblockunit") then
	if (not ud.icontype) then
		if (ud.maxvelocity and ud.maxvelocity > 0.1) then ud.icontype = "unit"..ud.footprintx else ud.icontype = "building" end
	end
	--colored description tool tip
	if (ud.description) then ud.description = "\255\255\255\64" .. ud.description .. "\b" end
	
	--miner cost editable by mod option
	if (ud.unitname == "tpgripper") then
		--Spring.Echo ("miner found")
		local modOptions = Spring.GetModOptions()
		local mc = nil
		if (modOptions) then Spring.Echo ("modOptions yes") mc = modOptions.minercost end
		if (mc) then ud.buildcostmetal = mc end		
	end
	
	--add IGNORE to nochasecategory for all units
	--Spring.Echo (ud.nochasecategory or "nochasecategory is nil")
	ud.nochasecategory = (ud.nochasecategory or "") .. " IGNORE"
	
	--make all units uncaptureable, except oil pump						
	if (ud.unitname == "tpoilpump") then
		--Spring.Echo ((ud.unitname or "nil") .. " ud.capturable = true")
		ud.capturable = true
	else
		ud.capturable = false
		--Spring.Echo ((ud.unitname or "nil").. " ud.capturable = false")
	end	
end
 
 
Spring.Echo ("--- anydefs_post.lua FROM GAME end! ---")