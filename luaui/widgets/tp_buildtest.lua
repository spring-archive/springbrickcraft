function widget:GetInfo()
   return {
   version   = "1",
   name      = "build test",
   desc      = "some test with commands",
   author    = "knorke",
   date      = "2011",
   license   = "Public Domain",
   layer     = 0,
   enabled   = false, --enabled by default
   handler   = true, --access to handler
   }
end

function widget:GameFrame (f)	
	local index,cmd_id,  cmd_type,  cmd_name = Spring.GetActiveCommand ()		
	if (cmd_id and cmd_id > 0) then return end --  < 0 means building something, >0 is move,patrol etc  cmd_id=-unitdefif (???)
	if (cmd_name) then
		local x,z = getCursorWorldCoord()
		Spring.Echo ("trying to place a " .. cmd_name .." at " .. math.floor(x) .. ":" .. math.floor(z))
	end	
end

function getCursorWorldCoord ()
    local mx,my = Spring.GetMouseState()
    local _,pos = Spring.TraceScreenRay(mx,my,true)
    if (pos~=nil) then return pos[1],pos[3] end --[1] = number x, [2] = number y, [3] = number z
end