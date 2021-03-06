--blue explosion, used by bigwheel death
--variante 2
return {
  ["tpeletricblueexplosion2"] = {
    goo = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      count              = 5,
      properties = {
        airdrag            = .5,
        colormap           = [[0 0 1 0.9  0.8 0.8 1 0.9  0.3 0.3 0.5 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 80,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.07, 0]],
        numparticles       = 5,
        particlelife       = 5,
        particlelifespread = 20,
        particlesize       = 5,
        particlesizespread = 20,
        particlespeed      = 10,
        particlespeedspread = 3,
        --size               = 0.2,
        sizegrowth         = 0.4,
        sizemod            = 1,
        texture            = [[blurring]],
      },
    },
    drops = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      count              = 4,
      properties = {
        airdrag            = 0.95,
        colormap           = [[0 0 0.2 0.8   0 0 0.8 0]],
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
        size               = 0.1,
        sizegrowth         = 0.02,
        sizemod            = 1,
        texture            = [[cartooncloud2]],
      },
    },
	 fastdrops = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      count              = 4,
      properties = {
        airdrag            = 0.98,
        colormap           = [[1 1 1 0.9   0 0 0.8 0.5]],
        directional        = true,
        emitrot            = 20,
        emitrotspread      = 45,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.01, 0]],
        numparticles       = 2,
        particlelife       = 10,
        particlelifespread = 6,
        particlesize       = 4,
        particlesizespread = 4,
        particlespeed      = 20,
        particlespeedspread = 10,
        size               = 0.05,
        sizegrowth         = 0.02,
        sizemod            = 1,
        texture            = [[trailball]],
      },
    },

	groundflash = {
      circlealpha        = 1,
      circlegrowth       = 20,
      flashalpha         = 1,
      flashsize          = 50,
      ttl                = 10,
	  texture            = [[ground_fuzzysquare]],
      color = {
        [1]  = 0,
        [2]  = 0,
        [3]  = 1,
      },
    },
	
  },

}