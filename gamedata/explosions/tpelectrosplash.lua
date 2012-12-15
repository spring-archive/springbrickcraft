return {
["tpelectrosplash"] = {
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
	electroplasma = {
      air                = true,
      class              = [[explspike]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.1,
        color              = [[0.5,0.2,1]],
        dir                = [[-15 r30,-15 r30,-15 r30]],
        length             = 5,
        width              = 20,
      },
    },	
	
		----	
    cartoon_zap_cloud = {
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
        --explosiongenerator = [[custom:tpflagreturn]],
		airdrag            = 0.7,
        colormap           = [[1 1 1 1  1 1 1 1  1 1 1 0]],
        directional        = false,
        --emitrot            = 90,
        emitrotspread      = 20,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1, 0]],
        numparticles       = 1,
        particlelife       = 20,
        particlelifespread = 20,
        particlesize       = 5,	--negative side: turn the texture upside down
        particlesizespread = 2,
        particlespeed      =  20,
        particlespeedspread = 0,
        pos                = [[0, 20, 0]],
        sizegrowth         = 0,--0
        sizemod            = 1.0,
        texture            = [[cartoonexplo_zap]],
      },
    },  
	----	
  }
}