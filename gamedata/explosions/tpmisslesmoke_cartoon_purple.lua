--purple rocket trail by knorke
return {
  ["tpmisslesmoke_cartoon_purple"] = {
    tpmisslesmoke_cartoon_purple = {
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
        explosiongenerator = [[custom:tpmisslesmoke_cartoon_purple]],
	  airdrag            = 0.9,
        colormap           = [[0.2 0.2 0.95 0.9    0.6 0.5 0.9 0.6    0.5 0.4 0.7 0.5     0.3 0.3 0.3 0.2]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 1,
        particlelife       = 5,
        particlelifespread = 10,
        particlesize       = 2,
        particlesizespread = 1,
        particlespeed      =  1.5,
        particlespeedspread = 2.5,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.5,
        sizemod            = 1.0,
        texture            = [[cartooncloud]],
      },
    },
  },

}
