local unitName = "whitevan"

local unitDef = {
name = "White Van",
Description = "Never trust the white man driving the black van.",
objectName = "Van_White.s3o",
script = "tpcivvehicle.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 500,
buildCostEnergy = 0,
buildTime = 25,
--Health
maxDamage = 1500,
idleAutoHeal = 0,

--Movement
Acceleration = 0.2,
BrakeRate = 0.3,
FootprintX = 3,
FootprintZ = 3,
--MaxSlope = 15,
MaxVelocity = 5.0,
--MaxWaterDepth = 20,
MovementClass = "Vehicle2x2",
TurnRate = 800,
TurnInPlace = false,

sightDistance = 500,
radarDistance = 1000, --radius
activateWhenBuilt = true,

Category = [[LAND VEHICLE]],

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = true,

-- weapons = {
-- [1]={name  = "rocket",
--        onlyTargetCategory = [[LAND AIR]],
--        },
-- },

}

return lowerkeys({ [unitName] = unitDef })