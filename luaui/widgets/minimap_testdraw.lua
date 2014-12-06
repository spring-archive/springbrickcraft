function widget:GetInfo()
  return {
    name      = "special texture draw test",
    desc      = "http://springrts.com/wiki/Lua_OpenGL_Api#Textures",
    author    = "knorke",
    date      = "2013",
    license   = "horses. horses everywhere.",
    layer     = -3,
    enabled   = true
  }
end


local wat =
{"$shadow",
"$specular",
"$reflection",
"$shadow",
"$shading",
"$grass",
"$heightmap",
"$minimap",
"#20",
"%20:0",
"$info",
"$info_losmap",
}

function widget:DrawScreen()
	local i = 1	
		for y = 700, 0, -250 do
		for x=100, 1024, 250 do		
			drawThing (x,y, wat[i], i)			
			i = i +1
			if i > #wat then return end
		end
	end
end

function drawThing (x,y,s, i)
	gl.Texture(s)
	gl.TexRect (x, y, x+200, y+200)
	gl.Text (i..")" .. s, x,y-20, 20)
	gl.Texture (false)
end