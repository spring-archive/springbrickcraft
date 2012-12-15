-- http://springrts.com/phpbb/viewtopic.php?f=14&t=28763

function gadget:GetInfo()
  return {
    name      = "test",
    desc      = "wepon",
    author    = "PressureLine / knorke",
    date      = "2012",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = false  --  loaded by default?
  }
end


function gadget:AllowWeaponTarget(attackerID, targetID, attackerWeaponNum, attackerWeaponDefID, defaultPriority)
   Spring.Echo ("attackerID=".. attackerID .."  " .. "targetID=" .. targetID)

   attackerUnitDefID = Spring.GetUnitDefID(attackerID)
   targetUnitDefID = Spring.GetUnitDefID(targetID)
   if UnitDefs[attackerUnitDefID].name == "tptank" then
    
	if UnitDefs[targetUnitDefID].name == "tpdude" then
         Spring.Echo ("aiming at a dude")
		 Spring.SetUnitWeaponState(attackerID, 0, "range", 2000)
      else
		Spring.Echo ("aiming at something else")
         Spring.SetUnitWeaponState(attackerID, 0, "range", 400)
      end
	  
   end   
   return true, defaultPriority
end