	unitDef = {
	  unitname            = [[tpabfang]],
	  name                = [[Cruise Missile]],
	  script = "tpabfang.lua",
		acceleration = 1,		
		brakerate = 1,
		 -- kamikaze               = true,
		--kamikazeDistance       = 60,
		verticalSpeed = 3,
		buildcostenergy = 0,
		buildcostmetal = 1,
		
		buildtime = 1,
		canfly = true,
		canmove = true,
		hoverattack=true,
		bankscale           = [[1]],
		maxBank			  = 0.2,
		maxPitch 			  = 0.2,
		Upright = false,
		category = "AIR",
		collide = false,
		cruisealt = 160,
		description = "explodes into a cluster of boom",
		explodeas = "BIG_UNITEX",
		footprintx = 2,
		footprintz = 2,
		icontype = "air",
		maxdamage = 60,		
		maxvelocity = 14,
		
		 ---speedToFront           = 0.5,
  --frontToSpeed           = 0.1,
		turnRadius = 50,		
		nochasecategory = "NOTAIR",
		objectname = "mine.s3o", --"projbig.s3o",		
		selfdestructas = "BIG_UNIT",
		sightdistance = 200,		
		turnrate = 500,
		sfxtypes            = {	
	    explosiongenerators = {
		"custom:tpmisslesmoke_cartoon",		
	    },	
	  },

	  
  weapons             = {
    {
      def                = [[bombs]],
      badTargetCategory  = [[MINERAL]],
      onlyTargetCategory = [[BIO LAND VEHICLE BUILDING SEA AIR]],
    },	
  },	
	  
	  
	  
	  weaponDefs          = {
bombs = {
	  name                    = "bouncing bomblets",
	      weaponType              = "Cannon", -- [[Cannon]],
	      --damage
		  damage = {
				Normal = 25,--50
				},	      
	      areaOfEffect            = 50,
		  --physics
		  weaponVelocity          = 250,
		  reloadtime              = 0.05,
--		  burst                   = 1,
--	      burstrate               = 0.08,
		  projectiles = 2,
		  range                   = 100, --50
		  sprayAngle              = 6000, --9000
	      tolerance               = 16000, --8000
		  lineOfSight             = true,
	      turret                  = true,
		  craterMult              = 0,
		  --TrajectoryHeight		  = 1,
		  --apperance
		  model                   = "projmedium.s3o", -- "projball.s3o",
		  explosionGenerator      = [[custom:tpballimpact]],
		  rgbColor                = [[1 0.95 0.4]],		  	      
          size                    = 3,
	      stages                  = 20,
		  separation              = 1,
		  startSmoke			  =1,
		  --bouncing
		  --NumBounce				  = 8,
		  --groundbounce			  = true,
 		  --BounceRebound			  = 0.3, --vertical bounce
		  --BounceSlip			  = 0.95,--horizontal bounce
		  
		  --[[
		  --test to make it tracking:
		  weaponType              = "MissileLauncher",
		  tracks                  = true, --false
	      Turnrate				  = 800,		  
	      startVelocity           = 250, --200
	      weaponAcceleration      = 10,
		  --]]
		  soundHit                = [[argh/Argh_LargeExplosion]],
		  --soundHit = [[kanoba/bomblet2.wav]],
		  soundStart = [[freesound/TheBaron/clonk2.wav]],
		  }
	  },	
	}
	
	return lowerkeys({ tpabfang = unitDef })