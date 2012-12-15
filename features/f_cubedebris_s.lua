local featureDef  =  {
   name           = "f_cubedebris_s",
   blocking       = true,
   --HITBOX--
   collisionVolumeTest       =  1,
   --collisionVolumeOffsets    =  [[0 30 0]],
   --collisionVolumeType       =  [[sphere]],
   --collisionVolumeScales     = [[5]],  -- [[20 30 20]],
   category       = "Debris",
   maxdamage            = 1,--any of those will work
   damage            = 1,--any of those will work
   maxhealth            = 1,--any of those will work
   mass				= 50,
   description       = "fragments of what used to be",
   energy            = 1,
--   featuredead       = "doesthistreeturnintoanotherfeaturewhenitdies?ifsonamethenewfeaturehere",  
   flammable         = 1,
   footprintX        = 2,
   footprintZ        = 2,
   upright           = false,
   height            = 36,
   object            = "1piece/cubedebris_s.s3o", --tree.s3o
   reclaimable       = false,
   autoreclaimable      = false,  
   world          = "All Worlds",
}
return lowerkeys({[featureDef.name] = featureDef})