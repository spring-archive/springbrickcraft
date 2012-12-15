unitDef = {
  unitname                      = [[tpfactory2]],
  name                          = [[Vehicle Factory]],
  description                   = [[Builds Vehicles]],
  amphibious                    = false,
  acceleration                  = 0,
  bmcode                        = [[0]],
  brakeRate                     = 0,
  buildCostEnergy               = 0,
  buildCostMetal                = 800,
  builder                       = true,

  buildoptions                  = {
	[[tpjeep]],
	[[tptank]],
	[[tpvierling]],
	[[tpgripper]],
--	[[tpupgradewheels]],
-- [[tpupgradechaindamage]],
--	[[tpupgradetanks]],
	[[tpupgradequadcannon]],
	[[tppioneer]],
--	[[tplaunchbox]],
--	[[tpheavytank]],
--	[[tpdrill]],
--	[[tpdude]],
--	[[tpheavydude]],
--	[[tpbigwheel]],
  },

  buildPic                      = [[tpfactory2.png]],
  buildTime                     = 35,
  canMove                       = true,
  canPatrol                     = true,
  canstop                       = [[1]],
  canBeAssisted                 = false,
  category                      = [[LAND BUILDING]],
--COLLISION  
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[150 180 150]],
  collisionVolumeTest           = 1,
  collisionVolumeType           = [[box]],
--  corpse                        = [[DEAD]],
  reclaimable                   = false,

  energyMake                    = 0,
  energyUse                     = 0,
  explodeAs                     = [[MEDIUM_UNIT]],
  footprintX                    = 9,
  footprintZ                    = 14, --10
  idleAutoHeal                  = 0,
  mass                          = 275,
  maxDamage                     = 2000,
  maxSlope                      = 15,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  metalMake                     = 0,
  minCloakDistance              = 150,
  noAutoFire                    = false,
  objectName                    = [[factory2.s3o]],

  seismicSignature              = 4,
  selfDestructAs                = [[MEDIUM_UNIT]],
  showNanoSpray                 = false,
  side                          = [[GAYS]],
  sightDistance                 = 200,
--ground decal  
  useBuildingGroundDecal =true,
  buildingGroundDecalType = "grounddecal_factory.png",
  buildingGroundDecalSizeX = 13,--9
  buildingGroundDecalSizeY = 18,--14


  smoothAnim                    = true,
  sortbias                      = [[0]],
  TEDClass                      = [[PLANT]],
  turnRate                      = 0,
  workerTime                    = 1,
--  yardMap                       = [[ooooooooo occccccco occccccco occccccco occccccco occccccco occccccco occccccco occccccco occccccco ccccccccc ccccccccc ccccccccc ccccccccc]],
  yardMap                       = [[ooooooooo occccccco occccccco occccccco occccccco occccccco occccccco occccccco occccccco occccccco yyyyyyyyy yyyyyyyyy yyyyyyyyy yyyyyyyyy]],
									
  script                        = [[tpfactory2.lua]],
  
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
	unitguide_protip = "Make multiple factories to pump out units faster.",
	}, 
}



return lowerkeys({ tpfactory2 = unitDef })