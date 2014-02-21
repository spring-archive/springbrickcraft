--smokeflare signal by knorke

return {
	["onepuff"] = {
		sphere = {
		air = true,
		class = [[CSimpleParticleSystem]],
		count = 2,
		ground = true,
		water = true,
		unit = true,
		properties = {
			emitVector = "0,-1,0",
			emitRot = 90,
			emitRotSpread = 10,
			emitMul = "1, 0.2, 1",
			particleSpeed = 0.5,
			particleSpeedSpread = 0.1,
			gravity = "0,0.8,0",
			airdrag = 0.9,
			particleSize = 0.9,
			particleSizeSpread = 5.0,
			sizeGrowth = -0.1,
			sizeMod = 1,
			directional = false,
			texture = "cartooncloudround",
			colorMap = "0.9 0.8 0.5 0.9  0.9 0.8 0 0.9  0.8 0.8 0.6 1",
			numParticles = 3, 
			particleLife = 35,
			particleLifeSpread = 20,
		},
	},
},    


	["tptestceg"] = {
	smokes = {
		air = true,
		class = [[CExpGenSpawner]],
		count = 15,
		ground = true,
		water = true,
		unit = true,
	properties = {
		delay = [[0 i12]],
		explosiongenerator = [[custom:onepuff]],
		pos = [[0, 0, 0]],
		},
	},

	groundflash = {
		circlealpha = 1,
		circlegrowth = 5,
		flashalpha = 1,
		flashsize = 20,
		ttl = 10,
		color = {
		[1]  = 0.9,
		[2]  = 0.9,
		[3]  = 0.2,
		  },
		},  
}, 
  

}