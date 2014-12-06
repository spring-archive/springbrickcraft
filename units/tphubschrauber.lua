	unitDef = {	
	  unitname            = [[tphubschrauber]],
	  name                = [[Mongoose]],
	  description         = [[the mongoose flies and has special rockets]],
	  acceleration        = 0.2,
	  amphibious          = false,
	  bankscale           = [[1]],
	  maxBank			  = 0.2,
	  maxPitch 			  = 0.2,
	  bmcode              = [[1]],
	  brakeRate           = 3.75,
	  buildCostEnergy     = 0,
	  buildCostMetal      = 900,
	  builder             = false,
	  buildPic            = [[tphubschrauberblue.png]],
	  buildTime           = 25,
	  canAttack           = true,
      canFly              = true,
	  --dontLand			  = true,--not read by engine
	  --dlHoverFactor			= 1,
	  canCrash		    = true,
	  canGuard            = true,
	  canMove             = true,
	  canPatrol           = true,
	  canstop             = [[1]],
	  category            = [[AIR]],
	  collide             = true,
      cruiseAlt           = 150, --200
          reclaimable         = false,
	collision = true,
	  --defaultmissiontype  = [[VTOL_standby]],
	  explodeAs           = [[MEDIUM_UNIT]],
	  floater             = false,
          footprintx          = 3,
	  footprintZ          = 3,
      hoverAttack         = true,
	  airHoverFactor	  = 0, --makes it not land?
	  airStrafe			  = false,
	  idleAutoHeal        = 0,
	  maneuverleashlength = [[1280]],
	  mass                = 125,
	  maxDamage           = 750, --500
	  maxVelocity         = 4,
	  minCloakDistance    = 75,
	  moverate1           = [[3]],
	  noAutoFire          = false,
	  noChaseCategory     = [[MINERALS IGNORE]],
	  objectName          = [[hubschrauber.s3o]],
	  scale               = [[1]],
	  seismicSignature    = 0,
	  selfDestructAs      = [[MEDIUM_UNIT]],
	  selfDestructCountdown = 0,
		Upright = true,
	  sfxtypes            = {	
	    explosiongenerators = {
		"custom:blacksmoke", --emit when crashing
		"custom:machinegun_muzzle",--mg
	    },
		pieceExplosionGenerators =
		{
		"blacksmoke",
		},	
	  },



	  sounds			= {
	      select = {
		{file="freesound/95663_radio-cleared-for-the-option.wav",volume=6.0 },
		  --[[
		  -- error: has data length 291939 greater than actual data length 56160
			{ file ="airtraffic/james-uk__atc1.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc2.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc3.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc4.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc5.wav", volume=5.0 },	
			{ file ="airtraffic/james-uk__atc6.wav", volume=5.0 },	
			--]]
	},		
	    ok = {
		"samples/check.ogg",
		{file="freesound/67644_radio-im-engaging.wav",volume=6.0 },		
		{file="freesound/95670_radio-expedite.wav",volume=6.0 },		
		},
	  },

	  side                = [[GAYS]],
	  sightDistance       = 700,--600--450
	  smoothAnim          = true,
	  steeringmode        = [[1]],
	  TEDClass            = [[VTOL]],
	  turnRate            = 693,
	  turnRadius		  = 5,
	  workerTime          = 0,
      script              = "tphubschrauber.lua",
	
	  weapons             = {		
	    {
	      def                = [[Rockets]],	      
	      onlyTargetCategory = [[LAND AIR WATER VEHICLE BUILDING BIO]],
		  badTargetCategory  = [[BIO AIR]],
	    },
		
	
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
	      commandfire             = true,
	      craterMult              = 0.25,
	      collideFriendly         = true,
	
	      damage                  = {
			Normal = 300,
	      },	
	      dropped                 = true,
	      edgeEffectiveness       = 0.7,
	      explosionGenerator      = [[custom:PLASMA_Expl]],
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
	
	    Rockets = {
	      name                    = [[Rockets]],
	      areaOfEffect            = 200, --256
	      avoidFeature            = false,
	      avoidFriendly           = false,
	      burst                   = 4,
	      Projectiles			  = 2,
		  burstrate               = 0.3, --0.2
	      --commandfire             = true,
	      craterMult              = 0.4,
	      collideFriendly         = true,
	
	      damage                  = {
		Normal = 40,
	      },
			CegTag				 = "tpshocktrail", --"tpmisslesmoke",
			model                   =  [[projmedium.s3o]],
	      Accuracy				  =	1000, --2000
		  dance                   = 10,
	      FixedLauncher			  = true,
		  wobble                  = 100,
	      explosionGenerator      =  [[custom:tpexplocloud]], -- [[custom:tpmissleimpact]],
	      flightTime              = 20,
	      lineOfSight             = true,
	      range                   = 500, --500
		  cylinderTargeting	  = 1,
	      reloadtime              = 5, --1.5
	      smokeTrail              = true,
	      soundHit                = [[kanoba/SabotHitRemake.ogg]],
	      soundStart              = [[kanoba/RockLit1Remake.ogg]],
	      BurnBlow				  = 0,
		  tolerance               = 16000,
	      tracks                  = true,
	      Turnrate				  = 32000, --TEST original: 12000, --16000: trifft quasi immer  10000:trifft etwas zu schlecht
		  turret                  = false,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 750,
	      startVelocity           = 100,
	      weaponAcceleration      = 150,
	    },	
		
	
	  },
	  
	  featureDefs         = {
		DEAD  = {
			  description      = [[crashed Helicopter]],
			  blocking         = true,
			  category         = [[corpses]],
			  damage           = 2250,
			  energy           = 0,		  
			  footprintX       = 7,
			  footprintZ       = 16,
			  mass             = 2000,
			  metal            = 150,
			  object           = [[hubschrauber.s3o]],
			  reclaimable      = true,
			  reclaimTime      = 4500,
			},
		},

	customParams = {
	unitguide_text = "Heavily armed attack helicopter", --no subtables in customParams? meh.
	unitguide_goodvs = "Buildings, Vehicles, Aircraft",
	unitguide_weakvs = "Infantry, Dragonaut, Drones",
	unitguide_protip = "When attacked, escape over cliffs where ground units can not follow.",
	}, 
	  
	  
}
	
return lowerkeys({ tphubschrauber = unitDef })