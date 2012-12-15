local unitName = "tpplatefactory"

local unitDef =
{
-- Internal settings    
        Category = "LAND BUILDING",
        ObjectName = "platefactory.s3o",     
        TEDClass = "PLANT",
        script = "tpplatefactory.lua",
        buildPic = "tpplatefactory.png",
-- Unit limitations and properties
        Description = "Constructs highly powered units",
        MaxDamage = 2000,
		idleAutoHeal        = 0,  
        Name = "High Capacity Plant",
        RadarDistance = 0,
        SightDistance = 400,    
        Upright = 1,    
        levelground = 1,
        --cost
        buildCostMetal = 800,	--2000
        buildCostEnergy = 0,
        buildTime = 30, --30
        --economy
        EnergyStorage = 0,
        EnergyUse = 0,
        MetalStorage = 0,
        EnergyMake = 0, 
        MakesMetal = 0, 
        MetalMake = 0,  
-- Pathfinding and related
        FootprintX = 10,
        FootprintZ = 8,
        MaxSlope = 10,  
        YardMap = "occcccccco occcccccco occcccccco occcccccco occcccccco occcccccco occcccccco occcccccco",		
--ground decal  
		useBuildingGroundDecal =true,
		buildingGroundDecalType = "grounddecal_factory.png",
		buildingGroundDecalSizeX = 11,
		buildingGroundDecalSizeY = 9,
-- Building     
        Builder = true,
    Reclaimable = false,
        ShowNanoSpray = true,
        CanBeAssisted = false,  
        workerTime = 1,
        buildoptions = 
        {
        "tpbigwheel",
		"tplaunchbox",
		"tpheavytank",
		"tppioneer",
        },
	customParams = {	
	unitguide_text = "blablablablablablabla",
	--unitguide_goodvs = "Nobody knows yet",
	--unitguide_weakvs = "Nobody knows yet",
	unitguide_protip = "The units in this factory are special.",
	}, 
		
}

return lowerkeys({ [unitName] = unitDef })
