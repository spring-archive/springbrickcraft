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

SpawnResource (389 , 5783)   -- minerals on bottom left corner hill
SpawnResource (513 , 5876)   -- 
SpawnResource (651 , 6011)   -- 
SpawnResource (5410 , 105)   -- minerals on top right corner hill
SpawnResource (5543 , 186)   -- 
SpawnResource (5698 , 275)   -- 
SpawnResource (1481 , 3271)   -- mins south of left big hill
SpawnResource (1631 , 3290)   -- 
SpawnResource (1775 , 3309)   -- 
SpawnResource (1960 , 3351)   -- 
SpawnResource (4172 , 2775)   -- mins north of right big hill
SpawnResource (4332 , 2820)   -- 
SpawnResource (4505 , 2853)   -- 
SpawnResource (3985 , 2712)   -- 
SpawnResource (3218 , 4922)   -- mins at lower cliff corner
SpawnResource (3224 , 5108)   -- 
SpawnResource (3352 , 5350)   -- 
SpawnResource (3111 , 5303)   -- 
SpawnResource (3057 , 4986)   -- 
SpawnResource (3143 , 4742)   -- 
SpawnResource (3028 , 1266)   -- mins at upper cliff corner
SpawnResource (3031 , 1053)   -- 
SpawnResource (2960 , 810)   -- 
SpawnResource (2838 , 640)   -- 
SpawnResource (3143 , 923)   -- 
SpawnResource (3102 , 672)   -- 

SpawnResource (4890 , 4640)   -- extra mins right hill
SpawnResource (4778 , 4740)   -- 
SpawnResource (4996 , 4786)   -- 
SpawnResource (4910 , 4520)   -- 
SpawnResource (4935 , 3780)   -- 
SpawnResource (5077 , 3974)   -- 
SpawnResource (1271 , 1528)   -- extra mins left hill
SpawnResource (1095 , 1617)   -- 
SpawnResource (1385 , 1696)   -- 
SpawnResource (1290 , 1373)   -- 
SpawnResource (1152 , 2130)   -- 
SpawnResource (1152 , 2386)   -- 

Pump (2741 , 4028)   -- middle pump low
Pump (3401 , 2126)   -- middle pump up
Pump (1181 , 1874)   -- left pump hill
Pump (4967 , 4268)   -- right pump hill
return {lolfactor=95, res=res}