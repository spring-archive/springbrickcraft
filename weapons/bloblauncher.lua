local weaponName = "bloblauncher"
    weaponDef = {
      name                    = "Blob Goo",
      areaOfEffect            = 75,
      burst                   = 5,
      burstrate               = 0.01,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        Normal = 75,
		default = 75,
      },
	  Paralyzer = true,
	  ParalyzeTime = 10,
      endsmoke                = [[0]],
      explosionGenerator      = [[custom:tpgooimpact]],
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      intensity               = 0.7,
      interceptedByShieldType = 1,
      lineOfSight             = true,
      mygravity               = 0.1,
      noSelfDamage            = true,
      range                   = 500,
      reloadtime              = 5,      
      rgbColor                = [[0.2 0.6 0.0]],
      size                    = 8,
      sizeDecay               = 0,
	  soundHit                = {file="freesound/Churd_Tzu/splash.wav",volume=5.0},
      --soundStart              = [[chickens/acid_fire]],
      sprayAngle              = 3000,
      startsmoke              = [[0]],
      tolerance               = 1000,
      turret                  = true,
      weaponTimer             = 0.2,
      weaponType              = [[Cannon]],
      weaponVelocity          = 350,
	  		  --bouncing
		  NumBounce				  = 1,
		  groundbounce			  = true,
 		  BounceRebound			  = 0.6, --vertical bounce
		  BounceSlip			  = 0.3,--horizontal bounce
    }
return lowerkeys({[weaponName] = weaponDef})