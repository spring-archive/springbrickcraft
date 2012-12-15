local unitName = "tpwall2x2"

local unitDef =
{
-- Internal settings	
	Category = [[IGNORE LAND BUILDING]],
	ObjectName = "wall2x2_4.s3o",	
	--TEDClass = "PLANT",
	script = "tpblockwall.lua",
	buildPic = "tpwall2x2blue.png",
	iconType = "wall",
-- Unit limitations and properties
	Description = "Blocks movement",
	MaxDamage = 3000,
	crushResitance = 250,
	idleAutoHeal = 0,
	Name = "Wall",
	RadarDistance = 0,
	SightDistance = 0,
	Upright = 0,
	levelground = 0,
	--cost
	buildCostMetal = 15,--25
	buildCostEnergy = 0,
	buildTime = 5,
	--economy	
	EnergyStorage = 0,
	EnergyUse = 0,
	MetalStorage = 0,
	EnergyMake = 0, 
	MakesMetal = 0, 
	MetalMake = 0,	
	
	--Movement
	--Acceleration = 0.2,
	--MaxVelocity = 3.0,
-- Pathfinding and related
	FootprintX = 4,
	FootprintZ = 4,
	MaxSlope = 45,
	--YardMap ="ooooo occco occco occco occco",
--hitbox
collisionVolumeType = "box",
collisionVolumeScales = "63 63 63",
collisionVolumeTest = 1,	--otherwise tank projectiles pass through when fired at angles
--effects
--	explodeAs           = [[BIGUNIT_DEAD]],
-- Building	
	Builder = false,
    Reclaimable = false,
	ShowNanoSpray = false,
	CanBeAssisted = false,
	canAssist = false,
	canRestore = false,
	--workerTime = 1,
	--buildDistance = 1000,
	--terraformSpeed = 9001,
	--canrepair = false,	
	
	customParams = {	
	unitguide_text = "This is a wall. What more text do you expect here?",
	--unitguide_goodvs = "Nobody knows yet",
	--unitguide_weakvs = "Nobody knows yet",
	unitguide_protip = "Some units can shot over the wall, for example tanks.",
	}, 
}

return lowerkeys({ [unitName] = unitDef })