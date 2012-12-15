unitDef = {

  unitname                      = [[tptetra]],
  name                          = [[Mineral]],
  description                   = [[gotta mine these minerals. bitches love minerals.]],
  acceleration                  = 0,
  activateWhenBuilt             = true,
  bmcode                        = [[0]],
  brakeRate                     = 0,
  buildCostEnergy               = 1,
  buildCostMetal                = 1,
  builder                       = false,
  iconType           		= "resource",
  buildPic                      = [[tetra.png]],
  buildTime                     = 1,
  canattack                     = [[false]],
  category                      = [[MINERALS]],

  reclaimable                   = false,
  repairable			= false,
  energyUse                     = 0,
  explodeAs                     = [[ROCK_MINEDOUT]],
  extractsMetal                 = 0.000,
  floater                       = false,
  footprintX                    = 2,
  footprintZ                    = 2,
  idleAutoHeal                  = 0,
  levelGround                   = false,
  mass                          = 37.5,
  maxDamage                     = 2000, --4000
  hidedamage					= 0,
  maxSlope                      = 255,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  minCloakDistance              = 150,
  decloakDistance			  = 0,  
  objectName                    = [[tetra.s3o]],  -- [[bmeteor_impact.s3o]],

  onoffable                     = true,
  seismicSignature              = 4,
  selfDestructAs                = [[ROCK_MINEDOUT]],
  side                          = [[GAYS]],
  sightDistance                 = 0,
  
  --makes unit non blocking by engine hardcodeness
  --http://springrts.com/mantis/view.php?id=2818
  --kamikaze               = true,
  --kamikazeDistance       = 1,
  --kamikazeUseLOS         = true,
  
  --https://github.com/spring/spring/commit/56220b1669adbdb67e59b8734166e441e98afad8
  blocking = false,

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
  yardMap                       = [[oo oo]],
  script                        = [[tptetra.lua]],
    customParams = {
  	is_mineable=1,		--used by minig: if the unit is a mineable resource
	},
}
return lowerkeys({ tptetra = unitDef })