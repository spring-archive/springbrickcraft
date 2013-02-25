unitDef = {
  unitname            = [[tpgunturret]],
  name                = "Whisk Turret",
  description         = [[Pew Pew! BOOM!]],
  acceleration        = 0,
  bmcode              = [[0]],
  brakeRate           = 0,
  buildCostEnergy     = 0,
  buildCostMetal      = 300, --500
  builder             = false,
  buildPic            = [[tpgunturretblue.png]],
  buildTime           = 15,
  canAttack           = true,
  canstop             = [[1]],
  category            = [[LAND BUILDING]],
  corpse              = [[DEAD]],
  reclaimable         = false,
  explodeAs           = [[SMALL_BUILDING]],
  footprintx          = 3,
  footprintZ          = 3,
  idleAutoHeal        = 0,
  levelGround         = false,
  mass                = 35,
  maxDamage           = 750,
  maxSlope            = 36,
  maxVelocity         = 0,
  maxWaterDepth       = 0,
  minCloakDistance    = 150,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS]],
  objectName          = [[gunturret.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[SMALL_BUILDING]],
  side                = [[NKG]],
  sightDistance       = 400,

  
	smoothAnim          = true,
	TEDClass            = [[FORT]],
	turnRate            = 0,
	orkerTime          = 0,
	yardMap             = [[ooo ooo ooo]],
	script              = [[tpgunturret.lua]],

  weapons             = {
	{
	  def                = [[Gun]],
	  badTargetCategory  = [[MINERALS AIR]],
	  onlyTargetCategory = [[LAND VEHICLE SEA BIO BUILDING AIR]],
	},
  },
  weaponDefs          = {
	Gun = {
	name                    = [[Automatic Gun]],
	interceptedByShieldType = 1,
	areaOfEffect            = 8,
	craterMult              = 0.25,
	damage                  = {
		Normal = 75,			--50
		},
	explosionGenerator      = "custom:tpturretorangehit", -- "custom:tporangeimpact_small",
	lineOfSight             = true,
	AvoidFeature		    = false,
	range                   = 450,
	reloadtime              = 1, --0.4
	--rgbColor                = [[0.8 0.95 0.8]], -- [[1 0.95 0.1]]
	color                = [[0.8 0.95 0.8]], -- [[1 0.95 0.1]]
	separation              = 2,
	size                    = 2,
	soundStart              = "freesound/marcuslee/lasercannon.wav",
	soundStartVolume        = 0.7,
	soundTrigger            = true,
	stages                  = 50,
	sprayAngle              = 100,
	tolerance               = 8000,
	turret                  = true,
	weaponType              = [[Cannon]],
	weaponVelocity          = 900,
	},

  },
  
    sfxtypes            = {
	explosiongenerators = {
	"custom:tpmuzzleflash",
--	"custom:orc_machinegun_muzzle",
	},
	},
	
	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	unitguide_goodvs = "everything in range",
	unitguide_weakvs = "everything outside range",
	unitguide_protip = "Each turret comes with a flying helicopter drone, for free!",
	},

		sounds = {
		select = {
			{file="freesound/alex41/are-you-still-there.wav", volume=6.0},
			{file="freesound/alex41/danger.wav", volume=6.0},
			{file="soundcloud/williamdavidjohn/whatdothesebuttonsdo.wav", volume=6.0},
		},
	},
	
}

return lowerkeys({ tpgunturret = unitDef })
