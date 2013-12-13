function widget:GetInfo()
  return {
    name      = "Brickcraft | FOG Shader",
    desc      = "fog it up",
    author    = "knorke playing around with things from interweb",
    date      = "2013",
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


varying float atten; 
varying float fogFactor; 
varying vec3 lightVec, viewVec; 
uniform sampler2D normalMap;
uniform sampler2D colorMap;
uniform sampler2D colorMap2;

void main (void)
{


const float LOG2 = 1.442695;
float z = gl_FragCoord.z / gl_FragCoord.w;
float fogFactor = exp2( -gl_Fog.density * 
				   gl_Fog.density * 
				   z * 
				   z * 
				   LOG2 );
//fogFactor = clamp(fogFactor, 0.0, 1.0);

//gl_FragColor = mix(gl_Fog.color, finalColor, fogFactor );

gl_FragColor = vec4(z/fogFactor, z, z, 1.0);

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
