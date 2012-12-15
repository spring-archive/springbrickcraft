--green ufo beam by knorke

return {
	["tpbeamcone"] = {
		bitmapmuzzleflame = {
			ground             = true,
			air                = true,
			water              = true,
			class              = [[CBitmapMuzzleFlame]],
			count              = 1,
			underwater         = 1,
			properties = {
				colormap           = [[0 0.8 0 0.01			0 1 0.05 0.01	         0 0.1 0 0.01]],
				-- [[0 1 0.05 0.01	    0 0.8 0 0.01     0 0.1 0 0.01]], --Colour map progress from one to next. Colors in RGBA
				dir                = [[dir]],
				frontoffset        = 1,
				fronttexture       = [[[tpmuzzleflash_front]],
				length             = -1000, -- -2000
				sidetexture        = [[tpbeamcone_side]],
				size               = -100,
				sizegrowth         = 0,
				ttl                = 12,
			},
		},
	},
}
