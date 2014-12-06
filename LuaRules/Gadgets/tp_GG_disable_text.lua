function gadget:GetInfo()
    return {
        name = "GG_gadget disable test",
        desc = "can gadget be disabled like this, for missions?",
        author = "Code_Man",
        date = "2014",
        license = "Public domain",
        layer = 1,
        enabled = GG.enableTest
    }
end

if (not gadgetHandler:IsSyncedCode()) then
    return false
end


function gadget:GameFrame(frame)
	if frame%60==0 then Spring.Echo (GG.enableTest, frame) end --pro way to see if gadget has not crashed yet	
end