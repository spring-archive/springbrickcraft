unitDef = {
  unitname            = [[tptiltjet]],
  name                = [[Drop Ship]],
  description         = "Take a trip, Drop out",
  acceleration        = 2,--0.2
  amphibious          = false,
  bankscale           = [[1]],
  maxBank			  = 0.2,
  maxPitch 			  = 0.2,
  bmcode              = [[1]],
  brakeRate           = 3.75,
  buildCostEnergy     = 0,
  buildCostMetal      = 600,
  builder             = false,
  buildPic            = "tptiltjetblue.png",
  buildTime           = 25,
  canAttack           = true,
  canFly              = true,
  --dontLand			  = true,--not read by engine
  --dlHoverFactor			= 1,
  canCrash		      = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[AIR]],
  collide             = true,
  corpse              = [[DEAD]],
  cruiseAlt           = 150, --200
  reclaimable         = false,
  collision = true,
  --collisionVolumeOffsets = [[0, -80, 0]],
  --defaultmissiontype  = [[VTOL_standby]],
  explodeAs           = [[MEDIUM_UNIT]],
  floater             = false,
  footprintx          = 5,
  footprintZ          = 5,
  hoverAttack         = true,
  airHoverFactor	  = 0, --makes it not land?
  airStrafe			  = false,
  idleAutoHeal        = 0,  
  mass                = 125,
  maxDamage           = 800,
  maxVelocity         = 5.5,--4
  minCloakDistance    = 75,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS]],
  objectName          = [[tiltjet.s3o]],  
  seismicSignature    = 0,
  selfDestructAs      = [[MEDIUM_UNIT]],
  Upright = true,
  verticalSpeed = 3,--engine default:3 ---100: annyoing superbopping
  ---transport
  loadingRadius = 500,--300 --350, until spring91.0 made transport collide with passenger..
  unloadSpread = 2,
  fallSpeed = 5,
  transportUnloadMethod =1,
  transportMass = 24*9, 
  transportSize = 10,--1,     --The size of units that the transport can pick up, in terms of the passengers footprintX. 
  transportCapacity = 9, --The total number of units that the transport can pick up, with each unit multiplied by it's footprintX size.
  releaseHeld = true,
  ------------
  sfxtypes            = {

	explosiongenerators = {
	"custom:tpjet",
	"custom:blacksmoke", --emit when crashing
	},

  },



  sounds			= {
	  select = {
	{file="samples/whoisthis.wav",volume=6.0},
	{file="freesound/ERH/whatlocation.wav",volume=6.0},
--	{file="freesound/shawshank73/95702_bumpy-ride.wav",volume=6.0},	
	},
	  ok = {
	{file="samples/check.ogg",volume=6.0},
	{file="freesound/alphahog/47148_hmmmhmmmhm.wav",volume=6.0},	
	},
  },

  side                = [[GAYS]],
  sightDistance       = 700,--600--450
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[VTOL]],
  turnRate            = 800,
  turnRadius		  = 5,
  workerTime          = 0,
	  script              = [[tptiltjet.lua]],

--  weapons             = {		
--	{
--	  def                = [[Rockets]],	      
--	  onlyTargetCategory = [[LAND AIR WATER VEHICLE BUILDING BIO]],
--	  badTargetCategory  = [[BIO AIR]],
--	},
--  },


  weaponDefs          = {
	Bombs = {
	  name                    = [[Bombs]],
	  areaOfEffect            = 256,
	  avoidFeature            = false,
	  avoidFriendly           = false,
	  burst                   = 3,
	  burstrate               = 0.2,
	  commandfire             = true,
	  craterMult              = 0.25,
	  collideFriendly         = true,

	  damage                  = {
		Normal = 300,
	  },	
	  dropped                 = true,
	  edgeEffectiveness       = 0.7,
	  explosionGenerator      = [[custom:PLASMA_Expl]],
	  tolerance               = 64000,
	  manualBombSettings      = true,
	  model                   = [[bantimechmissile.s3o]],
	  myGravity               = 0.7,
	  range                   = 500,
	  cylinderTargeting	  = 1,
	  reloadtime              = 2,
	  --soundHit                = [[ct/shot3]],
	  sprayangle              = 64000,
	  startvelocity           = 2,
	  weaponType              = [[AircraftBomb]],
	},

	Rockets = {
	  name                    = "Rockets",
	  areaOfEffect            = 200, --256
	  avoidFeature            = false,
	  avoidFriendly           = false,
	  burst                   = 2,
	  Projectiles			  = 2,
	  burstrate               = 0.3, --0.2
	  --commandfire             = true,
	  craterMult              = 0.4,
	  collideFriendly         = true,

	  damage                  = {
	Normal = 40,
	  },
		CegTag				 = "tpshocktrail", --"tpmisslesmoke",
		model                   = [[projmedium.s3o]],
	  Accuracy				  =	0, --2000
	  dance                   = 30,
	  FixedLauncher			  = true,
	  wobble                  = 1000,
	  explosionGenerator      =  [[custom:tpexplocloud]], -- [[custom:tpmissleimpact]],
	  flightTime              = 2.5,	      
	  lineOfSight             = true,
	  range                   = 350, --500
	  cylinderTargeting	  = 1,
	  reloadtime              = 2.5, --1.5
	  smokeTrail              = true,
	  soundHit                = [[kanoba/SabotHitRemake.ogg]],
	  soundStart              = [[kanoba/RockLit1Remake.ogg]],
	  BurnBlow				  = 0,
	  tolerance               = 16000,
	  tracks                  = false,
	  Turnrate				  = 12000, --16000: trifft quasi immer  10000:trifft etwas zu schlecht
	  turret                  = true,
	  weaponType              = [[MissileLauncher]],
	  weaponVelocity          = 1500,
	  startVelocity           = 100,
	  weaponAcceleration      = 150,
	},	
	
  },
  customParams = {
	unitguide_text = "blablablablablablabla", 
	--unitguide_goodvs = "Nobody knows yet",
	--unitguide_weakvs = "Nobody knows yet",
	unitguide_protip = "Use the dropship to sneak-attack unsuspecting harvesters.",
	},
  
}

return lowerkeys({ tptiltjet = unitDef })