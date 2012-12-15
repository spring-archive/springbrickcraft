--einfach ein kleiner brennender flash
return {
  ["tpburnflash"] = {
    usedefaultexplosions = false,  
  	heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      properties = {
        heat               = 5,
        heatfalloff        = .1,
        maxheat            = 20,
        pos                = [[-15 r30, r15, -15 r30]],
        size               = 55,
        speed              = [[0.8 r-0.8, -1 r0.8, 0.4 r-0.8]],
      },
    },
  
  },
}
