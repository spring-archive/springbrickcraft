unitDef = {
  unitname            = [[tplaunchbox]],
  name                = [[Launch Box]],
  description         = [[Walks, Shots Missiles, Walks away.]],
  acceleration        = 0.1,
  bmcode              = [[1]],
  brakeRate           = 0.1,
  buildCostEnergy     = 0,
  buildCostMetal      = 900,
  builder             = false,
  buildPic            = [[tplaunchboxblue.png]],
  buildTime           = 20,
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[LAND VEHICLE]],
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
  trackStretch        = 0.5,
  trackType           = [[footSteps_apart]],
  trackWidth          = 50,
  maneuverleashlength = [[640]],
  mass                = 200,
  maxDamage           = 500,
	  maxSlope            = 18,
  maxVelocity         = 3.2,
	  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[Vehicle4x4]],
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS FIXEDWING GUNSHIP SUB]],
  objectName          = [[launchbox.s3o]],
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
	{file="soundcloud/BaerTaffy/frankly.wav",volume=5.0},
	{file="soundcloud/BaerTaffy/teaparty.wav",volume=5.0},
	{file="soundcloud/BaerTaffy/wizard.wav",volume=5.0},
	{file="soundcloud/BaerTaffy/briefsample.wav",volume=5.0},
	
	
 --	{file="n64/wasgibtscommander.wav",volume=12.0},
--	{file="n64/4anschluesse.wav",volume=12.0},
--	{file="n64/captainschauensiemal.wav",volume=12.0},
--	{file="n64/frequenzkontrolle.wav",volume=12.0},
--	{file="n64/istdaseinangriff.wav",volume=12.0},
--	{file="n64/sicherheitsstufe.wav",volume=12.0},
--	{file="n64/wasgibtscommander.wav",volume=12.0},
	},
	  ok = {
	{file="freesound/13743_morsecode.wav",volume=5.0},
	},
  },

  

  side                = [[GAYS]],
  sightDistance       = 500,
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  turninplace         = 1,
  turnRate            = 2000,
  workerTime          = 0,
  script              = [[tplaunchbox2.lua]],

  weapons             = {	
	    {
	    def                = [[targetmarker]],
	    badTargetCategory  = [[MINERALS BIO]],
	    onlyTargetCategory = [[LAND VEHICLE BIO BUILDING SHIP]],
	    },
		{
	    def                = [[Flamer]],
	    badTargetCategory  = [[SINK FLOAT MINERALS]],
	    onlyTargetCategory = [[LAND VEHICLE BIO BUILDING SHIP]],
		mainDir = [[1 0 0]],
		maxAngleDif = 220,
		--MaxAngleDif1=200;
	    },
		{
	    def                = [[Flamer]],
	    badTargetCategory  = [[SINK FLOAT MINERALS]],
	    onlyTargetCategory = [[LAND VEHICLE BIO BUILDING SHIP]],
		mainDir = [[-1 0 0]],
		maxAngleDif = 220,
		--WeaponMainDir1=[[-1 0 0]],
		--MaxAngleDif1=200;
	    },
	
	  },	
	  weaponDefs          = {	
	    targetmarker = {
	      name                    = "Target Marker", --"Hype Missile Launcher",
	      areaOfEffect            = 2, --200
	      --burst                   = 4,
	      --burstrate               = 0.5, --0.25, --0.4
	      craterMult              = 0,
	      accuracy                = 0,--100 -5000
	
	      damage                  = {
			Normal = 1, --75 war bevor es zum targetmarker wurde und ab da 1
	      },
		  CegTag				 = "tpshocktrail", --"tpmisslesmoke_cartoon_purple", --"tpmisslesmoke",
	      model                   = "projmissle.s3o", --"20empty.s3o", -- [[projmissle.s3o]], -- [[bantimechmissile.s3o]],
	      --dance                   = 200,
	      --wobble                  = 200,
	      explosionGenerator      = [[custom:tpfiresplash]],
	      flightTime              = 4,--4
		  --burnBlow 				  = true, --war nicht
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 1200,--800
	      reloadtime              = 12.0, --1 --4.0 --8.0
	      smokeTrail              = false,
	      soundHit                = [[tp/woohoping.wav]],
	      soundStart              = [[kanoba/Torpedo1Remake.ogg]],
	      soundStartVolume        = 2,
		  tolerance               = 8000,
	      tracks                  = false,
	      Turnrate				  = 66000, --16000 26000
		  FixedLauncher			  = false,
		  TrajectoryHeight		  = 2, --2
		  turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 1000,--1000
	      startVelocity           = 1000,--1000
	      weaponAcceleration      = 10,
	    },
		
		Flamer = {
		name                    = [[Flamer]],
		areaOfEffect            = 64,
		avoidFeature            = false,
		collideFeature          = false,
		craterBoost             = 0,
		craterMult              = 0,
		damage                  = {
			normal = 0.5,
		},
		--explosionGenerator      = [[custom:tpsmallsmoke]],
		fireStarter             = 100,
		flameGfxTime            = 1.6,
		impulseBoost            = 0,
		impulseFactor           = 0,
		intensity               = 6,
		interceptedByShieldType = 0,
		noExplode               = true,
		noSelfDamage            = true,
		groundbounce			=1,
		range                   = 300,--200
		reloadtime              = 0.16,
		sizeGrowth              = 2, --3
		--soundStart              = [[weapon/flamethrower]],
		soundTrigger            = true,
		sprayAngle              = 10000, --50000
		tolerance               = 8000,
		turret                  = true,
		weaponType              = [[Flame]],
		weaponVelocity          = 200,
	},

	
	},
	
	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	unitguide_goodvs = "Turrets, Buildings, slow units",
	unitguide_weakvs = "Aircraft, units that get too near",
	unitguide_protip = "Keep it safe behind other units.",
	}, 
}

return lowerkeys({ tplaunchbox = unitDef })
