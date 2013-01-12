unitDef = {
  unitname               = [[tpclocky_medium]],
  name                   = "Timebomb",
  description            = [[3, 2, 1,....!]],  
  bmcode                 = [[1]],
  brakeRate              = 0.6,
  buildCostEnergy        = 0,
  buildCostMetal         = 600,
  buildPic               = [[tpclocky.png]],
  buildTime              = 100,
  canAttack              = true,
  canGuard               = true,
  canMove                = false,
  canstop                = [[1]],
  category               = [[NEUTRAL]], -- [[LAND VEHICLE]],
  --collisionVolumeOffsets = [[0 0 0]],
  --collisionVolumeScales  = [[64 64 64]],
  --collisionVolumeTest    = 1,
  --collisionVolumeType    = [[ellipsoid]],  
  --leaveTracks         = true,
  --trackOffset         = 3,
  --trackStrength       = 6,
  --trackStretch        = 1,
  --trackType           = [[StdTank]],
  --trackWidth          = 45,
 
  --designation            = [[ARM-PASPD2]],
  explodeAs              = [[boom_1]],
  fireState              = 0,
  footprintX             = 1,
  footprintZ             = 1,  
  --kamikaze               = true,
  --kamikazeDistance       = 100,
  --kamikazeUseLOS         = true,
  mass                   = 82,
  maxDamage              = 500,
  maxSlope               = 72,  
  maxWaterDepth          = 15,  
  movementClass          = [[Vehicle2x2]], --nix
  upright 				 = false, --nix
  noChaseCategory        = [[FIXEDWING LAND SINK SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName             = [[clocky_medium.s3o]],
  pushResistant          = 1,
  seismicSignature       = 4,
  selfDestructAs         = [[boom_1]],
  selfDestructCountdown  = 5,
  script              = [[tpclocky.lua]],

  weapons             = {
	{	
	  def                = "Boom",	--fake weapon, not really fired, damage is dealt by explodeAs=
	  badTargetCategory  = [[MINERAL]],
	  onlyTargetCategory = [[SWIM LAND SINK FLOAT SHIP HOVER GUNSHIP]],
	},
  },
  
weaponDefs          = {
	
	    Boom = {
	      name                    = [[Boom]],
	      areaOfEffect            = 1,
	      craterMult              = 0,
		  avoidFriendly           = 0,           
              
	      collideFriendly         = false,

	    damage                  = {
		Normal = 0.1,
		Minerals = 15, 
	      },
		  --soundStart 			  = [[kanoba/MavGun2Remake.ogg]],	      
	      lineOfSight             = true,
	      range                   = 200,
	      reloadtime              = 0.1,
	      rgbColor                = [[0.1 0.95 0.4]],
	      separation              = 2,
          size                    = 1.25,
	      stages                  = 50,
	      sprayAngle              = 1180,
	      tolerance               = 8000,
	      turret                  = true,
	      weaponType              = [[Cannon]],
	      weaponVelocity          = 750,
	      dgun=1,
		},
	
	  },      
  sightDistance          = 400,  
  steeringmode           = [[1]],
  TEDClass               = [[TANK]],  
  turninplace            = 1,
  turnRate               = 500,
  wpri_badtargetcategory = [[VTOL]],
  zbuffer                = [[1]],
}

return lowerkeys({ tpclocky_medium = unitDef })