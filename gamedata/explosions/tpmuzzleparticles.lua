--spraying fire and smoke from a tanks gun barrel
return {
  ["tpmuzzleparticles"] = {
    smoke = {
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
        --explosiongenerator = [[custom:tpmuzzleparticles]],
	  airdrag            = 0.9,--0.95
        colormap           = [[1 0 0 0.5  1 0 0 1  0.5 0.5 0.5 1  0 0 0 0.5]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 5,
        emitvector         = "dir",
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 10,--3
        particlelife       = 5,--8--16
        particlelifespread = 16,--5
        particlesize       = 10,
        particlesizespread = 1,
        particlespeed      = 8,--2--4--10
        particlespeedspread = 5,--2.5--4
        pos                = [[0, 0, 0]],
        sizegrowth         = -0.25, --0.5
        sizemod            = 1.0,
        texture            = [[cartooncloud]],
      },
    },
  },
}