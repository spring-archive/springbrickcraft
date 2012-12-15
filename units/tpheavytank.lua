unitDef = {
  unitname            = [[tpheavytank]],
  name                = [[Blocker]],
  description         = [[Bam, total devastation!]],
  acceleration        = 1,
  bmcode              = [[1]],
  brakeRate           = 1,
  buildCostEnergy     = 0,
  buildCostMetal      = 800,
  builder             = false,
  buildPic            = [[tpheavytankblue.png]],
  buildTime           = 40,
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
  --OnOffable			  =true,  --ON: mobile, OFF: bunker
  --	  explodeAs           = [[MEDIUM_UNIT]],
  footprintx          = 4,
  footprintZ          = 4,  
  leaveTracks         = true,
  trackOffset         = 3,
  trackStrength       = 6,
  trackStretch        = 4.5,
  trackType           = [[wideTracks_sep]],
  trackWidth          = 60,
  maneuverleashlength = [[640]],
  mass                = 225,
  maxDamage           = 2000,--war 2500 aber jetzt kann er sich ja einbunkern
  autoHeal 			 = 0,
  idleTime 			  = 300,
  idleAutoHeal        = 10,
  
  maxSlope            = 18,
  maxVelocity         = 2.5,
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[Vehicle4x4]],
  crushStrength 	  = 100,
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS BIO AIR]],
  objectName          = [[blocktank.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[SMALL_UNIT]],

		
  sfxtypes            = {

	explosiongenerators = {
	"custom:tpmuzzleflash_frag",
	"custom:tpfireburst",
--		"custom:tpdirtdigging",
	},

  },

  sounds			= {
	  select = {
	--"Argh_TankSound",
	{file="freesound/Xythe/brute_showgun.wav",volume=6.0},
	{file="freesound/Xythe/brute_yeaq.wav",volume=6.0 },
	{file="freesound/Xythe/brute_he.wav",volume=6.0 },
	{file="freesound/Xythe/brute_he.wav",volume=6.0 },
	{file="freesound/Xythe/brute_he.wav",volume=6.0 },
	{file="freesound/jamesduckett/evillaugh.wav",volume=6.0 },
	{file="freesound/128528_fastdeath.wav",volume=7.0},
	},
	  ok = {
	{file="freesound/Xythe/brute_moving.wav",volume=6.0 },
	{file="freesound/Xythe/brute_np.wav",volume=6.0 },
	{file="freesound/Xythe/brute_rightaway.wav",volume=6.0 },
	},
  },

  side                = [[GAYS]],
  sightDistance       = 400,	--300
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  turninplace         = 1,
  turnRate            = 550,
  workerTime          = 0,
	  script              = [[tpheavytank.lua]],
--CanDgun=1,

  weapons             = {
	{
	  def                = [[Cannon]],
	  badTargetCategory  = [[MINERALS AIR]],
	  onlyTargetCategory = [[LAND VEHICLE BIO BUILDING]],
	},
  },


  weaponDefs          = {
	Cannon = {
--CommandFire=true,	
	name                    = "Heavy Tank Cannon",
	  areaOfEffect            = 200,
	  burst                   = 1,
	  burstrate               = 0.08,
	  craterMult              = 0.25,
	  accuracy                = 100,

	  damage                  = {
	Normal = 300,--100 --200
	  },

	  model                   = [[projbig.s3o]],
	  dance                   = 2,
	  wobble                  = 2,
	  explosionGenerator      = [[custom:tpexplosive]],
	  CegTag				 = "tpcannon_trail",
	  flightTime              = 4,
	  interceptedByShieldType = 1,
	  lineOfSight             = true,
	  range                   = 400, --300 -400
	  reloadtime              = 2.5, --2
	  smokeTrail              = true,
	  --soundHit                = [[argh/Argh_LargeExplosion]],
	  soundStart              = [[kanoba/Canlite3Remake.ogg]],
	  tolerance               = 8000,
	  tracks                  = false,
	  turret                  = true,
	  weaponType              = [[MissileLauncher]],
	  weaponVelocity          = 1000, --1500
	  startVelocity           = 1000, --1500
	  TrajectoryHeight		  = 0.2, --gabs nicht
	  weaponAcceleration      = 100,
	},

  },
	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	unitguide_goodvs = "Everything",
	unitguide_weakvs = "Aircraft",
	unitguide_protip = "Slow speed means most units can run away.",
	}, 
}


return lowerkeys({ tpheavytank = unitDef })
