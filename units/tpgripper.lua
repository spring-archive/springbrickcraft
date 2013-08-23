unitDef = {
  unitname            = [[tpgripper]],
  name                = [[Big Dipper]],
  description         = [[Mines minerals, brings them to the Master Cube for money]],
  acceleration        = 0.08,
  bmcode              = [[1]],
  brakeRate           = 0.2,
  buildCostEnergy     = 0,
  buildCostMetal      = 1500,--2000
  builder             = false,
  buildPic            = [[tpgripperblue2.png]],
  buildTime           = 25,	--50
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[LAND VEHICLE]],
  reclaimable         = false,
--COLLISION  
  --collisionVolumeOffsets        = [[0 0 -20]],  --rechts/link	hoch/runter		vor/zurück
  --collisionVolumeScales         = [[60 60 60]],
  --collisionVolumeTest           = 1,
  --collisionVolumeType           = [[box]],
  ----------
  defaultmissiontype  = [[Standby]],
  FireState			  = 0,
  explodeAs           = [[MEDIUM_UNIT]],
  footprintX          = 4,
  footprintZ          = 4,
  idleAutoHeal        = 0,  
  maneuverleashlength = [[640]],
  mass                = 200,
  maxDamage           = 3000,
  maxSlope            = 45,--18
  maxVelocity         = 3,
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[Vehicle4x4]],
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[LAND VEHICLE AIR BIO BUILDING SEA]],
  objectName          = [[gripper.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[MEDIUM_UNIT]],

  --wall building	
--	Builder = true,
    Reclaimable = false,
--	ShowNanoSpray = false,
--	CanBeAssisted = false,
--	canAssist = false,
--	canRestore = false,
--	workerTime = 1,
--	buildDistance = 175,
--	terraformSpeed = 9001,
--	canrepair = false,
--	buildoptions = 
--	{
--	"tpwall2x2",
--	},
  
  sounds			= {
	  select = {
	{file="freesound/Xythe/eng_whatyouwant.wav",volume=10.0},
	--"samples/kristalle.wav",
	},
	  ok = {
	{file="samples/yea.wav",volume=10.0},
	{file="freesound/Xythe/eng_gatherres.wav",volume=10.0},
	{file="freesound/Xythe/eng_mining.wav",volume=10.0},	
	{file="freesound/Xythe/eng_yeayearight.wav",volume=10.0},		
	},
  },

  sfxtypes            = {
	explosiongenerators = {
	"custom:tpflyingmineralshard",
--	"custom:orc_machinegun_muzzle",
	},
  },

  side                = [[GAYS]],
  sightDistance       = 300, --250
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  leaveTracks         = true,
  trackOffset         = 3,
  trackStrength       = 6,
  trackStretch        = 4.5,
  trackType           = [[wideTracks_sep]],
  trackWidth          = 60,
  turninplace         = 1,
  turnRate            = 1000,
  workerTime          = 0,
  script              =  [[tpgripper.lua]],

  weapons             = {
	{
	  onlyTargetCategory = [[MINERALS]],
	  def                = [[Drill]],	  
	},

  },
  	  weaponDefs          = {	
	    Drill = {
	      name                    = [[Drill]],
	      --areaOfEffect            = 1,		  
	      craterMult              = 0,
		  avoidFriendly           = 0,           
              
	      collideFriendly         = false,

	    damage                  = {
		--Normal = 0.1,
		minerals = 666,--10, --100
	      },
		  impactOnly			  = true,	--war nicht
	      explosionGenerator      = "custom:tpflyingmineralshard",
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 130,
	      reloadtime              = 0.2,
	      rgbColor                = [[0.1 0.95 0.4]],
	      separation              = 2,
          size                    = 1.25,
--	      soundStart              = [[machine_gun]],
	      soundStartVolume        = 0.5,
	      soundTrigger            = true,
	      stages                  = 50,
	      sprayAngle              = 0,
	      tolerance               = 8000,
	      turret                  = true,
	      weaponType              = [[Cannon]],
	      weaponVelocity          = 300,--750
		  --myGravity = 0, --war nicht
		},
	
	  },
	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	unitguide_goodvs = "Minerals!",
	unitguide_weakvs = "everything else.",
	unitguide_protip = "Protect your harvester.",
	}, 	  
	  
}

return lowerkeys({ tpgripper = unitDef })