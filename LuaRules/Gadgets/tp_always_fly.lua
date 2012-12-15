function gadget:GetInfo()
  return {
    name      = "aircraft always fly",
    desc      = "remove land/fly toggle, set aircraft to fly",
    author    = "basically by Flozi thanks!",
    date      = "2011",
    license   = "raubkopierer sind verbrecher",
    layer     = 0,
    enabled   = true,
  }
end


if (gadgetHandler:IsSyncedCode()) then


function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	local ud = UnitDefs[unitDefID]
	if ud.canFly then
		Spring.GiveOrderToUnit(unitID, CMD.IDLEMODE, {0}, {})
		local toRemove = {CMD.IDLEMODE, CMD.AUTOREPAIRLEVEL}
		for _, cmdID in pairs(toRemove) do
			local cmdDescID = Spring.FindUnitCmdDesc(unitID, cmdID)
			Spring.RemoveUnitCmdDesc(unitID, cmdDescID)
		end
	end
end

else -- ab hier unsync


end