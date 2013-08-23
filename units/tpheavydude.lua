unitDef = {
  unitname            = [[tpheavydude]],
  name                = [[Demonaut]],
  description         = [[Rocket Launcher - Fuck Yeah!]],
  acceleration        = 0.2,
  bmcode              = [[1]],
  brakeRate           = 0.5,
  buildCostEnergy     = 0,
  buildCostMetal      = 100,
  builder             = false,
  buildPic            = [[tpheavydudeblue.png]],
  buildTime           = 15,
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  --OnOffable			  =true,
  category            = [[LAND BIO]],
  reclaimable         = false,
  --HITBOX--
  collisionVolumeTest       =  1,
  collisionVolumeOffsets    =  [[0 30 0]],
  collisionVolumeType       =  [[sphere]],
  collisionVolumeScales     = [[20]],  -- [[20 30 20]],
	----------	
  defaultmissiontype  = [[Standby]],
  --explodeAs           = [[MEDIUM_UNIT]],
  footprintX          = 1,
  footprintZ          = 1,
  idleAutoHeal        = 0,  
  maneuverleashlength = [[640]],
  mass                = 24,
  maxDamage           = 80, --75
  maxSlope            = 45,
  maxVelocity         = 2.5,
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[Infantry]],
  crushStrength 	  = 25,
  moveState           = -1,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS BIO]],
  objectName          = [[heavydude.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[MEDIUM_UNIT]],

  sounds			= {
	  select = {
--	"samples/knarrehand.ogg",
	{ file ="freesound/shawshank73/enemies_left.wav", volume=5.0 },
	{ file ="freesound/shawshank73/enemies_right.wav", volume=5.0 },
	{ file ="freesound/shawshank73/enemies_everywhere.wav", volume=5.0 },
	{ file ="freesound/shawshank73/lookout_behind.wav", volume=5.0 },
	{ file ="freesound/shawshank73/fire_rpg.wav", volume=5.0 },
	},
	  ok = {
		{ file ="freesound/OLPCsamples/voice-man-shout-unhh.wav", volume=5.0 },
	},
  },

  sfxtypes            = {
	explosiongenerators = {
	"custom:tpmuzzleflash_small",
--	"custom:orc_machinegun_muzzle",
	},

  },

  side                = [[GAYS]],
  sightDistance       = 350,
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  leaveTracks         = true,
  trackOffset         = 0,
  trackStrength       = 3,
  trackStretch        = 1,
  trackWidth          = 10,
  trackType           = [[footSteps]],
  turninplace         = 1,
  turnRate            = 2000,
  workerTime          = 0,
	  script              = [[tpheavydude.lua]], -- [[tpheavydude.lua]],

  weapons             = {
	{
	def                = [[RocketLauncherTrack]],
	badTargetCategory  = [[MINERALS AIR]],
	onlyTargetCategory = [[VEHICLE AIR BUILDING]] ,
	},
	{
	def                = [[RocketLauncherNoTrack]],
	badTargetCategory  = [[MINERALS AIR BIO]],
	onlyTargetCategory = [[BIO]] ,
	},

  },

	  weaponDefs          = {	
	    RocketLauncherTrack = {
	      name                    = [[RocketLauncher]],
	      areaOfEffect            = 20,
	      --burst                   = 4,
	      --burstrate               = 0.25,
	      craterMult              = 0.25,
	      accuracy                = 1000,--100 --10000	
	      damage                  = {
			Normal = 100,
	      },
		  CegTag				 = "tpmisslesmoke_cartoon",
	      model                   = [[projbullet.s3o]], -- [[bantimechmissile.s3o]],
	      dance                   = 0,--50 --25
	      wobble                  = 10,--100 --50
	      explosionGenerator      = [[custom:tpmissleimpact]],
	      flightTime              = 2,--2
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 350, --350
		  shotground			  = false,
		  cylinderTargeting	  = 1,
	      reloadtime              = 1.3,
	      smokeTrail              = true,
	      soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[kanoba/Torpedo1Remake.ogg]],
	      soundStartVolume        = 2,
		  tolerance               = 8000,
	      tracks                  = true, --false
	      Turnrate				  = 26000, --16000 26000
		  --FixedLauncher			  = true,
		  TrajectoryHeight		  = 0.5, --2
		  turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 350, --300
	      startVelocity           = 250, --200
	      weaponAcceleration      = 10,
	    },
		
		RocketLauncherNoTrack = {
	      name                    = [[Unguided RocketLauncher]],
	      areaOfEffect            = 20,
	      --burst                   = 4,
	      --burstrate               = 0.25,
	      craterMult              = 0.25,
	      accuracy                = 1000,--100 --10000	
	      damage                  = {
			Normal = 100,
	      },
		  --CegTag				 = "tpmisslesmoke",
	      accuracy                = 50000,
		  model                   = [[projbullet.s3o]], -- [[bantimechmissile.s3o]],
	      dance                   = 0,--50 --25
	      wobble                  = 1,--100 --50
	      explosionGenerator      = [[custom:tpmissleimpact]],
	      flightTime              = 1.8,
		  burnBlow=true,
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 350,
		  cylinderTargeting	  = 1,
	      reloadtime              = 1.3,
	      smokeTrail              = true,
	      soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[kanoba/Torpedo1Remake.ogg]],
	      soundStartVolume        = 2,
		  tolerance               = 4000,--8000
	      tracks                  = true, --false
	      Turnrate				  = 1000, --16000 26000
		  --FixedLauncher			  = true,
		  TrajectoryHeight		  = 0.4, --2--0.5:schiesst IMMER zu weit
		  turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 100, --300
	      startVelocity           = 200, --200
	      weaponAcceleration      = 0,
	    },
		
		Grenade = {
	      name                    = [[Grenade]],
	      areaOfEffect            = 60,
	      --burst                   = 4,
	      --burstrate               = 0.25,
	      craterMult              = 5,
	      accuracy                = 50000,	
	      damage                  = {
			Normal = 100,
	      },
		  --CegTag				 = "tpmisslesmoke",
	      model                   = [[projmissle.s3o]],
	      dance                   = 0,
	      wobble                  = 0,
	      explosionGenerator      = [[custom:tpsmokecloud]],
	      flightTime              = 0.01,
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 200,
	      reloadtime              = 1,
	      smokeTrail              = false,
	      soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[kanoba/Torpedo1Remake.ogg]],
	      soundStartVolume        = 2,
		  tolerance               = 8000,
	      tracks                  = false,
	      Turnrate				  = 26000, --16000 26000
		  --FixedLauncher			  = true,
		  TrajectoryHeight		  = 2, --2
		  turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 200,
	      startVelocity           = 200,
	      weaponAcceleration      = 10,
		  NumBounce				  = -1,
		  groundbounce			  = true,
 		  BounceRebound			  = 0.25, --vertical bounce
		  BounceSlip			  = 0.95,--horizontal bounce
	    },
	
	  },
	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	unitguide_goodvs = "Vehicles, Aircraft",
	unitguide_weakvs = "Infantry",
	unitguide_protip = "dick in da dirt",
	}, 
	 
}

return lowerkeys({ tpheavydude = unitDef })