--eine raketenspur die dicker und d�nner wird ooOoOooOooOoo =>
--naja
return {
  ["tpshocktrail"] = {
    fireball1 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      --useairlos          = true,
      water              = true,
	  alwaysVisible			= true,
      properties = {
        airdrag            = 0.98,
        colormap           = [[0.8 0.8 1 0.8  0.8 0.8 0.8 0.4  0.5 0.5 0.5 0]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 20, 
        particlelifespread = 5,
        particlesize       = 6,
        particlesizespread = 0,
        particlespeed      = 0.1,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = -0.1,
        sizemod            = 1,
        texture            = [[shocktrail]],
      },
    },
  },

}