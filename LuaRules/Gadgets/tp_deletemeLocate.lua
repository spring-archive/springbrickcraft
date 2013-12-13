function gadget:GetInfo()
return {
name = "locatecmd",
desc = "Adds a command button for location initiation.",
author = "Bilal Itani",
date = "March, 2013",
license = "GNU GPL, v3.0 or later",
layer = 0,
enabled = false -- loaded by default?
}
end
 
if (not gadgetHandler:IsSyncedCode()) then return end
 			 midPos = true
             aimPos = false
--SYNCED
 
 
--local EditUnitCmdDesc = Spring.EditUnitCmdDesc
--local FindUnitCmdDesc = Spring.FindUnitCmdDesc
--local GiveOrderToUnit = Spring.GiveOrderToUnit
--local SetUnitNeutral = Spring.SetUnitNeutral
--local GetUnitMoveTypeData = Spring.GetUnitMoveTypeData
--local SetGroundMoveTypeData = Spring.MoveCtrl.SetGroundMoveTypeData
--local SetGunshipMoveTypeData = Spring.MoveCtrl.SetGunshipMoveTypeData
 
local LOCATORS = {
  [UnitDefNames["tptank"].id] = true, --need to inherit the for real for some reason
}
 
local activeLocators = {} --these too?
 
local locatorList = {}
 
local CMD_STRT_LOC = 34581
 
local locateCmd = {
        id      = CMD_STRT_LOC,
        name    = "Locate",
        action  = "locate",
        type    = CMDTYPE.ICON_MAP,
        tooltip = "Commands the locator to locate.",
        params  = { 'Stop', 'Locate',}
}
--Info for cmd
 
function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)  --identifies unitID, unitDefID, unitTeam, and builderID of each unit created. Can be used for specified units.
  --callin for when locator is created
        if LOCATORS[unitDefID] then
  --makes callin locator specific
         locatorList[unitID] = true
		 
                Spring.InsertUnitCmdDesc(unitID, 500, locateCmd)
        --actually creates the cmd; makes it visible in the locator's cmd buttons
        else
       
end
 
end
 
-- <[2up]knorke> in CommandFallback() you must add the activated locator to a list
-- <[2up]knorke> and in GameFrame you loop over that list and have each locator do its locator thing

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
	Spring.Echo (CMD[cmdID])
	if cmdID == CMD.STOP then	--lolcator giving STOP command and is not active anymore
		Spring.Echo ("a stop command in AllowCommand")
		activeLocators[unitID] = nil
	end
	return true
end

 
function gadget:CommandFallback(unitID, unitDefID, unitTeam, cmdID, cmdParams, cmdOptions, cmdTag)
				 metalx = 1000
                 metaly = 2800
                 metalz = 2800
				
        if cmdID == CMD_STRT_LOC then --is beloved our custom command?
                if LOCATORS[unitDefID] then   --is it a unit that should care about our custom command?        
					activeLocators[unitID] = true
					local x = cmdParams[1]
					local y = cmdParams[2]
					local z = cmdParams[3]
					Spring.Echo("commandfallback is called.")
					Spring.GiveOrderToUnit(unitID, CMD.MOVE , {x,y,z }, {}) 
					 --tells the locator to move to coords x,y,z; move to click
				end
		else -- it is not our beloved custom command anymore! * this is actually never called
			activeLocators[unitID] = nil
			Spring.Echo ("a different command in CommandFallback")
         end
    

                       
 
               
                --unitID ==
               
               
     --   if locatorList[ unitID ] then
       --  local midPos = true
         --       local aimPos = false
           --     local locatorPosX, _, locatorPosZ = Spring.GetUnitPosition(unitID, midPos, aimPos)
             --           Spring.Echo("The locator is told to distance check for mineral deposits.")
               --          if math.abs(metalx - locatorPosX)<=200 and math.abs(metalz - locatorPosZ)<=200 then
                 --                       Spring.Echo("The Locator is within range of a mineral deposit!")
                                        --local metalx = cmdParams[1]
                                        --local metaly = cmdParams[2]
                                        --local metalz = cmdParams[3]
                   --                     Spring.GiveOrderToUnit(unitID, CMD.MOVE , {metalx,metaly,metalz }, {})
                                     
                     --    end
		--else
        --Spring.Echo("That's not a locator.")
        --end
 end


        
 
 
 function gadget:GameFrame(frame)
        if frame%10 == 0 then
                Spring.Echo("GameFrame initiated.")
                for unitID in pairs(activeLocators) do
                        local unitDefID = Spring.GetUnitDefID(unitID)
                        local locatorPosX, _, locatorPosZ = Spring.GetUnitPosition(unitID, midPos, aimPos)
                        Spring.Echo("The locator is told to distance check for mineral deposits.")
					if math.abs(metalx - locatorPosX)<=200 and math.abs(metalz - locatorPosZ)<=200 then
							Spring.Echo("The Locator is within range of a mineral deposit!")
							depositLocated = true
							Spring.SetUnitMoveGoal(unitID, metalx, metaly, metalz) 
						else
								depositLocated = nil
                                --local metalx = cmdParams[1]
                                --local metaly = cmdParams[2]
                                --local metalz = cmdParams[3]                  
                        end
                end
        end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
         if locatorList[ unitID ] then
        locatorList[ unitID ] = nil
end    
end