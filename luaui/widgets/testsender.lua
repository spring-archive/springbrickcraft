function widget:GetInfo()
  return {
    name      = "testsender",
    desc      = "send luarulesmsg",
    author    = "knorke",
    date      = "2014 Feb",
    license   = "horses. horses everywhere.",
    layer     = -3,
    enabled   = true
  }
end



function widget:AddConsoleLine(msg, priority)
--Spring.Echo ("-"..msg.."-")
if (msg=="<knorke> lol") then 
Spring.Echo ("rofl") 

Spring.SendLuaRulesMsg("scan!")
end
end