--big explosion (when hq is destroyed)
return {
  ["bigpoofboom"] = {

	whitepoof = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 20,
      ground             = true,
      water              = true,
      properties = {
	    --delay              = "200i",
		airdrag            = 0.9,--0.9
        colormap           = [[1 1 1 0.75   1 1 1 0]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0 , 0]],
        numparticles       = 1,
        particlelife       = 60,
        particlelifespread = 60,
        particlesize       = 8,
        particlesizespread = 10,
        particlespeed      =  10,
        particlespeedspread = 6,
        pos                = [[0,-2 i20, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[cartooncloud2]],
      },
    },	

	blackpoof = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 20,
      ground             = true,
      water              = true,
      properties = {
	    --delay              = "200i",
		airdrag            = 0.95,--0.9
        colormap           = [[0.3 0.3 0.3 1  0.3 0.3 0.3 1  0.3 0.3 0.3 0]],
        directional        = false,
        emitrot            = 45,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, r0.1 -0.1 , 0]],
        numparticles       = 1,
        particlelife       = 60,
        particlelifespread = 100,
        particlesize       = 20,
        particlesizespread = 20,
        particlespeed      =  10,
        particlespeedspread = 6,
        pos                = [[0,-1 i10, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[greyblob]],
      },
    },
	
	groundflash = {
      circlealpha        = 1,
      circlegrowth       = 20,
      flashalpha         = 1,
      flashsize          = 100,
      ttl                = 100,
	  texture            = [[ground_fuzzysquare]],
      color = {
        [1]  = 1,
        [2]  = 0.9,
        [3]  = 0.9,
      },
    },

},
  
}