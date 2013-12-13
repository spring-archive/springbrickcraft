    function widget:GetInfo()
            return {
                            name    = "Show Unit ID",
                            desc    = "Show all ID of all units",
                            author  = "zwzsg",
                            date    = "August 2010",
                            license = "Free",
                            layer   = 0,
                            enabled = false,
                    }
    end
     
     
    function widget:DrawScreenEffects()
            for _,id in ipairs(Spring.GetAllUnits()) do
                    local x,y=Spring.WorldToScreenCoords(Spring.GetUnitPosition(id))
                    local FontSize=16
                    gl.Text("ID:"..id,x,y,16,"od")
            end
    end