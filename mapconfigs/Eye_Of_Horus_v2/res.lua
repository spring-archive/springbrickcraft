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

SpawnResource (1866 , 4402)   -- 
SpawnResource (1998 , 4620)   -- 
SpawnResource (2314 , 4728)   -- 
SpawnResource (3913 , 2302)   -- 
SpawnResource (4087 , 2421)   -- 
SpawnResource (4261 , 2684)   -- 
SpawnResource (3319 , 5441)   -- 
SpawnResource (3282 , 5686)   -- 
SpawnResource (3577 , 5573)   -- 
SpawnResource (2891 , 1609)   -- 
SpawnResource (3217 , 1734)   -- 
SpawnResource (3097 , 1390)   -- 
SpawnResource (2558 , 3752)   -- 
SpawnResource (2774 , 4000)   -- 
SpawnResource (3631 , 3293)   -- 
SpawnResource (3250 , 3046)   -- 
SpawnResource (2806 , 3069)   -- 
SpawnResource (2617 , 3306)   -- 
SpawnResource (3549 , 3709)   -- 
SpawnResource (3303 , 3939)   -- 
SpawnResource (5512 , 2931)   -- 
SpawnResource (5547 , 3133)   -- 
SpawnResource (5374 , 3164)   -- 
SpawnResource (5675 , 3238)   -- 
SpawnResource (539 , 3960)   -- 
SpawnResource (771 , 4036)   -- 
SpawnResource (626 , 4146)   -- 
SpawnResource (678 , 3894)   -- 
SpawnResource (4591 , 4296)   -- 
SpawnResource (4542 , 4489)   -- 
SpawnResource (4752 , 4703)   -- 
SpawnResource (4658 , 4491)   -- 
SpawnResource (1423 , 2512)   -- 
SpawnResource (1573 , 2668)   -- 
SpawnResource (1591 , 2881)   -- 
SpawnResource (1476 , 2716)   -- 

Pump (2535 , 5853)   -- pumps
Pump (3932 , 6043)   -- 
Pump (3876 , 4299)   -- 
Pump (2307 , 3018)   -- 
Pump (2063 , 2091)   -- 
Pump (3598 , 1368)   -- 


return {lolfactor=95, res=res}