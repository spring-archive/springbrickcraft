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

SpawnResource (855 , 3802)   -- left arm
SpawnResource (768 , 3566)   -- 
SpawnResource (878 , 3952)   -- 
SpawnResource (5306 , 3962)   -- rright arm
SpawnResource (5201 , 4100)   -- 
SpawnResource (5334 , 3729)   -- 
SpawnResource (3136 , 469)   -- ttop arm
SpawnResource (3314 , 469)   -- 
SpawnResource (2941 , 424)   -- 
SpawnResource (796 , 2385)   -- s1 res
SpawnResource (907 , 2462)   -- 
SpawnResource (778 , 2511)   -- 
SpawnResource (2190 , 700)   -- 
SpawnResource (2251 , 786)   -- 
SpawnResource (2113 , 787)   -- 
SpawnResource (2017 , 4862)   -- s2 res
SpawnResource (1906 , 4824)   -- 
SpawnResource (1968 , 4761)   -- 
SpawnResource (4189 , 4939)   -- 
SpawnResource (4329 , 4907)   -- 
SpawnResource (4235 , 4757)   -- 
SpawnResource (4288 , 709)   -- s3 res
SpawnResource (4412 , 731)   -- 
SpawnResource (4313 , 819)   -- 
SpawnResource (5314 , 2581)   -- 
SpawnResource (5222 , 2663)   -- 
SpawnResource (5294 , 2746)   -- 

Pump (2604 , 2601)   -- real oil 1
Pump (3197 , 3388)   -- oil 2
Pump (3663 , 2671)   -- oil 3



return {lolfactor=95, res=res}

