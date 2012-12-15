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

SpawnResource (5234 , 2189)   -- s2 startmin
SpawnResource (5241 , 2024)   -- 
SpawnResource (5304 , 1846)   -- 
SpawnResource (5119 , 1967)   -- 
SpawnResource (1658 , 5307)   -- s1 startmin
SpawnResource (1787 , 5276)   -- 
SpawnResource (1973 , 5272)   -- 
SpawnResource (1825 , 5167)   -- 
SpawnResource (1967 , 3455)   -- left beach
SpawnResource (2040 , 3303)   -- 
SpawnResource (2077 , 3159)   -- 
SpawnResource (1945 , 3594)   -- 
SpawnResource (2124 , 3093)   -- 
SpawnResource (3319 , 2313)   -- right beach
SpawnResource (3438 , 2301)   -- 
SpawnResource (3597 , 2295)   -- 
SpawnResource (3827 , 2221)   -- 
SpawnResource (5203 , 6871)   -- left lower
SpawnResource (5066 , 6869)   -- 
SpawnResource (5021 , 6998)   -- 
SpawnResource (4956 , 6785)   -- 
SpawnResource (6751 , 5244)   -- right lower
SpawnResource (6741 , 5381)   -- 
SpawnResource (6599 , 5448)   -- 
SpawnResource (6803 , 5464)   -- 
SpawnResource (3671 , 5662)   -- s1 nat
SpawnResource (3763 , 5803)   -- 
SpawnResource (3918 , 5944)   -- 
SpawnResource (5731 , 3751)   -- s2 nat
SpawnResource (5888 , 3808)   -- 
SpawnResource (6047 , 3923)   -- 

Pump (5608 , 4351)   -- 1
Pump (4317 , 5560)   -- 2
Pump (2996 , 3174)   -- 3
Pump (5501 , 5439)   -- 4


return {lolfactor=95, res=res}