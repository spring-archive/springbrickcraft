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


SpawnResource (293 , 657)   -- 
SpawnResource (462 , 560)   -- 
SpawnResource (604 , 505)   -- 
SpawnResource (489 , 3545)   -- 
SpawnResource (606 , 3587)   -- 
SpawnResource (728 , 3579)   -- 
SpawnResource (6526 , 527)   -- 
SpawnResource (6705 , 565)   -- 
SpawnResource (6867 , 631)   -- 
SpawnResource (6240 , 3573)   -- 
SpawnResource (6435 , 3573)   -- 
SpawnResource (6673 , 3519)   -- 
SpawnResource (2705 , 375)   -- exe oben links
SpawnResource (2577 , 425)   -- 
SpawnResource (2824 , 464)   -- 
SpawnResource (2698 , 231)   -- 
SpawnResource (2533 , 271)   -- 
SpawnResource (2921 , 260)   -- 
SpawnResource (2684 , 544)   -- 
SpawnResource (4502 , 3666)   -- exe unten rechts
SpawnResource (4482 , 3888)   -- 
SpawnResource (4346 , 3483)   -- 
SpawnResource (4765 , 3457)   -- 
SpawnResource (4243 , 3725)   -- 
SpawnResource (4754 , 3757)   -- 
SpawnResource (4572 , 3427)   -- 
SpawnResource (2430 , 2006)   -- left middle
SpawnResource (2412 , 2173)   -- 
SpawnResource (2412 , 1821)   -- 
SpawnResource (2605 , 1899)   -- 
SpawnResource (2587 , 2095)   -- 
SpawnResource (2713 , 1992)   -- 
SpawnResource (4745 , 2014)   -- right middle
SpawnResource (4770 , 1814)   -- 
SpawnResource (4736 , 2199)   -- 
SpawnResource (4624 , 2102)   -- 
SpawnResource (4626 , 1875)   -- 
SpawnResource (4510 , 1970)   -- 


Pump (2520 , 3683)   -- left low pump
Pump (4764 , 395)   -- right up pump

return {lolfactor=95, res=res}