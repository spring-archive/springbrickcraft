--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    unit_draw.lua
--  brief:   draws unit pieces
--  author:  Pressure Line
--
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
	return {
		name      = "UnitDraw",
		desc      = "Draws extra unit pieces",
		author    = "Pressure Line",
		date      = "June, 2012",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true  --  loaded by default?
	}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- uncsynced only
if (gadgetHandler:IsSyncedCode()) then
	return false
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--Storage
--
--Spring.GetUnitTeam(unitID)
--Spring.GetVisibleUnits

function gadget:Initialize()
	Spring.Echo("UnitDraw Gadget Initialized")
end

local drawDefNames  = VFS.Include"LuaRules/Configs/unit_draw_defs.lua"

local drawDefs = {}

for name, data in pairs(drawDefNames) do
  drawDefs[UnitDefNames[name].id] = data
end

function gadget:DrawWorld()

	local units = Spring.GetVisibleUnits()

	for key,uID in ipairs(units) do
		local udID = Spring.GetUnitDefID(uID)
		local tID = Spring.GetUnitTeam(uID)
		
		if(udID ~= nil) then
			if (UnitDefs[udID]["customParams"]["unitdraw"] ~= nil) then
				local drawDef = drawDefs[udID]
				local drawpos = drawDef.pos
				local drawname = drawDef.name
				local pieces = Spring.GetUnitPieceList(uID)

				for pID, pName in pairs(pieces) do
					if(string.sub(pName,1,-1) == drawpos) then
						gl.PushMatrix() 
						gl.UnitMultMatrix(uID)
						gl.UnitPieceMultMatrix(uID,pID)

						gl.DepthTest(true)
						gl.ShadeModel(GL.SMOOTH)
						gl.Lighting(true)
						gl.Culling(GL.BACK)
						gl.PolygonMode(GL.FRONT_AND_BACK, GL.FILL)
						gl.DepthMask(true)
						
						gl.UnitShape(UnitDefNames[drawname].id,tID)
						gl.PopMatrix()
					end
				end
			
			end
		end
	end

	gl.ResetState()
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID) 
	if (UnitDefs[unitDefID]["customParams"]["unitdraw"] ~= nil) then
		Spring.Echo(UnitDefs[unitDefID]["name"])  --debug message
	end
end
