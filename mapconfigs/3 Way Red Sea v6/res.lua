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

SpawnResource (1807 , 1421)   -- minerals 1
SpawnResource (1927 , 1471)   -- 
SpawnResource (2035 , 1548)   -- 
SpawnResource (797 , 2979)   -- 
SpawnResource (975 , 3106)   -- 
SpawnResource (1150 , 3195)   -- 
SpawnResource (6091 , 1584)   -- minerals 2
SpawnResource (6256 , 1474)   -- 
SpawnResource (6439 , 1409)   -- 
SpawnResource (7173 , 3182)   -- 
SpawnResource (7328 , 3050)   -- 
SpawnResource (7498 , 2850)   -- 
SpawnResource (3123 , 6763)   -- minerals 3
SpawnResource (3117 , 6937)   -- 
SpawnResource (3135 , 6563)   -- 
SpawnResource (5065 , 6673)   -- 
SpawnResource (5055 , 6848)   -- 
SpawnResource (5012 , 7061)   -- 
SpawnResource (4413 , 4004)   -- minerals middle
SpawnResource (4513 , 4048)   -- 
SpawnResource (4638 , 4109)   -- 
SpawnResource (4771 , 4164)   -- 
SpawnResource (3932 , 3969)   -- 
SpawnResource (3797 , 4019)   -- 
SpawnResource (3637 , 4106)   -- 
SpawnResource (3488 , 4191)   -- 
SpawnResource (4114 , 3461)   -- 
SpawnResource (4122 , 3294)   -- 
SpawnResource (4118 , 3139)   -- 
SpawnResource (4133 , 3005)   -- 



return {lolfactor=95, res=res}

