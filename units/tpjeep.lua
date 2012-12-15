unitDef = {
  unitname            = [[tpjeep]],
  name                = [[Rough Rider]],
  description         = [[rougher than usual]],
  acceleration        = 0.8, --0.2
  bmcode              = [[1]],
  brakeRate           = 0.5, --0.2 --0.05--0.2->wenn man s drückt rutscht er noch ziemlich viel
  buildCostEnergy     = 0,
  buildCostMetal      = 200,--100 war sehr billig..
  builder             = false,
  buildPic            = [[tpjeepblue.png]],
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
	  collisionVolumeTest       =  1,	
	  collisionVolumeOffsets    =  [[0 0 0]],  --positiv = nach oben
	  collisionVolumeType       =  [[box]],	   --box
	  collisionVolumeScales     =  [[40 20 55]],--40 25 55
	  --collisionVolumeScales		= [[25 10 50]],
	  --collisionVolumeOffsets	= [[-30 0 -5]],
	  
  ----------
  --TRANSPORT--
  isTransport = true,
  ReleaseHeld = true,		--transported units survive if transporter dies
  HoldSteady = true,		--transported units tilt and turn like the transporter
  TransportCapacity = 1,    --The number of units the transport can carry
  transportSize = 10000,
  TransportMass = 50,
  transportUnloadMethod = 2,
  canload             = [[1]],
  isfireplatform=1,   
  -------------
  defaultmissiontype  = [[Standby]],
--  explodeAs           = [[MEDIUM_UNIT]],
  footprintX          = 3,
  footprintZ          = 3,
  idleAutoHeal        = 0,  
  maneuverleashlength = [[640]],
  mass                = 200,
  maxDamage           = 300,
  maxSlope            = 45, --18
  maxVelocity         = 5.5, --20, --(was 5) script sets it lower so upgrade can increase it again http://springrts.com/mantis/view.php?id=2877
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[Vehicle3x3]],
  --crushStrength 	  = 100,
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS]],
  objectName          = [[jeep.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[MEDIUM_UNIT]],

  sounds			= {
	  select = {
	{file="freesound/acclivity/muststayonpath.wav",volume=6.0},
	{file="freesound/104432_wrongnumber.wav",volume=6.0},
	{file="freesound/104432_thisis912.wav",volume=6.0},
	},
	  ok = {
	{file="samples/loslos.wav",volume=6.0},
	{file="freesound/acclivity/youmusthurry.wav",volume=6.0},
	{file="freesound/128528_justgettingstarted.wav",volume=6.0},
	{"Argh_TankSound",volume=6.0},
	},
  },

  sfxtypes            = {
	explosiongenerators = {
	"custom:tpmuzzleflash_jeep",
	},
  },

  side                = [[GAYS]],
  sightDistance       = 450,
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  leaveTracks         = true,
  trackOffset         = -3,
  trackStrength       = 6,
  trackStretch        = 1,
  trackType           = [[StdTank]],
  trackWidth          = 34,
  turninplace         = 0,
  turnRate            = 1000,--800,
  --turnInPlaceSpeedLimit = 6, --gabs nicht
  workerTime          = 0,
	  script              = [[tpjeep.lua]],

  weapons             = {
	{
	  def                = [[Gatling]],
	  onlyTargetCategory = [[LAND BUILDING BIO SHIP SWIM AIR]], --AIR war nicht
	  badTargetCategory  = [[AIR BUILDING VEHICLE]],
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
		  cylinderTargeting =1, --war nicht
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
  
	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	unitguide_goodvs = "Infantry",
	unitguide_weakvs = "Vehicles",
	unitguide_protip = "Can transport dudes.",
	},
}

return lowerkeys({ tpjeep = unitDef })