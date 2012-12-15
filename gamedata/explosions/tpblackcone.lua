--black cone shaped explosion

return {
  ["tpblackcone"] = {
    dust = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      count              = 10,
      properties = {
	    pos = [[0, i20, 0]],
        airdrag            = .96,
        colormap           = [[0 0 0 1   0 0 0 0.5    0.1 0.1 0.1 0]],
        directional        = false,
        emitrot            = "i36",
        emitrotspread      = 0,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.07, 0]],
        numparticles       = 3,
        particlelife       = "30",
        particlelifespread = 20,
        particlesize       = "5",
        particlesizespread = 0,--"2i",--5
        particlespeed      = -2,--2
        particlespeedspread = 4,--0
        size               = "i20", --0.2
        sizegrowth         = "i1.5",--10
        sizemod            = 0.5,
        texture            = [[greyblob]],
      },
    },
    drops = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      count              = 4,
      properties = {
        airdrag            = 0.95,
        colormap           = [[0 0 0 1   0 0 0 0.5    0.1 0.1 0.1 0]],
        directional        = true,
        emitrot            = 60,
        emitrotspread      = 45,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.01, 0]],
        numparticles       = 2,
        particlelife       = 25,
        particlelifespread = 6,
        particlesize       = 8,
        particlesizespread = 4,
        particlespeed      = 5,
        particlespeedspread = 1,        
        size               = 0.1,
        sizegrowth         = 0.02,
        sizemod            = 1,
        texture            = [[fuzzyring]],
      },
    },
	 fastdrops = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      count              = 4,
      properties = {
        airdrag            = 0.98,
        colormap           = [[1 0.9 0 0.5   0 0 0 0]],
        directional        = true,
        emitrot            = 20,
        emitrotspread      = 45,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -1, 0]],
        numparticles       = 2,
        particlelife       = 20,
        particlelifespread = 6,
        particlesize       = 5,
        particlesizespread = 4,
        particlespeed      = 10,
        particlespeedspread = 10,
        size               = 0.05,
        sizegrowth         = 0.02,
        sizemod            = 1,
        texture            = [[cartooncloud]],
      },
    },
	
  },

}