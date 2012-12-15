--based on mine.tdf from kernel panic
return {
  ["tphe"] = {
    cloud = {
      air = true,
      ground = true,
	  water = true,
	  class              = [[CSimpleParticleSystem]],      
      properties = {
			sizegrowth=0,
			sizemod=.98,
			pos=[[0, 1.0, 0]],
			emitVector=[[0, 1, 0]],
			gravity=0, 0, 0,
			Texture = "ball",
			colorMap=[[1 1 1 1   1 1 1 1   0 0 0 1  0 0 0 0]],
			airdrag=0.9, --0.8
			particleLife=25,
			particleLifeSpread=25,
			numParticles=48,
			particleSpeed=2,
			particleSpeedSpread=20,
			particleSize=8,
			particleSizeSpread=4,
			emitRot=0,
			emitRotSpread=80,
			directional=1,
      },
    },	
	groundflash = {
		flashSize = 64, -- flash size
		flashAlpha = 1, -- initial alpha of the flash
		circleGrowth = 12.8, -- size increase/frame
		circleAlpha = 1, -- initial alpha of the ring
		ttl = 16, -- number of frames
		color = {
			[1]  = 0.9,
			[2]  = 0.8,
			[3]  = 0,
			},
	},    
  },
}