local featureDef  =  {
   name           = "f_cubedebris_l",
   blocking       = true,
   --HITBOX--
   collisionVolumeTest       =  1,
   --collisionVolumeOffsets    =  [[0 30 0]],
   --collisionVolumeType       =  [[sphere]],
   --collisionVolumeScales     = [[5]],  -- [[20 30 20]],
   category       = "Debris",
   
   damage            = 3000,--any of those will work
   mass				= 50,
   description       = "Nothing here remains",
   energy            = 1,
--   featuredead       = "doesthistreeturnintoanotherfeaturewhenitdies?ifsonamethenewfeaturehere",  
   flammable         = 1,
   footprintX        = 6,
   footprintZ        = 6,
   upright           = false,
   height            = 36,
   object            = "1piece/cubedebris_l.s3o", --tree.s3o
   reclaimable       = false,
   autoreclaimable      = false,  
   world          = "All Worlds",
}
return lowerkeys({[featureDef.name] = featureDef})