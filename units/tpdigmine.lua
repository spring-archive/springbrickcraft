local unitName = "tpdigmine"

local unitDef = {
name = "Dirt Torpedo",
Description = "wtf",
objectName = "mine.s3o",
script = "tpdigmine.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 500,
buildCostEnergy = 0,
buildTime = 25,
--Health
maxDamage = 20,
idleAutoHeal = 0,

--Movement
Acceleration = 0.9,
BrakeRate = 0.3,
FootprintX = 1,
FootprintZ = 1,
turnInPlace = true,
MaxSlope = 90,
MaxVelocity = 5.0,
--MaxWaterDepth = 20,
MovementClass = "Climber1x1",
TurnRate = 5000,

sightDistance = 800,
Category = [[MINE LAND]],
noChaseCategory     = [[MINERALS MINE AIR]],
maneuverleashlength = 800,

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,

leaveTracks         = true,
trackOffset         = 0,
trackStrength       = 6,
trackStretch        = 1,
trackType           = [[plow]],
trackWidth          = 20,

weapons             = {
[1] ={
  def                = [[JumpAttack]],
  badTargetCategory  = [[MINERALS BUILDING]],
  onlyTargetCategory = [[BIO AIR VEHICLE LAND]],
},
[2] ={
  def                = [[targetlaser]],
  badTargetCategory  = [[MINERALS]],
  onlyTargetCategory = [[BIO AIR VEHICLE BUILDING LAND]],
},

},

weaponDefs          = {
JumpAttack = {
  name                    = [[JumpAttack]],
  areaOfEffect            = 100, --25 
  craterMult              = 0.25,
  accuracy                = 5000,--100
  damage                  = {
	Normal = 300,
	NoMineDamage = 25,
  },
  CegTag				 = "tpmisslesmoke",
  model                   = "projmine.s3o",
  --model                   = "turretcenter.s3o",
  --dance                   = 200,
  wobble                  = 200,
  explosionGenerator      = [[custom:tpfiresplash]],
  flightTime              = 0.75,
  interceptedByShieldType = 1,
  lineOfSight             = true,
  range                   = 150,
  reloadtime              = 1.0,
  smokeTrail              = true,
  soundHit                = [[argh/Argh_LargeExplosion]],
  soundStart              = [[kanoba/Torpedo1Remake.ogg]],
  soundStartVolume        = 2,
  tolerance               = 8000,
  tracks                  = false,--true
  Turnrate				  = 26000, --16000 26000
  FixedLauncher			  = false,
  TrajectoryHeight		  = 0.25, --2
  turret                  = true,
  weaponType              = [[MissileLauncher]],
  weaponVelocity          = 300,
  startVelocity           = 300,
  weaponAcceleration      = 10,
  targetBorder            = 1,
  },
targetlaser = {
	name                    = [[Targeting Laser]],
	areaOfEffect            = 8,
	avoidFriendly           = false,
	beamTime                = 0.2,
	craterMult              = 0.25,
	accuracy                = 0,
	collideFriendly         = true,
	energypershot           = 0,
	damage                  = {
		default = 0,
		normal = 0,
	},
	--	explosionGenerator      = [[custom:resmining]],	
	lineOfSight             = true,
	range                   = 600,
	reloadtime              = 0.2,
	rgbColor                = [[0 1 0]],
	separation              = 2,
	thickness               = 1,
	minIntensity            = 1,
	size                    = 0.4,
	--soundStart              = [[tp/swoosh]],
	--soundStartVolume        = 0.5,
	--soundTrigger            = true,
	stages                  = 50,
	targetBorder            = 0,
	tolerance               = 8000,
	turret                  = true,
	weaponType              = [[BeamLaser]],
	weaponVelocity          = 2500,
	cylinderTargeting	  = 1,
	},

},

sfxtypes            = {

	explosiongenerators = {	
		"custom:tpdirtdigging",
		"custom:tpgroundglow",
		
	},

  },

}

return lowerkeys({ [unitName] = unitDef })