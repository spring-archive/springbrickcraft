--dust and debris when a buildings is destroyed and sinks into the ground
return {
  ["tpbuildingdeath"] = {
    dust = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      count              = 5,
      properties = {
        airdrag            = .95,
        colormap           = [[0.5 0.25 0 0.8   0.8 0.6 0 0.5  0.2 0.2 0 0.3  0 0 0 0.3]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 80,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.07, 0]],
        numparticles       = 1,
        particlelife       = 40,
        particlelifespread = 10,
        particlesize       = 14,
        particlesizespread = 5,
        particlespeed      = 2,
        particlespeedspread = 1,
        --size               = 0.2,
        sizegrowth         = 0.4,
        sizemod            = 1,
        texture            = [[cartooncloud3]],
      },
    },
    drops = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      count              = 4,
      properties = {
        airdrag            = 0.95,
        colormap           = [[1 0.9 0.9 0.8   0 0 0 0]],
        directional        = true,
        emitrot            = 60,
        emitrotspread      = 45,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.01, 0]],
        numparticles       = 2,
        particlelife       = 40,
        particlelifespread = 6,
        particlesize       = 8,
        particlesizespread = 4,
        particlespeed      = 5,
        particlespeedspread = 1,        
        --size               = 0.1,
        sizegrowth         = 0.02,
        sizemod            = 1,
        texture            = [[splatter]],
      },
    },
	 fastdrops = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      count              = 4,
      properties = {
        airdrag            = 0.98,
        colormap           = [[0.1 0.1 0.1 0.9   0 0 0 0.5]],
        directional        = true,
        emitrot            = 20,
        emitrotspread      = 45,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.01, 0]],
        numparticles       = 2,
        particlelife       = 10,
        particlelifespread = 6,
        particlesize       = 2,
        particlesizespread = 4,
        particlespeed      = 2,
        particlespeedspread = 10,
        --size               = 0.05,
        sizegrowth         = 0.02,
        sizemod            = 1,
        texture            = [[splatter]],
      },
    },
	
  },

}