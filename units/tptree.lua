--tree that falls over
unitDef = {
  unitname                      = [[tptree]],
  name                          = [[Tree]],
  description                   = [[its big and green and at the top.]],
  --isfeature						= true,
  acceleration                  = 0,
  activateWhenBuilt             = true,
  bmcode                        = [[0]],
  brakeRate                     = 0,
  buildCostEnergy               = 1,
  buildCostMetal                = 1,
  builder                       = false,
  iconType           		= "empty",
  buildPic                      = [[tree.png]],
  buildTime                     = 1,
  canattack                     = [[false]],
  category                      = [[NEUTRAL]],

  reclaimable                   = false,
  repairable			= false,
  energyUse                     = 0,    
  floater                       = false,
  footprintX                    = 1,
  footprintZ                    = 1,
  yardMap                       = [[oo oo]],
  idleAutoHeal                  = 0,
  levelGround                   = false,
  mass                          = 37.5,
  maxDamage                     = 400,
  hidedamage					= true,
  maxSlope                      = 255,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  minCloakDistance              = 150,
  decloakDistance			  = 0,
  noAutoFire                    = false,
  objectName                    = [[tree.s3o]], --tree.s3o
  onoffable                     = true,
  seismicSignature              = 4,
  selfDestructAs                = [[ROCK_MINEDOUT]],
  side                          = [[GAYS]],
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
  script                        = [[tptree.lua]],
    customParams = {
  	is_mineable=1,		--used by minig: if the unit is a mineable resource
	},
}
return lowerkeys({ tptree = unitDef })