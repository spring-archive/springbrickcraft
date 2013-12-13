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

SpawnResource (2065 , 1350)   -- minerals left
SpawnResource (2088 , 1436)   -- 
SpawnResource (2080 , 1513)   -- 
SpawnResource (2081 , 1591)   -- 
SpawnResource (2164 , 1372)   -- 
SpawnResource (2163 , 1463)   -- 
SpawnResource (2164 , 1559)   -- 
SpawnResource (2157 , 1632)   -- 
SpawnResource (2091 , 1677)   -- 
SpawnResource (1522 , 2459)   -- 
SpawnResource (1660 , 2378)   -- 
SpawnResource (1549 , 2380)   -- 
SpawnResource (2035 , 2671)   -- minerals right
SpawnResource (2060 , 2742)   -- 
SpawnResource (2103 , 2799)   -- 
SpawnResource (2128 , 2866)   -- 
SpawnResource (1972 , 2604)   -- 
SpawnResource (1948 , 2686)   -- 
SpawnResource (1972 , 2768)   -- 
SpawnResource (2018 , 2849)   -- 
SpawnResource (1902 , 2664)   -- 
SpawnResource (2587 , 1517)   -- 
SpawnResource (2491 , 1509)   -- 
SpawnResource (2496 , 1599)   -- 


return {lolfactor=95, res=res}