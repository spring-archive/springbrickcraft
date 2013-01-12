unitDef = {

  unitname                      = [[tpsmallfac]],
  name                          = [[Block Barracks]],
  description                   = [[recruit new dudes. mostly fat ones.]],
  amphibious                    = false,
  acceleration                  = 0,
  bmcode                        = [[0]],
  brakeRate                     = 0,
  buildCostEnergy               = 0,
  buildCostMetal                = 150,
  builder                       = true,
  moveState 						= 1,
  buildoptions                  = {	
	[[tpdude]],	
	[[tpheavydude]],
  },

  buildPic                      = [[tpsmallfacblue.png]],
  buildTime                     = 20,
  canMove                       = true,
  canPatrol                     = true,
  canstop                       = [[1]],
  canBeAssisted                 = false,
  category                      = [[BUILDING LAND]],
--COLLISION  
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[65 70 65]],
  collisionVolumeTest           = 1,
  collisionVolumeType           = [[box]],
  corpse                        = "f_cubedebris_s",
  reclaimable                   = false,

  energyMake                    = 0,
  energyUse                     = 0,
  explodeAs                     = [[MEDIUM_UNIT]],  
  idleAutoHeal                  = 0,
  mass                          = 275,
  maxDamage                     = 1500, --750
  maxSlope                      = 15,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  metalMake                     = 0,
  minCloakDistance              = 150,
  noAutoFire                    = false,
  objectName                    = [[smallfac.s3o]],

  seismicSignature              = 4,
  selfDestructAs                = [[MEDIUM_UNIT]],
  showNanoSpray                 = false,
  side                          = [[GAYS]],
  sightDistance                 = 200,

	  sounds			= {
	      select = {
		{file="freesound/13743_morsecode.wav",volume=5.0},
		},

	  },
  --ground decal  
  useBuildingGroundDecal =true,
  buildingGroundDecalType = "grounddecal_factory.png",
  buildingGroundDecalSizeX = 5,
  buildingGroundDecalSizeY = 10,
  
  TEDClass                      = [[PLANT]],
  turnRate                      = 0,
  workerTime                    = 1,
  footprintX                    = 4,
  footprintZ                    = 7, --4
  yardMap                       = [[oooo occo occo occo occo yyyy yyyy]], --oooo occo occo occo occo yyyy yyyy yyyy
  script                        = [[tpsmallfac.lua]],

    sfxtypes = {
	explosiongenerators = {
	"custom:whitesmoke",
	"custom:tpbuildingdeath",
		},
	},
	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	--unitguide_goodvs = "Nobody knows yet",
	--unitguide_weakvs = "Nobody knows yet",
	unitguide_protip = "Having multiple barracks allows you to pump out units faster.",
	},	
}
return lowerkeys({ tpsmallfac = unitDef })