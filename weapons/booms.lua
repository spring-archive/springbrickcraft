--weapons that are just explosionen. for selfdestruct and scripting lols
booms = {  
boom_1 = {
   name="boom_1",
   --rendertype=4,
   --ballistic=1,
   --turret=1,
   impulseFactor = 1,
   range=480,
   --reloadtime=3.6,
   --weaponvelocity=600,
   areaofeffect=300,
   --craterMult = 10,
--   soundstart="golgotha/old_generic.wav",
--   soundhit="golgotha/old_generic.wav",
   explosiongenerator="custom:tphe",
	damage = {
		Normal = 1000,
		default = 10,	--krater
	    },
  },
}

return lowerkeys(booms)