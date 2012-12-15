local unitName = "tpslinger_mobile"

local unitDef = {
name = "Mobile Slinger",
Description = "Wzz-Wuuuish!",
objectName = "slinger_mobile.s3o",
script = "tpslinger_mobile.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 500,
buildCostEnergy = 0,
buildTime = 25,
mass = 200,
--Health
maxDamage = 800,
idleAutoHeal = 0,

--Movement
Acceleration = 1,
BrakeRate = 2,
FootprintX = 3,
FootprintZ = 3,
--upright= true,
--MaxSlope = 15,
MaxVelocity = 4.0,
--MaxWaterDepth = 20,
MovementClass = "Vehicle3x3",
TurnRate = 1200,

sightDistance = 600,
--radarDistance = 1000, --radius
--activateWhenBuilt = true,

Category = [[LAND VEHICLE]],

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = true,
noChaseCategory     = [[MINERALS AIR]],
 weapons = {
 [1]={name  = "ballgun",
        onlyTargetCategory = [[LAND AIR]],
        },
 },

}

return lowerkeys({ [unitName] = unitDef })