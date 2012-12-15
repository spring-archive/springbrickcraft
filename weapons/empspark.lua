local weaponName = "empspark"
 --from zk
 weaponDef = {
      name                    = [[Electro-Stunner]],
      areaOfEffect            = 20,
      beamWeapon              = true,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,
	  burst                   = 4,
	  burstrate               = 0.1,

      damage                  = {
        --default        = 600,
        --empresistant75 = 150,
        --empresistant99 = 6,
		Normal = 1, 
      },

      duration                = 2,
      explosionGenerator      = [[custom:tpelectrosplash]],
      fireStarter             = 0,
      heightMod               = 1,
      impulseBoost            = 0,
      impulseFactor           = 0,
      intensity               = 12,
      interceptedByShieldType = 1,
      noSelfDamage            = true,
      --paralyzer               = true,
      --paralyzeTime            = 3,
      range                   = 240,
      reloadtime              = 1.75,
      rgbColor                = [[0 1 0.5]],
      --soundStart              = [[weapon/lightning_fire]],
      soundTrigger            = true,
      targetMoveError         = 0.2,
      texture1                = [[electro]],
      thickness               = 10,
      turret                  = true,
      weaponType              = [[LightningCannon]],
      weaponVelocity          = 450,
    }
return lowerkeys({[weaponName] = weaponDef})