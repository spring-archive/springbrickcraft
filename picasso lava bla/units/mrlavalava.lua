local unitName = "mrlavalava"

local unitDef = {
name = "Mister Lava Lava",
Description = "boomtastic",
objectName = "mrlavalava2.s3o",
script = "mrlavalava.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 100,
buildCostEnergy = 0,
buildTime = 5,
--Health
maxDamage = 300,
idleAutoHeal = 0,
--Movement
Acceleration = 0.2,
BrakeRate = 0.3,
FootprintX = 2,
FootprintZ = 2,
MaxSlope = 15,
MaxVelocity = 5.0,
MaxWaterDepth = 20,
MovementClass = "Vehicle3x3",
TurnRate = 900,

sightDistance = 500,

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false, 

Category = [[LAND]],

OnOffable			  =true,


  weapons             = {	
		{
	    def                = [[Flamer]],
	    badTargetCategory  = [[SINK FLOAT MINERALS]],
	    onlyTargetCategory = [[LAND SINK SHIP SWIM FLOAT HOVER]],		  
		--mainDir = [[1 0 0]],
		--maxAngleDif = 300,
		--MaxAngleDif1=200;
	    },
		{
	    def                = [[Flamer]],
	    badTargetCategory  = [[SINK FLOAT MINERALS]],
	    onlyTargetCategory = [[LAND SINK SHIP SWIM FLOAT HOVER]],
		--mainDir = [[-1 0 0]],
		--maxAngleDif = 300,
		--WeaponMainDir1=[[-1 0 0]],
		--MaxAngleDif1=200;
	    },
	
	  },	
	  weaponDefs          = {		
		Flamer = {
		name                    = [[Flamer]],
		areaOfEffect            = 64,
		avoidFeature            = false,
		collideFeature          = false,
		craterBoost             = 0,
		craterMult              = 0,
		damage                  = {
			normal = 0.5,
		},
		--explosionGenerator      = [[custom:tpsmallsmoke]],
		fireStarter             = 100,
		flameGfxTime            = 1.6,
		impulseBoost            = 0,
		impulseFactor           = 0,
		intensity               = 6,
		interceptedByShieldType = 0,
		noExplode               = true,
		noSelfDamage            = true,
		groundbounce			=1,
		range                   = 500,--300
		reloadtime              = 0.16,
		sizeGrowth              = 1.5, --3
		--soundStart              = [[weapon/flamethrower]],
		soundTrigger            = true,
		sprayAngle              = 10000, --50000
		tolerance               = 8000,
		turret                  = true,
		weaponType              = [[Flame]],
		weaponVelocity          = 200,
	},

	
	  },


}

return lowerkeys({ [unitName] = unitDef })
