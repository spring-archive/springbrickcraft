unitDef = {
  unitname            = [[tpmagnet]],
  name                = [[Magnet]],
  description         = [[how does it work?]],
  acceleration        = 0.08,
  bmcode              = [[1]],
  brakeRate           = 0.2,  
  builder             = false,
  buildPic            = [[tpmagnetblue.png]],
  buildTime           = 12,
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[LAND]],
  corpse              = [[DEAD]],
  reclaimable         = false,
  --HITBOX--
	  collisionVolumeTest       =  1,	
	  collisionVolumeOffsets    =  [[0 0 0]],  --positiv = nach oben
	  collisionVolumeType       =  [[box]],	  
	  ollisionVolumeScales     =  [[40 25 55]],
	  --collisionVolumeScales		= [[25 10 50]],
	  --collisionVolumeOffsets	= [[-30 0 -5]],
	  
  ----------
  --TRANSPORT--
  isTransport = true,
  ReleaseHeld = true,		--transported units survive if transporter dies
  HoldSteady = true,		--transported units tilt and turn like the transporter
  TransportCapacity = 900,    --The number of units the transport can carry
  transportSize = 100000,
  TransportMass = 50000,
  transportUnloadMethod = 2,
  canload             = [[1]],
  isFirebase = true,
  Firebase = true,
  IsFirebase = true,
  isfireplatform=1,
  -------------
  defaultmissiontype  = [[Standby]],
--  explodeAs           = [[MEDIUM_UNIT]],
  footprintX          = 3,
  footprintZ          = 3,
  idleAutoHeal        = 0,
  leaveTracks         = true,
  maneuverleashlength = [[640]],
  mass                = 110,
  maxDamage           = 300,
  maxSlope            = 18,
  maxVelocity         = 5,
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[Vehicle3x3]],
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS LAND SINK HOVER SHIP FLOAT SUB]],
  objectName          = [[20empty.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[MEDIUM_UNIT]],



  sfxtypes            = {
	explosiongenerators = {
	"custom:tpsmokecloud",
	"custom:tpmuzzleflash",
	},
  },

  side                = [[GAYS]],
  sightDistance       = 500,
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  trackOffset         = 3,
  trackStrength       = 6,
  trackStretch        = 1,
  trackType           = [[StdTank]],
  trackWidth          = 30,
  turninplace         = 0,
  turnRate            = 800,
  workerTime          = 0,
  script              = [[tpmagnet.lua]],

  weapons             = {

	{
	  def                = [[Gatling]],
	  onlyTargetCategory = [[LAND SINK SHIP SWIM FLOAT HOVER]],
	  badTargetCategory  = [[SINK FLOAT MINERALS]],

	},

  },


  	  weaponDefs          = {
	
	    Gatling = {
	      name                    = [[Gatling]],
	      areaOfEffect            = 8,
	      craterMult              = 0.25,
	
	    damage                  = {
		Normal = 15,
	      },
	
--	      explosionGenerator      = [[custom:FLAK_BURST_Expl]],
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 350,
	      reloadtime              = 0.8, --0.4
	      rgbColor                = [[1 0.95 0.4]],
	      separation              = 2,
          size                    = 1.25,
	      soundStart              = [[Argh_heavy_machinegun]],
	      soundStartVolume        = 0.8,
	      soundTrigger            = true,
	      stages                  = 50,
	      sprayAngle              = 300, --1180
	      tolerance               = 8000,
	      turret                  = true,
	      weaponType              = [[Cannon]],
	      weaponVelocity          = 750,
		  burst                   = 3, --war vorher kein burst
	      burstrate               = 0.08,
	    },
	
	  },
}

return lowerkeys({ tpmagnet = unitDef })