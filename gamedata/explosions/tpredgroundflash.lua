--red light on ground, like from led mouse
return {
  ["tpredgroundflash"] = {
    air                = true,
    count              = 1,
    ground             = true,
    water              = true,
    water = {
      air                = false,
      class              = [[CSimpleParticleSystem]],
      count              = 5,
      ground             = false,
      water              = true,
      properties = {
        airdrag            = 0.98,
        colormap           = [[0.7 0.7 0.9 0.8   0 0.2 0.9 0.7   0.2 0.2 1 0.5]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 90,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.2, 0]],
        numparticles       = 2,
        particlelife       = [[30 i-0.5]],
        particlelifespread = 0,
        particlesize       = [[30 r10]],
        particlesizespread = 0,
        particlespeed      = 4,
        particlespeedspread = 1,
        pos                = [[0, -2, 0]],
        sizegrowth         = [[-0.1 i0.015]],
        sizemod            = 1.0,
        texture            = [[splatter]],
      },
    },

    dirt2 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = false,
      water              = false,
      properties = {
        airdrag            = 0.8,
        colormap           = [[1 0.5 0.2 0.8	 0 0 0 0.01]],
        directional        = true,
        emitrot            = 90,
        emitrotspread      = 20,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 20,
        particlelifespread = 3,
        particlesize       = 1,
        particlesizespread = 1,
        particlespeed      = 0,
        particlespeedspread = 19,
        pos                = [[0, -2, 0]],
        sizegrowth         = 0.5,
        sizemod            = 1.0,
        texture            = [[greyblob]],
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
		dir                = [[-10 r10,-10 r5,-10 r10]],
        length             = 5,
        width              = 10,
      },
    },
	
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 0.99,
      flashsize          = 75,
      ttl                = 10,
      color = {
        [1]  = 1,
        [2]  = 0.2,
        [3]  = 0.2,
      },
    },
  },

}



