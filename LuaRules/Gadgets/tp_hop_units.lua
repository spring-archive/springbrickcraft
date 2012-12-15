function gadget:GetInfo()
  return {
    name      = "factory hopper",
    desc      = "makes units hop out of a factory",
    author    = "knorke",
    date      = "Mar 2011",
    license   = "horses gonna hop",
    layer     = 0,
    enabled   = true--  loaded by default?
  }
end

if (not gadgetHandler:IsSyncedCode()) then return end
local hoppers = {} --[unitID] --startposition: sx,sy,sz,  flightProgress [0,1], horizontale abweichungen: dx, dz, flighttime, hopHeight:höhe am höhsten punkt
local toRemove = {} --welche hoppers im nächsten frame rausfliegen
local mustRemove = false --true/false ob toRemove gefüllt ist

local GiveOrderToUnit = Spring.GiveOrderToUnit
local SetUnitNeutral = Spring.SetUnitNeutral
local GetUnitMoveTypeData = Spring.GetUnitMoveTypeData

function gadget:Initalize() 
	Spring.Echo ("factory hopper initalize()")
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  hoppers[unitID] = nil
end


function gadget:GameFrame (f)	
	--Spring.Echo (f)
	moveHoppers()
	if (mustRemove) then removeHoppers () end
end

function GG.HopOutOfFactory (unitID, factoryID)
	--Spring.Echo (unitID .. " is hopping out of " .. factoryID)
	local f = Spring.GetUnitBuildFacing  (factoryID) or 0	
	if (f==0) then GG.addHopper (unitID,0,50,400) end
	if (f==1) then GG.addHopper (unitID,50,0,400) end
	if (f==2) then GG.addHopper (unitID,0,-50,400) end
	if (f==3) then GG.addHopper (unitID,-50,0,400) end
end

function GG.addHopper (unitID, dx, dz,h )
	if (not Spring.ValidUnitID (unitID)) then return end
	Spring.MoveCtrl.Enable (unitID)
	hoppers[unitID] = {}
	hoppers[unitID].sx, hoppers[unitID].sy, hoppers[unitID].sz = Spring.GetUnitPosition (unitID)
	hoppers[unitID].dx = dx --50
	hoppers[unitID].dz = dz --50
	hoppers[unitID].hopHeight = h--400
	hoppers[unitID].flightProgress = 0
end

function removeHoppers ()
	for unitID in pairs(toRemove) do
		if (toRemove[unitID]) then hoppers[unitID] = nil end
		Spring.MoveCtrl.Disable (unitID)
		if (Spring.ValidUnitID (unitID)) then --maybe unit died during flight
			Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, {}) --without this the unit will not continue to move
			Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, {})
		end
	end
	mustRemove = false
end

function moveHoppers ()
	--Spring.Echo ("moveHoppers ()")
	for unitID in pairs(hoppers) do		
		hoppers[unitID].flightProgress=hoppers[unitID].flightProgress+0.02		
		if (hoppers[unitID].flightProgress > 1) then 
			toRemove[unitID] = true 
			mustRemove = true
			local x,y,z = Spring.GetUnitPosition (unitID)
			Spring.SpawnCEG("tpdirtspray", x,y,z)
			--local oldQueue = Spring.GetCommandQueue(unitID)
			--reloadQueue(unitID, oldQueue)
		end		
		local y = hoppers[unitID].sy + (1-(2*hoppers[unitID].flightProgress-1)^2)*hoppers[unitID].hopHeight*hoppers[unitID].flightProgress
		local x = hoppers[unitID].sx+hoppers[unitID].dx*hoppers[unitID].flightProgress
		local z = hoppers[unitID].sz+hoppers[unitID].dz*hoppers[unitID].flightProgress
		Spring.SetUnitPosition (unitID, x, y, z)
		--Spring.SpawnCEG("tpdirtspray", x,y,z)
	--	Spring.Echo (unitID .. " is hopping " .. hoppers[unitID].flightProgress)
	end
end