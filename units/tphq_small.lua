local unitName = "tphq_small"

local unitDef =
{
-- Internal settings	
	Category = [[LAND BUILDING]], ---**naja building?
	ObjectName = "3x3cube_small.s3o",	
	TEDClass = "PLANT",
	script = "tphq_small.lua",
	buildPic = "placeholder.png",
-- Unit limitations and properties
	Description = "expand your base with this smaller version of the Master Cube",
	MaxDamage = 2500,
	idleAutoHeal = 0,
	Name = "Companion Cube",
	RadarDistance = 0,
	SightDistance = 1000,
	Upright = 1,	
	levelground = 1,
	--cost
	buildCostMetal = 500,
	buildCostEnergy = 0,
	buildTime = 20,
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
	FootprintX = 7,
	FootprintZ = 7,
	MaxSlope = 20,	
	--YardMap ="ooooo occco occco occco occco",
--hitbox
collisionVolumeType = "box",
collisionVolumeScales = "110 115 110",
--effects
	explodeAs           = [[BIGUNIT_DEAD]],
-- Building	
	Builder = true,
    Reclaimable = false,
	ShowNanoSpray = false,
	CanBeAssisted = false,
	canAssist = false,
	canRestore = false,
	workerTime = 1,
	buildDistance = 600,--500
	terraformSpeed = 9001,
	canrepair = false,
	buildoptions = 
	{
	"tpsmallfac",
	"tpfactory2",	
	"tpturretcenter",
	"tpheliport",
	"tpwarpantenne",
	"tpplatefactory",
	"tpwall2x2",
	--"tpgripper",
	},
	
	customParams = {	
	unitguide_text = "blablablablablablabla",
	--unitguide_goodvs = "Nobody knows yet",
	--unitguide_weakvs = "Nobody knows yet",
	unitguide_protip = "Protect this!",
	}, 
}

return lowerkeys({ [unitName] = unitDef })