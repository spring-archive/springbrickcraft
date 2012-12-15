--[[
function widget:GetInfo()
	return {
	name = "Brickcraft | rightlick = moveto instead of attack",
	desc = "instead of trying to attack minerals on rightclic, move to their position",
	author = "knorke",
	date = "2011",
	license = "horse",
	layer = 1,
	enabled = true
	}
end

function widget:DefaultCommand()
	local mx,my=Spring.GetMouseState()
	local s,t =Spring.TraceScreenRay(mx,my)
	if s == "unit" then		
		if (unitName (t) == "tptetra) then
			--if not at at least miner is selected...
			return CMD.MOVE
		end
	end
end


function unitName (unitID)
	if (not Spring.ValidUnitID (unitID)) then return "!invalid unitID in unitName()!" end
	local udID =Spring.GetUnitDefID(unitID)
	local uDef = UnitDefs [udID]
	return uDef.name
end


function widget:GotChatMsg (a,b)
	Spring.Echo (a)
end
--]]