--used by subterrain units when they dig up/down
return {
  ["tpdirtdigging"] = {
     usedefaultexplosions = false,
    debris2 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.98,
        alwaysvisible      = true,
        colormap           = [[0.6 0.4 0 1  0.6 0.4 0 0.5]],  -- [[0.8 0.8 0.2 1   1 0 0 1        0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 45,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.4, 0]],
        numparticles       = 3,
        particlelife       = 25,
        particlelifespread = 35,
        particlesize       = 1,
        particlesizespread = 5,
        particlespeed      = 4,
        particlespeedspread = 5,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[greyblob]],
      },
    },
},
}