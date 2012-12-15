--a simple UI framework with buttons 
--Feb 2011 by knorke
local glPopMatrix      = gl.PopMatrix
local glPushMatrix     = gl.PushMatrix
local glText           = gl.Text
local vsx, vsy = widgetHandler:GetViewSizes()
--UI coordinaten zu scalierten screen koordinaten
function sX (uix)
	return uix*vsx
end
function sY (uiy)
	return uiy*vsy
end
---...und andersrum!
function uiX (sX)
	return sX/vsx
end
function uiY (sY)
	return sY/vsy
end

function widget:ViewResize(viewSizeX, viewSizeY)
	vsx = viewSizeX
	vsy = viewSizeY	
end
----zeichen funktionen---------
function uiRect (x,y,x2,y2)
	gl.Rect (sX(x), sY(y), sX(x2), sY(y2))
end

function uiText (text, x,y,s,options)
	if (text==" " or text=="  ") then return end --archivement: unlock +20 fps
	glText (text, sX(x), sY(y), sX(s), options)
end

function uiTextRect (x,y,x2,y2)
	gl.TexRect (sX(x), sY(y), sX(x2), sY(y2))
end
--------------------------------
-----message boxxy-----
function drawmessagebox (msgbox, msg_n)
	if (msgbox.messages==nil) then return end	
	local yoff = msgbox.textsize
	if (msg_n==nil) then msg_n=100 end --***
	local start = #msgbox.messages-msg_n+1
	if (start < 1) then start = 1 end	
	local fade = 1
	for i =  start, #msgbox.messages , 1 do
		drawmessage (msgbox.messages[i],  msgbox.x,  msgbox.y-yoff, msgbox.textsize)
		yoff=yoff+msgbox.textsize*1.2
	end
end


function drawmessage_simple (message, x, y, s)
	offx=0
	if (message.frame) then		
		glText (frame2time (message.frame), sX(x+offx), sY(y), sX(s/2), 'vo')
		offx=offx+(2*s)
	end	
	glText (message.text, sX(x+offx), sY(y), sX(s), 'vo')	
end

--X, Y and size in UI scale
function drawmessage (message, x, y, s)	
	if (message.bgcolor) then 
		gl.Color (unpack(message.bgcolor))
		uiRect (x,y+s/2, x+1, y-s/2)
	end	
	offx=0
	if (message.frame) then		
		glText (frame2time (message.frame), sX(x+offx), sY(y), sX(s/2), 'vo')
		offx=offx+(2*s)
	end
	if (message.icon) then		
		--****!!! irgendwie malt er danach keine Rechtecke mehr
		--gl.PushMatrix()
		gl.Color (1,1,1,1)
		gl.Texture(message.icon)		
		gl.TexRect(sX(x+s*1.9),sY(y-s*0.8), sX(x+s*2.9),sY(y+s*0.8)  )		
		gl.Texture(false)
		--gl.PopMatrix()
		offx=offx+(s)
	end	
	glText (message.text, sX(x+offx), sY(y), sX(s), 'vo')	
end


function addmessage (msgbox, text, bgcolor)
	local newmessage = {}
	--newmessage.frame = gameframe
	if (bgcolor) then newmessage.bgcolor = bgcolor end---{0,0,0.8,0.5}
	newmessage.text = text
	table.insert (msgbox.messages, newmessage)
end
-------message boxxy end------
------BUTTONS------
function draw_buttons (b)
local mousex, mousey = Spring.GetMouseState()
for i = 1, #b, 1 do	
	if (b[i].color) then gl.Color (unpack(b[i].color)) else gl.Color (1 ,0,0,1) end
	if (point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  uiX(mousex), uiY(mousey)) or i == active_button) then
		gl.Color (1,1,0.5,0.8)
	end
	if (b[i].name == selected_missionid) then gl.Color (0,1,1,0.9) end --highlight selected mission, bit unnice this way w/e
	uiRect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h)
	uiText (b[i].text, b[i].x, b[i].y+b[i].h/2,  0.02, 'vo')
	end
end

function add_button (buttonlist, x,y, w, h, text, name, color)
	local new_button = {}
	new_button.x=x new_button.y=y new_button.w=w new_button.h=h new_button.text=text new_button.name=name
	if(color) then new_button.color=color end
	table.insert (buttonlist, new_button)
end

function previous_button ()
	active_button = active_button -1
	if (active_button < 1) then active_button = #buttons end
end

function next_button ()
	active_button = active_button +1
	if (active_button > #buttons) then active_button = 1 end
end

function point_in_rect (x1, y1, x2, y2, px, py)
	if (px > x1 and px < x2 and py > y1 and py < y2) then return true end
	return false
end

function clicked_button (b)
	local mx, my,click = Spring.GetMouseState()
	local mousex=uiX(mx)
	local mousey=uiY(my)
	for i = 1, #b, 1 do	
		if (click == true and point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  mousex, mousey)) then return b[i].name, i end
		--if (mouse_was_down == false and click == true and point_in_rect (b[i].x, b[i].y, b[i].x+b[i].w, b[i].y+b[i].h,  mousex, mousey)) then mouse_was_down = true end
		end
	--keyboard:
	--if (enter_was_down and active_button > 0 and active_button < #buttons+1) then enter_was_down = false return b[active_button].name, active_button end
	return "NOBUTTONCLICKED"
end