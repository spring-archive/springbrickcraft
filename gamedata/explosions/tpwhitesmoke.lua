--a smaller smoke cloud by knorke
return {
  ["whitesmoke"] = {
    tpsmallsmoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 3,
      ground             = true,
      underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
        alwaysVisible = 0,
        explosiongenerator = [[custom:whitesmoke]],
		airdrag            = 0.95,--0.9
        colormap           = [[1 1 1 0.75   1 1 1 0]], --fade out
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.15 , 0]],
        numparticles       = 1,
        particlelife       = 60,
        particlelifespread = 30,
        particlesize       = 8,
        particlesizespread = 10,
        particlespeed      =  1.5,
        particlespeedspread = 3.5,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[cartooncloud]],
      },
    },
  },
}