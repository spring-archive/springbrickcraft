unitDef = {
  unitname            = [[tpdrill]],
  name                = [[Anteater]],
  description         = [[mines for resources'n shit.]],
  acceleration        = 0.08,
  bmcode              = [[1]],
  brakeRate           = 0.2,
  buildCostEnergy     = 0,
  buildCostMetal      = 2000,
  builder             = false,
  buildPic            = [[tpdrillblue.png]],
  buildTime           = 12,
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[LAND]],
  corpse              = [[DEAD]],
  reclaimable         = false,
--COLLISION  
  collisionVolumeOffsets        = [[0 0 -20]],  --rechts/link	hoch/runter		vor/zurück
  collisionVolumeScales         = [[60 60 60]],
  collisionVolumeTest           = 1,
  collisionVolumeType           = [[box]],
  ----------
  defaultmissiontype  = [[Standby]],
  FireState			  = 0,
  explodeAs           = [[MEDIUM_UNIT]],
  footprintX          = 4,
  footprintZ          = 4,
  idleAutoHeal        = 0,
  leaveTracks         = true,
  maneuverleashlength = [[640]],
  mass                = 110,
  maxDamage           = 3000,
  maxSlope            = 18,
  maxVelocity         = 2,
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[Vehicle4x4]],
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS LAND SINK HOVER SHIP FLOAT SUB NORMAL]],
  objectName          = [[drill.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[MEDIUM_UNIT]],


--  sfxtypes            = {

--	explosiongenerators = {
--	"custom:orc_machinegun_flash",
--	"custom:orc_machinegun_muzzle",
--	},

--  },

  side                = [[GAYS]],
  sightDistance       = 500,
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  trackOffset         = 3,
  trackStrength       = 6,
  trackStretch        = 1,
  trackType           = [[StdTank]],
  trackWidth          = 44,
  turninplace         = 1,
  turnRate            = 800,
  workerTime          = 0,
  script              =  [[tpdrill.lua]],

  weapons             = {
	{
	  onlyTargetCategory = [[MINERALS]],
	  def                = [[Drill]],
	  
	},

  },


  	  weaponDefs          = {
	
	    Drill = {
	      name                    = [[Drill]],
	      areaOfEffect            = 1,
	      craterMult              = 0,
		  avoidFriendly           = 0,           
              
	      collideFriendly         = false,

	    damage                  = {
		Normal = 0.1,
		Minerals = 15, 
	      },
	
--	      explosionGenerator      = [[custom:FLAK_BURST_Expl]],
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 75,
	      reloadtime              = 1.0,
	      rgbColor                = [[0.1 0.95 0.4]],
	      separation              = 2,
          size                    = 1.25,
--	      soundStart              = [[machine_gun]],
	      soundStartVolume        = 0.5,
	      soundTrigger            = true,
	      stages                  = 50,
	      sprayAngle              = 1180,
	      tolerance               = 8000,
	      turret                  = true,
	      weaponType              = [[Cannon]],
	      weaponVelocity          = 750,
	      dgun=1,
		},
	
	  },




  featureDefs         = {

	DEAD  = {
	  description      = [[Wreckage - Block drill]],
	  blocking         = false,
	  category         = [[corpses]],
	  damage           = 825,
	  energy           = 0,
	  featureDead      = [[DEAD2]],
	  featurereclamate = [[SMUDGE01]],
	  footprintX       = 2,
	  footprintZ       = 2,
	  height           = [[4]],
	  hitdensity       = [[100]],
	  metal            = 88,
	  object           = [[bgenericwreckage.s3o]],
	  reclaimable      = true,
	  reclaimTime      = 15,
	  seqnamereclamate = [[TREE1RECLAMATE]],
	  world            = [[All Worlds]],
	},


	DEAD2 = {
	  description      = [[Debris - Anti-Air Buggy]],
	  blocking         = false,
	  category         = [[heaps]],
	  damage           = 550,
	  energy           = 0,
	  featurereclamate = [[SMUDGE01]],
	  footprintX       = 3,
	  footprintZ       = 3,
	  height           = [[4]],
	  hitdensity       = [[100]],
	  metal            = 44,
	  object           = [[b3x3heap.s3o]],
	  reclaimable      = true,
	  reclaimTime      = 15,
	  seqnamereclamate = [[TREE1RECLAMATE]],
	  world            = [[All Worlds]],
	},

  },

}

return lowerkeys({ tpdrill = unitDef })