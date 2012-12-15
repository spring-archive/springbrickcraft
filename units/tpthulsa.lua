	unitDef = {
	  unitname            = [[tpthulsa]],
	  name                = [[Thulsa]],
	  description         = [[Unstoppable]],
	  acceleration        = 0.1,
	  bmcode              = [[1]],
	  brakeRate           = 0.4,
	  buildCostEnergy     = 0,
	  buildCostMetal      = 300,
	  builder             = false,
	  buildPic            = [[tpthulsablue.png]],
	  buildTime           = 20,
	  canAttack           = true,
	  canGuard            = true,
	  canMove             = true,
	  canPatrol           = true,
	  canstop             = [[1]],
	  category            = [[LAND]],
	  corpse              = [[DEAD]],
      reclaimable         = false,
	  --HITBOX--
	  --collisionVolumeTest       =  1,	
	  --collisionVolumeOffsets    =  [[0 0 0]],
	  --collisionVolumeType       =  [[box]],
	  --collisionVolumeScales     =  [[55 65 55]],
	  ----------
	  defaultmissiontype  = [[Standby]],
--	  explodeAs           = [[MEDIUM_UNIT]],
      footprintx          = 4,
	  footprintZ          = 4,
	  idleAutoHeal        = 0,
	  leaveTracks         = true,
	  trackOffset         = 3,
	  trackStrength       = 6,
	  trackStretch        = 1,
	  trackType           = [[StdTank]],
	  trackWidth          = 50,
	  maneuverleashlength = [[640]],
	  mass                = 90,
	  maxDamage           = 1000,
      maxSlope            = 18,
	  maxVelocity         = 3.5,
	  maxReverseVelocity   = 3.5,
      maxWaterDepth       = 22,
	  minCloakDistance    = 75,
	  movementClass       = [[LightTANK]],
	  moveState           = 0,
	  noAutoFire          = false,
	  noChaseCategory     = [[MINERALS FIXEDWING GUNSHIP SUB]],
	  objectName          = [[tpthulsa.s3o]],
	  seismicSignature    = 4,
	  selfDestructAs      = [[SMALL_UNIT]],

	  	    
	  sfxtypes            = {
	
	    explosiongenerators = {
		"custom:tpsmokecloud",
--		"custom:orc_machinegun_muzzle",
	    },
	
	  },

	  sounds			= {
	      select = {
		"Argh_TankSound",
		},
	      ok = {
		"Argh_TankSound",
		},
	  },

	  side                = [[GAYS]],
	  sightDistance       = 500,
	  smoothAnim          = true,
	  steeringmode        = [[1]],
	  TEDClass            = [[TANK]],
	  turninplace         = 1,
	  turnRate            = 550,
	  workerTime          = 0,
          script              = [[tpthulsa.lua]],
	
	  weapons             = {
	
	    {
	      def                = [[Cannon]],
	      badTargetCategory  = [[SINK FLOAT MINERALS]],
	      onlyTargetCategory = [[LAND SINK SHIP SWIM FLOAT HOVER]],
	    },
	
	  },
	
	
	  weaponDefs          = {
	
	    Cannon = {
	      name                    = [[Cannon]],
	      areaOfEffect            = 200,
	      burst                   = 1,
	      burstrate               = 0.08,
	      craterMult              = 0.25,
	      accuracy                = 100,
	
	      damage                  = {
		Normal = 300,
	      },
		  CegTag				 = "tpmisslesmoke",
	      model                   = [[projmissle.s3o]], -- [[bantimechmissile.s3o]],
	      dance                   = 2,
	      wobble                  = 2,
	      explosionGenerator      = [[custom:tpsmokecloud]],
	      flightTime              = 4,
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 450,
	      reloadtime              = 2,
	      smokeTrail              = true,
	      --soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[kanoba/Canlite3Remake.ogg]],
	      tolerance               = 8000,
	      tracks                  = false,
	      turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 500, --1500
	      startVelocity           = 500,
	      weaponAcceleration      = 0,
	    },
	
	  },
		
	}
	
	return lowerkeys({ tpthulsa = unitDef })
