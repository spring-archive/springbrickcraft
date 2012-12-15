return {
	["tpmuzzleflash_frag"] = {
		bitmapmuzzleflame = {
			ground             = true,
			air                = true,
			water              = true,
			class              = [[CBitmapMuzzleFlame]],
			count              = 1,
			underwater         = 1,
			properties = {
				colormap           = [[1 1 1 0.01	    1 0.3 0 0.01     0 0 0 0]], --Colour map progress from one to next. Colors in RGBA
				dir                = [[dir]],
				frontoffset        = 0,
				fronttexture       = [[muzzlefrontfrag]],
				length             = 20,
				sidetexture        = [[muzzlesidefrag]],
				size               = 15,
				sizegrowth         = 1,
				ttl                = 6,
			},
		},
	},
}
