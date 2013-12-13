--BUG: es gibt kein SetFeatureNoBlocking darum ist scheisse weil die unit an ihrem feature manchmal hängen bleibt
--[[
[02:33:54] <[2up]knorke> are custom commands always invisible even if shift is pressed?
[03:04:38] <[LCC]jK> you need to register
[03:04:40] <[LCC]jK> them
[03:04:50] <[LCC]jK> Spring.SetCustom...Data
--]]
function gadget:GetInfo()
	return {
	name = "units carry features",
	desc = "these units care about stuff",
	author = "knorke",
	date = "2013",
	license = "horse sized ant",
	layer = 1,
	enabled = true,
	handler=true,
	}
end



local pickUpRange = 50 --unit must be this close to feature to be able to pick it up
-------------------------------------------------------------------------------------
---------------------------FEATURES CARRIED BY UNITS STUFF---------------------------
-------------------------------------------------------------------------------------
local features = {} -- [featureID] = .carrier (a unitID) 	, .pieceID
local units = {} -- .carrying [fID]=trie      .targetFeature=featureID that the unit is moving towards (via SetMoveGoal) to pickUp KANN MAN DIREKT VOM CMDPARAMS AUSLESEN

function attachFeature (fID, uID, pieceID)
	features[fID] = {carrier=uID, pieceID=pieceID}
	if not units[uID] then 
		units[uID] = {}
		units[uID].carrying = {}
	end
	units[uID].carrying[fID]=true
end

function deattachFeature (fID, uID)
	features[fID] = nil
	units[uID].carrying[fID]=nil --TODO: table komplett auslöschen wenn er leer ACHTUNG: #carrying get nicht -> getLength oder sowas
end


function gadget:GameFrame (f)
	if f%1==0 then updateFeatures() end
	if f%60 ==0 then Spring.Echo (f, "yesyes") end
end

function updateFeatures ()
	for fID in pairs(features) do
		--Spring.Echo ("updateFeatures", fID)
		local x,y,z
		if features[fID].pieceID then
			x,y,z = Spring.GetUnitPiecePosDir (features[fID].carrier, features[fID].pieceID)
			y=y+20	--http://springrts.com/mantis/view.php?id=3882
		else
			x,y,z = Spring.GetUnitPosition (features[fID].carrier, true)
			y=y+20
		end
		Spring.SetFeaturePosition (fID, x,y,z, false)
		local dx,dy,dz = Spring.GetUnitDirection (features[fID].carrier)
		Spring.SetFeatureDirection (fID, dx,dy,dz)		
	end
end

function getFeatureCarrier (fID)	--return which unitID is carrying this feature
	if not features[fID] then return nil end
	return features[fID].carrier or -666
end


function getFeaturesCarried (uID)	--return which features this unitID is carrying  {[1]=236,[2]=684,[3]=anotherFeatureID,...}  / number of features
	Spring.Echo ("getFeaturesCarried " .. uID)
	if not units[uID] then return nil,0 end
	local featuresCarried = {}
	local i = 0
	Spring.Echo ("in front of loop")
	for fID,f in pairs(units[uID].carrying) do
		Spring.Echo ("in loop:", fID, true)
		i=i+1
		featuresCarried[i] = fID		
	end
	return featuresCarried, i
end


function pickUp (uID, fID, pieceID)
	local u = getFeatureCarrier (fID)
	if Spring.ValidUnitID (u) then return false end	--feature is already being carried by someone else
	local x,y,z = Spring.GetUnitPosition (uID, true)
	local x2,y2,z2 = Spring.GetFeaturePosition (fID)
	if distance2D (x,z, x2,z2) > pickUpRange then return false end
	attachFeature (fID, uID, pieceID) --FIXME: pieceID durchs unitscript laufen lassen?
	--Script.LuaRules.FeatureAttached (uID, fID)	--FIXME: figure how this works or this event thing instead of GG
	--GG.FeaturePickedUp (uID, fID)
end

function putDown (uID, fID) --fID==nil means to put down all carried features
	Spring.Echo (uID.. " putDown()")
	local featuresCarried, nFeatures = getFeaturesCarried(uID)
	if not featuresCarried then return end	
	local x,y,z = Spring.GetUnitPosition (uID, true)
	Spring.Echo ("in front of putDown() loop")
	for i, fID in pairs (featuresCarried) do
		Spring.Echo ("in loop:", fID)
		deattachFeature (fID, uID)
		--GG.FeaturePutDown (uID, fID)
		Spring.SetFeaturePosition (fID, x+math.random(-20,20),y,z+math.random(-20,20), true)
	end
end

local CMD_PICKUPFEATURE = 30003 --66636--6663666--FIXME: file
local pickUpFeatureCMD = {
      id      = CMD_PICKUPFEATURE,
      name    = "pickUp!",	--text on the button
      action  = "pickUpFeature",
      type    = CMDTYPE.ICON_UNIT_FEATURE_OR_AREA ,
	  --texture = "&.9x.9&unitpics/sigterm.png&bitmaps/frame.tga",
	  --texture = "unitpics/tpexploicon.png&", --& = larger icon due to no frame
      tooltip = "pick up a feature to carry it",
      params  = { 'do it!'}
}

local CMD_PUTDOWNFEATURE = 6663777--FIXME: file
local putDownFeatureCMD = {
      id      = CMD_PUTDOWNFEATURE,
      name    = "putDown!",	--text on the button
      action  = "putDownFeature",
      type    = CMDTYPE.ICON_MAP,
	  --texture = "&.9x.9&unitpics/sigterm.png&bitmaps/frame.tga",
	  --texture = "unitpics/tpexploicon.png&", --& = larger icon due to no frame
      tooltip = "put a feature down",
      params  = { 'do it!'}
}

local canCarryFeatures = {
  [UnitDefNames["tpdude"].id] = true,
}
function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)	
	if canCarryFeatures[unitDefID] then
		Spring.InsertUnitCmdDesc (unitID, pickUpFeatureCMD)
		Spring.InsertUnitCmdDesc (unitID, putDownFeatureCMD)
	end
end

function gadget:Initialize()
   gadgetHandler:RegisterCMDID(gadget, CMD_PICKUPFEATURE) --compare nil with number error
   Spring.AssignMouseCursor ("pickUp!", "cursorrepair")
   --Spring.SetCustomCommandDrawData(CMD_PICKUPFEATURE, "cursorrepair", {1, 1, 1, 0.5})
   Spring.SetCustomCommandDrawData(CMD_PICKUPFEATURE, "cursorrepair", {1,0.5,0,.8}, true)
   
   Spring.AssignMouseCursor ("putDown!", "cursorunload")   
   --gadgetHandler:RegisterGlobal("FeatureAttached", FeatureAttached)
end

function gadget:UnitDestroyed (unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)	
	local featuresCarried, nFeatures = getFeaturesCarried(unitID)
	if not featuresCarried then return end	
	for i, fID in pairs (featuresCarried) do
		Spring.Echo ("setze nil", fID)
		features[fID] = nil
	end
	units[unitID] = nil
end

function gadget:FeatureDestroyed(featureID, allyTeam)	
	local uID = getFeatureCarrier (featureID)
	if uID then units[uID].carrying[featureID] = nil end
	features[featureID] = nil
end

-------------------------------------------------
---command------------------------------------------
-------------------------------------------------

local canCarryUnitDefs = {
  [UnitDefNames["tpdude"].id] = true,
}

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
	
	--TESTHAX: pickup with on/off, putdown with stop
	if canCarryUnitDefs[unitDefID] and cmdID == CMD.ONOFF then
		local x,y,z = Spring.GetUnitPosition (unitID, true)		
		local nearFeatures = Spring.GetFeaturesInCylinder (x,z,pickUpRange)
		if nearFeatures then
			for i, fID in pairs (nearFeatures) do
				if not getFeatureCarrier (fID) then
					pickUp (unitID, fID)
					break
				end
			end
		end
		-- allow to queue
		--if cmdOptions.shift then return true else return false end
	end
	--[[
	if canCarryUnitDefs[unitDefID] and cmdID == CMD.STOP then		
		putDown (unitID)		
	end	
	--]]
	----pickUp
	if canCarryUnitDefs[unitDefID] and cmdID == CMD_PICKUPFEATURE then		
		Spring.Echo ("pickup!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		local targetFeature = cmdParams[1]-Game.maxUnits --WTFMAN: zum unterscheiden ob feature oder unit
		if Spring.ValidFeatureID (targetFeature) == true then 			
			Spring.Echo ("VALID TARGET FEATURE")
			--local x,y,z = Spring.GetFeaturePosition (targetFeature)
			--Spring.SetUnitMoveGoal (unitID, x,y,z, 20)
		else
			return false
		end
	end
	
	--putDown
	if canCarryUnitDefs[unitDefID] and cmdID == CMD_PUTDOWNFEATURE then
		local featuresCarried = getFeaturesCarried(unitID)
		if featuresCarried then
			local x,y,z = cmdParams[1],cmdParams[2],cmdParams[3]
			Spring.Echo ("putting it down at ", x,y,z)
			--Spring.SetUnitMoveGoal (unitID, x,y,z, 20)
		elseif cmdOptions.shift then
			return true
		else
			return false
		end
		-- allow to queue
		--if cmdOptions.shift then return true else return false end
	end	
	
	return true
end

function gadget:CommandFallback(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)	
--function gadget:UnitCommand                      (unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOpts)
	Spring.Echo ("CommandFallback" , unitID, cmdID)
	--pickUp
	if cmdID == CMD_PICKUPFEATURE then
		local targetFeature = cmdParams[1]-Game.maxUnits
		if not Spring.ValidFeatureID (targetFeature) == true then return true, true end
		local x,y,z = Spring.GetFeaturePosition (targetFeature)
		Spring.SetUnitMoveGoal (unitID, x,y,z, 20)	--FIXME: do not call so often
		local x2,y2,z2 = Spring.GetUnitPosition (unitID, true)
		if distance2D (x,z, x2,z2) < pickUpRange then 
			local pieces = Spring.GetUnitPieceMap (unitID)
			pickUp (unitID, targetFeature, pieces["spot1"])
			return true,true
		end
	end
	
	--putDown
	--FIXME: if feature dies while being carried, this still gets called: remove the command like it is done at pickUp
	if cmdID == CMD_PUTDOWNFEATURE then
		local x,y,z = cmdParams[1],cmdParams[2],cmdParams[3]
		Spring.SetUnitMoveGoal (unitID, x,y,z, 20)	--FIXME: do not call so often
		local x2,y2,z2 = Spring.GetUnitPosition (unitID, true)
		if distance2D (x,z, x2,z2) < pickUpRange then
			putDown (unitID)	--put everything down. evtl bei ALT gedrückt nur eins?
			return true, true
		end
	end
	
	--Spring.SetUnitMoveGoal (unitID, x,y,z)
	----
	return true,false
end


--------helpers
 function distance2D (x1,y1,x2,y2)
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)	
end