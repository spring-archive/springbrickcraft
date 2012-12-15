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

SpawnResource (1025 , 3199)   -- start mins 1
SpawnResource (954 , 3062)   -- 
SpawnResource (1135 , 3085)   -- 
SpawnResource (1002 , 3299)   -- 
SpawnResource (5100 , 1997)   -- start mins 2
SpawnResource (4976 , 2077)   -- 
SpawnResource (5111 , 1861)   -- 
SpawnResource (5222 , 2088)   -- 
SpawnResource (3951 , 4098)   -- up 1 left
SpawnResource (4071 , 4213)   -- 
SpawnResource (3862 , 4213)   -- 
SpawnResource (3969 , 3932)   -- 
SpawnResource (2198 , 1011)   -- up 1 right
SpawnResource (2193 , 1147)   -- 
SpawnResource (2314 , 919)   -- 
SpawnResource (2107 , 908)   -- 
SpawnResource (4719 , 4690)   -- up 2 right
SpawnResource (4834 , 4615)   -- 
SpawnResource (4729 , 4826)   -- 
SpawnResource (4642 , 4615)   -- 
SpawnResource (1420 , 434)   -- up 2 left
SpawnResource (1322 , 285)   -- 
SpawnResource (1579 , 356)   -- 
SpawnResource (1405 , 553)   -- 

--3 extra minerals
--left
SpawnResource (2017 , 3497)   -- 
SpawnResource (2068 , 3683)   -- 
SpawnResource (2097 , 3843)   -- 
--right
SpawnResource (4058 , 1540)   -- 
SpawnResource (4072 , 1280)   -- 
SpawnResource (4155 , 1679)   -- 


Pump (4910 , 3635)   -- pump right
Pump (1215 , 1469)   -- pump left
Pump (1387 , 3641)   -- pump low 1
Pump (4727 , 1551)   -- pump low 2

return {lolfactor=95, res=res}