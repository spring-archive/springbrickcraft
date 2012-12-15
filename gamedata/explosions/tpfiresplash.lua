return {
["tpfiresplash"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 3,
      flashalpha         = 0.8,
      flashsize          = 50,
      ttl                = 15,
      color = {
        [1]  = 0.9,
        [2]  = 0.8,
        [3]  = 0,
      },
    },    
	flames = {
      air                = true,
      class              = [[explspike]],
      count              = 7,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.1,
        color              = [[0.9 ,0.2 ,0]],
        dir                = [[-15 r50,-15 r50,-15 r50]],
        length             = 5,
        width              = 20,
      },
    },	
  }
}