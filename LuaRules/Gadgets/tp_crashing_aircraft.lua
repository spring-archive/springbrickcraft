function gadget:GetInfo()
  return {
    name      = "unit crasher",
    desc      = "makes aircraft crash",
    author    = "knorke",
    date      = "Dec 2011",
    license   = "horses gonna crash",
    layer     = 0,
    enabled   = true--  loaded by default?
  }
end
--unitscript:  calls crashUnit (unitID, crashType) in killed()
--killed() looks like   while (isCrashing) do Sleep (100) end
--gadget:	calls unitscript.startCrashing() -> unit begins playing animation (smoke or whatever)
--gadget:   animats unit crash flight path until unit crashes into terrain
--gadget:   calls unitscript.endCrashing() -> unit begins death animation (shatter into pieces or whatever)


if (not gadgetHandler:IsSyncedCode()) then return end
include("LuaRules/Configs/tp_crashtypes.lua")
local crashers = {}	--[unitID] .f (frame) .x .y .z  .vx .vy .vz
local toRemove = {} --welche crasher im nächsten frame rausfliegen
local mustRemove = false --true/false ob toRemove gefüllt ist

local GiveOrderToUnit = Spring.GiveOrderToUnit
local SetUnitNeutral = Spring.SetUnitNeutral
local GetUnitMoveTypeData = Spring.GetUnitMoveTypeData

function gadget:Initalize() 
	Spring.Echo ("crashers initalize()")
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  crashers[unitID] = nil
end


function gadget:GameFrame (f)	
	moveAllCrashers()
	if (mustRemove) then removeCrashers () end
end


function GG.crashUnit (unitID, crashType, initParams)
	Spring.MoveCtrl.Enable (unitID)
	if (not Spring.ValidUnitID (unitID)) then return end
	crashers[unitID]={crashType = crashType}
	moveCrasher (unitID, crashType, true, initParams)	--true: add new crasher & run initcode of move_bla funtion
	Spring.SetUnitNoSelect (unitID, true) 
	env = Spring.UnitScript.GetScriptEnv(unitID)
	if (env) then Spring.UnitScript.CallAsUnit(unitID, env.startCrashing) end	
end

function removeCrashers ()
	for unitID in pairs(toRemove) do
		if (toRemove[unitID]) then crashers[unitID] = nil end
		Spring.MoveCtrl.Disable (unitID)
		if (Spring.ValidUnitID (unitID)) then --maybe unit died during flight
			Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, {}) --without this the unit will not continue to move
			Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, {})
		end
	end
	mustRemove = false
end

function moveAllCrashers ()	
	for unitID in pairs(crashers) do		
		crashers[unitID].f=crashers[unitID].f+1
		if (crashers[unitID].f > 300) then
			toRemove[unitID] = true 
			mustRemove = true
		end
		
		local endCrashing = moveCrasher (unitID, crashers[unitID].crashType)		
		if (endCrashing) then
			env = Spring.UnitScript.GetScriptEnv(unitID)
			if (env) then Spring.UnitScript.CallAsUnit(unitID, env.endCrashing) end
			toRemove[unitID] = true 
			mustRemove = true
		end

	end
end

function moveCrasher (unitID, crashType, addNew, initParams)
	--local endCrashing = false
	if (crashType == FallDown) then return move_FallDown (unitID, addNew, initParams) end
	if (crashType == NoseDive) then return move_NoseDive (unitID, addNew, initParams) end
	if (crashType == CrashLand) then return move_CrashLand (unitID, addNew, initParams) end
	if (crashType == HeliCrash) then return move_HeliCrash (unitID, addNew, initParams) end
	
end


function isUnderTerrain (x,y,z)
	if (Spring.GetGroundHeight (x,z) > y) then 
		--Spring.Echo ("is under ground!") 
		return true 
	end
	return false
end

-------------------crash movement types------------------
--functions are named like    move_BlablaBlub (unitID, addNew)
--if addNew==true then the unit is not to be animated but just added and variables initset etc
--return endCrashing true|false   (eg true when crashed into terrain or burnt up or animation simply ended)
---------------------------------------------------------


--the unit simply falls down like a stone
function move_FallDown (unitID, addNew, initParams)
	if (addNew) then
		local crashType = crashers[unitID].crashType
		local x,y,z=Spring.GetUnitPosition (unitID)
		crashers[unitID] = {
		crashType = crashType,
		x=x,
		y=y,
		z=z,
		f = 0,
		fallSpeed = initParams.fallSpeed or 2
		}
		return false
	end
	
	crashers[unitID].y = crashers[unitID].y - crashers[unitID].fallSpeed
	Spring.SetUnitPosition (unitID, crashers[unitID].x, crashers[unitID].y, crashers[unitID].z)
	
	local x = crashers[unitID].x
	local y = crashers[unitID].y
	local z = crashers[unitID].z
	return isUnderTerrain (x,y,z)
end

--fly forward and lose height until crash into terrain
function move_CrashLand (unitID, addNew, initParams)
	if (addNew) then
		local crashType = crashers[unitID].crashType
		local x,y,z=Spring.GetUnitPosition (unitID)
		local unitangle = Spring.GetUnitHeading(unitID)
		local angle = (unitangle*math.pi/ 32768)
		crashers[unitID] = {
		crashType = crashType,
		x=x,
		y=y,
		z=z,
		xs = math.sin (angle) * (initParams.horizontalSpeed or 4),
		zs = math.cos (angle) * (initParams.horizontalSpeed or 4),
		f = 0,
		fallSpeed = initParams.fallSpeed or 10
		}
		return false
	end
	
	crashers[unitID].y = crashers[unitID].y - crashers[unitID].fallSpeed
	crashers[unitID].x = crashers[unitID].x + crashers[unitID].xs
	crashers[unitID].z = crashers[unitID].z + crashers[unitID].zs
	
	Spring.SetUnitPosition (unitID, crashers[unitID].x, crashers[unitID].y, crashers[unitID].z)
	
	local x = crashers[unitID].x
	local y = crashers[unitID].y
	local z = crashers[unitID].z
	return isUnderTerrain (x,y,z)
end


--tumble towards ground
function move_HeliCrash (unitID, addNew, initParams)
	if (addNew) then
		local crashType = crashers[unitID].crashType		
		crashers[unitID] = {
			crashType = crashType,		
			f = 0,
		}
		local tumbleSpin = initParams.tumbleSpin or 2
		local tumbleDrift = initParams.tumbleDrift or 2		
		local fallSpeed = initParams.fallSpeed or 10
		local x,y,z=Spring.GetUnitPosition (unitID)
		--Spring.Echo ("tumbleSpin="..tumbleSpin)
		--Spring.MoveCtrl.SetPhysics  (unitID, x,y,z, 300, fallSpeed, math.random (-tumbleDrift, tumbleDrift), 0, tumbleSpin, 0)		
		Spring.MoveCtrl.SetVelocity (unitID, 0, -fallSpeed, 0)
		Spring.MoveCtrl.SetRotationVelocity (unitID, 0, tumbleSpin, 0)
		return false
	end	
	
	local x,y,z=Spring.GetUnitPosition (unitID)
	return isUnderTerrain (x,y,z)
end


