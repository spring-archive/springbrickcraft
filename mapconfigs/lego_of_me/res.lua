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

SpawnResource (2925 , 1194)   -- mins start 1
SpawnResource (2826 , 1092)   -- 
SpawnResource (3078 , 1067)   -- 
SpawnResource (2957 , 1343)   -- 
SpawnResource (4649 , 312)   -- 
SpawnResource (4697 , 447)   -- 
SpawnResource (4582 , 511)   -- 
SpawnResource (4771 , 559)   -- 
SpawnResource (3808 , 5248)   -- res start 2
SpawnResource (3965 , 5131)   -- 
SpawnResource (3940 , 5344)   -- 
SpawnResource (3699 , 5184)   -- 
SpawnResource (2340 , 5763)   -- 
SpawnResource (2259 , 5672)   -- 
SpawnResource (2498 , 5675)   -- 
SpawnResource (2321 , 5880)   -- 
SpawnResource (5659 , 3680)   -- res start 3
SpawnResource (5790 , 3572)   -- 
SpawnResource (5681 , 3841)   -- 
SpawnResource (5515 , 3561)   -- 
SpawnResource (5532 , 3134)   -- 
SpawnResource (5633 , 3065)   -- 
SpawnResource (5585 , 2925)   -- 
SpawnResource (5457 , 3012)   -- 
SpawnResource (614 , 2542)   -- res start 4
SpawnResource (489 , 2503)   -- 
SpawnResource (533 , 2733)   -- 
SpawnResource (731 , 2564)   -- 
SpawnResource (1427 , 1271)   -- 
SpawnResource (1271 , 1188)   -- 
SpawnResource (1423 , 1106)   -- 
SpawnResource (1586 , 1172)   -- 
SpawnResource (2445 , 3489)   -- middle res left
SpawnResource (2330 , 3423)   -- 
SpawnResource (2483 , 3307)   -- 
SpawnResource (2672 , 3371)   -- 
SpawnResource (2576 , 3500)   -- 
SpawnResource (2587 , 3639)   -- 
SpawnResource (3568 , 2499)   -- middle res right
SpawnResource (3468 , 2385)   -- 
SpawnResource (3486 , 2615)   -- 
SpawnResource (3613 , 2661)   -- 
SpawnResource (3706 , 2638)   -- 
SpawnResource (3712 , 2448)   -- 

Pump (3446 , 3369)   -- pumps
Pump (4270 , 4646)   -- 
Pump (1172 , 3983)   -- 
Pump (2628 , 478)   -- 
Pump (5808 , 5740)   -- 
Pump (1391 , 537)   --

return {lolfactor=95, res=res}