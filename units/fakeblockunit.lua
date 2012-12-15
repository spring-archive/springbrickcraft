unitDef = {
  unitname               = [[fakeblockunit]],
  name                   = [[Fake]],
  acceleration           = 0,
  brakeRate              = 0,
  buildCostEnergy        = 1, --1000000,
  buildCostMetal         = 1, --1000000,
  builder                = false,
  iconType               = "empty",
  buildTime              = 1000000,
  canAttack              = false,
  capturable             = false,
  collisionVolumeOffsets = [[0 -10 0]],
  collisionVolumeScales  = [[1 1 1]],
  collisionVolumeType    = [[ellipsoid]],
  footprintX             = 1,
  footprintZ             = 1,
  idleAutoHeal           = 0,
  idleTime               = 1800,
  isFeature              = false,
  levelGround            = false,
  mass                   = 500000,
  maxDamage              = 1000000,
  maxSlope               = 255,
  maxVelocity            = 0,
  minCloakDistance       = 0,
  objectName             = [[20empty.s3o]],
  reclaimable            = false,
  script                 = [[nullscript.lua]],
  side                   = [[ARM]],
  sightDistance          = 0,
  airSightDistance		 = 0,
  stealth                = true,
  turnRate               = 0,
  upright                = false,
  workerTime             = 0,
  category				 = [[IGNORE]],
  power 				 = 1,--0 causes warning
  
  yardMap                = [[oooo]],
}

return lowerkeys({ fakeblockunit = unitDef })
