return {
  ["tpexplosive"] = {
    usedefaultexplosions = false,
    bang = {
      air                = true,
      class              = [[heatcloud]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 12,
        heatfalloff        = 1,
        maxheat            = 12,
        pos                = [[0, 5, 0]],
        size               = 15,
        sizegrowth         = 15,
        speed              = [[0, 0, 0]],
        texture            = [[dirt]],
      },
    },
    groundflash = {
      circlealpha        = .5,
      circlegrowth       = 12,
      flashalpha         = 1.8,
      flashsize          = 20,
      ttl                = 12,
      color = {
        [1]  = 1,
        [2]  = 0.7,
        [3]  = 0.4,
      },
    },
    
	heatcloud = {
      air                = true,
      count              = 5,
      ground             = true,
      properties = {
        heat               = 10,
        heatfalloff        = .25,
        maxheat            = 30,
        pos                = [[-15 r30, r15, -15 r30]],
        size               = 55,
        speed              = [[0.4 r-0.8, -0.4 r0.8, 0.4 r-0.8]],
      },
    },

	flames = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.05,
        color              = [[0.9 ,0.5 ,0]],
        dir                = [[-15 r50,-15 r50,-15 r50]],
        length             = 2,
        width              = 20,
      },
    },		
	----	
    carton_bom_cloud = {
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
		airdrag            = 0.8,
        colormap           = "1 1 1 1  1 1 1 1", -- [[1 1 1 1  1 1 1 1  1 1 1 0]],
        directional        = false,
        --emitrot            = 90,
        emitrotspread      = 60,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1, 0]],
        numparticles       = 3,
        particlelife       = 40,
        particlelifespread = 0,
        particlesize       = 20,	--negative side: turn the texture upside down
        particlesizespread = 0,
        particlespeed      =  25,
        particlespeedspread = 0,
        pos                = [[0, 100, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[cartoonexplo_bom]],
      },
    },  
	----
	
  },
  
  

}
