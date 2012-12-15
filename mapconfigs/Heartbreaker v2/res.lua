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

SpawnResource (324 , 1946)   -- links hinten sicher
SpawnResource (875 , 1724)   -- 
SpawnResource (514 , 1734)   -- 
SpawnResource (6753 , 4346)   -- rechts hinten sicher
SpawnResource (6540 , 4285)   -- 
SpawnResource (6214 , 4285)   -- 
SpawnResource (3267 , 4423)   -- 6 uhr lower ditch
SpawnResource (3220 , 4700)   -- 
SpawnResource (3536 , 4831)   -- 
SpawnResource (3311 , 5053)   -- 
SpawnResource (3395 , 4700)   -- 
SpawnResource (3726 , 1462)   -- 12 uhr top ditch
SpawnResource (3906 , 1180)   -- 
SpawnResource (3531 , 1092)   -- 
SpawnResource (3949 , 1748)   -- 
SpawnResource (3911 , 1457)   -- 
SpawnResource (3580 , 3052)   -- middle
SpawnResource (3463 , 2969)   -- 
SpawnResource (3714 , 3160)   -- 
SpawnResource (3766 , 2966)   -- 
SpawnResource (3400 , 3147)   -- 
SpawnResource (1286 , 5740)   -- bottom left corner
SpawnResource (1508 , 5608)   -- 
SpawnResource (1216 , 5960)   -- 
SpawnResource (1055 , 5601)   -- 
SpawnResource (6358 , 514)   -- top right corner
SpawnResource (6571 , 409)   -- 
SpawnResource (6139 , 281)   -- 
SpawnResource (6381 , 738)   -- 

Pump (341 , 3778)   -- 
Pump (6894 , 2405)   -- 
Pump (3187 , 5717)   -- 
Pump (3757 , 494)   -- 

return {lolfactor=95, res=res}