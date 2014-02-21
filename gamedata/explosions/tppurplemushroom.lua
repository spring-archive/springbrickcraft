--pillar builds up, crown on top. mushroom mushroom
--by knorke. feat. operators

return {
	["smallpiff"] = {
		piff = {
		air = true,
		class = [[CSimpleParticleSystem]],
		count = 1,
		ground = true,
		water = true,
		unit = true,
		properties = {
			emitVector = "0,-1,0",
			emitRot = 90,
			emitRotSpread = 10,
			emitMul = "1, 0.2, 1",
			particleSpeed = 2.0,
			particleSpeedSpread = 0,
			gravity = "0,0,0",
			airdrag = 0.7,
			particleSize = 0.5,
			particleSizeSpread = 5.0,
			sizeGrowth = -0.1,
			sizeMod = 1.0,
			directional = false,
			texture = "blurring",
			colorMap = "0.5 0 1 0.9  0.8 0.8 1 0",
			numParticles = 10, 
			particleLife = 15,
			particleLifeSpread = 10,
		},
	},
},

	["crown"] = {
		poff = {
		air                = true,
		class              = [[CSimpleParticleSystem]],
		count              = 1,
		ground             = true,
		water              = true,
		unit = true,
		properties = {
			emitVector = "0,-1,0",
			emitRot = 90,
			emitRotSpread = 30,
			emitMul = "1, 1, 1",
			particleSpeed = 3.0,
			particleSpeedSpread = 0,
			gravity = "0,0,0",
			airdrag = 0.9,
			particleSize = 2,
			particleSizeSpread = 5.0,
			sizeGrowth = -0.1,
			sizeMod = 1.0,
			directional = false,
			texture = "blurring",
			colorMap = "1 0 0.6 1  0.8 0.8 1 0",
			numParticles = 50, 
			particleLife = 50,
			particleLifeSpread = 0,
		},
	},	
},

     


	["tppurplemushroom"] = {
	upwardsPiffs = {
		air = true,
		class = [[CExpGenSpawner]],
		count = 10,
		ground = true,
		water = true,
		unit = true,
	properties = {
		delay = [[0 i1]],
		explosiongenerator = [[custom:smallpiff]],
		pos = [[0, i5, 0]],
		},
	},

	crownAtTop = {
		air = true,
		class = [[CExpGenSpawner]],
		count = 1,
		ground = true,
		water = true,
		unit = true,
	properties = {
		delay = [[10]],
		explosiongenerator = [[custom:crown]],
		pos = [[0, 50, 0]],
		},
	},

	groundflash = {
		circlealpha = 1,
		circlegrowth = 1,
		flashalpha = 1,
		flashsize = 50,
		ttl = 50,
		color = {
		[1]  = 0.5,
		[2]  = 0.2,
		[3]  = 1,
		  },
		},  
}, 
  

}

