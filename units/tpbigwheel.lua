unitDef = {
  unitname            = "tpbigwheel",
  name                = "Stealth Tank",
  description         = "sneaky peachy zap zap",
  acceleration        = 0.1,
  bmcode              = [[1]],
  brakeRate           = 0.2,
  buildCostEnergy     = 0,
  buildCostMetal      = 600,
  builder             = false,
  buildPic            = "tpbigwheelblue.png",
  buildTime           = 30,
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[LAND VEHICLE]],
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
  defaultmissiontype  = [[Standby]],
--  explodeAs           = [[MEDIUM_UNIT]],
  footprintX          = 3,
  footprintZ          = 3,
  idleAutoHeal        = 0,  
  maneuverleashlength = [[640]],
  mass                = 200,
  maxDamage           = 600,
  maxSlope            = 45, --18
  maxVelocity         = 4,
  maxWaterDepth       = 22,
  
  movementClass       = [[Vehicle3x3]],
  crushStrength 	  = 100,
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS]],
  objectName          = [[bigwheel.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[MEDIUM_UNIT]],
  selfDestructCountdown  = 0,
  --cloaking
  --cloakCost = -1,
  --minCloakDistance    = 150,
  
  sounds			= {
	  select = {
	{file="freesound/Xythe/ghost_shadows.wav",volume=6.0},
	},
	  ok = {
--	{file="loslos",volume=6.0},
	{file="freesound/idensai-I/toasty.wav",volume=6.0},
	},
  },
--  sfxtypes            = {

--	explosiongenerators = {
--	"custom:orc_machinegun_flash",
--	"custom:orc_machinegun_muzzle",
--	},

--  },

  side                = [[GAYS]],
  sightDistance       = 450,  
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  leaveTracks         = true,
  trackOffset         = 10,
  trackStrength       = 5,
  trackStretch        = 1,
  trackType           = [[4Tracks]],
  trackWidth          = 60,
  turninplace         = 1,
  turnRate            = 800,
  turnInPlaceSpeedLimit = 6, --gabs nicht
  workerTime          = 0,
  script              = [[tpbigwheel.lua]],
  weapons             = {
	{
	def                = [[TeslaCoil]],
	onlyTargetCategory = [[LAND VEHICLE SEA BIO BUILDING]],
	badTargetCategory  = [[SEA]],
	mainDir = [[-1 0 0]],
	maxAngleDif = 90,
	},
	{
	def                = [[TeslaCoil]],
	onlyTargetCategory = [[LAND VEHICLE SEA BIO BUILDING]],
	badTargetCategory  = [[SEA]],
	mainDir = [[1 0 0]],
	maxAngleDif = 90,
	},
	{
	def                = [[TeslaCoil]],
	onlyTargetCategory = [[LAND VEHICLE SEA BIO BUILDING]],
	badTargetCategory  = [[SEA]],
	mainDir = [[0 0 1]],
	maxAngleDif = 90,
	},
	{
	def                = [[TeslaCoil]],
	onlyTargetCategory = [[LAND VEHICLE SEA BIO BUILDING]],
	badTargetCategory  = [[SEA]],
	mainDir = [[0 0 -1]],
	maxAngleDif = 90,
	},
	{
	def                = [[TeslaCoil]],
	onlyTargetCategory = [[LAND VEHICLE SEA BIO BUILDING]],
	badTargetCategory  = [[SEA]],
	},
	{
	def                = [[TeslaCoil]],
	onlyTargetCategory = [[LAND VEHICLE SEA BIO BUILDING]],
	badTargetCategory  = [[SEA]],
	},
  },

weaponDefs             = {
    TeslaCoil = {
      name                    = [[Lightning Gun]],
      areaOfEffect            = 30,
      beamWeapon              = true,
      craterBoost             = 0,
      craterMult              = 0,
      cylinderTargeting      = false,
      damage                  = {
        normal = 10,
      },
	  Accuracy				  =	110, --1500: damit trifft er dudes kaum --1100: war ganz gut als die 5 blitze noch nicht in fire arcs aufgeteilt waren.
      duration                = 100,
      explosionGenerator      = [[custom:tpelectrosplash]],	--effect on impact
      fireStarter             = 1000,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0,
      --intensity               = 12,
      interceptedByShieldType = 1,
      lineOfSight             = true,
      noSelfDamage            = true,
      --paralyzer               = true,
      --paralyzeTime            = 1,
      range                   = 400,
      reloadtime              = 0.6,
      --renderType              = 7,
      rgbColor                = [[0.5 0.3 1]],
      soundStart              = [[tp/tesla.ogg]],
      soundTrigger            = true,
      startsmoke              = [[1]],
      targetMoveError         = 0.3,
      texture1                = [[electro]],
      thickness               = 5,
      turret                  = true,
      weaponType              = [[LightningCannon]],
      weaponVelocity          = 400,
    },
  },
	customParams = {
	unitguide_text = "Magnetic cobs spread forth and spin a web, making this unit invisible to the naked eye. The same power of tesla is used to zap enemies.", 
	unitguide_goodvs = "Groups of Infantry",
	unitguide_weakvs = "Vehicles, Aircraft",
	unitguide_protip = "Enemies can not see this unit, unless they get near.",
	},  
  
}

return lowerkeys({ tpbigwheel = unitDef })