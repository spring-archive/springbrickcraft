local features = {}

local function Bush  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z	
	newBush.name = "tptribush_multi"
	table.insert (features, newBush)
end

local function Tree  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z	
	newBush.name = "f_tptree"
	table.insert (features, newBush)
end

local function Stuff (x,z)
	if (math.random (1,100) < 50) then
		Tree  (x,z)
	else
		Bush  (x,z)
	end
end

Stuff (1717 , 2068)   -- grass left
Stuff (1429 , 2189)   -- 
Stuff (1498 , 1997)   -- 
Stuff (1824 , 1815)   -- 
Stuff (1966 , 2075)   -- 
Stuff (2056 , 2284)   -- 
Stuff (2131 , 1933)   -- 
Stuff (2315 , 1572)   -- 
Stuff (1997 , 1379)   -- 
Stuff (1645 , 1813)   -- 
Stuff (1273 , 1869)   -- 
Stuff (1809 , 2212)   -- 
Stuff (2655 , 1669)   -- 
Stuff (2842 , 1914)   -- 
Stuff (2812 , 2341)   -- 
Stuff (2488 , 2540)   -- 
Stuff (2249 , 2283)   -- 
Stuff (2584 , 2261)   -- 
Stuff (2909 , 1587)   -- 
Stuff (2116 , 1711)   -- 
Stuff (2231 , 2528)   -- 
Stuff (1002 , 2012)   -- 
Stuff (948 , 2212)   -- 
Stuff (1250 , 2426)   -- 
Stuff (5465 , 2002)   -- grass right
Stuff (5194 , 2100)   -- 
Stuff (5193 , 1828)   -- 
Stuff (5766 , 1797)   -- 
Stuff (5521 , 2179)   -- 
Stuff (5167 , 2384)   -- 
Stuff (4851 , 2541)   -- 
Stuff (5030 , 2226)   -- 
Stuff (5032 , 1961)   -- 
Stuff (4910 , 1492)   -- 
Stuff (5963 , 1665)   -- 
Stuff (5880 , 1991)   -- 
Stuff (5993 , 2195)   -- 
Stuff (5646 , 2377)   -- 
Stuff (4811 , 2765)   -- 
Stuff (4613 , 2375)   -- 
Stuff (4936 , 1715)   -- 
Stuff (4606 , 1656)   -- 
Stuff (4401 , 2112)   -- 
Stuff (4998 , 2421)   -- 
Stuff (5124 , 2621)   -- 
Stuff (5360 , 1617)   -- 
Stuff (5138 , 1450)   -- 
Stuff (5611 , 1907)   -- 
Stuff (5317 , 2246)   -- 
Stuff (6039 , 1794)   -- 
Stuff (2692 , 3570)   -- grass everywhere
Stuff (2744 , 3656)   -- 
Stuff (2791 , 3581)   -- 
Stuff (2682 , 3411)   -- 
Stuff (2502 , 3418)   -- 
Stuff (4417 , 733)   -- 
Stuff (4303 , 552)   -- 
Stuff (4223 , 759)   -- 
Stuff (4297 , 856)   -- 
Stuff (4549 , 679)   -- 
Stuff (6386 , 1324)   -- 
Stuff (6287 , 1161)   -- 
Stuff (6079 , 3292)   -- 
Stuff (6098 , 3155)   -- 
Stuff (6172 , 3232)   -- 
Stuff (6115 , 3412)   -- 
Stuff (5929 , 3283)   -- 
Stuff (6399 , 1150)   -- 
Stuff (488 , 961)   -- 
Stuff (327 , 1034)   -- 
Stuff (341 , 1209)   -- 
Stuff (475 , 1131)   -- 
Stuff (403 , 1073)   -- 
Stuff (586 , 1044)   -- 
Stuff (3898 , 3194)   -- 
Stuff (3763 , 3365)   -- 
Stuff (3520 , 3467)   -- 
Stuff (3298 , 3518)   -- 
Stuff (3119 , 3198)   -- 
Stuff (3448 , 3277)   -- 
Stuff (3907 , 3487)   -- 
Stuff (4240 , 3216)   -- 
Stuff (3971 , 3358)   -- 
Stuff (3589 , 3538)   -- 
Stuff (3252 , 3325)   -- 
Stuff (3668 , 3287)   -- 
Stuff (4092 , 2937)   -- 
Stuff (2995 , 931)   -- 
Stuff (2963 , 1172)   -- 
Stuff (3192 , 1084)   -- 
Stuff (3285 , 683)   -- 
Stuff (3140 , 831)   -- 
Stuff (3600 , 824)   -- 
Stuff (3695 , 875)   -- 
Stuff (3829 , 627)   -- 


return features, true