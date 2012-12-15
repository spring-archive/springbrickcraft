--trail of WHATEVER behind a cannon
return {
  ["tpcannon_trail"] = {
    cstrail = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
        alwaysVisible = 0,
        explosiongenerator = [[custom:cstrail]],
	  airdrag            = 0.85,
        colormap           = [[0.3 0.3 0.3 0.7  0.5 0.5 0.5 0]],
        directional        = true,
        emitrot            = 0,--90
        emitrotspread      = 90,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 10,--5
        particlelifespread = 5,--1
        particlesize       = -10,
        particlesizespread = 1,
        particlespeed      =  5,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.5,--1
        sizemod            = 1.0,
        texture            = [[cartooncloud3]],
      },
    },
  },

}
