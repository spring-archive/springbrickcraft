--a ball that bounces on the ground
local weaponName = "ballgun"
local weaponDef = {
	      name                    = "Ball Gun",
	      weaponType              = "Cannon", -- [[Cannon]],
	      --damage
		  damage = {
				Normal = 80,
				},	      
	      areaOfEffect            = 50,
		  --physics
		  weaponVelocity          = 250,
		  reloadtime              = 1,
		  burst                   = 1,
	      burstrate               = 0.08,
		  range                   = 600,
		  sprayAngle              = 1500,
	      tolerance               = 8000,
		  lineOfSight             = true,
	      turret                  = true,
		  craterMult              = 0,
		  --TrajectoryHeight		  = 1,
		  --apperance
		  model                   = "projball.s3o",
		  explosionGenerator      = [[custom:tpballimpact]],
		  --rgbColor                = [[1 0.95 0.4]],		  	      
          size                    = 3,
	      stages                  = 20,
		  separation              = 1,
		  startSmoke			  =1,
		  --bouncing
		  NumBounce				  = 2,
		  groundbounce			  = true,
 		  BounceRebound			  = 0.9, --vertical bounce
		  BounceSlip			  = 0.7,--horizontal bounce
		  
		  --[[
		  --test to make it tracking:
		  weaponType              = "MissileLauncher",
		  tracks                  = true, --false
	      Turnrate				  = 800,		  
	      startVelocity           = 250, --200
	      weaponAcceleration      = 10,
		  --]]
		  }
		
return lowerkeys({[weaponName] = weaponDef})