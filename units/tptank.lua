	unitDef = {
	  unitname            = [[tptank]],
	  name                = [[Bucket]],
	  description         = [[Oh, you found mah bucket!]],
	  acceleration        = 0.2,
	  upright = false,--false
	  bmcode              = [[1]],
	  brakeRate           = 0.5, --0.02 = slide into range of enemies
	  buildCostEnergy     = 0,
	  buildCostMetal      = 350, --300
	  showNanoFrame = false,
	  builder             = false,
	  buildPic            = [[tptankblue.png]],
	  buildTime           = 25,
	  canAttack           = true,
	  canGuard            = true,
	  canMove             = true,
	  canPatrol           = true,
	  canstop             = [[1]],
	  category            = [[VEHICLE LAND]],
	  corpse              = "f_cubedebris_s",
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
	  
	  autoHeal 			 = 0,
	  --idleTime 			  = 300,
	  idleAutoHeal        = 0,
	  
	  leaveTracks         = true,
	  trackOffset         = 3,
	  trackStrength       = 6,
	  trackStretch        = 6,--1,
	  trackType           = "wideTracks_sep", -- [[StdTank]],
	  trackWidth          = 50,
	  maneuverleashlength = [[640]],
	  mass                = 200,--90
	  maxDamage           = 860, --1000 --800
      maxSlope            = 18,
	  maxVelocity         = 3,
	  pushResistant 	  = true, --so they do not push each other into range of stuff
      maxWaterDepth       = 22,
	  minCloakDistance    = 75,
	  movementClass       = [[Vehicle4x4]],
	  crushStrength 	  = 100,
	  moveState           = 0,
	  noAutoFire          = false,
	  noChaseCategory     = [[MINERALS]],
	  objectName          = [[cubetank.s3o]],
	  seismicSignature    = 4,
	  selfDestructAs      = [[SMALL_UNIT]],

	  	    
	  sfxtypes            = {
	
	    explosiongenerators = {
		"custom:tpmuzzleparticles",
		"custom:tpjet",
		"custom:tpsmokecloud",		

	    },
	
	  },

	  sounds			= {
	      select = {
		--"Argh_TankSound",
		{file="freesound/TheBaron/ready2rocknroll.wav", volume=6.0,},
		{file="freesound/Nickleus/ahyeah.wav", volume=6.0,},		
		{file="freesound/alphahog/46011_systems-online.wav",volume=8.0},
		},
	      ok = {
		{file="freesound/idensai-I/rocknroll.wav", volume=6.0,},
		},
	  },

	  side                = [[GAYS]],
	  sightDistance       = 350,--500
	  smoothAnim          = true,
	  steeringmode        = [[1]],
	  TEDClass            = [[TANK]],
	  turninplace         = 1,
	  turnRate            = 800,--550
	  workerTime          = 0,
          script              = [[tptank.lua]],
	
	  weapons             = {	
	    {
	      def                = [[Cannon]],
	      badTargetCategory  = [[MINERALS]],
	      onlyTargetCategory = [[VEHICLE BIO BUILDING LAND]],
	    },	
	  },
	
	
	  weaponDefs          = {	
	    Cannon = {
	      name                    = [[Cannon]],
	      areaOfEffect            = 10, --200--75
	      burst                   = 1,
	      burstrate               = 0.08,
	      craterMult              = 0.25,
	      accuracy                = 100,
		  impactOnly			  = true,--nix
	      damage                  = {
		Normal = 75,  --60 --30 --40
		default = 75,
	      },
	
	      model                   = [[projmissle.s3o]], -- [[bantimechmissile.s3o]],
	      dance                   = 2,
	      wobble                  = 2,
	      explosionGenerator      = [[custom:tpfiresplash]], --tpsmokecloud
	      flightTime              = 4,
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 500, --war 450 habs runter gemacht damit turrets den panzer outrangen --400 müssen sie das? --600 --400
	      reloadtime              = 1.5, --2 --1
	      smokeTrail              = true,
	      soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[kanoba/Canlite3Remake.ogg]],
	      tolerance               = 8000,
	      tracks                  = true,
	      Turnrate				  = 16000,
		  turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 1000,
	      startVelocity           = 1000,
	      weaponAcceleration      = 100,
		  TrajectoryHeight		  = 0.65,	--0.5 -> increased to make shoting over walls easier
	    },
	
	  },	

	customParams = {
	unitguide_text = "blablablablablablabla", 
	unitguide_goodvs = "Most stuff",
	unitguide_weakvs = "Aircraft, Infantry with Rocketlauncher",
	unitguide_protip = "This is a good all-around unit.",
	unitdraw=true, --http://springrts.com/phpbb/viewtopic.php?f=23&p=523790#p523790
	}, 
	
	}

	
return lowerkeys({ tptank = unitDef })
