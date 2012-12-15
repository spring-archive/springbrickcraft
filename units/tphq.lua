local unitName = "tphq"

local unitDef =
{
-- Internal settings	
	Category = [[LAND BUILDING]], ---**naja building?
	ObjectName = "3x3cube.s3o",	
	TEDClass = "PLANT",
	script = "tphq.lua",
	buildPic = "placeholder.png",
-- Unit limitations and properties
	Description = "orders the construction of structures",
	MaxDamage = 5000,
	idleAutoHeal = 0,
	Name = "Master Cube",
	RadarDistance = 0,
	SightDistance = 1000,
	Upright = 1,	
	levelground = 1,
	--cost
	buildCostMetal = 2000,
	buildCostEnergy = 0,
	buildTime = 25,
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
	FootprintX = 15,
	FootprintZ = 15,
	MaxSlope = 10,	
	--YardMap ="ooooo occco occco occco occco",
--hitbox
collisionVolumeType = "box",
collisionVolumeScales = "190 230 190",	--"220 230 220": einheiten können reinclippen und sind umverwundbar
--effects
	explodeAs           = [[BIGUNIT_DEAD]],
	corpse = "f_cubedebris_l",
-- Building	
	Builder = true,
    Reclaimable = false,
	ShowNanoSpray = false,
	CanBeAssisted = false,
	canAssist = false,
	canRestore = false,
	workerTime = 1,
	buildDistance = 1000,
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