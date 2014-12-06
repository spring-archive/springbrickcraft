--[[
psi storm idee
custom command mit x,y,z auf map klicken
wenn mana>required:
bei x,y,z getunitsincircle -> damage
ceg (x,y,z)
ceg chain (unitxyz, x,y,z)
--]]

function gadget:GetInfo()
  return {
    name      = "Mine Layer",
    desc      = "adds a button to a unit so it lay mines",
    author    = "knorke",
    date      = "2011",
    license   = "gooooooooooodbye horses",
    layer     = 1,
    enabled   = true,
  }
end

include("LuaRules/Configs/tp_CMDID.lua")

if (not gadgetHandler:IsSyncedCode()) then return end

local EditUnitCmdDesc = Spring.EditUnitCmdDesc
local FindUnitCmdDesc = Spring.FindUnitCmdDesc
local InsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local GiveOrderToUnit = Spring.GiveOrderToUnit
local SetUnitNeutral = Spring.SetUnitNeutral
local GetUnitMoveTypeData = Spring.GetUnitMoveTypeData
local SetGroundMoveTypeData = Spring.MoveCtrl.SetGroundMoveTypeData
local SetGunshipMoveTypeData = Spring.MoveCtrl.SetGunshipMoveTypeData

local mineLayerNames = {
  [UnitDefNames["tppioneer"].id] = true,
}

local mineLayCmd = {
      id      = CMD_LAY_MINE,
      --name    = " Time\nBomb!",	--text on the button
      action  = "layMine",
      type    = CMDTYPE.ICON_MODE,
	  --texture = "&.9x.9&unitpics/sigterm.png&bitmaps/frame.tga",
	  texture = "unitpics/tpexploicon.png&", --& = larger icon due to no frame
      tooltip = "Place a trolltastic timebomb!   Hotkey: b",
      params  = { 'do it!'}
}

function gadget:Initalize() 
	Spring.Echo ("tp_minelayer.lua initalize()")
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)	
	if mineLayerNames[unitDefID] then
		InsertUnitCmdDesc(unitID, mineLayCmd)
	end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
	if mineLayerNames[unitDefID] then	
		if (cmdID == CMD_LAY_MINE) then
			if (GG.GetMana (unitID) >= 1) then
				local x,y,z=Spring.GetUnitPosition (unitID)
				local unitangle = Spring.GetUnitHeading(unitID)
				local angle = (unitangle*math.pi/ 32768)	--drop behind unit
				local radius = 50
				x=x- radius*math.sin(angle)
				z=z- radius*math.cos(angle)				
				local newmine = Spring.CreateUnit("tpclocky_medium", x, y, z, unitangle, teamID)
				Spring.SetUnitNoSelect (newmine, true)
				--Spring.UseTeamResource (teamID, "metal", 200)
				GG.AdjustMana (unitID, -1)
				env = Spring.UnitScript.GetScriptEnv(unitID)
				if (env) then Spring.UnitScript.CallAsUnit(unitID, env.layMineAnimation) end
			end
			return false
		end
	end
	return true
end