--a mineral shard flies off during miningreturn {["tpflyingmineralshard"] = {	tpflyingmineralshard={      air                = true,      class              = [[CSimpleParticleSystem]],      count              = 1,      ground             = true,      water              = true,	  useairlos          = false,      properties = {        alwaysVisible = 0,		useairlos          = true,		airdrag            = 0.95,        --color              = [[.4, .4, .4]],		colormap           = [[1 1 1 1  1 1 1 1  1 1 1 0]],        directional        = true,        emitrot            = 45,        emitrotspread      = 2,        emitvector         = [[dir]],        gravity            = [[0, -0.5, 0]],        numparticles       = 1,        particlelife       = 30,        particlelifespread = 0,        particlesize       = 5,--3        particlesizespread = 3,        particlespeed      = -15,        particlespeedspread = 5,        pos                = [[0, 0, 0]],        sizegrowth         = 0,        sizemod            = 1.0,        texture            = [[mineralshard]],      },    },},}