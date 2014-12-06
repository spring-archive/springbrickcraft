function widget:GetInfo()
  return {
    name      = "zzz test raycast",
    desc      = "3d lol",
    author    = "knorke, based on http://www.blitzforum.de/forum/viewtopic.php?p=166370&sid=e9317fc48e5658be0ce61dc29b174e2a",
    date      = "dec 1010",
    license   = "push button magic",
    layer     = 0,
    enabled   = true,
  }
end

include("keysym.h.lua")

KP0 = 256
KP1 = 257
KP2 = 258
KP3 = 259
KP4 = 260
KP5 = 261
KP6 = 262
KP7 = 263
KP8 = 264
KP9 = 265
W = 119
S = 115
A = 97
D = 100
E = 101
Q = 113

local function glColor (a,b,c,d)
	gl.Color (math.min (a,1),math.min (b,1),math.min (c,1),math.min (d or 1,1))
end

map = {}
map = {
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,2,2,2,2,0,2,2,2,2,0,2,2,2,2,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,0,0,0,0,3,3,0,0,0,3,3,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0},
{0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,2,2,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,2,2,0},
{0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,2,2,0,0,0,3,3,0,0,0,0,0,0,0,0,1,1,1,0,0,0,2,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,2,2,0,0,0,2,2,0,0,0,0,0,0,0,0,0,1,1,0,0,0,2,0},
{0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,2,2,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,1,0,0,0,0,2,2,0,0,0,0,2,3,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,2,2,0,0,0,2,3,0,0,0,1,1,0,0,0,2,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,3,2,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,3,2,0,0,0,2,0,0,0,0,3,2,0,0,0,2,2,0,0,0,2,0,0,0,0,0,1,1,0,0,1,2,0,0,0,2,2,0,0,0,0,0,0},
{0,0,0,0,0,0,3,2,0,0,0,2,2,0,0,0,3,3,0,0,0,2,2,0,0,0,0,0,0,0,0,0,0,1,0,0,1,2,0,0,0,2,2,0,0,0,0,0,0},
{0,0,0,0,0,0,3,2,0,0,0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,2,3,0,0,0,0,2,0,0,1,2,0,0,0,0,1,2,0,0,0,1,2,0,0,0,1,2,0,0,0,1,2,0,0,0,3,2,0,0,0,1,1,0},
{0,0,0,0,0,0,2,3,0,0,0,2,2,0,0,2,1,0,0,0,0,1,3,0,0,0,1,2,0,0,0,2,2,0,0,0,1,2,0,0,0,3,2,0,0,0,1,1,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
}
  
  local offX = 0
local offY = 0

  mapWidth = 32
  mapHeight = 25

sW = 1280
sH = 1024
  
  
  xp = 5
  yp = 5
  w = 20
  wi = 0
  hi = 0 -- -100

stepRes = 15
  
color = {}
  
color[1] = {[1]=200,[2]=200, [3] = 200}
color[2] = {[1]=255,[2]=200, [3] = 0}
color[3] = {[1]=200,[2]=255, [3] = 0}
color[4] = {[1]=0,[2]=255, [3] = 125}
color[5] = {[1]=200,[2]=255, [3] = 200}
color[6] = {[1]=0,[2]=200, [3] = 255}
 
local horinzont = sH/2 + hi

local vsx, vsy = widgetHandler:GetViewSizes()
function widget:ViewResize(viewSizeX, viewSizeY)
	vsx = viewSizeX
	vsy = viewSizeY
end
function widget:DrawScreen()

glColor (50/255,50/255,50/255,1)	
gl.Rect(offX, 0, offX +sW, horinzont)
glColor (50/255,50/255,100/255)	
gl.Rect (offX, horinzont, offX +sW, sH)
	--for y=1,25 do
		--for x=1,2 do
--love.graphics.setColor (255,255,255,255)	
--	love.graphics.print(math.floor(xp+0.5)..":"..math.floor(yp+0.5), 400, 300)
		--end
	--end

	
for x=-sW/2, sW/2, stepRes do
  local f=0
    local WTX = math.cos(math.rad(wi+(x/w)))
  local WTY = math.sin(math.rad(wi+(x/w)))
  for e=0, 30, 0.1 do --0.05  
   if f==0 then --fertig?    
    local c = xy(xp+WTX*e, yp+WTY*e)
	if c~=0 then     
     --Color 512/(e+2),1024/(e+4),512/(e+2);255-e*9
	 ea= math.abs (e)/2
	 local wc = color[c]
	 
	 --love.graphics.setColor (wc[1]/(ea),wc[2]/(ea),wc[3]/(ea))
     glColor (wc[1]/(ea)/255,wc[2]/(ea)/255,wc[3]/(ea)/255,1)
	 
	 --love.graphics.rectangle("fill", x+(sW/2), (sH/2)+(hi-(sH/2)/e),  4,sH/e*2) --*2 weg	 
	 gl.Rect (offX + x+(sW/2), (sH/2)+(hi-(sH/2)/e), offX + x+(sW/2)+stepRes,  (sH/2)+(hi-(sH/2)/e)  +sH/e*2)	 
     f=1 --fertig!
    end 
   end 
  end	
	
end

drawMiniMap (300,400,2)

--crosshair
--local s = 5
--gl.Color (1,1,1,0.5)
--gl.Rect (offX+sW/2-s, sH/2, offX+sW/2+s, sH/2+s)

gl.Color (1,1,1,1)
gl.Text("loading..." , vsx/2, vsy/2, vsy/20, "oc")
end

function xy (x,y)
x= math.floor (x+0.5)
y= math.floor (y+0.5)
	if not (x > 0 and x < mapWidth+1) then return 0 end 
	if not (y > 0 and y < mapHeight+1) then return 0 end
	return map[y][x]
end


local keys = {}


local targetXP = 6
local targetYP = yp
local spin = 90
--[[
function widget:Update(dt)
wi=wi+spin*dt
xp, hasReachedX = approach (xp, targetXP, dt*5)
yp, hasReachedY = approach (yp, targetYP, dt*5)
if hasReachedX and hasReachedY then 
if math.random (1,10) > 5 then
	targetXP = math.random (1,5)*5
	else
	targetYP = math.random (1,5)*5
	end
	spin = math.random(-40,40)
end

--Spring.Echo ("update")
	if keys[KP8] then 
		xp=xp+ math.cos(math.rad(wi))*5*dt
		yp=yp+ math.sin(math.rad(wi))*5*dt 
	end
	if keys[KP2] then 
		xp=xp- math.cos(math.rad(wi))*5*dt 
		yp=yp- math.sin(math.rad(wi))*5*dt 
	end	
	

	if keys[KP6] then 
		xp=xp+ math.cos(math.rad(wi+90))*5*dt 
		yp=yp+ math.sin(math.rad(wi+90))*5*dt 
	end
	if keys[KP4] then 
		xp=xp- math.cos(math.rad(wi+90))*5*dt 
		yp=yp- math.sin(math.rad(wi+90))*5*dt 
	end	
	
	--if keys["a"] then yp=yp+10*dt end
	--if keys["d"] then yp=yp-10*dt end
	if keys[KP9] then wi=wi+100*dt end
	if keys[KP7] then wi=wi-100*dt end
	--keys = {}
	--keys = {}
	
	--if keys["t"] then w=w+4 keys["t"]=nil end
	--if keys["g"] then w=w-4 keys["g"]=nil end
	
end
--]]
function drawMiniMap (miniMapOffsetX, miniMapOffsetY, miniMapScale)
	for y=1,mapHeight do
		for x=1,mapWidth do			
			if map[y][x] ~= 0 then
			local c =color[map[y][x]]				
				glColor(c[1]/255,c[2]/255,c[3]/255, 1)
				gl.Rect((x * miniMapScale) + miniMapOffsetX, (y * miniMapScale) + miniMapOffsetY, (x * miniMapScale) + miniMapOffsetX+miniMapScale, (y * miniMapScale) + miniMapOffsetY+miniMapScale)
			end
			if (x==math.floor(xp) and y == math.floor (yp)) then
				glColor(math.random(100,255)/255,math.random(100,255)/255,1,1)
				--gl.Rect(x * miniMapScale + miniMapOffsetX, y * miniMapScale + miniMapOffsetY, miniMapScale, miniMapScale)
				gl.Rect((x * miniMapScale) + miniMapOffsetX, (y * miniMapScale) + miniMapOffsetY, (x * miniMapScale) + miniMapOffsetX+miniMapScale, (y * miniMapScale) + miniMapOffsetY+miniMapScale)
			end
		end
	end
end


function widget:KeyPress(key,mods,isRepeat,label,unicode)	
	keys[key] = true
end

function widget:KeyRelease(key)	
	keys[key] = false
end

function approach (currentX, targetX, speed)
	local newX = currentX
	local diff = currentX - targetX
	local hasReached = false
	if (math.abs (diff) < speed) then
		currentX = targetX
		hasReached = true
	else
		if diff < 0 then 
			newX = newX + speed
		else 
			newX = newX - speed
		end
	end
	return newX, hasReached, newX-currentX
end