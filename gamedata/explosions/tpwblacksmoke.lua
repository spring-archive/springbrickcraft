--black smoke
return {
  ["blacksmoke"] = {
    tpsmallsmoke = {
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
        --explosiongenerator = [[custom:blacksmoke]],
		airdrag            = 0.95,--0.9
        colormap           = [[0.2 0.2 0.2 1   0 0 0 0.9  0 0 0 0.2]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.15 , 0]],
        numparticles       = 1,
        particlelife       = 60,
        particlelifespread = 30,
        particlesize       = 3,
        particlesizespread = 7,
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