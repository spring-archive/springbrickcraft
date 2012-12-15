local res = {}

local function SpawnResource  (x,y)
	newrock = {}
	newrock.x = x
	newrock.y = y
	table.insert (res, newrock)
end

SpawnResource (2968 , 2603)   -- tetra mitte
SpawnResource (2858 , 2356)   -- 
SpawnResource (2828 , 2749)   -- 
SpawnResource (4098 , 2603)   -- 
SpawnResource (4252 , 2447)   -- 
SpawnResource (4237 , 2741)   -- 
SpawnResource (3115 , 2592)   -- 
SpawnResource (3903 , 2600)   -- 
SpawnResource (5514 , 3742)   -- tetra rechts unten
SpawnResource (5683 , 3539)   -- 
SpawnResource (5651 , 3911)   -- 
SpawnResource (5283 , 3740)   -- 
SpawnResource (1715 , 1391)   -- tetra oben links
SpawnResource (1695 , 1142)   -- 
SpawnResource (1485 , 1506)   -- 
SpawnResource (1947 , 1505)   -- 
SpawnResource (3016 , 4165)   -- tetra strand unten
SpawnResource (3196 , 4201)   -- 
SpawnResource (3403 , 4211)   -- 
SpawnResource (3638 , 4200)   -- 
SpawnResource (3926 , 4153)   -- 
SpawnResource (4204 , 4106)   -- 
SpawnResource (3380 , 971)   -- tetra strand oben
SpawnResource (2925 , 959)   -- 
SpawnResource (3101 , 946)   -- 
SpawnResource (3556 , 947)   -- 
SpawnResource (3753 , 980)   -- 
SpawnResource (3950 , 1119)   -- 

return {lolfactor=95, res=res}