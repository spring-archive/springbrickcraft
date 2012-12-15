local unitName = "tpwarpantenne"

local unitDef =
{
-- Internal settings	
	Category = "LAND BUILDING",
	ObjectName = "warpantenne.s3o",	
	TEDClass = "PLANT",
	script = "tpwarpantenne.lua",
	buildPic = "tpwarpantenne.png",
-- Unit limitations and properties
	Description = "enables the production of new amazing products!",
	MaxDamage = 3000, --1500
	idleAutoHeal = 0,
	AutoHeal = 0,
	Name = "Warp Coil",
	RadarDistance = 0,
	SightDistance = 400,
	Upright = 1,	
	levelground = 1,
	--cost
	buildCostMetal = 500, --2000 --1000
	buildCostEnergy = 0, --1000,--0
	buildTime = 30,
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
	FootprintX = 9,
	FootprintZ = 9,
	MaxSlope = 10,	
	YardMap ="ooooooooo ooooooooo ooooooooo ooooooooo oooocoooo ooooooooo ooooooooo ooooooooo ooooooooo",

-- Building	
	Builder = true,
    Reclaimable = false,
	ShowNanoSpray = false,
	CanBeAssisted = false,	
	workerTime = 1,
	buildDistance = 1000,
	terraformSpeed = 9001,
	buildoptions = 
	{
	"tpupgradechaindamage",
	},
	--gfx
	sfxtypes = {
	explosiongenerators = {
	"custom:tpreactorglow",
		},
	},
	--sfx
	sounds			= {
	  select = {
	{file="kw/generator.wav",volume=15.0,},
	{file="kw/stimme.wav",volume=15.0,},
	},
  },
	customParams = {  
  	unitguide_text = "blablablablablablabla", 
	--unitguide_goodvs = "Nobody knows yet",
	--unitguide_weakvs = "Nobody knows yet",
	unitguide_protip = "Build this to unlock the special factory.",
  },
}

return lowerkeys({ [unitName] = unitDef })