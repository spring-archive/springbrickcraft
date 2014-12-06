if not Spring.GetConfigInt("LuaSocketEnabled", 0) == 1 then
	Spring.Echo("LuaSocketEnabled is disabled")
	return false
end

function widget:GetInfo()
return {
	name    = "Test-Widget for luasocket",
	desc    = "a simple test widget to show capabilities of luasocket",
	author  = "knorke loling with abmas socket thing",
	date    = "Jul. 2011",
	license = "GNU GPL, v2 or later",
	layer   = 0,
	enabled = true,
}
end

include "tp_clickbuttons.lua"

--VFS.Include(LUAUI_DIRNAME .. "Widgets/socket/socket.lua")

local socket=require("socket")

local client
local set

local host = "localhost"
local port = 8200
--local file = "/"

local function dumpConfig()
	-- dump all luasocket related config settings to console
	for _, conf in ipairs({"TCPAllowConnect", "TCPAllowListen", "UDPAllowConnect", "UDPAllowListen"  }) do
		Spring.Echo(conf .. " = " .. Spring.GetConfigString(conf, ""))
	end
end

local chatTextBox =
{
	x = 0.5,
	y = 0.95,
	w = 0.4,
	h = 0.2,
	textsize = 0.02,
	color = 1,
	messages = {}
}



function widget:Initialize()
	addmessage (chatTextBox, "HEY!")
	addmessage (chatTextBox, "1")
	addmessage (chatTextBox, "2")
	addmessage (chatTextBox, "3")
	addmessage (chatTextBox, "4A\n4B\r\n4c")
	addmessage (chatTextBox, "5")
	
	
	dumpConfig()
	client=socket.tcp()
	client:settimeout(0)
	--Spring.Echo(socket.dns.toip("localhost"))
	--FIXME dns-request seems to block
	res, err = client:connect(host, port)
	if not res and not res=="timeout" then
		Spring.Echo("Error in connect: "..err)
		return
	end
	set = newset()
	set:insert(client)
end


function newset()
    local reverse = {}
    local set = {}
    return setmetatable(set, {__index = {
        insert = function(set, value)
            if not reverse[value] then
                table.insert(set, value)
                reverse[value] = table.getn(set)
            end
        end,
        remove = function(set, value)
            local index = reverse[value]
            if index then
                reverse[value] = nil
                local top = table.remove(set)
                if top ~= value then
                    reverse[top] = index
                    set[index] = top
                end
            end
        end
    }})
end


local sendLogin = true


local t = 0
function widget:Update(dt)	
	t = t +dt
	if (t>3) then
		sendPing ()
		t = 0
	end
	local readable, writeable, error = socket.select(set, set, 0)

	--receive
	for __, input in ipairs(readable) do
		local s, status, partial = input:receive('*a') --try to read all data
		if status == "timeout" then
			Spring.Echo(s or partial)
			addmessage (chatTextBox, "<" .. (s or partial or "nil"))			
		elseif status == "closed" then
			Spring.Echo("closed connection")
			input:close()
			set:remove(input)
		end
	end	

	--send
	if sendBuffer and #sendBuffer > 1 then		
		if error~=nil then -- some error happened in select			
			if error=="timeout" then return end -- nothing to do, return		
			Spring.Echo("Error in select: " .. error)
		end
		for __, output in ipairs(writeable) do
			for i=1,#sendBuffer, 1 do
				output:send (sendBuffer[i])
				addmessage (chatTextBox,  ">" .. (sendBuffer[i] or "nil"))				
			end
			sendBuffer = {}
		end
	end

end


function sendPing ()
	sendSocketMsg ("PING")
end

---------
sendBuffer = {}

--add a message to sendBuffer that will be send next Update()
function sendSocketMsg (msg)
	sendBuffer[#sendBuffer+1] = msg .. "\r\n"
end

--return table of received messages
msgCounter = 0
function receivedSocketMsg (msg)
	Spring.Echo (msgCounter ..") receivedSocketMsg:".. msg)
	msgCounter=msgCounter+1
end
---------
	
function widget:TextCommand(command)
	if (command=="join") then 		
		sendSocketMsg ("LOGIN knorkebot MD5_PASSWORD_HASH_REMOVED 6666 * knorkeluasocket")
		sendSocketMsg ("JOIN knorkesbot")
	else
		sendSocketMsg ("SAY knorkesbot " ..command)
	end	
end

-------------------------------------------------------
-----------drawing

function widget:DrawScreen()	
	drawmessagebox(chatTextBox, 20)
end