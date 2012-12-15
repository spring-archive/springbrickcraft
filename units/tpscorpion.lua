local unitName = "tpscorpion"

local unitDef = {
name = "Scorpion",
Description = "A pain in da ass!",
objectName = "scorpion.s3o",
script = "tpscorpion.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 300,
buildCostEnergy = 0,
buildTime = 20,
--Health
maxDamage = 600, --300
idleAutoHeal = 0,
mass = 200,
--Movement
Acceleration = 0.8,
BrakeRate = 0.3,
FootprintX = 3,
FootprintZ = 3,
MaxSlope = 90,
MaxVelocity = 3.0,
MaxWaterDepth = 0,
MovementClass = "Climber3x3",
TurnRate = 1500,

sightDistance = 500,

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
leaveTracks         = true,
trackOffset         = 0,
trackStrength       = 5,
trackStretch        = 3,
trackType           = [[plow]],
trackWidth          = 25,
Category = [[LAND BIO]],
noChaseCategory     = [[MINERALS LAND SINK HOVER SHIP FLOAT SUB]],

weapons = {
[1]={name  = "empspark", --"bloblauncher", --laser
	onlyTargetCategory = [[LAND VEHICLE BIO]],
	--mainDir = [[0 0 1]],
	--maxAngleDif = 180,
	},
},

	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	unitguide_goodvs = "Infantry?",
	unitguide_weakvs = "Aircraft, no idea",
	unitguide_protip = "Climb over cliffs to attack the enemy by surprise.",
	}, 
}

return lowerkeys({ [unitName] = unitDef })