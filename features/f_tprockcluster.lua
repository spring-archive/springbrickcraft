local featureDef  =  {
   name           = "f_tprockcluster",
   blocking       = true,
   category       = "Tree",
   maxdamage            = 10000,
   hideDamage = true,
   damage            = 1,
   indestructible = true,
   --maxhealth            = 1,
   mass				= 999,
   crushResistance = 999,
   description       = "Some rocks",
   energy            = 1,
   flammable         = 0,
   footprintX        = 6,
   footprintZ        = 6,
   upright           = false,
   height            = 50,
   object            = "1piece/rockcluster.s3o",
   reclaimable       = false,
   autoreclaimable      = false,   
}
return lowerkeys({[featureDef.name] = featureDef})