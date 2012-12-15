unitDef = {
  unitname            = [[tpkaiserdude]],
  name                = [[look at that fucker]],
  description         = [[fo real]],
  acceleration        = 1, --0.2
  bmcode              = [[1]],
  brakeRate           = 1, --0.5
  buildCostEnergy     = 0,
  buildCostMetal      = 45,
  builder             = false,
  buildPic            = "tpdudeblue.png",
  buildTime           = 10,--5
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[BIO LAND]],
  corpse              = [[DEAD]],
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
  maxDamage           = 50,--75
  maxSlope            = 45,
  maxVelocity         = 3,
  maxReverseVelocity   = 2.5,  ---**** als upgrade
  maxWaterDepth       = 22,  
  movementClass       = [[Infantry]],
  --crushStrength 	  = 25,
  moveState           = -1,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS AIR]],
  objectName          =   [[kaiserdude.s3o]], --
  seismicSignature    = 4,
  --selfDestructAs      = [[MEDIUM_UNIT]],
  selfDestructCountdown = 1,
  sounds			= {
	  select = {
	{file="tp/loskomm_fast.wav",volume=6.0},
	{file="tp/zauber_fast.wav",volume=6.0},
	{file="tp/satan_fast.wav",volume=6.0},
	},
	  --ok = {
	--"samples/fire.ogg",
	--},
  },

  sfxtypes            = {
	explosiongenerators = {
	"custom:tpmuzzleflash_small",
	},

  },

  side                = [[GAYS]],
  sightDistance       = 350,--250
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  leaveTracks         = true,
  trackOffset         = 0,
  trackStrength       = 3,
  trackStretch        = 1,
  trackType           = [[footSteps]],
  trackWidth          = 10,
  turninplace         = 1,
  turnRate            = 2000,
  workerTime          = 0,
	  script              = [[tpkaiserdude.lua]], -- [[tpdude.lua]],

  weapons             = {
	{
	  def                = [[Rifle]],
	 onlyTargetCategory = [[BIO VEHICLE BUILDING LAND AIR]], --AIR war nicht
	},

  },


  	  weaponDefs          = {	
	    Rifle = {
	      name                    = [[Rifle]],
	      areaOfEffect            = 5,
	      craterMult              = 0.25,	
	      damage                  = {
		  Normal = 5, --12 --10
	      },
			cylinderTargeting    = true, --gabs nicht
--	      explosionGenerator      = [[custom:FLAK_BURST_Expl]],
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 300,
	      reloadtime              = 0.4, --0.8
	      rgbColor                = [[1 0.95 0.4]],
	      separation              = 2,
          size                    = 1.00,
	      soundStart              = [[machine_gun]],
	      soundStartVolume        = 0.75,
	      soundTrigger            = true,
	      stages                  = 50,
	      sprayAngle              = 1180,
	      tolerance               = 8000,
	      turret                  = true,
	      weaponType              = [[Cannon]],
	      weaponVelocity          = 750,
		  burst                   = 2,  --3
	      burstrate               = 0.08,
		  },
	
	  },
	  
	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	unitguide_goodvs = "Nothing",
	unitguide_weakvs = "Everything",
	unitguide_protip = "Build a lot of those",
	},
}

return lowerkeys({ tpkaiserdude = unitDef })