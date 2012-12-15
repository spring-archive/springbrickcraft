local featureDef  =  {
   name           = "f_tptree",
   blocking       = true,
   --HITBOX--
   collisionVolumeTest       =  1,
   collisionVolumeOffsets    =  [[0 30 0]],
   collisionVolumeType       =  [[sphere]],
   collisionVolumeScales     = [[5]],  -- [[20 30 20]],
   category       = "Tree",
   maxdamage            = 1,--any of those will work
   damage            = 1,--any of those will work
   maxhealth            = 1,--any of those will work
   mass				= 50,
   description       = "Tree",
   energy            = 1,
--   featuredead       = "doesthistreeturnintoanotherfeaturewhenitdies?ifsonamethenewfeaturehere",  
   flammable         = 1,
   footprintX        = 1,
   footprintZ        = 1,
   upright           = true,
   height            = 36,
   object            = "1piece/tree.s3o", --tree.s3o
   reclaimable       = true,
   autoreclaimable      = true,  
   world          = "All Worlds",
}
return lowerkeys({[featureDef.name] = featureDef})