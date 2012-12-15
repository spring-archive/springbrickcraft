unitDef = {

  unitname                      = [[tpkristall2]],
  name                          = [[Mineral Field]],
  description                   = [[Harvest for money]],
  acceleration                  = 0,
  activateWhenBuilt             = true,
  bmcode                        = [[0]],
  brakeRate                     = 0,
  buildCostEnergy               = 1,
  buildCostMetal                = 1,
  builder                       = false,
  iconType           		= "resource",
  buildPic                      = [[bmex.png]],
  buildTime                     = 1,
  canattack                     = [[false]],
  category                      = [[MINERALS]],

  reclaimable                   = false,
  repairable					= false,
  energyUse                     = 0,
  explodeAs                     = [[ROCK_MINEDOUT]],
  extractsMetal                 = 0.000,
  floater                       = false,
  footprintX                    = 3,
  footprintZ                    = 3,
  --HITBOX--
	  collisionVolumeTest       =  1,	
	  collisionVolumeOffsets    =  [[0 0 0]],  --positiv = nach oben
	  collisionVolumeType       =  [[box]],
	  collisionVolumeScales     =  [[50 15 50]],
  ----------
  --  hideDamage                    = true,
  idleAutoHeal                  = 0,
  levelGround                   = false,
  mass                          = 37.5,
  maxDamage                     = 200,
  hidedamage					= 0,
  maxSlope                      = 255,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  minCloakDistance              = 150,
  decloakDistance			  = 0,
  noAutoFire                    = false,
  objectName                    = [[kristall2.s3o]],  -- [[bmeteor_impact.s3o]],

  onoffable                     = true,
  seismicSignature              = 4,
  selfDestructAs                = [[ROCK_MINEDOUT]],
  side                          = [[NKG]],
  sightDistance                 = 0,

	  sfxtypes            = {
	
	    explosiongenerators = {
		"custom:digdig",
	    },
	
	  },



  smoothAnim                    = true,
  TEDClass                      = [[METAL]],
  turnRate                      = 0,

  waterline                     = 1,
  workerTime                    = 0,
  yardMap                       = [[CCC CCC CCC]],
  script                        = [[kristall2.lua]],  --  [[kristall2.lua]],
    customParams = {
  	is_mineable=1,		--used by minig: if the unit is a mineable resource
	},
}



return lowerkeys({ tpkristall2 = unitDef })