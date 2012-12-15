--glowing "ball of light" thing used by warpcoil
return {	
	pillar = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 32,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[i1]],
        dir                = [[dir]],
        explosiongenerator = [[custom:tpreactorglow]],
        pos                = [[0, i8, 0]],
      },
	  },
	
	["tpreactorglow"] = {
		glowing = {
			air                = true,
			class              = [[explspike]],
			count              = 7,
			ground             = true,
			water              = true,
			properties = {
				alpha              = 1,
				alphadecay         = 0.04,
				color              = [[0.9 ,0.5 ,0.5]],
				dir                = [[-15 r50,-15 r50,-15 r50]],
				length             = 6,
				width              = 15,
				pos = [[i2 i3 i1]],
			},
		}
	}
}
