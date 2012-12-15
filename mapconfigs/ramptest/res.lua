local res = {}

local function SpawnResource  (x,y)
	newrock = {}
	newrock.x = x
	newrock.y = y
	table.insert (res, newrock)
end

local function Pump  (x,y)
	newrock = {}
	newrock.x = x
	newrock.y = y
	newrock.unitname = "tpoilpump"
	table.insert (res, newrock)
end

SpawnResource (1080 , 1808)   -- start min 1 A
SpawnResource (939 , 1794)   -- 
SpawnResource (1240 , 1813)   -- 
SpawnResource (1090 , 1942)   -- 
SpawnResource (136 , 778)   -- start min 1 B
SpawnResource (138 , 619)   -- 
SpawnResource (153 , 1009)   -- 
SpawnResource (5092 , 4322)   -- start min 2 A
SpawnResource (4936 , 4326)   -- 
SpawnResource (5243 , 4340)   -- 
SpawnResource (5085 , 4156)   -- 
SpawnResource (6057 , 5375)   -- start min 2 B
SpawnResource (6079 , 5215)   -- 
SpawnResource (6062 , 5571)   -- 
SpawnResource (1044 , 3807)   -- 1mins low diagonal cliff
SpawnResource (1139 , 3914)   -- 
SpawnResource (1272 , 4053)   -- 
SpawnResource (1041 , 4056)   -- 
SpawnResource (1215 , 4129)   -- 
SpawnResource (944 , 3923)   -- 
SpawnResource (4989 , 2153)   -- 2mins - low diagonal cliff
SpawnResource (4781 , 2036)   -- 
SpawnResource (5080 , 2365)   -- 
SpawnResource (4900 , 2222)   -- 
SpawnResource (4920 , 1980)   -- 
SpawnResource (5128 , 2212)   -- 

SpawnResource (123 , 123)   -- test!
SpawnResource (3096 , 3088)   -- minerals in middle
SpawnResource (3086 , 3237)   -- 
SpawnResource (3110 , 2856)   -- 
SpawnResource (2910 , 2833)   -- 
SpawnResource (3298 , 3246)   -- 
SpawnResource (3246 , 2947)   -- 
SpawnResource (2924 , 3160)   -- 
Pump (1741 , 3394)   -- left pump
Pump (4456 , 2785)   -- right pump
Pump (1053 , 4694)   -- pump left low
Pump (5206 , 1567) -- pump right low




return {lolfactor=95, res=res}