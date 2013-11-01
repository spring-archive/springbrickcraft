--trail of smoke left by small bullets (gating guns etc)
return {
  ["tpbulletsmoketrail"] = {
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      --useairlos          = true,
      water              = true,
	  alwaysVisible			= true,
      properties = {
        airdrag            = 0.9,
        colormap           = [[1 1 1 1  1 1 1 0.5]],
        directional        = true,
        emitrot            = 90,
        emitrotspread      = 0,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.1, 0]],
        numparticles       = 1,
        particlelife       = 2, 
        particlelifespread = 5,
        particlesize       = 2,
        particlesizespread = 2,
        particlespeed      = 1,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = -0.1,
        sizemod            = 1,
        texture            = [[fuzzyring]],
      },
    },
  },

}