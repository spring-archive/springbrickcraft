function widget:GetInfo()
  return {
    name      = "zzzz create unitguide list",
    desc      = "creates a unitlist thing",
    author    = "knorke",
    date      = "2011",
    license   = "dfgh",
    layer     = 0,
    enabled   = false,  --  loaded by default	
  }
end

function widget:Initialize()
for id,weaponDef in pairs(WeaponDefs) do
   for name,param in weaponDef:pairs() do
		Spring.Echo (name)
   end
end
----

	file = io.open ("unitguide.html", "w")
	file:write ("<html>\n")
	for id,ud in ipairs(UnitDefs) do
		printUnitHtml (id)
	end
	file:write ("</html>")
	file:close()
end

function widget:UnitCreated(unitID, unitDefID, teamID, builderID)
	Spring.Echo ("qwretz")
	printUnitHtml (unitDefID)	
end

function htmlImage (imageFN)
    return '<img src="'.. imageFN ..'" >'                
end

function htmlColorText (text, color)
	local s = "<font color=\"" .. color ..  "\">" .. text .. "</font>"	  
	return s
end

function htmlNewLine ()
	return "\n<br>\n"
end

function htmlBold (s)
	if (not s) then s = "" end
	return "<b>" .. s .. "</b>"
end

function htmlUnitItem (name, value)
	if (not value) then return "" end
	value = unescape(value)
	local s = ""
	if (name) then
		s = name .. " : " .. htmlBold (value) .. htmlNewLine ()
	else
		s = htmlBold (value) --.. htmlNewLine ()
	end
	return s
end


function printUnitHtml (unitDefID)
	local unitDef = UnitDefs[unitDefID]	
	if (not unitDef) then Spring.Echo ("not UnitDef") return end	
	local cp = unitDef.customParams
	if (not cp or not cp.unitguide_text) then return end
	
	local s = ""
	s = s .. "<h3>" .. htmlUnitItem (nil, unitDef.humanName or "unnamed") .. "</h3>"
	if (unitDef.buildpicname) then s = s .. htmlImage ("unitpics/" .. unitDef.buildpicname) .. htmlNewLine() end	
	s = s .. "<i>" .. htmlUnitItem (nil, unitDef.tooltip or "wut?") .. "</i>" .. htmlNewLine()
	s = s .. htmlUnitItem ("Hitpoints", unitDef.health or "---")
	s = s .. htmlUnitItem ("Cost", unitDef.metalCost or "really cheap")
	s = s .. htmlUnitItem ("Help Text", cp.unitguide_text or "---")
	s = s .. htmlUnitItem ("good vs", cp.unitguide_goodvs)
	s = s .. htmlUnitItem ("weak vs", cp.unitguide_weakvs)
	s = s .. htmlUnitItem ("Protip", cp.unitguide_protip)
	
	Spring.Echo (s)	
	file:write (s)
	printWeaponsHtml (unitDefID)
 --for id,unitDef in pairs(UnitDefs) do
   --for name,param in unitDef:pairs() do
  --   Spring.Echo(name,param)
--   end
 --end	
end


function printWeaponsHtml (unitDefID)
	local weapondefs = UnitDefs[unitDefID].weapons
	if (not weapondefs or #weapondefs < 1) then return end
	local unitDef = UnitDefs[unitDefID]
	file:write (htmlBold("Armed with:<br>\n"))
	local s = ""
	for i, wd in pairs(unitDef.weapons) do
		local weaponDef = WeaponDefs[wd.weaponDef]
		s = s .. htmlUnitItem ("", weaponDef.description or "unnamed")
		--[[
		htmlUnitItem ("Damage", weaponDef.damage.normal or "none")
		htmlUnitItem ("Range", weaponDef.damage.normal or "none")
		
		if (weaponDef.reload and weaponDef.projectiles) then
			local bpm =  math.ceil (60/weaponDef.reload)*weaponDef.projectiles --bullets per minute
			Spring.Echo ("Bullets per Minute:" ..(bpm or "N/A"))
		end
			
		for k,v in pairs (weaponDef) do
		if type (v) == "number" then 
			Spring.Echo (k .. "="..v)
		end
		end
		--]]
	end
	file:write (s)
end

----------------------------
--
function printUnit (unitDefID)
	local unitDef = UnitDefs[unitDefID]	
	if (not unitDef) then Spring.Echo ("not UnitDef") return end
	Spring.Echo ("Unit Name: " .. (unitDef.humanName or "unnamed"))
	local cp = unitDef.customParams
	if (not cp or not cp.unitguide_text) then return end
	
	
	--for k,v in pairs (unitDef) do
		--Spring.Echo (k .. "="..v)
	--end
	Spring.Echo ("UG ja")
	Spring.Echo ("Health: " .. (unitDef.health or "---"))
	Spring.Echo ("Help Text :" .. cp.unitguide_text)
	printWeapons(unitDefID)
	Spring.Echo ("----------------")

end

function printWeapons (unitDefID)
	local weapondefs = UnitDefs[unitDefID].weapons
	if (not weapondefs) then return "---" end        	

	local unitDef = UnitDefs[unitDefID]
	--for i,wd in ipairs(weapondefs) do
	for i, wd in pairs(unitDef.weapons) do
	--Spring.Echo ("wID="..weaponDef.range)
		--for k,v in pairs (wd) do
		--if type (v) ~= "table" then 
			--Spring.Echo (k .. "="..v)
		--end
		--end
		local weaponDef = WeaponDefs[wd.weaponDef]
		
		Spring.Echo ("*** Weapon Name:" ..(weaponDef.description or "unnamed") .. " ***")
		if (weaponDef.damage) then Spring.Echo ("Damage:" ..(weaponDef.damage.normal or "none")) end
		Spring.Echo ("Range:" ..(weaponDef.range or "none"))
		if (weaponDef.reload and weaponDef.projectiles) then
			local bpm =  math.ceil (60/weaponDef.reload)*weaponDef.projectiles --bullets per minute
			Spring.Echo ("Bullets per Minute:" ..(bpm or "N/A"))
		end
			
		for k,v in pairs (weaponDef) do
		if type (v) == "number" then 
			Spring.Echo (k .. "="..v)
		end
		end
		
	end	
end

---helpers
-- remove escape characters that set color in tooltip
-- does not work
unescape = function(text)
  return string.gsub(text, '\\([$/}`])', '%1')
end