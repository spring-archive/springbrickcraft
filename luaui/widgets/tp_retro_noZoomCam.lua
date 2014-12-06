function widget:GetInfo()
  return {
    name      = "retro unzoomable camera",
    desc      = "doesnt zoom, is retro. http://springrts.com/phpbb/viewtopic.php?f=14&p=549306#p549049",
    author    = "knorke",
    date      = "Mar 2011, 2011",
    license   = "horses. horses everywhere.",
    layer     = -3,
    enabled   = true
  }
end

function widget:Update(dt)
	local cam = Spring.GetCameraState ()
	cam.height=1000 
	cam.zscale=0.1 --tilt
	cam.mode=1 --TA mode
	Spring.SetCameraState(cam,0)
end