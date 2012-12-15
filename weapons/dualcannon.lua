--fire 2 projectiles in an arc
local weaponName = "dualcannon"
local weaponDef = {
	      name                    = "Dual Cannon",
	      weaponType              = [[Cannon]],
	      --damage
		  damage = {
				Normal = 30,
				},	      
	      areaOfEffect            = 100,
		  --physics
		  weaponVelocity          = 600,
		  reloadtime              = 2,
		  burst                   = 4,
	      burstrate               = 0.15,
		  range                   = 1000,
		  sprayAngle              = 2000,--1200
	      tolerance               = 4000,
		  lineOfSight             = true,	      
	      turret                  = true,
		  craterMult              = 0,
		  TrajectoryHeight		  = 3,
		  --apperance
		  model                   = [[projmissle.s3o]],
		  rgbColor                = [[1 0.95 0.4]],		  	      
          size                    = 6,
	      stages                  = 20,
		  separation              = 1,
		  start					  =1,
		  CegTag				 = "tpshocktrail",
		  alwaysVisible			= true,
		  }
		
return lowerkeys({[weaponName] = weaponDef})