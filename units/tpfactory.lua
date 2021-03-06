unitDef = {

  unitname                      = [[tpfactory]],
  name                          = [[Block Factory]],
  description                   = [[Constructs Blocks]],
  amphibious                    = false,
  acceleration                  = 0,
  bmcode                        = [[0]],
  brakeRate                     = 0,
  buildCostEnergy               = 0,
  buildCostMetal                = 800,
  builder                       = true,
	moveState =1,
  buildoptions                  = {
	[[tpdrill]],
	[[tpdude]],
	[[tpjeep]],
	[[tptank]],
	[[tpvierling]],
	[[tpupgradewheels]],
--	[[tpupgradetanks]],
	[[tphubschrauber]],
	[[tpupgradequadcannon]],
  },



--  buildPic                      = [[tpfactory.png]],
  buildTime                     = 60,
  canMove                       = true,
  canPatrol                     = true,
  canstop                       = [[1]],
  canBeAssisted                 = false,
  category                      = [[SINK]],
--COLLISION  
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[150 170 170]],
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
  objectName                    = [[factory.s3o]],

  seismicSignature              = 4,
  selfDestructAs                = [[MEDIUM_UNIT]],
  showNanoSpray                 = false,
  side                          = [[GAYS]],
  sightDistance                 = 600,


  smoothAnim                    = true,
  sortbias                      = [[0]],
  TEDClass                      = [[PLANT]],
  turnRate                      = 0,
  workerTime                    = 1,
  yardMap                       = [[ooooooooo occccccco occccccco occccccco occccccco occccccco occccccco occccccco occccccco occccccco]],
									
  script                        = [[tpfactory.lua]],
}



return lowerkeys({ tpfactory = unitDef })