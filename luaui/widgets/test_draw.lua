function widget:GetInfo()
  return {
    name      = "testdraw",
    desc      = "dtest",
    author    = "http://springrts.com/phpbb/viewtopic.php?f=23&p=536669#p536669",
    date      = "Mar 2011, 2011",
    license   = "horses. horses everywhere.",
    layer     = -3,
    enabled   = true
  }
end

local function TestDraw()   
   --for sniper in pairs(sniperList) do
      local x, y, z = 100,100,100 --Spring.GetUnitPosition(sniper)
      gl.Vertex(x,y,z+1000)
      gl.Vertex(x,y,z-1000)
      gl.Vertex(x,y+1000,z)
      gl.Vertex(x,y-1000,z)
      gl.Vertex(x+1000,y,z)
      gl.Vertex(x-1000,y,z)
   --end
end

function widget:DrawWorldPreUnit()   
   		--[[
		gl.PushAttrib(GL_LINE_BITS)	
		--gl.DepthTest(true)
		gl.Color(1,1,1,0.5)
		gl.LineWidth(10)
		gl.BeginEnd(GL.LINES, TestDraw)	
		--gl.DepthTest(false)
		gl.Color(1,1,1,1)	
		gl.PopAttrib()   
		--]]
		
		drawPatches()
		
		
end


mSpots = {}
mSpots[1] = {x=100, z=100}
mSpots[2] = {x=150, z=100}
mSpots[3] = {x=100, z=150}

local metalSpotHeight = 64
local metalSpotWidth = 64

local r = 0
function widget:GameFrame (f)
r = r +1
end


   --gl.Texture("LuaUI\\images\\test64.png" )

function drawPatches()
   
   
 -- Set Matrix
   gl.MatrixMode(GL.TEXTURE )
   --gl.PushMatrix()
   
    gl.PolygonOffset(-25, -2)
    gl.Culling(GL.BACK)
    gl.DepthTest(true)
gl.Texture("LuaUI\\images\\test64.png" )

   gl.Color(1, 1, 1) -- fix color from other widgets
   for i = 1, #mSpots do
	
	--gl.Translate(-100-metalSpotWidth/2, 0,-100-metalSpotHeight/2)
	    --  gl.Translate(metalSpotWidth/2, metalSpotHeight/2, 0)
	gl.PushMatrix()
	gl.Translate(0.5, 0.5, 0)
	gl.Rotate( r*i,0, 1,0)
	
	--gl.Translate(metalSpotWidth/2, 0,metalSpotHeight/2)
	--gl.Translate(100+metalSpotWidth/2, 0,100+metalSpotHeight/2)
	  --gl.Translate(-metalSpotWidth/2, -metalSpotHeight/2, 0)
	--gl.Translate(0, 0, 0)
      gl.DrawGroundQuad( mSpots[i].x - metalSpotWidth/2, mSpots[i].z - metalSpotHeight/2, mSpots[i].x + metalSpotWidth/2, mSpots[i].z + metalSpotHeight/2, false, 
	  -0.5,-0.5, 0.5,0.5)
    --gl.Rotate( -r,0, 0,1)
	--gl.Translate(-0.5, -0.5, 0)  
	gl.PopMatrix()
   end
    gl.Texture(false)
    gl.DepthTest(false)
    gl.Culling(false)
   -- gl.PolygonOffset(false)
   
   -- Restore Matrix
   --gl.PopMatrix()
   
   gl.MatrixMode(GL.MODELVIEW)
end   


function DrawGroundHuggingSquareVertices(x1,z1, x2,z2,   HoverHeight)
  local y=HoverHeight--+Spring.GetGroundHeight(x,z)  
  local s = 2 -- +math.sin (SYNCED.frame/50)/10
  gl.TexCoord(-s,-s)
  gl.Vertex(x1 ,y, z1)
  
  gl.TexCoord(-s,s) 
  gl.Vertex(x1,y,z2)
  
  gl.TexCoord(s,s)
  gl.Vertex(x2,y,z2)
  
  gl.TexCoord(s,-s)
  gl.Vertex(x2,y,z1)
end

function widget:Update(dt)
	local cam = Spring.GetCameraState ()
	--Spring.Echo (ta)
	--Spring.SetCameraState({name=ta,mode=1,px=x+9*v*vx,py=0,pz=z+9*v*vz,flipped=-1,dy=-0.9,zscale=0.5,height=2*r,dx=0,dz=-0.45},1)
	cam.height=1000 
	cam.zscale=0.1 --tilt
	cam.mode=1 --TA mode
	--pro tip: uncomment for hang
	--cam.dx=0
	--cam.dy=0
	--cam.dz=0
	Spring.SetCameraState(cam,0)
end