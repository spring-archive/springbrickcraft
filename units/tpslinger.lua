local unitName = "tpslinger"

local unitDef = {
name = "Slinger",
Description = "wzzz-wuuuish!",
objectName = "slinger.s3o",
script = "tpslinger.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 500,
buildCostEnergy = 0,
buildTime = 25,
--Health
maxDamage = 500,
idleAutoHeal = 0,

--Movement
Acceleration = 1,
BrakeRate = 0.3,
FootprintX = 3,
FootprintZ = 3,
upright= true,
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