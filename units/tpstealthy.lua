	unitDef = {
	  unitname            = "tpstealthy",
	  name                = "Purple Death",
	  description         = "America, fuck yeah!",
	  acceleration        = 1,
	  maxVelocity         = 10,
	  turnRate            = 6000,--4200
	  turnRadius		  = 500,
	  amphibious          = false,
	  bankscale           = [[1]],
	  maxBank			  = 2,
	  maxPitch 			  = 2,
	  bmcode              = [[1]],
	  brakeRate           = 10,
	  buildCostEnergy     = 0,
	  buildCostMetal      = 600,
	  builder             = false,
	  buildPic            = [[tphubschrauberblue.png]],
	  buildTime           = 15,
	  canAttack           = true,
      canFly              = true,
	  --dontLand			  = true,--not read by engine
	  --dlHoverFactor			= 1,
	  
	  CanLoopbackAttack=1;
	  canGuard            = true,
	  canMove             = true,
	  canPatrol           = true,
	  canstop             = [[1]],
	  category            = [[AIR]],
	  collide             = true,
      cruiseAlt           = 250,
          reclaimable         = false,
	collision = true,
	  --defaultmissiontype  = [[VTOL_standby]],
	  explodeAs           = [[MEDIUM_UNIT]],
	  floater             = false,
          footprintx          = 3,
	  footprintZ          = 3,
      hoverAttack         = false,--true,
	  airHoverFactor	  = 0, --makes it not land?
	  airStrafe			  = false,
	  idleAutoHeal        = 0,
	  maneuverleashlength = [[1280]],
	  mass                = 125,
	  maxDamage           = 400,
	  minCloakDistance    = 75,
	  moverate1           = [[3]],
	  noAutoFire          = false,
	  noChaseCategory     = [[MINERALS IGNORE]],
	  objectName          = [[stealthy.s3o]],
	  scale               = [[1]],
	  seismicSignature    = 0,
	  selfDestructAs      = [[MEDIUM_UNIT]],
	  selfDestructCountdown = 0,
		Upright = false,
	  sfxtypes            = {	
	    explosiongenerators = {
		"custom:blacksmoke", --emit when crashing
		"custom:machinegun_muzzle",--mg
	    },
		pieceExplosionGenerators =
		{
		"orangesmoke",
		},	
	  },


--[[
	  sounds			= {
	      select = {		
			{ file ="airtraffic/james-uk__atc1.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc2.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc3.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc4.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc5.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc6.wav", volume=5.0 },	
	},		
	    ok = {
		"samples/check.ogg",
		},
	  },
--]]
	  side                = [[GAYS]],
	  sightDistance       = 700,--600--450
	  smoothAnim          = true,
	  steeringmode        = [[1]],
	  TEDClass            = [[VTOL]],
	  workerTime          = 0,
          script              = [[tpstealthy.lua]],
	
	  weapons             = {		
	    [1]={
	      def                = [[GatlingCannon]],
	      onlyTargetCategory = [[AIR LAND]],
	    },	
		[2]={
	      def                = [[AArockets]],	      
	      onlyTargetCategory = [[AIR]],
	    },	
--		[3]={
--	      def                = [[Bombs]],
--	      onlyTargetCategory = [[LAND]],
		  --badTargetCategory  = [[BIO AIR]],
--	    },	
	  },
	
	
	  weaponDefs          = {
		Bombs = {
		  interceptedByShieldType = 1,
	      name                    = [[Bombs]],
	      areaOfEffect            = 256,
	      avoidFeature            = false,
	      avoidFriendly           = true, --false caused teamkilling in swarms
	      burst                   = 3,
	      burstrate               = 0.2,
	      commandfire             = false,
	      craterMult              = 0.25,
	      collideFriendly         = true,
	
	      damage                  = {
			Normal = 300,
	      },	
	      dropped                 = true,
	      edgeEffectiveness       = 0.7,
	      explosionGenerator      = [[custom:tppurplemushroom]],
	      tolerance               = 64000,
	      manualBombSettings      = true,
	      model                   = [[bantimechmissile.s3o]],
	      myGravity               = 0.7,
	      range                   = 500,
		  cylinderTargeting	  = 1,
	      reloadtime              = 2,
	      --soundHit                = [[ct/shot3]],
	      sprayangle              = 64000,
	      startvelocity           = 2,
	      weaponType              = [[AircraftBomb]],
	    },
	
	    AArockets = {
	      name                    = [[Anti Air Rocket]],
	      areaOfEffect            = 25, --256
	      avoidFeature            = false,
	      avoidFriendly           = false,
	      --burst                   = 1,
	      Projectiles			  = 1,
		  --burstrate               = 0.1, --0.2
	      --commandfire             = true,
	      craterMult              = 0.4,
	      collideFriendly         = true,
	
	      damage                  = {
		Normal = 50,
	      },
			CegTag				 = "orangesmoke", --FIXME: use something unique
			model                   = [[projbullet.s3o]],
	      Accuracy				  =	0, --2000
		  dance                   = 30,
	      FixedLauncher			  = true,
		  wobble                  = 1000,
	      explosionGenerator      =  [[custom:whitesmoke]], -- [[custom:tpmissleimpact]],
	      flightTime              = 2.5,	      
	      lineOfSight             = true,
	      range                   = 1200,--800
		  --cylinderTargeting	  = 1,
	      reloadtime              = 2,
	      smokeTrail              = true,
	      soundHit                = [[kanoba/SabotHitRemake.ogg]],
	      soundStart              = [[kanoba/RockLit1Remake.ogg]],
	      BurnBlow				  = 0,
		  tolerance               = 8000,
	      tracks                  = false,--true,
	      Turnrate				  = 9000,
		  turret                  = false,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 600,
	      startVelocity           = 600,
	      weaponAcceleration      = 10,
	    },	
		
		GatlingCannon = {
	      name                    = [[Gatling Cannon]],
	      areaOfEffect            = 20,
	      burst                   = 6,
	      burstrate               = 0.08,
		  projectiles=1,
	      craterMult              = 0,
	      accuracy                = 200, --100
		  sprayangle              = 500,
	      damage                  = {
		Normal = 7, --15 --7
	      },
	
	      model                   = [[projbullet.s3o]],
	      dance                   = 2,
	      wobble                  = 2,
	      explosionGenerator      = [[custom:tpbulletimpact]],
		  cegTag				  = "tpbulletsmoketrail",
	      flightTime              = 1,
		burnBlow			= true,
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 700,
		  CylinderTargeting		  = 1,
	      reloadtime              = 0.5,
	      smokeTrail              = true,
		  fixedLauncher			  = true,
--	      soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[tpgatlingkanobaremix_softer.wav]],	      
		  tolerance               = 1000,
	      tracks                  = false,
	      turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 1000,--1500
	      startVelocity           = 1000,--1500
	      weaponAcceleration      = 100,
	    },
		
	
	  },	  

	customParams = {
	unitguide_text = "A fast aircraft", --no subtables in customParams? meh.
	unitguide_goodvs = "???",
	unitguide_weakvs = "Anti Aircraft stuff",
	unitguide_protip = "i dont even",
	}, 
	  
	  
}
	
return lowerkeys({ tpstealthy = unitDef })