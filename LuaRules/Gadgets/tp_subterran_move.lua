--functions to be called in unitscript:
--startDiggingDown
--startDiggingUp
--FinishedDiggingUp

function gadget:GetInfo()
        return {
                name                    = "subterran",
                desc                    = "suberrans",
                author          		= "knorke",
                date                    = "Sep 2012",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true,
        }
end


if (gadgetHandler:IsSyncedCode()) then

local diggerDefs = {
  [UnitDefNames["tpscorpion"].id] = {hSpeed = 3, vSpeed = 2, digDepth = -200},
  [UnitDefNames["tpsubtransporter"].id] = {hSpeed = 2, vSpeed = 0.4, digDepth = -100},
  
--  [UnitDefNames["tphubschrauber"].id] = true,
--  [UnitDefNames["tpsmallfac"].id] = true,
 }

local TRAVEL_UP = 1
local TRAVEL_DOWN = 2
local TRAVEL_STRAIGHT = 3
 
local diggers = {}	--.tx .ty .tz .travel [see constants above]
local toRemove = {} --remove those next frame
local mustRemove = false


function gadget:Initialize()
	_G.diggers = diggers
end

function addDigger (unitID)
	diggers[unitID] = {tempbla=100,}
	Spring.MoveCtrl.Enable (unitID)
	blindUnit (unitID)
	Spring.SetUnitLeaveTracks (unitID, false)
	local defID = Spring.GetUnitDefID (unitID)
	diggers[unitID].vSpeed = diggerDefs[defID].vSpeed
	diggers[unitID].hSpeed = diggerDefs[defID].hSpeed
	diggers[unitID].digDepth = diggerDefs[defID].digDepth
	env = Spring.UnitScript.GetScriptEnv(unitID)
	if (env and env.startDiggingDown) then Spring.UnitScript.CallAsUnit(unitID, env.startDiggingDown) end
end

local speed = 3
local digSpeed = 1
local digDepth =  200
local digDistance = 500 --how far away must a waypoint be until unit submerges instead of driving on surface?
local targetDistance = 25 --how near to target is "close enough"?

function MoveDiggers ()
	for unitID in pairs(diggers) do
	--get move target FIXME: only do the cQueue stuff if commands changed
		local cQueue = Spring.GetCommandQueue(unitID)
		local x,y,z=Spring.GetUnitPosition (unitID)
		local hasMoveTarget = false
		if cQueue then
			--Spring.Echo ("cQueue not empty")			
			if cQueue[1] and cQueue[1].id == CMD.MOVE then
				cx,cy,cz = cQueue[1].params[1],cQueue[1].params[2],cQueue[1].params[3]
				local dist = math.sqrt ( ((cx-x)^2) + ((cz-z)^2)) 
				--Spring.Echo (dist)
				if (dist > targetDistance) then
					diggers[unitID].tx = cx
					diggers[unitID].ty = cy
					diggers[unitID].tz = cz
					hasMoveTarget = true
				end
			else				
				hasMoveTarget = false
			end
		end
		local canDrive = false
		local targetY
		if hasMoveTarget then
			targetY = Spring.GetGroundHeight (x,z) + diggers[unitID].digDepth
		else
			targetY = Spring.GetGroundHeight (x,z)
		end
		
		local yReached = false
		local diff = 0
		y, yReached,diff = approach (y,  targetY, diggers[unitID].vSpeed)
		
		if diff > 0 and not hasMoveTarget then
			env = Spring.UnitScript.GetScriptEnv(unitID)
			if (env and env.DigUp) then Spring.UnitScript.CallAsUnit(unitID, env.DigUp) end				
		end
					--use this somewhere?
					--env = Spring.UnitScript.GetScriptEnv(unitID)
					--if (env and env.startDiggingUp) then Spring.UnitScript.CallAsUnit(unitID, env.startDiggingUp) end				
		
		if yReached then canDrive = true end
		
		if (yReached and not hasMoveTarget) then
			toRemove[unitID] = true 
			mustRemove = true
			env = Spring.UnitScript.GetScriptEnv(unitID)
			if (env and env.FinishedDiggingUp) then Spring.UnitScript.CallAsUnit(unitID, env.FinishedDiggingUp) end
		end

		if canDrive then
			diggers[unitID].travel = TRAVEL_STRAIGHT
			x = approach (x, diggers[unitID].tx , diggers[unitID].hSpeed)
			z = approach (z, diggers[unitID].tz , diggers[unitID].hSpeed)
		end
		
	 
		--collision
		local n = table.getn (Spring.GetUnitsInSphere (x,y,z, 100))
		if ( n<2)  then
			Spring.SetUnitPosition (unitID, x,y,z)
		end
	end
end

function approach (currentX, targetX, speed)
	local newX = currentX
	local diff = currentX - targetX
	local hasReached = false
	if (math.abs (diff) < speed) then
		currentX = targetX
		hasReached = true
	else
		if diff < 0 then 
			newX = newX + speed
		else 
			newX = newX - speed
		end
	end
	return newX, hasReached, newX-currentX
end

function gadget:GameFrame (f)
	--Spring.Echo (f)
	MoveDiggers ()
	if mustRemove then removeDiggers() end	
end


function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	--if diggerUnitNames [unitDefID] then 
		--addDigger (unitID)
	--end	
--	local x = Spring.GetUnitSensorRadius (unitID, "radar")
--	Spring.Echo ("radar = " .. x)
end


function removeDiggers ()
	for unitID in pairs(toRemove) do
		if (toRemove[unitID]) then removeDigger (unitID) end		
	end
	mustRemove = false
end

function removeDigger (unitID)
	diggers[unitID] = nil
	if (not Spring.ValidUnitID (unitID)) then return end
	unblindUnit (unitID)
	Spring.MoveCtrl.Disable (unitID)
	Spring.SetUnitLeaveTracks (unitID, true)
	Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, {}) --without this the unit will not continue to move
	Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, {})
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
	if diggerDefs [unitDefID] then 
		local cQueue = Spring.GetCommandQueue(unitID)
		local x,y,z=Spring.GetUnitPosition (unitID)		
		if cQueue and cQueue[1] and cQueue[1].id == CMD.MOVE then
			cx,cy,cz = cQueue[1].params[1],cQueue[1].params[2],cQueue[1].params[3]
			local dist = math.sqrt ( ((cx-x)^2) + ((cz-z)^2)) 
			--Spring.Echo (dist)
			if (dist > digDistance) then
				if not diggers[unitID] then addDigger (unitID) end
			end
		end
	end
	return true
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  diggers[unitID] = nil
end

function blindUnit (unitID)
	local orgLos = Spring.GetUnitSensorRadius (unitID, "los")
--	Spring.Echo ("orgLos=" .. (orgLos or "nil"))
	Spring.SetUnitSensorRadius (unitID, "los", 0)
	Spring.SetUnitSensorRadius (unitID, "airLos", 0)
end

function unblindUnit (unitID)
	local unitDefID = Spring.GetUnitDefID (unitID)
	local orgLos = UnitDefs[unitDefID]["losRadius"] * 64
--	Spring.Echo ("orgLos from def=" .. (orgLos or "nil"))
	Spring.SetUnitSensorRadius (unitID, "los", orgLos)

	local orgLosAir = 9000 --= UnitDefs[unitDefID]["airLosRadius"] * 300 --this is not right FIXME
--	Spring.Echo ("orgLosAir from def=" .. (orgLosAir or "nil"))
	Spring.SetUnitSensorRadius (unitID, "airLos", orgLosAir)
end


else --- UNSYNCED ---

local glBillboard               = gl.Billboard
local glColor                   = gl.Color
local glPopMatrix               = gl.PopMatrix
local glPushMatrix              = gl.PushMatrix
local glTexRect                 = gl.TexRect
local glTexture                 = gl.Texture
local glTranslate               = gl.Translate
local spGetLocalTeamID			= Spring.GetLocalTeamID
local spGetUnitTeam				= Spring.GetUnitTeam
local spGetTeamColor			= Spring.GetTeamColor

local TRAVEL_UP = 1
local TRAVEL_DOWN = 2
local TRAVEL_STRAIGHT = 3

--GL part based on something from KDR_11k (David Becker)
local size=16
local offset=0
local diggers = SYNCED.diggers
function gadget:DrawWorld()
	glTexture("bitmaps/subterrain.png")
	local localTeam = spGetLocalTeamID()
	if not diggers then return end
	--Spring.Echo ("i see diggers")
	for u,_ in spairs(diggers) do
		if diggers[u].travel == TRAVEL_STRAIGHT then
			local team=spGetUnitTeam(u)
			if team==localTeam then
				local x,y,z=Spring.GetUnitPosition(u)
				local h = 0 --spGetUnitHeight(u)
				local r,g,b = spGetTeamColor(team)
				glColor(r,g,b,1)
				glPushMatrix()
				glTranslate(x,y+h,z)
				glBillboard()
				glTexRect(-size, -size + offset, size, size + offset, false, false)			
				glPopMatrix()
			end
		end
	end
	glTexture(false)
end

end