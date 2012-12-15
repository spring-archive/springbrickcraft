function gadget:GetInfo()
  return {
    name      = "glass draw test",
    desc      = "transparent underwear",
    author    = "knorke",
    date      = "Feb 2011, 2011",
    license   = "weeeeeee iam on horse",
    layer     = -3,
    enabled   = false
  }
end

local duID = nil

if (gadgetHandler:IsSyncedCode()) then

function gadget:GameFrame (f)
	_G.frame = f
	if (duID) then getCoords (duID) end
	--if f%30 then Spring.Echo ("running") end
end

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)	
	duID = unitID
end

function getCoords (unitID)
	env = Spring.UnitScript.GetScriptEnv(unitID)
	coords = {}	
	coords[1] = {}
	--coords[1].x,coords[1].y,coords[1].z = Spring.UnitScript.CallAsUnit(unitID, Spring.UnitScript.GetPieceTranslation, 1)
	coords[1].x,coords[1].y,coords[1].z = Spring.GetUnitPiecePosDir  (unitID,1)
	coords[2] = {}
	--coords[2].x,coords[2].y,coords[2].z = Spring.UnitScript.CallAsUnit(unitID, Spring.UnitScript.GetPieceTranslation, 5)
	coords[2].x,coords[2].y,coords[2].z = Spring.GetUnitPiecePosDir  (unitID,5)
	coords[3] = {}
	coords[3].x,coords[3].y,coords[3].z = Spring.GetUnitPiecePosDir  (unitID,15)
	--coords[3].x,coords[3].y,coords[3].z = Spring.UnitScript.CallAsUnit(unitID, Spring.UnitScript.GetPieceTranslation, 15)
	_G.coords = coords
end


else --- UNSYCNED:

function gadget:DrawWorld ()
	x1=100 y1=100 z1=100
	x2=400 y2=200 z2=100
	x3=100 y3=300 z3=400
	x4=400 y4=100 z4=200
	
	--DrawGroundHuggingSquare(1,1,1,1,  0, 0, Game.mapX*512, Game.mapY*512 ,SYNCED.lavalevel) --***map.width bla	
	gl.PushAttrib(GL.ALL_ATTRIB_BITS)
	gl.DepthTest(true)
	gl.DepthMask(true)	
	gl.Texture(":a:LuaRules\\Gadgets\\lava2.png")-- Texture file	
	gl.Color(1,0,1,0.5)	
	gl.LineWidth (10)
	gl.BeginEnd(GL.LINE_STRIP,Draw3DSHAPE, x1,y1,z1, x2,y2,z2,  x3,y3,z3,  x4,y4,z4) --GL.QUADS
	gl.Color(1,1,0,0.5)
	x1=500 y1=100 z1=100
	x2=600 y2=200 z2=100
	x3=700 y3=300 z3=400
	x4=800 y4=100 z4=200
	gl.BeginEnd(GL.TRIANGLES,Draw3DSHAPE, x1,y1,z1, x2,y2,z2,  x3,y3,z3,  x4,y4,z4) 
	--DrawGroundHuggingSquare(1,1,1,1,  0, 0, 200, 200 ,200) --
	gl.Color(1,0,0,0.5)
	local coords = SYNCED.coords
	if (coords) then gl.BeginEnd(GL.TRIANGLES,Draw3DTriangle, coords[1],coords[2],coords[3]) end	
	gl.Texture(false)
	gl.DepthMask(false)
	gl.DepthTest(false)	
	gl.PopAttrib()	
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
  local s = 2--2+math.sin (SYNCED.frame/50)/10
  gl.TexCoord(-s,-s)
  gl.Vertex(x1 ,y, z1)  
	gl.TexCoord(-s,s) 
	gl.Vertex(x1,y,z2)  
  gl.TexCoord(s,s)
  gl.Vertex(x2,y,z2)  
	gl.TexCoord(s,-s)
	gl.Vertex(x2,y,z1)
end

function Draw3DSHAPE (x1,y1,z1, x2,y2,z2,  x3,y3,z3,  x4,y4,z4)
  local s = 2--+math.sin (SYNCED.frame/50)/10
  gl.TexCoord(-s,-s)
  gl.Vertex(x1 ,y1, z1)
  
  gl.TexCoord(-s,s) 
  gl.Vertex(x2,y2,z2)
  
  gl.TexCoord(s,s)
  gl.Vertex(x3,y3,z3)
  
  gl.TexCoord(s,-s)
  gl.Vertex(x4,y4,z4)
end

function Draw3DTriangle (point1, point2, point3)
  local s = 2--+math.sin (SYNCED.frame/50)/10
  gl.TexCoord(-s,-s)
  gl.Vertex(point1.x ,point1.y, point1.z)
  
  gl.TexCoord(-s,s) 
  gl.Vertex(point2.x ,point2.y, point2.z)
  
  gl.TexCoord(s,s)
  gl.Vertex(point3.x ,point3.y, point3.z)
end

end--ende unsync