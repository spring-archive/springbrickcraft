unitDef = {
  unitname            = [[tpturretcenter]],
  name                = [[Agitator]],
  description         = [[controlls defense turrets.]],
  acceleration        = 0,
  bmcode              = [[0]],
  brakeRate           = 0,
  buildCostEnergy     = 0,
  buildCostMetal      = 600, --2000
  builder             = true,
  canrepair	= false,
  ShowNanoSpray = false,
  canAssist = false,
  canRestore = false,
  buildDistance      = 150,--400
  workerTime         = 1,
 canMove=false,  
  buildoptions                  = {
  [[tpgunturret]],
--  [[tpupgradequadcannon]],	--***das ist doof weil man sie zum bauen platzieren muss
	},
  buildPic            = [[tpturretcenter.png]],
  buildTime           = 20,--25
  canAttack           = true,
  canstop             = [[1]],
  category            = [[BUILDING LAND]],  
  reclaimable         = false,  
  footprintx          = 3,
  footprintZ          = 3,
  yardMap             = [[ooo ooo ooo]],
  idleAutoHeal        = 0,
  levelGround         = false,
  mass                = 35,
  maxDamage           = 1500,
  maxSlope            = 36,
  maxVelocity         = 5,
  maxWaterDepth       = 0,
  minCloakDistance    = 150,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS FIXEDWING GUNSHIP SUB]],
  objectName          = [[turretcenter.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[SMALL_BUILDING]],
  side                = [[GAYS]],
  sightDistance       = 150, --800
  
    activateWhenBuilt             = true,
   
   onoffable                     = true,
   makesMetal = 10,
   
  radarDistance                 = 1500,



	smoothAnim          = true,
	TEDClass            = [[FORT]],
	turnRate            = 0,	
	script              = [[tpturretcenter.lua]],  
  
    sfxtypes            = {
	explosiongenerators = {
	"custom:tpbuildingdeath",
--	"custom:orc_machinegun_muzzle",
	},
	},
	
	customParams = {
	unitguide_text = "blablablablablablabla",
	unitguide_goodvs = "Everything in range of its turrets or flying drones.",
	unitguide_weakvs = "Units that go around it.",
	unitguide_protip = "Built-in radar to spot sneaky enemies.",
	},
	
	sounds = {
		select = {
			{file="freesound/ERH/radio.wav", volume=6.0},
			{file="freesound/ERH/radio2.wav", volume=6.0},			
		},
	},
}

return lowerkeys({ tpturretcenter = unitDef })