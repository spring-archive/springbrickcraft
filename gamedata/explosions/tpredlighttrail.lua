
--trail of red light behind projectile
return {
  ["tpredlighttrail"] = {
    air                = true,
    count              = 1,
    ground             = true,
    water              = true,
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = false,
      water              = false,
      properties = {
        airdrag            = 0.3,
        colormap           = [[1 1 1 1	 0 0 0 0.01]],
        directional        = true,
        emitrot            = 90,
        emitrotspread      = 20,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 3,
        particlelifespread = 20,
        particlesize       = 6,
        particlesizespread = 1,
        particlespeed      = 0,
        particlespeedspread = 10,
        pos                = [[0, -2, 0]],
        sizegrowth         = -0.5,
        sizemod            = 1.0,
        texture            = [[blurring]],
      },
    },
	
	flamespikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.1,
        color              = [[1 ,0.2 ,0.2]],
        --dir                = [[-15 r50,-15 r50,-15 r50]],
		dir                = [[-1 r1,-1 r1,-1 r1]],
        length             = 2,
        width              = 20,
      },
    },
	

  },

}



