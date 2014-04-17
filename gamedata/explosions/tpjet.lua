--jet engine exhaust
return {
  ["tpjet"] = {
    tpjet = {
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
        --explosiongenerator = [[custom:tpjet]],
	  airdrag            = 0.95,
        colormap           = [[1 0 0 0.5  1 0 0 1  1 1 1 1  1 1 1 0.5]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 5,
        emitvector         = [[0, -1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 2,--1
        particlelife       = 16,--8
        particlelifespread = 5,
        particlesize       = 10,
        particlesizespread = 1,
        particlespeed      = 4,--2--4
        particlespeedspread = 4,--2.5
        pos                = [[0, 0, 0]],
        sizegrowth         = -0.25, --0.5
        sizemod            = 1.0,
        texture            = [[cartooncloud]],
      },
    },
  },
}