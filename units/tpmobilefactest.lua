local unitName = "tpmobilefactest"

local unitDef = {
name = "Mobile Factory Test",
Description = "test lol",
objectName = "pioneer.s3o",
script = "tpmobilefactest.lua",
buildPic = "tppioneerblue.png",
--cost
buildCostMetal = 500,
buildCostEnergy = 0,
buildTime = 25,
mass = 200,
--Health
maxDamage = 1500,
idleAutoHeal = 0,

--Movement
Acceleration = 0.5,
BrakeRate = 0.3,
FootprintX = 3,
FootprintZ = 3,
--MaxSlope = 15,
MaxVelocity = 5.0,
--MaxWaterDepth = 20,
MovementClass = "Vehicle3x3",
TurnRate = 1200,

sightDistance = 500,
radarDistance = 1000, --radius
activateWhenBuilt = true,

Category = [[LAND VEHICLE]],



CanGuard = false,
CanMove = true,
CanPatrol = true,
CanStop = true,


LeaveTracks = true,
--for pumps
	canCapture = true,
	captureSpeed = 3, --workerTime

  sounds			= {
	select = {
		{file="n64/wasgibtscommander.wav",volume=10.0},
		{file="n64/wasgibtscommander.wav",volume=10.0},
		{file="n64/wasgibtscommander.wav",volume=10.0},
			
		{file="n64/4anschluesse.wav",volume=10.0},		
		{file="n64/controllerpack.wav",volume=10.0},
		{file="n64/frequenzkontrolle.wav",volume=10.0},
		{file="n64/istdaseinangriff.wav",volume=10.0},
		{file="n64/sicherheitsstufe.wav.wav",volume=10.0},
	},
	  ok = {
		{file="n64/sicherheitsstufe.wav.wav",volume=10.0},
	},
	build = {
		{file="n64/captainschauensiemal.wav",volume=10.0},
	},
  },

    sfxtypes            = {
	explosiongenerators = {
	"custom:tpcapturebeam",
	},
	},
  
-- weapons = {
-- [1]={name  = "rocket",
--        onlyTargetCategory = [[LAND AIR]],
--        },
-- },

	customParams = {	
	unitguide_text = "Construct Companion Cubes to expand your base. Capture sirup pumps to gain resources for new technologic.",
	unitguide_goodvs = "blabla",
	unitguide_weakvs = "blabla",
	unitguide_protip = "blabla",
	}, 

}

return lowerkeys({ [unitName] = unitDef })