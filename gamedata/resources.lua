local   resources = {
      graphics = {
         -- Spring Defaults
         groundfx = {
            groundflash   = 'groundflash.tga',
            groundring   = 'groundring.tga',
            seismic      = 'circles.tga',
			ground_fuzzysquare = 'effects/fuzzysquare.png',			
         },
		 
		 
		scars = {
			'unknown/scars/scar1.png',
			'unknown/scars/scar2.png',
			'unknown/scars/scar3.png',
			'unknown/scars/scar4.png',
		},
		 
         projectiletextures = {
            circularthingy      = 'circularthingy.tga',
            laserend         = 'laserend.tga',
            laserfalloff      = 'laserfalloff.tga',
            randdots         = 'randdots.tga',
            smoketrail         = 'effects/cartoonsmoketrail.png', -- 'smoketrail.tga',
            wake            = 'wake.tga',
            flare            = 'flare.tga',
            explo            = 'explo.tga',
            explofade         = 'effects/greyblob.png', -- 'explofade.tga',
            heatcloud         = 'effects/greyblob.png', -- 'explofade.tga',
            flame            = 'flame.tga',
            muzzleside         = 'muzzleside.tga',
            muzzlefront         = 'muzzlefront.tga',
            largebeam         = 'largelaserfalloff.tga',
			
			cartooncloud = 'effects/cartooncloud.png',
			cartooncloud2 = 'effects/cartooncloud2.png',
			cartooncloud3 = 'effects/cartooncloud3.png',
			cartooncloudround = 'effects/cartooncloudround.png',
			dirt 				= 'dirt.png',
			trailball = 'effects/trailball.png',
			ball = 'effects/ball.png',
			ballflare = 'effects/ballflare.png',
			muzzlesidefrag         = 'effects/muzzle_frag_side.png',
            muzzlefrontfrag         = 'effects/muzzle_frag_front.png',
			shocktrail = 'effects/shocktrail.png',
			ejectshell = 'effects/ejectshell.png',
			greyblob = 'effects/greyblob.png',
			cartoonexplo_bom = 'effects/cartoonexplo_bom.png',
			cartoonexplo_zap = 'effects/cartoonexplo_zap.png',
			mineralshard = 'effects/mineralshard.png',
			spark = 'effects/spark.png',
			sparktrail = 'effects/sparktrail.png',
			splatter = 'effects/splatter.png',
			ufoshield = 'ufoshield.png',
			fuzzysquare = 'effects/fuzzysquare.png',
			fuzzyring = 'effects/fuzzyring.png',
			blurring = 'effects/blurring.png',
			firesquare = 'effects/firesquare.png',
			firecircle = 'effects/firecircle.png',
			firecircle2 = 'effects/firecircle2.png',
			null= 'null.tga',
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