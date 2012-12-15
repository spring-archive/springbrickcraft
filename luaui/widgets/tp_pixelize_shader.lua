function widget:GetInfo()
  return {
    name      = "Brickcraft | Pixelize Shader",
    desc      = "bigger pixels = better!",
    author    = "knorke playing around with Evil4Zerggin's shader blub",
    date      = "3 November 2009",
    license   = "MIT",
    layer     = 1,
    enabled   = false  --  loaded by default?
  }
end

local vsx, vsy
local screencopy
local shaderProgram

local glUseShader = gl.UseShader
local glCopyToTexture = gl.CopyToTexture
local glTexture = gl.Texture
local glTexRect = gl.TexRect

--intensity formula based on http://alienryderflex.com/hsp.html
local fragmentShaderSource = [[
uniform sampler2D screencopy;
void main() {
	int pixzelSize = 10; //why cant this be rand() % 10
	float pixelx = pixzelSize/1600.0f;	// ***get real screensize up in this bitch
	float pixely = pixzelSize/1200.0f;
	//vec2 texCoord = vec2(gl_TexCoord[0].x, gl_TexCoord[0].y);
	//if (gl_TexCoord[0].x > 0.5) 
	vec2 texCoord = vec2(pixelx*int(gl_TexCoord[0].x/pixelx), pixely*int(gl_TexCoord[0].y/pixely));
		
	gl_FragColor = texture2D(screencopy, texCoord);
}
]]

local uniformInt = {
  screencopy = 0,
}

local shaderTable = {
  fragment = fragmentShaderSource,
  uniformInt = uniformInt,
}

function widget:Initialize()
  vsx, vsy = widgetHandler:GetViewSizes()
  widget:ViewResize(vsx, vsy)
  
  if gl.CreateShader then
    shaderProgram = gl.CreateShader(shaderTable)
  else
    Spring.Echo("<Obama Shader>: GLSL not supported.")
  end
  
  if not shaderProgram then
    Spring.Echo(gl.GetShaderLog())
    widgetHandler:RemoveWidget()
  end
end

function widget:Shutdown()
  if shaderProgram then
    gl.DeleteShader(shaderProgram)
  end
end

function widget:ViewResize(viewSizeX, viewSizeY)
  vsx, vsy = viewSizeX, viewSizeY
  screencopy = gl.CreateTexture(vsx, vsy, {
    border = false,
    min_filter = GL.NEAREST,
    mag_filter = GL.NEAREST,
  })
end


local pos =
{
x1=0.5,
x2=0.6,
}




function widget:DrawScreenEffects()--DrawScreen()--DrawWorldPreUnit()--DrawScreenEffects()
  glCopyToTexture(screencopy, 0, 0, 0, 0, vsx, vsy)
  --glCopyToTexture(screencopy, pos.x1*vsx, 0, pos.x1*vsx, 0, vsx*pos.x2, vsy)
  
  glTexture(0, screencopy)
  glUseShader(shaderProgram)
  --gl.Color (0,1,1, 0.1)
   --gl.Blending(GL.ONE_MINUS_SRC_COLOR,GL.ONE)
   
      --gl.Blending(GL.SRC_ALPHA,GL.ONE_MINUS_SRC_ALPHA)
	  --gl.Blending(GL.SRC_ALPHA, GL.ZERO)
  glTexRect(0,vsy,vsx,0)
  
  glTexture(0, false)
  glUseShader(0)
end
