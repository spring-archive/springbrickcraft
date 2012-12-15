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


SpawnResource (630 , 2486)   -- mins middle left
SpawnResource (823 , 2304)   -- 
SpawnResource (810 , 2490)   -- 
SpawnResource (926 , 2599)   -- 
SpawnResource (3405 , 1740)   -- mins middle right
SpawnResource (3302 , 1909)   -- 
SpawnResource (3599 , 1697)   -- 
SpawnResource (3253 , 1609)   -- 

SpawnResource (2003 , 3607)   -- mins bottom
SpawnResource (1978 , 3782)   -- 
SpawnResource (2212 , 3514)   -- 
SpawnResource (1800 , 3528)   -- 
SpawnResource (1992 , 590)   -- mins top
SpawnResource (2072 , 741)   -- 
SpawnResource (2079 , 394)   -- 
SpawnResource (1768 , 622)   -- 

SpawnResource (379 , 3714)   -- bottom left corner
SpawnResource (400 , 3558)   -- 
SpawnResource (538 , 3757)   -- 
SpawnResource (246 , 3783)   -- 
SpawnResource (3731 , 525)   -- top right corner
SpawnResource (3540 , 501)   -- 
SpawnResource (3692 , 660)   -- 
SpawnResource (3856 , 384)   -- 

Pump (179 , 3373)   -- 1
Pump (494 , 3956)   -- 2
Pump (3679 , 130)   -- 3
Pump (3878 , 815)   -- 4



return {lolfactor=95, res=res}