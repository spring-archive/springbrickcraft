local unitName = "tpshovermouse"

local unitDef = {
name = "Swoosher",
Description = "Light scout and attack hovercraft",
objectName = "hovermouse.s3o",
script = "tpshovermouse.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 250,
buildCostEnergy = 0,
buildTime = 22,
--Health
maxDamage = 300,
idleAutoHeal = 0,

--Movement
Acceleration = 0.2,
BrakeRate = 0.3,
FootprintX = 3,
FootprintZ = 3,
--MaxSlope = 15,
MaxVelocity = 6.0,
--MaxWaterDepth = 20,
MovementClass = "Hover3x3",
canHover = true,
TurnRate = 900,
maxReverseVelocity  = 3.0,

sightDistance = 650,

Category = [[VEHICLE LAND]],

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false, 

  sfxtypes            = {
	explosiongenerators = {
	"custom:tpredgroundflash",
	},

  },
  
  weapons             = {	
	    {
	    def                = [[redrockets]],
	    badTargetCategory  = [[BIO]],
	    onlyTargetCategory = [[LAND VEHICLE BIO BUILDING SHIP]],
	    },
	
	  },	
	  weaponDefs = {	
	    redrockets = {
	      name                    = "Hype Missile Launcher",
	      areaOfEffect            = 50, --200
	      burst                   = 2,
	      burstrate               = 0.4,
	      craterMult              = 0,
	      accuracy                = 500,	
	      damage                  = {
			Normal = 45,
	      },
		  CegTag				 = "tpredlighttrail",
	      model                   = "projdoublecone.s3o",
	      --dance                   = 0,
	      --wobble                  = 75,
	      explosionGenerator      = [[custom:tpballimpact]],
	      flightTime              = 8,
		  burnBlow 				  = true,
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 500,
	      reloadtime              = 2.7,
	      smokeTrail              = false,
	      soundHit                = [[tp/pluckexplosion.wav]],
	      soundStart              = [[kanoba/Torpedo1Remake.ogg]],
	      soundStartVolume        = 2,
		  tolerance               = 200,
	      tracks                  = true,
	      Turnrate				  = 30000,
		  FixedLauncher			  = false,
		  TrajectoryHeight		  = 6, --2
		  turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 700,
	      startVelocity           = 450,
	      weaponAcceleration      = 10,
	    },
		},

  sounds = {
	  select = {
	{file="freesound/racerobot/196845_autopilot.wav",volume=4.0},
	},
	  ok = {
	{file="freesound/racerobot/196847_collision-course.wav",volume=4.0},
	{file="freesound/racerobot/196863_full-speed.wav",volume=4.0},
	{file="freesound/racerobot/196886_engage.wav",volume=4.0},
	},
  },
		

}

return lowerkeys({ [unitName] = unitDef })