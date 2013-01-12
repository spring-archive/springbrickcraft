return {
	["tpmuzzleflash_jeep"] = {
		bitmapmuzzleflame = {
			ground             = true,
			air                = true,
			water              = true,
			class              = [[CBitmapMuzzleFlame]],
			count              = 1,
			underwater         = 1,
			properties = {
				colormap           = [[1 0 0 0.1	    1 0 0 0.01     0 0 0 0.01]], --Colour map progress from one to next. Colors in RGBA
				dir                = [[dir]],
				frontoffset        = 0,
				fronttexture       = [[tpmuzzleflash_front]],
				length             = 12,
				sidetexture        = [[tpmuzzleflash_side]],
				size               = 4,
				sizegrowth         = 1,
				ttl                = 3,
			},
		},
	},
}