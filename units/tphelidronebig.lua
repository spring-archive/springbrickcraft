	unitDef = {
	  unitname            = [[tphelidronebig]],
	  name                = [[Super Slap Chop]],
	  description         = [[Suddendly, multiplication.]],
	  acceleration        = 2,
	  amphibious          = false,
	  bankscale           = [[1]],
	  maxBank			  = 1,
	  maxPitch 			  = 1,
	  bmcode              = [[1]],
	  brakeRate           = 3,
	  buildCostEnergy     = 0,
	  buildCostMetal      = 1000,
	  builder             = false,
	  buildPic            = [[tphelidrone.png]],
	  buildTime           = 25,
	  canAttack           = true,
      canFly              = true,
	  canLand			  = false,	--does nothing
	  canGuard            = true,
	  canMove             = true,
	  canPatrol           = true,
	  canstop             = [[1]],
	  category            = [[AIR]],
	  collide             = true,
	  corpse              = [[DEAD]],
      cruiseAlt           = 200,
          reclaimable         = false,
	collision = true,
	  defaultmissiontype  = [[VTOL_standby]],
	  --explodeAs           = [[MEDIUM_UNIT]],
	  floater             = false,
          footprintx          = 2,
	  footprintZ          = 2,
      hoverAttack         = true,
	  airStrafe			  = true,
	  idleAutoHeal        = 0,
	  maneuverleashlength = [[1280]],
	  mass                = 400,
	  maxDamage           = 200,
	  maxVelocity         = 3,
	  minCloakDistance    = 75,
	  moverate1           = [[3]],
	  noAutoFire          = false,
	  noChaseCategory     = [[MINERALS]],
	  objectName          = [[helidronebig.s3o]],
	  scale               = [[1]],
	  seismicSignature    = 0,
	--  selfDestructAs      = [[MEDIUM_UNIT]],
	  Upright = true,
	  sfxtypes            = {	
	    explosiongenerators = {
		"custom:tpsmokecloud",
		"custom:tpmuzzleflash_small",
	    },	
	  },


	  side                = [[GAYS]],
	  sightDistance       = 300,
	  smoothAnim          = true,
	  steeringmode        = [[1]],
	  TEDClass            = [[VTOL]],
	  turnRate            = 9001,
	  turnRadius		  = 0,
	  workerTime          = 0,
      script              = [[tphelidronebig.lua]],
	
	  weapons             = {
	    {
	      def                = [[Shotgun]],
	      badTargetCategory  = [[AIR]],
	      onlyTargetCategory = [[BIO LAND VEHICLE BUILDING SEA AIR]],
	    },	
	  },	
	  weaponDefs          = {
	  Shotgun = {
	      name                    = [[Shotgun]],
	      areaOfEffect            = 8,
	      craterMult              = 0,
	    damage                  = {
		Normal = 2,
	      },
--	      explosionGenerator      = [[custom:FLAK_BURST_Expl]],
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 200,
	      reloadtime              = 0.5,
	      rgbColor                = [[1 0.4 0.4]],
	      separation              = 2,
          size                    = 1,
	      soundStart              = [[Argh_heavy_machinegun]],
	      soundStartVolume        = 0.6,
	      soundTrigger            = true,
	      stages                  = 50,
	      sprayAngle              = 2000,
	      tolerance               = 8000,
	      turret                  = true,
	      weaponType              = [[Cannon]],
	      weaponVelocity          = 750,
		  burst                   = 1,
		  projectiles 			  = 40,
	      burstrate               = 0.08,
	    },	
	  },	
	}
	
return lowerkeys({ tphelidronebig = unitDef })