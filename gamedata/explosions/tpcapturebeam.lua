--some purple beam that captures stuff
return {
	["tpcapturebeam"] = {
		bitmapmuzzleflame = {
			ground             = true,
			air                = true,
			water              = true,
			class              = [[CBitmapMuzzleFlame]],
			count              = 1,
			underwater         = 1,
			properties = {
				colormap           = [[0.8 1 0.2 0.75  0.8 0.5 1 1  1 0 0.8 0.5]],
				-- [[0 1 0.05 0.01	    0 0.8 0 0.01     0 0.1 0 0.01]], --Colour map progress from one to next. Colors in RGBA
				dir                = [[dir]],
				--emitvector         = [[1, 0, 0]],
				frontoffset        = 1,
				fronttexture       = [[[tpmuzzleflash_front]],
				length             = 50, -- -2000
				sidetexture        = [[spark]],
				size               = 15,
				sizegrowth         = 1.5,
				ttl                = 12,
			},
		},
	},
}