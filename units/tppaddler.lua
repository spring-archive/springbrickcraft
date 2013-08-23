local unitName = "tppaddler"

local unitDef = {
name = "Paddler",
Description = "",
objectName = "paddler.s3o",
script = "tppaddler.lua",

--Health
maxDamage = 1000,
idleAutoHeal = 0,
Category = [[VEHICLE WATER]],

--hitbox
collisionVolumeType       =  [[box]],
collisionVolumeOffsets	= [[0 -10 0]],
collisionVolumeScales		= [[59 45 110]],
collisionVolumeTest       =  1,	


--Movement
Acceleration = 0.2,
BrakeRate = 0.02,
FootprintX = 5,
FootprintZ = 5,
floater = true,
TEDClass  = [[SHIP]],
MovementClass = "Ship5x5",
turninplace = false,
--MaxSlope = 15,
MaxVelocity = 2.0,
--MaxWaterDepth = 20,
TurnRate = 600,

sightDistance = 700,

mass = 9,

Builder = false,
CanAttack = true,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false, 
  noChaseCategory     = [[MINERALS]],
weapons = {
[1]={name  = "dualcannon",
	onlyTargetCategory = [[VEHICLE BUILDING BIO LAND]],
	mainDir = [[0 0 1]],
	maxAngleDif = 260,
	},
[2]={name  = "singlecannon",
	mainDir = [[0 0 -1]],
	maxAngleDif = 270,
	onlyTargetCategory = [[VEHICLE BUILDING BIO AIR]],
	},
},

sfxtypes = {
	explosiongenerators = {
	"custom:whitesmoke",
	"custom:tpmuzzleflash",
		},
	},
	customParams = {	
	unitguide_text = "blablablablablablabla", --no subtables in customParams? meh.
	unitguide_goodvs = "Nobody knows yet",
	unitguide_weakvs = "Nobody knows yet",
	unitguide_protip = "blub blub",
	},
	
  sounds = {
	  select = {
		{file="freesound/qubodup/169741_comein.wav", volume=6.0,},
		{file="freesound/qubodup/169741_hereiam.wav", volume=6.0,},
		{file="freesound/qubodup/169741_what.wav", volume=6.0,},
		{file="freesound/qubodup/169741_ready.wav", volume=6.0,},
		},
	  ok = {
		{file="freesound/qubodup/169741_affirmative.wav", volume=6.0,},
		{file="freesound/qubodup/169741_OnMyWay.wav", volume=6.0,},
		{file="freesound/qubodup/169741_ComeIn.wav", volume=6.0,},
		},
	},	

}

return lowerkeys({ [unitName] = unitDef })