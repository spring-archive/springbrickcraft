local unitName = "tpoilpump"

local unitDef =
{
-- Internal settings    
        Category = "IGNORE LAND BUILDING", --IGNORE
        ObjectName = "oilpump.s3o",     
        TEDClass = "PLANT",
        script = "tpoilpump.lua",
		unitName = "tpoilpump",
        buildPic = "placeholder.png",
		capturable = true,
-- Unit limitations and properties
        Description = "Pumps sirup. Sirup is required for advanced buildings and upgrades. Use an Otis pioneer vehicle to capture.",
        MaxDamage = 2000,
        Name = "Sirup Pump",
        RadarDistance = 0,
        SightDistance = 400,
        Upright = 1,    
        levelground = 1,
		capturable = true,
		canSelfDestruct = false,
        --cost
        buildCostMetal = 1000,
        buildCostEnergy = 0,
        buildTime = 40,
        --economy
        EnergyStorage = 0,
        EnergyUse = 0,
        MetalStorage = 0,
        EnergyMake = 10, 
        MakesMetal = 0, 
        MetalMake = 2, --0
-- Pathfinding and related
        FootprintX = 8,
        FootprintZ = 10,
        MaxSlope = 10,  
        YardMap = "oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo",
		
		sfxtypes = {
			explosiongenerators = {			
			"custom:tpbuildingdeath",
			},
		},
}

return lowerkeys({ [unitName] = unitDef })
