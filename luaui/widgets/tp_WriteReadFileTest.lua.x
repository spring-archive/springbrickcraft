function widget:GetInfo()
   return {
   version   = "1",
   name      = "zzzz read/write file test",
   desc      = "try to write to file, then read it again",
   author    = "knorke",
   date      = "2014",
   license   = "Public Domain",
   layer     = 0,
   enabled   = true, --enabled by default
   --handler   = true, --access to handler   mit =true geht widgetHandler:RemoveWidget() nicht (?!)
   }
end

function widget:Initialize ()
	local file = io.open("zzzztest.txt", "r")
	--file:write("Lalala.")
	local file = "zzzztest.txt"
	
  lines = {}
  for line in io.lines(file) do 
    Spring.Echo (line)
  end

	file:close()
end
