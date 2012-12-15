function gadget:GetInfo()
  return {
    name      = "lava draw test",
    desc      = "gayly hot",
    author    = "knorke",
    date      = "Feb 2011, 2011",
    license   = "weeeeeee iam on horse",
    layer     = -3,
    enabled   = false
  }
end


if (gadgetHandler:IsSyncedCode()) then
lavalevel = 100
lavalGrow =0.3
_G.Game.mapSizeX = Game.mapSizeX
_G.Game.mapSizeY = Game.mapSizeY

function gadget:GameFrame (f)
	_G.lavalevel = lavalevel+math.sin(f/30)*2
	_G.frame = f
	if (f%10==0) then
		lavaDeathCheck()
	end

	--if (f%2==0) then
		lavalevel = lavalevel+lavalGrow 
		if (lavalevel > 300) then lavalGrow=-0.0005 end
		if (lavalevel == -15) then lavalGrow=0.5 end
	--end
	
	--if (f%10==0) then		
		local x = math.random(1,Game.mapX*512)
		local z = math.random(1,Game.mapY*512)
		local y = Spring.GetGroundHeight(x,z)
		if y  < lavalevel then
			--Spring.SpawnCEG("tpsmokecloud", x, lavalevel, z)
		end
	--end
	
end

function lavaDeathCheck ()
local all_units = Spring.GetAllUnits ()
	for i in pairs(all_units) do
		x,y,z = Spring.GetUnitBasePosition   (all_units[i])
		if (y ~= nil) then
			if (y and y < lavalevel) then 
				Spring.AddUnitDamage (all_units[i], 1000)
				--Spring.SpawnCEG("tpsmokecloud", x, y, z)
			end
		end
	end
end


else --- UNSYCNED:

function gadget:DrawWorld ()  
    if (SYNCED.lavalevel) then
		r = 0.8
		DrawWorldTimer=DrawWorldTimer or Spring.GetTimer()
		local cm1=(math.abs(((Spring.DiffTimers(Spring.GetTimer(),DrawWorldTimer)/0.78)%2)-1)^2)*0.5
		local cm2=(math.abs(((Spring.DiffTimers(Spring.GetTimer(),DrawWorldTimer)/1.13)%2)-1)^2)*0.5
		local cm3=math.abs(((Spring.DiffTimers(Spring.GetTimer(),DrawWorldTimer)/2.87)%2)-1)
		
         --gl.Color(1-cm1,1-cm1-cm2,0.5,1)
		
		--DrawGroundHuggingSquare(1-cm1,1-cm1-cm2,0.5,1,  0, 0, Game.mapX*512, Game.mapY*512 ,SYNCED.lavalevel) --***map.width bla
		DrawGroundHuggingSquare(1,1,1,1,  0, 0, Game.mapX*512, Game.mapY*512 ,SYNCED.lavalevel) --***map.width bla
		--DrawGroundHuggingSquare(0,0.5,0.8,0.8,  0, 0, Game.mapX*512, Game.mapY*512 ,SYNCED.lavalevel) --***map.width bla
	end
end

function DrawGroundHuggingSquare(red,green,blue,alpha,  x1,z1,x2,z2,   HoverHeight)
	gl.PushAttrib(GL.ALL_ATTRIB_BITS)
	gl.DepthTest(true)
	gl.DepthMask(true)
	
	gl.Texture(":a:LuaRules\\Gadgets\\lava2.png")-- Texture file
	--gl.Texture(":a:bitmaps\\default\\ocean.jpg")-- Texture file
	gl.Color(red,green,blue,alpha)
	--gl.Color(0,1,1,0.4)
	gl.BeginEnd(GL.QUADS,DrawGroundHuggingSquareVertices,  x1,z1, x2,z2,  HoverHeight)
	gl.Texture(false)
	gl.DepthMask(false)
	gl.DepthTest(false)
	--gl.Color(1,1,1,1)
	gl.PopAttrib()
end


function DrawGroundHuggingSquareVertices(x1,z1, x2,z2,   HoverHeight)
  local y=HoverHeight--+Spring.GetGroundHeight(x,z)
  
  local s = 2+math.sin (SYNCED.frame/50)/10
  gl.TexCoord(-s,-s)
  gl.Vertex(x1 ,y, z1)
  
  gl.TexCoord(-s,s) 
  gl.Vertex(x1,y,z2)
  
  gl.TexCoord(s,s)
  gl.Vertex(x2,y,z2)
  
  gl.TexCoord(s,-s)
  gl.Vertex(x2,y,z1)
end

end--ende unsync