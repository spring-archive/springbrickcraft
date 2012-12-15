    local	resources = {
		graphics = {
			trees = {
				bark		= 'Bark.bmp',
				leaf		= 'bleaf.bmp',
				gran1		= 'gran.bmp',
				gran2		= 'gran2.bmp',
				birch1		= 'birch1.bmp',
				birch2		= 'birch2.bmp',
				birch3		= 'birch3.bmp',
			},
			maps = {
				detailtex	= 'detailtex2.bmp',
				watertex	= 'ocean.jpg',
			},
			groundfx = {
				groundflash	= 'groundflash.tga',
				groundring	= 'groundring.tga',
				seismic		= 'circles.tga',
			},
			projectiletextures = {
				circularthingy		= 'circularthingy.tga',
				laserend			= 'laserend.tga',
				laserfalloff		= 'laserfalloff.tga',
				randdots			= 'randdots.tga',
				smoketrail			= 'smoketrail.tga',
				wake				= 'wake.tga',
				flare				= 'flare.tga',
				explo				= 'explo.tga',
				explofade			= 'explofade.tga',
				heatcloud			= 'explo.tga',
				flame				= 'flame.tga',
				muzzleside			= 'muzzlefront.tga',
				muzzlefront			= 'muzzleside.tga',
				largebeam			= 'largelaserfalloff.tga',
				dirt 				= 'dirt.png',
				spark				= 'spark.png',
				electnovaexplo		= 'electnovaexplo.png',
				--tpmuzzleflash_side	= 'tpmuzzleflash_side',
				--tpbeamcone_side		= 'tpbeamcone_side.tga',
				tpexplosive 		= 'tpexplosive.png',
				tpelectro			= 'tp/electro.png'
				--cartooncloud = 'effects/cartooncloud.png',

			},
		}
	}

local VFSUtils = VFS.Include('gamedata/VFSUtils.lua')

local function AutoAdd(subDir, map, filter)
  local dirList = RecursiveFileSearch("bitmaps/" .. subDir)
  for _, fullPath in ipairs(dirList) do
    local path, key, ext = fullPath:match("bitmaps/(.*/(.*)%.(.*))")
    if not fullPath:match("/%.svn") then
    local subTable = resources["graphics"][subDir] or {}
    resources["graphics"][subDir] = subTable
      if not filter or filter == ext then
        if not map then
          table.insert(subTable, path)
        else -- a mapped subtable
          subTable[key] = path
        end
      end
    end
  end
end

-- Add mod projectiletextures
AutoAdd("projectiletextures", true)

return resources