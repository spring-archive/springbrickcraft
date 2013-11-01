local vehicle_maxslope = 25 --18--25 besser?
local infantry_maxslope = 25 --18--25 besser?
local climber_maxslope = 90
	
local moveDefs = {
--------knorkes new movedefs--------
	Infantry = {
	footprintx = 1,
	footprintz = 1,
		maxwaterdepth = 22,
		maxslope = infantry_maxslope,
		slopemod = 0,
		crushstrength = 25,
	},
	Vehicle1x1 = {
		footprintx = 1,
		footprintz = 1,
		maxwaterdepth = 22,
		maxslope = vehicle_maxslope,
		slopemod = 0,
		crushstrength = 100,
	},
	Vehicle2x2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 22,
		maxslope = vehicle_maxslope,
		slopemod = 0,
		crushstrength = 100,
	},
	Vehicle3x3 = {
		footprintx = 4,
		footprintz = 4,
		maxwaterdepth = 22,
		maxslope = vehicle_maxslope,
		slopemod = 0,
		crushstrength = 100,
	},
	Vehicle4x4 = {
		footprintx = 4,
		footprintz = 4,
		maxwaterdepth = 22,
		maxslope = vehicle_maxslope,
		slopemod = 0,
		crushstrength = 100,
	},
	
	Ship5x5 = {
		footprintx = 5,
		footprintz = 5,
		minwaterdepth = 5,                                        
		crushstrength = 100,
	},	
	
	Climber1x1 = {
		footprintx = 1,
		footprintz = 1,
		maxwaterdepth = 22,
		maxslope = climber_maxslope,
		slopemod = 0,
		crushstrength = 100,
	},
	
	Climber2x2 = {
		footprintx = 2,
		footprintz = 2,
		maxwaterdepth = 22,
		maxslope = climber_maxslope,
		slopemod = 0,
		crushstrength = 100,
	},
		
	Climber3x3 = {
		footprintx = 3,
		footprintz = 3,
		maxwaterdepth = 22,
		maxslope = climber_maxslope,
		slopemod = 0,
		crushstrength = 100,
	},
	
	Hover3x3 = {
		footprintX = 3,
		footprintz = 3,
		maxWaterDepth = 5000,
		maxSlope = vehicle_maxslope,
		crushStrength = 100,
		hover = true,
	},
	
}
	
	--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	
	-- convert from map format to the expected array format
	
	local array = {}
	local i = 1
	for k,v in pairs(moveDefs) do
	        array[i] = v
	        v.name = k
	        i = i + 1
	end	
	
	return array