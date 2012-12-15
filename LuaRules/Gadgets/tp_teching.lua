--the fuck was i thinking
--++++better to use unitDefID instead of unitName

--[[
Fabrik benötigt Kaserne
 Turretcenter benötigt Fabrik
 Helipad benötigt Fabrik
 Helipad spawnt Helidronen die zwischen Turretcenter und Turrets patrollen
 
 Einheiten
 Fabrik kann immer bauen: Jeep, Tank, JeepSpeedUpgrade
 Schwerer Panzer benötigt Turretcenter
 Launchbox benötigt ??
 --]]

 --rahmen ums buildicon verstecken:
--local cmdArray = {disabled = true, texture="lol"}
--Spring.EditUnitCmdDesc(unitID, cmdDescID, cmdArray)
 

function gadget:GetInfo()
	return {
	name                    = "Techer",
	desc                    = "tec2nuk",
	author          = "knorke",
	date                    = "Dec 2010",
	license  = "GNU GPL, v2 or later horses",
	layer            = 9004,
	enabled  = true, --      loaded by default?
	}
end
if (gadgetHandler:IsSyncedCode()) then
--triggerUnits: die unit ("research item") die das upgrade auslöst, zb tpupgradewheels
--affectedUnits: die unit die dadurch upgegradet wird, zb tpjeep
--providingUnits: die unit wo man das upgrade kauft zb techzentrum
--ACHTUNG: EINE EINHEIT KANN IMMER NUR EINEN TECH PROVIDEN -> entweder als table oder kurz alles durch loopen

local techTree = {} -- [techName] .triggerUnit .affectedUnit .functionForExistingUnits .functionForFutureUnits .functionForExistingProviders .functionForFutureProviders
local triggerUnits = {} --[unitname] .techName -> you can check which tech is triggered by unit X
local affectedUnits = {} --[unitname] .techName -> you can check which tech affects this units
local providingUnits = {} --[unitname] .techName -> you can check if ie a new tech center was made and block already researched stuff

--speed upgrade for jeep--
local newtech = {}
newtech.triggerUnit = "tpupgradewheels"
newtech.affectedUnit ="tpjeep"
newtech.providingUnit = "tpfactory2"
newtech.techName = "TECHwheels"
--newtech.functionForExistingUnits = "wheelsForExistingJeeps (TEAM)" --removed for balance
newtech.functionForFutureUnits = "wheelsForJeep (UNIT)"  
newtech.functionForExistingProviders = "UpdateBuildersOptions (TEAM, 'tpfactory2', 'tpupgradewheels', false, 'speed wheels are already bought')"
newtech.functionForFutureProviders   = "UpdateBuildersOptions (TEAM, 'tpfactory2', 'tpupgradewheels', false, 'speed wheels are already bought')"
techTree[newtech.techName] = newtech
triggerUnits[newtech.triggerUnit] = newtech.techName
affectedUnits[newtech.affectedUnit] = newtech.techName
if (not providingUnits[newtech.providingUnit]) then providingUnits[newtech.providingUnit] = {} end
table.insert (providingUnits[newtech.providingUnit] , newtech.techName)

--quad cannon for gatling
local newtech = {}
newtech.triggerUnit = "tpupgradequadcannon"
newtech.affectedUnit ="tpvierling"
newtech.providingUnit = "tpfactory2"
newtech.techName = "TECHquadcannon"
--newtech.functionForExistingUnits = "quadcannonForExistingVierlings (TEAM)"  --removed for balance
newtech.functionForFutureUnits = "quadcannonForVierling (UNIT)"	
newtech.functionForExistingProviders = "UpdateBuildersOptions (TEAM, 'tpfactory2', 'tpupgradequadcannon', false, 'you already got the quad!')"
newtech.functionForFutureProviders = "UpdateBuildersOptions (TEAM, 'tpfactory2', 'tpupgradequadcannon', false, 'you already got the quad!')"
techTree[newtech.techName] = newtech
triggerUnits[newtech.triggerUnit] = newtech.techName
affectedUnits[newtech.affectedUnit] = newtech.techName
if (not providingUnits[newtech.providingUnit]) then providingUnits[newtech.providingUnit] = {} end
table.insert (providingUnits[newtech.providingUnit] , newtech.techName)


--baracks unlocks factory--
local newtech = {}
newtech.triggerUnit = "tpsmallfac"
newtech.affectedUnit ="tphq"
newtech.providingUnit = "tpsmallfac"
newtech.techName = "TECHfactory"
--newtech.functionForExistingUnits = "wheelsForExistingJeeps (TEAM)"
--newtech.functionForFutureUnits = "wheelsForJeep (UNIT)"
newtech.functionForExistingProviders = "UpdateBuildersOptions (TEAM, 'tphq', 'tpfactory2', true, 'DEFAULT')"
newtech.functionForFutureProviders   = "UpdateBuildersOptions (TEAM, 'tphq', 'tpfactory2', true, 'DEFAULT')"
newtech.functionDestroyed = "UpdateBuildersOptions (TEAM, 'tphq', 'tpfactory2', false, 'Rebuild the barracks first!')"
techTree[newtech.techName] = newtech
triggerUnits[newtech.triggerUnit] = newtech.techName
affectedUnits[newtech.affectedUnit] = newtech.techName
if (not providingUnits[newtech.providingUnit]) then providingUnits[newtech.providingUnit] = {} end
table.insert (providingUnits[newtech.providingUnit] , newtech.techName)

--chain lightning upgrade can be researched. muss eigentlich nur dem chaindamage gadget bescheid sagen
local newtech = {}
newtech.triggerUnit = "tpupgradechaindamage"
newtech.affectedUnit ="tpbigwheel"	--ist quasi egal
newtech.providingUnit = "tpwarpantenne"
newtech.techName = "TECHchaindamage"
newtech.functionForExistingUnits = "UpdateBuildersOptions (TEAM, 'tpwarpantenne', 'tpupgradechaindamage', false, 'chain damage upgrade is bought')" --weil existingProviders schon benutzt wird um die teamrules zu setzen für das chaindamage gadget
--newtech.functionForFutureUnits = "wheelsForJeep (UNIT)"
newtech.functionForExistingProviders = "Spring.SetTeamRulesParam(TEAM,'chaindamage',1)"
newtech.functionForFutureProviders   = "UpdateBuildersOptions (TEAM, 'tpwarpantenne', 'tpupgradechaindamage', false, 'chain damage upgrade is bought')"
techTree[newtech.techName] = newtech
triggerUnits[newtech.triggerUnit] = newtech.techName
affectedUnits[newtech.affectedUnit] = newtech.techName
if (not providingUnits[newtech.providingUnit]) then providingUnits[newtech.providingUnit] = {} end
table.insert (providingUnits[newtech.providingUnit] , newtech.techName)

--tpwarpantenne unlockt tpplatefactory für tphq
local newtech = {}
newtech.triggerUnit = "tpwarpantenne"
newtech.affectedUnit ="tphq"
newtech.providingUnit = "tpwarpantenne"
newtech.techName = "TECHhitech"
newtech.functionForExistingUnits = "UpdateBuildersOptions (TEAM, 'tphq', 'tpplatefactory', true, 'DEFAULT')"
newtech.functionForFutureUnits = "UpdateBuildersOptions (TEAM, 'tphq', 'tpplatefactory', true, 'DEFAULT')"
--newtech.functionForExistingProviders = "UpdateBuildersOptions (TEAM, 'tphq', 'tpplatefactory', true, 'DEFAULT')"
--newtech.functionForFutureProviders   = "UpdateBuildersOptions (TEAM, 'tphq', 'tpplatefactory', true, 'DEFAULT')"
newtech.functionDestroyed = "UpdateBuildersOptions (TEAM, 'tphq', 'tpplatefactory', false, 'Rebuild the Warp Coil first!')"
techTree[newtech.techName] = newtech
triggerUnits[newtech.triggerUnit] = newtech.techName
affectedUnits[newtech.affectedUnit] = newtech.techName
if (not providingUnits[newtech.providingUnit]) then providingUnits[newtech.providingUnit] = {} end
table.insert (providingUnits[newtech.providingUnit] , newtech.techName)

--[[
--factory unlockt heliport für tphq
local newtech = {}
newtech.triggerUnit = "tpfactory2"
newtech.affectedUnit ="tphq"
newtech.providingUnit = "tpfactory2"
newtech.techName = "TECHtothesky"
newtech.functionForExistingUnits = "UpdateBuildersOptions (TEAM, 'tphq', 'tpheliport', true, 'DEFAULT')"
newtech.functionForFutureUnits = "UpdateBuildersOptions (TEAM, 'tphq', 'tpheliport', true, 'DEFAULT')"
--newtech.functionForExistingProviders = "UpdateBuildersOptions (TEAM, 'tphq', 'tpplatefactory', true, 'DEFAULT')"
--newtech.functionForFutureProviders   = "UpdateBuildersOptions (TEAM, 'tphq', 'tpplatefactory', true, 'DEFAULT')"
newtech.functionDestroyed = "UpdateBuildersOptions (TEAM, 'tphq', 'tpheliport', false, 'Rebuild the Factory first!')"
techTree[newtech.techName] = newtech
triggerUnits[newtech.triggerUnit] = newtech.techName
affectedUnits[newtech.affectedUnit] = newtech.techName
providingUnits[newtech.providingUnit] = newtech.techName
--]]
-----------------------------------------------------------------------------
GG.techTriggerUnits = triggerUnits	--needed for only_build_once.lua
------------------------------------------------------------------------------
defaultToolTip = {}

local techs = {}
local teams = Spring.GetTeamList ()

--***das geht besser

--for i in pairs(teams) do
--	techs["wheels"] = {}				--runde räder für jeep
--	techs["wheels"][teams[i]] = 0
--	techs["tanks"] = {}					--panzer bauen
--	techs["tanks"][teams[i]] = 0
--	techs["quadcannon"] = {}			--quad cannon für gatling
--	techs["quadcannon"][teams[i]] = 0
--	techs["factory"] = {}			--quad cannon für gatling
--	techs["factory"][teams[i]] = 0
--	techs["chaindamage"] = {}			--quad cannon für gatling
--	techs["chaindamage"][teams[i]] = 0
--	Spring.Echo ("***tech team" .. teams[i])
--end


--einen tech freischalten
function enableTech (teamID, techName)
	if (not techs[techName]) then techs[techName] = {} end
	--techs[techName][teamID] = true	
	if (not techs[techName][teamID]) then 
		techs[techName][teamID] = 1
	else
		techs[techName][teamID] = techs[techName][teamID]+1
	end	
	--Spring.Echo (teamID .. " hat jetzt tech" .. techName .. " auf level ".. techs[techName][teamID])
	Spring.SetTeamRulesParam(teamID,techName,1, techs[techName][teamID])
	GG.techs = techs
end

--einen tech abschalten/runterstufen
function decreaseTech (teamID, techName)
	if (not techs[techName]) then techs[techName] = {} end
	--techs[techName][teamID] = false	
	if (not techs[techName][teamID]) then 
		techs[techName][teamID] = 0
	else
		techs[techName][teamID] = techs[techName][teamID]-1
	end	
	--Spring.Echo (teamID .. " hat jetzt tech" .. techName .. " auf level ".. techs[techName][teamID])
	Spring.SetTeamRulesParam(teamID,techName,1, techs[techName][teamID])
	GG.techs = techs
end

function checkTeamTech (teamID, techName)
	if ( techs[techName] and techs[techName][teamID]) then
		return techs[techName][teamID] >= 1
	else
		return false
	end
end

--thx quantum:
--table.insert(alwaysDisableTable, {UnitDefNames["corwin"].id, "Unit disabled: Wind is too weak on this map.",})
local function DisableBuildButtons(unitID, disableTable)
        for _, disable in ipairs(disableTable) do
            local cmdDescID = Spring.FindUnitCmdDesc(unitID, -disable[1])
			if (cmdDescID) then
				--Spring.Echo ("schalte ab: " .. cmdDescID)
				------
				if (not defaultToolTip[cmdDescID]) then 
					defaultToolTip[cmdDescID] = Spring.GetUnitCmdDescs(unitID)[cmdDescID].tooltip 
					--Spring.Echo ("gemerkt:" .. defaultToolTip[cmdDescID])
				end
                -----
				if (cmdDescID) then
					local cmdArray = {disabled = true, tooltip = disable[2]}
					Spring.EditUnitCmdDesc(unitID, cmdDescID, cmdArray)
                end
			else
				--Spring.Echo ("FindUnitCmdDesc returned nil")
			end
        end
end


local function EnableBuildButtons(unitID, enableTable)
        for _, disable in ipairs(enableTable) do
                local cmdDescID = Spring.FindUnitCmdDesc(unitID, -disable[1])
                if (cmdDescID) then
					-----
					if (disable[2]=="DEFAULT") then
						disable[2] = defaultToolTip[cmdDescID]
					end
					-----
					local cmdArray = {disabled = false, tooltip = disable[2]}
					Spring.EditUnitCmdDesc(unitID, cmdDescID, cmdArray)
                end
        end
end

--zB  (1, "tpfactory2", "tpupgradewheels", false, "this upgrade has already been bought")
function UpdateBuildersOptions (teamID, builder, buildunit, enable, text)
	local all_units = Spring.GetTeamUnitsByDefs (teamID, UnitDefNames[builder].id)
	for i in pairs(all_units) do
		local LUnit = {}

		table.insert(LUnit, {UnitDefNames[buildunit].id,text,}) --das funzt

		if (enable==true) then
			EnableBuildButtons (all_units[i], LUnit)
		else
			DisableBuildButtons (all_units[i], LUnit)
		end
	end
end

--die upgrade funktion von neu gespawnten unites aufrufen, wenn der tech da ist
function gadget:UnitFinished(unitID, unitDefID, teamID)
	local ntName = triggerUnits [unitName(unitID)]	--get name of new tech that this unit possible triggers	
	if (ntName) then	--appearently a triggering unit was created
		if (not checkTeamTech (teamID, ntName)) then	--team does not yet have the tech
			--Spring.Echo ("a tech got triggerd: " .. ntName)
			enableTech (teamID, ntName)
			if (techTree[ntName].functionForExistingProviders) then				
				local s2 = string.gsub(techTree[ntName].functionForExistingProviders, "TEAM", teamID)
				f2 = assert (loadstring (s2))
				f2 ()
			end
			if (techTree[ntName].functionForExistingUnits) then
				local s = string.gsub(techTree[ntName].functionForExistingUnits, "TEAM", teamID)
				f = assert (loadstring (s))
				f ()
			end
		else	--team already has the tech
			--Spring.Echo ("already have the tech:" .. ntName)
			enableTech (teamID, ntName)		--still call this function again to increase the counter
		end
	end

	local techName = affectedUnits [unitName(unitID)]	--get tech that affects this unit
	if (techName and checkTeamTech (teamID, techName)) then --this unit is affected by a tech and this team has the tech
		--Spring.Echo ("unit gets upgraded with tech: " .. ntName)
		if (techTree[techName].functionForFutureUnits) then
			local s = string.gsub(techTree[techName].functionForFutureUnits, "UNIT", unitID)
			f = assert (loadstring (s))
			f ()			
		end
	end
	--[[
	-----hack to make jeeps slow:----  just   wait until 89.0
	if unitName (unitID) == "tpjeep" then
		Spring.Echo ("made a jeep slow")
		Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 1)
	end
	--]]
end

--bei providing units mit UnitCreated damit die buildoptions schon beim bauen stimmen
function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	--example: a new "research center" was created: block the research if its already done
	local providedTechs = providingUnits [unitName(unitID)]
	if (not providedTechs) then return end
	for k,providedTech in pairs (providedTechs) do
		if (providedTech ~= nil and checkTeamTech (teamID, providedTech)) then
			--Spring.Echo ("ein neuer provider fuer tech den es schon gibt: " .. providedTech)
			if (techTree[providedTech].functionForFutureProviders) then
				local s2 = string.gsub(techTree[providedTech].functionForFutureProviders, "TEAM", teamID)--***sollte eigentlich mit UNIT gehen aber keine lust extra eine neue UpdateBuilderOption zu machen die mit unitid statt teamid funzt
				f2 = assert (loadstring (s2))
				f2 ()
			end
		end
	end
end


function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)	
	local ntNames = providingUnits [unitName(unitID)]	
	if (ntNames) then	--appearently a providingUnit unit was destroyed
		for k,ntName in pairs (ntNames) do
			if (checkTeamTech (teamID, ntName)) then	--team has the tech
				if (techTree[ntName].functionDestroyed) then		--does this tech care?
					decreaseTech (teamID, ntName)
					--Spring.Echo ("a tech got de-provided: " .. ntName)			
					if (not checkTeamTech (teamID, ntName)) then	--did team just lose the tech?				
						--Spring.Echo ("a tech got lost! " .. ntName)
						local s2 = string.gsub(techTree[ntName].functionDestroyed, "TEAM", teamID)
						f2 = assert (loadstring (s2))
						f2 ()
					end
				end
			end
		end
	end
end



--[[
--works but 1 unit can only provide 1 tech
--bei providing units mit UnitCreated damit die buildoptions schon beim bauen stimmen
function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	--example: a new "research center" was created: block the research if its already done
	local providedTech = providingUnits [unitName(unitID)]
	if (providedTech ~= nil and checkTeamTech (teamID, providedTech)) then
		--Spring.Echo ("ein neuer provider fuer tech den es schon gibt: " .. providedTech)
		if (techTree[providedTech].functionForFutureProviders) then
			local s2 = string.gsub(techTree[providedTech].functionForFutureProviders, "TEAM", teamID)--***sollte eigentlich mit UNIT gehen aber keine lust extra eine neue UpdateBuilderOption zu machen die mit unitid statt teamid funzt
			f2 = assert (loadstring (s2))
			f2 ()
		end
	end	
end
--]]

--[[
--works but 1 unit can only provide 1 tech
function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)	
	local ntName = providingUnits [unitName(unitID)]	
	if (ntName) then	--appearently a providingUnit unit was destroyed
		--local ntName = tech.name	--get name of new tech that this unit possible provided
		--Spring.Echo ("appearently a providingUnit unit was destroyed")
		if (checkTeamTech (teamID, ntName)) then	--team has the tech
			if (techTree[ntName].functionDestroyed) then		--does this tech care?
				decreaseTech (teamID, ntName)
				--Spring.Echo ("a tech got de-provided: " .. ntName)			
				if (not checkTeamTech (teamID, ntName)) then	--did team just lose the tech?				
					--Spring.Echo ("a tech got lost! " .. ntName)
					local s2 = string.gsub(techTree[ntName].functionDestroyed, "TEAM", teamID)
					f2 = assert (loadstring (s2))
					f2 ()
				end
			end
		end
	end
end
--]]

---------------------------------------------------------------------
function wheelsForExistingJeeps (teamID)
	for _,unitID in ipairs(Spring.GetTeamUnitsByDefs(teamID,UnitDefNames["tpjeep"].id)) do
		wheelsForJeep (unitID)
	end
end
function wheelsForJeep (unitID)
		Spring.Echo ("upgraded "..unitID .. " with speed")
		Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 280)	--300
		env = Spring.UnitScript.GetScriptEnv(unitID)
		if (env) then Spring.UnitScript.CallAsUnit(unitID, env.upgradewheels) end
end
---------------------------------------------------------------------

---------------------------------------------------------------------
function quadcannonForExistingVierlings (teamID)
	for _,unitID in ipairs(Spring.GetTeamUnitsByDefs(teamID,UnitDefNames["tpvierling"].id)) do
		quadcannonForVierling (unitID)
	end
end
function quadcannonForVierling (unitID)
		local newgun = {}
		newgun["reloadTime"] = 0.08
		Spring.SetUnitWeaponState(unitID, 0, newgun)
		env = Spring.UnitScript.GetScriptEnv(unitID)
		if (env) then Spring.UnitScript.CallAsUnit(unitID, env.upgradegun) end
end
---------------------------------------------------------------------
function factoryBuildableForTeam (teamID)
--zB  (1, "tpfactory2", "tpupgradewheels", false, "this upgrade has already been bought")
	UpdateBuildersOptions (teamID, "tphq", "tpfactory2", true, "now go build this!")
end
---------------------------------------------------------------------


function unitName (unitID)
	if (not Spring.ValidUnitID (unitID)) then return "!invalid unitID in unitName()!" end
	local udID =Spring.GetUnitDefID(unitID)
	local uDef = UnitDefs [udID]
	return uDef.name
end

function gadget:Initialize()
	Spring.Echo ("tech gadget here")
	initLock()
end

function gadget:GameStart()
	Spring.Echo ("tech gadget here")
	initLock()
end

function initLock ()
	local teams = Spring.GetTeamList ()
	for i in ipairs(teams) do
		Spring.Echo ("t="..teams[i])
		UpdateBuildersOptions (teams[i], "tphq", "tpfactory2", false, "Baracks required!")
		UpdateBuildersOptions (teams[i], "tphq", "tpplatefactory", false, "Warp Coil required!")
		--UpdateBuildersOptions (teams[i], "tphq", "tpheliport", false, "Factory required!")
		--Spring.SetTeamRulesParam(teams[i],"chaindamage",0)
	end	
end 

end



----------------------------------------------------------------------------
--scrap yard
--[[
--quad cannon for gatling
local newtech = {}
newtech.triggerUnit = "tpupgradequadcannon"
newtech.affectedUnit ="tpvierling"
newtech.providingUnit = "tpturretcenter"
newtech.techName = "quadcannon"
newtech.functionForExistingUnits = "quadcannonForExistingVierlings (TEAM)"
newtech.functionForFutureUnits = "quadcannonForVierling (UNIT)"
newtech.functionForExistingProviders = "UpdateBuildersOptions (TEAM, 'tpturretcenter', 'tpupgradequadcannon', false, 'you already got the quad!')"
newtech.functionForFutureProviders = "UpdateBuildersOptions (TEAM, 'tpturretcenter', 'tpupgradequadcannon', false, 'you already got the quad!')"
techTree[newtech.techName] = newtech
triggerUnits[newtech.triggerUnit] = newtech.techName
affectedUnits[newtech.affectedUnit] = newtech.techName
providingUnits[newtech.providingUnit] = newtech.techName
--]]