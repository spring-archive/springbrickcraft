unitDef = {
  unitname            = [[tpkeyframer]],
  name                = [[lego car]],
  description         = [[vrmm vrmm]],
  acceleration        = 0.6,
  bmcode              = [[1]],
  brakeRate           = 0.2,
  buildCostEnergy     = 0,
  buildCostMetal      = 100,
  builder             = false,
  buildPic            = [[tpkeyframerblue.png]],
  buildTime           = 12,
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[LAND]],
  corpse              = [[DEAD]],
  reclaimable         = false,
  --HITBOX--
	  collisionVolumeTest       =  1,	
	  collisionVolumeOffsets    =  [[0 0 0]],  --positiv = nach oben
	  collisionVolumeType       =  [[box]],	  
	  ollisionVolumeScales     =  [[40 25 55]],  
  ----------
  --TRANSPORT--
  isTransport = true,
  ReleaseHeld = true,		--transported units survive if transporter dies
  HoldSteady = true,		--transported units tilt and turn like the transporter
  TransportCapacity = 1,    --The number of units the transport can carry
  transportSize = 10000,
  TransportMass = 50,
  transportUnloadMethod = 2,
  canload             = [[1]],
  isFirebase = true,
  Firebase = true,
  IsFirebase = true,
  isfireplatform=1,
  -------------
  defaultmissiontype  = [[Standby]],
--  explodeAs           = [[MEDIUM_UNIT]],
  footprintX          = 3,
  footprintZ          = 3,
  idleAutoHeal        = 0,
  leaveTracks         = true,
  maneuverleashlength = [[640]],
  mass                = 110,
  maxDamage           = 300,
  maxSlope            = 18,
  maxVelocity         = 6,
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[MedTANK]],
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS LAND SINK HOVER SHIP FLOAT SUB]],
  objectName          = [[medium tank.s3o]], --legocar.s3o
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
  trackWidth          = 15,
  turninplace         = 0,
  turnRate            = 1000,
  workerTime          = 0,
	  script              = [[tpkeyframerus.lua]],

  weapons             = {

	{
	  def                = [[Gatling]],
	  onlyTargetCategory = [[LAND SINK SHIP SWIM FLOAT HOVER]],
	  badTargetCategory  = [[SINK FLOAT MINERALS]],

	},

  },


  	  weaponDefs          = {
	
	    Gatling = {
	      name                    = [[Gatling]],
	      areaOfEffect            = 8,
	      craterMult              = 0.25,
	
	    damage                  = {
		Normal = 15,
	      },
	
--	      explosionGenerator      = [[custom:FLAK_BURST_Expl]],
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 350,
	      reloadtime              = 0.4,
	      rgbColor                = [[1 0.95 0.4]],
	      separation              = 2,
          size                    = 1.25,
	      soundStart              = [[Argh_heavy_machinegun]],
	      soundStartVolume        = 0.8,
	      soundTrigger            = true,
	      stages                  = 50,
	      sprayAngle              = 300, --1180
	      tolerance               = 8000,
	      turret                  = true,
	      weaponType              = [[Cannon]],
	      weaponVelocity          = 750,
	    },
	
	  },




  featureDefs         = {

	DEAD  = {
	  description      = [[Wreckage - Block legocar]],
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

return lowerkeys({ tpkeyframer = unitDef })