--fire 2 projectiles in an arc
local weaponName = "singlecannon"
local weaponDef = {
	      name                    = "Cannon",
	      weaponType              = [[Cannon]],
	      --damage
		  damage = {
				Normal = 10,
				},
	      areaOfEffect            = 100,
		  --physics
		  weaponVelocity          = 600,
		  reloadtime              = 0.5,
		  burst                   = 3,
	      burstrate               = 0.08,
		  range                   = 400,
		  sprayAngle              = 1500,
	      tolerance               = 8000,
		  lineOfSight             = true,
	      turret                  = true,
		  craterMult              = 0,
		  TrajectoryHeight		  = 1,
		  --apperance
		  model                   = [[projmissle.s3o]],
		  rgbColor                = [[1 0.95 0.4]],		  	      
          size                    = 3,
	      stages                  = 20,
		  separation              = 1,
		  startSmoke			  =1,
		  }
		
return lowerkeys({[weaponName] = weaponDef})