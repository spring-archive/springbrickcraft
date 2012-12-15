--the effect spawned between exploding linked units (turretcenter <-> turret)
return {
["tpchainexplofailure"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.3,
      flashsize          = 50,
      ttl                = 10,
      color = {
        [1]  = 0.5,
        [2]  = 0.3,
        [3]  = 1,
      },
    },    
	burn = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.05,
        color              = [[1,0.2,1]],
        dir                = [[-15 r30,-15 r30,-15 r30]],
        length             = 5,
        width              = 20,
      },
    },	
	
		----	
    sparks = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 5,
      ground             = true,
      underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
        alwaysVisible = 0,
        --explosiongenerator = [[custom:tpflagreturn]],
		airdrag            = 1,
        colormap           = [[1 1 1 1  1 1 1 1  1 1 1 0]],
        directional        = true,
        --emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.1, 0]],
        numparticles       = 1,
        particlelife       = 10,
        particlelifespread = 20,
        particlesize       = 10,	--negative side: turn the texture upside down
        particlesizespread = 10,
        particlespeed      =  5,
        particlespeedspread = 25,
        pos                = [[0, 20, 0]],
        sizegrowth         = 0,--0
        sizemod            = 1.0,
        texture            = [[spark]],
      },
    },  
	----	
  }
}