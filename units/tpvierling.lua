	unitDef = {
	  unitname            = [[tpvierling]],
	  name                = [[Dragonaut]],
	  description         = [[rapid fire of doom]],
	  acceleration        = 0.4,
	  bmcode              = [[1]],
	  brakeRate           = 0.4,
	  buildCostEnergy     = 0,
	  buildCostMetal      = 500,--800
	  builder             = false,
	  buildPic            = [[tpvierlingblue.png]],
	  buildTime           = 30, --20
	  canAttack           = true,
	  canGuard            = true,
	  canMove             = true,
	  canPatrol           = true,
	  canstop             = [[1]],
	  category            = [[VEHICLE LAND]],
	  corpse              = [[DEAD]],
          reclaimable         = false,
	
	  defaultmissiontype  = [[Standby]],
--	  explodeAs           = [[MEDIUM_UNIT]],
      footprintx          = 3,
	  footprintZ          = 3,
	  idleAutoHeal        = 0,
	  leaveTracks         = true,
	  maneuverleashlength = [[640]],
	  mass                = 200,
	  maxDamage           = 500,
          --maxSlope            = 18,
	  maxVelocity         = 2.3, --2.5
      maxWaterDepth       = 22,
	  minCloakDistance    = 75,
	  movementClass       = [[Vehicle3x3]],
	  moveState           = 0,
	  noAutoFire          = false,
	  noChaseCategory     = [[MINERALS]],
	  objectName          = [[vierling.s3o]],
	  seismicSignature    = 4,
	  selfDestructAs      = [[SMALL_UNIT]],

	  	    
	  sfxtypes            = {	
	    explosiongenerators = {
		--"custom:tpsmokecloud",
		"custom:tpmuzzleflash",
		"custom:tpejectshell",
	    },	
	  },

	sounds = {
		select = {
--			{file="samples/judge.wav",volume=6.0},
--			{file="samples/iwasdrauf.wav", volume=6.0},
--			{file="samples/battle.ogg.wav", volume=6.0},
			{file="freesound/shawshank73/prepareyourself.wav", volume=6.0},
			{file="freesound/shawshank73/gameover.wav", volume=6.0},
			{file="freesound/shawshank73/letsfight.wav", volume=6.0},
			{file="freesound/idensai-I/fatality.wav", volume=6.0},
			
		},
		ok = {
			{file="freesound/Xythe/brute_pewpewpew.wav",volume=6.0},
			{file="freesound/shawshank73/youlose.wav",volume=6.0},			
		},
	},

	  side                = [[NKG]],
	  sightDistance       = 450,
	  smoothAnim          = true,
	  steeringmode        = [[1]],
	  TEDClass            = [[TANK]],
	  trackOffset         = 3,
	  trackStrength       = 6,
	  trackStretch        = 1,
	  trackType           = [[StdTank]],
	  trackWidth          = 42,
	  turninplace         = 1,
	  turnRate            = 550,
	  workerTime          = 0,
          script              = [[tpvierling.lua]],
	
	  weapons             = {
	    {
	      def                = [[Cannon]],
	      badTargetCategory  = [[MINERALS]],
	      onlyTargetCategory = [[BIO AIR VEHICLE BUILDING LAND]],
	    },
	
	  },
	
	
	  weaponDefs          = {
	
	    Cannon = {
	      name                    = [[Cannon]],
	      areaOfEffect            = 48,
	      burst                   = 1,
	      burstrate               = 0.08,
		  projectiles=2,			--wtf?
	      craterMult              = 0,
	      accuracy                = 200, --100	
	      damage                  = {
		Normal = 7, --15 --7
	      },
	
	      model                   = [[projbullet.s3o]],
	      dance                   = 2,
	      wobble                  = 2,
	      explosionGenerator      = [[custom:tpbulletimpact]],
	      flightTime              = 1,
		burnBlow			= true,
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 450, --war 800 aber das ist bischen krass, die launchbox schiesst schon so weit.. --500, damit konnte er turrets outrangen aber der tank nicht->nicht gut.->450 damit er dudes besser wegschreddert
		  CylinderTargeting		  = 1,--damit er air gut treffen kann
	      reloadtime              = 0.17, --0.35
	      smokeTrail              = false,
--	      soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[tpgatlingkanobaremix.ogg]],
	      tolerance               = 8000,
	      tracks                  = false,
	      turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 1000,--1500
	      startVelocity           = 1000,--1500
	      weaponAcceleration      = 100,
	    },
	
	  },

	customParams = {
	unitguide_text = "blablablablablablabla", 
	unitguide_goodvs = "Infantry, Aircraft, light vehicles",
	unitguide_weakvs = "Nobody knows yet",
	unitguide_protip = "When damaged, guns fall off and thus the rate of fire decreases.",
	},
	}
	
	return lowerkeys({ tpvierling = unitDef })