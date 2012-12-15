function widget:GetInfo()
   return {
   version   = "1",
   name      = "Brickcraft | Hotkeys",
   desc      = "Adds hotkeys: b: place bomb, m: mine minerals",
   author    = "knorke",
   date      = "2011",
   license   = "3,5% Fett",
   layer     = 0,
   enabled   = true, --enabled by default
   --handler   = true, --access to handler
   }
end
include("keysym.h.lua")
include("Configs/tp_CMDID.lua")


local KEY_BOMB = KEYSYMS.B
local KEY_MINING = KEYSYMS.M

function widget:KeyPress(key, mods, isRepeat)
	--Spring.Echo ("key was pressed:" .. key)
	if (key==KEY_BOMB) then return placeBomb () end
	if (key==KEY_MINING) then return goMine () end
end

function placeBomb ()
	selectedUnits = Spring.GetSelectedUnits  ()
	if (#selectedUnits>0) then
		for i,_  in pairs (selectedUnits) do			
			if (Spring.ValidUnitID (selectedUnits[i])) then
				Spring.GiveOrderToUnit(selectedUnits[i], CMD_LAY_MINE , {}, {})
			end
		end
	return true
	end
	return false
end

function goMine ()
	selectedUnits = Spring.GetSelectedUnits  ()
	if (#selectedUnits>0) then		
		for _,i  in ipairs (selectedUnits) do					
			if (Spring.ValidUnitID (i)) then
				Spring.GiveOrderToUnit(i, 70703 , {}, {})	--CMD_GO_MINING mag er irgendwie nicht?!***
			end
		end
	return true
	end
	return false
end

--unbind annoying keys
function widget:Initialize ()
   --Spring.SendCommands("unbindkeyset Any+c controlunit")
   Spring.SendCommands("unbindkeyset any+j")
   Spring.SendCommands("unbindkeyset any+m")	--move
   Spring.SendCommands("unbindkeyset Any+h sharedialog")   
end
