	unitDef = {
	  unitname            = [[tplasertest]],
	  name                = [[Laser Bucket]],
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
		"Argh_TankSound",
		{file="freesound/TheBaron/ready2rocknroll.wav", volume=6.0,},
		{file="freesound/Nickleus/ahyeah.wav", volume=6.0,},
		},
	      --ok = {
		--"samples/changecourse.ogg",
		--},
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
	      def                = [[heavybeamweapon]],
	      badTargetCategory  = [[MINERALS]],
	      onlyTargetCategory = [[VEHICLE BIO BUILDING LAND]],
	    },
	
	  },
	
	
	  weaponDefs          = {
	
heavybeamweapon = {
    AreaOfEffect       = 200,
    avoidFeature       = false,
    avoidFriendly      = false,
    beamTime           = 100/30,
    beamWeapon         = true,
	cameraShake		   = 1,
    collideFeature     = false,
    collideFriendly    = false,
    coreThickness      = 0.5,
--	cegTag             = "mediumcannonweapon3",
--    duration           = 0.2,
    energypershot      = 30,
    explosionGenerator = "custom:MEDMECHPOP",
    fallOffRate        = 1,
    fireStarter        = 50,
	impulseFactor      = 0,
	interceptedByShieldType = 4,
    lineOfSight        = true,
    minintensity       = "1",
    name               = "Laser",
    range              = 1000,
    reloadtime         = 100/30,
    WeaponType         = "BeamLaser",
    rgbColor           = "1 0 1",
    rgbColor2          = "1 1 1",
    --soundTrigger       = true,
    --soundstart         = "krabprimary.wav",
--    soundHit           = "mediumcannonhit.wav",
	sweepfire		   = true,
    --texture1           = "shot",
    --texture2           = "empty",
    thickness          = 9,
    tolerance          = 0,
    turret             = true,
    weaponVelocity     = 800,

    damage = {
      normal           = 300,
    },
  },
	
	  },
	
	
	  featureDefs         = {
	
	    DEAD  = {
	      description      = [[Wreckage - Assault Tank]],
	      blocking         = false,
	      category         = [[corpses]],
	      damage           = 1125,
	      energy           = 0,
	      featureDead      = [[DEAD2]],
	      featurereclamate = [[SMUDGE01]],
	      footprintX       = 2,
	      footprintZ       = 2,
	      height           = [[4]],
	      hitdensity       = [[100]],
	      metal            = 72,
	      object           = [[bgenericwreckage.s3o]],
	      reclaimable      = true,
	      reclaimTime      = 15,
	      seqnamereclamate = [[TREE1RECLAMATE]],
	      world            = [[All Worlds]],
	    },
	
	
	    DEAD2 = {
	      description      = [[Debris - Assault Tank]],
	      blocking         = false,
	      category         = [[heaps]],
	      damage           = 750,
	      energy           = 0,
	      featurereclamate = [[SMUDGE01]],
	      footprintX       = 2,
	      footprintZ       = 2,
	      height           = [[4]],
	      hitdensity       = [[100]],
	      metal            = 36,
	      object           = [[b2x2heap.s3o]],
	      reclaimable      = true,
	      reclaimTime      = 15,
	      seqnamereclamate = [[TREE1RECLAMATE]],
	      world            = [[All Worlds]],
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

	
return lowerkeys({ tplasertest = unitDef })
