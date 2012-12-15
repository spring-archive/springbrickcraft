unitDef = {

  unitname                      = [[tpheliport]],
  name                          = [[Heli Nest]],
  description                   = [[Helicopters live here]],
  amphibious                    = false,
  acceleration                  = 0,
  bmcode                        = [[0]],
  brakeRate                     = 0,
  buildCostEnergy               = 0,
  buildCostMetal                = 800, --2000
  builder                       = true,

  buildoptions                  = {
	"tphubschrauber",
	"tptiltjet",	
  },


  buildPic                      = [[tpheliportblue.png]],
  buildTime                     = 60,
  canMove                       = true,
  canPatrol                     = true,
  canstop                       = [[1]],
  canBeAssisted                 = false,
  category                      = [[LAND BUILDING]],
--COLLISION  
  collisionVolumeOffsets        = [[0 120 0]],
  collisionVolumeScales         = [[150 195 170]],
  collisionVolumeTest           = 1,
  collisionVolumeType           = [[box]],
--  corpse                        = [[DEAD]],
  reclaimable                   = false,

  energyMake                    = 0,
  energyUse                     = 0,
  explodeAs                     = [[MEDIUM_UNIT]],
  footprintX                    = 9,
  footprintZ                    = 10,
  idleAutoHeal                  = 0,
  mass                          = 275,
  maxDamage                     = 2000,
  maxSlope                      = 15,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  metalMake                     = 0,
  minCloakDistance              = 150,
  noAutoFire                    = false,
  objectName                    = [[heliport.s3o]],
  seismicSignature              = 4,
  selfDestructAs                = [[MEDIUM_UNIT]],
  showNanoSpray                 = true,
  side                          = [[GAYS]],
  sightDistance                 = 200,


  smoothAnim                    = true,
  sortbias                      = [[0]],
  TEDClass                      = [[PLANT]],
  turnRate                      = 0,
  workerTime                    = 1,
  yardMap                       = [[ooooooooo occccccco occccccco occccccco occccccco occccccco occccccco occccccco occccccco occccccco]],
									
  script                        = [[tpheliport.lua]],
  
  	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	--unitguide_goodvs = "Nobody knows yet",
	--unitguide_weakvs = "Nobody knows yet",
	unitguide_protip = "Flying units are best used as support.",
	}, 
  
}

return lowerkeys({ tpheliport = unitDef })