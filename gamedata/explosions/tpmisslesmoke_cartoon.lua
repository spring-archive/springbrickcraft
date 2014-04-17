--smoke puff trail for small missiles
return {
  ["tpmisslesmoke_cartoon"] = {
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
        --explosiongenerator = [[custom:cstrail]],
	  airdrag            = 0.9,
        colormap           = [[1 1 1 1  0.5 0.5 0.5 0]],
        directional        = false,
        emitrot            = 0,--90
        emitrotspread      = 5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 1,
        particlelife       = 8,--5
        particlelifespread = 5,--1
        particlesize       = 2,
        particlesizespread = 1,
        particlespeed      =  1.5,
        particlespeedspread = 2.5,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.5,--1
        sizemod            = 1.0,
        texture            = [[cartooncloud]],
      },
    },
  },

}
