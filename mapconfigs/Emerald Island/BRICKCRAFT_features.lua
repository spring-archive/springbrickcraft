local features = {}

local function Bush  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z
	newBush.name = "f_tptribush_multi"
	table.insert (features, newBush)
end

local function Bush2  (x,z)
	Bush (x,z)
end

local function Tree  (x,z)
	new = {}
	new.x = x
	new.z = z	
	new.name = "f_tptree"
	table.insert (features, new)
end

local function Rock  (x,z)
	new = {}
	new.x = x
	new.z = z	
	new.name = "f_cubedebris_l"
	table.insert (features, new)
end

local function RockSmall  (x,z)
	new = {}
	new.x = x
	new.z = z	
	new.name = "f_cubedebris_s"
	table.insert (features, new)
end

local function Rock2 (x,z)
	new = {}
	new.x = x
	new.z = z	
	new.name = "f_tprockcluster"
	table.insert (features, new)
end


local function smallTree  (x,z)
	Tree (x,z)
end

Rock (2026 , 2068)   -- crushable wall stuff that divides players
Rock (2113 , 1882)   -- 
Rock (2167 , 1806)   -- 
Rock (2224 , 1737)   -- 
Rock (2276 , 1653)   -- 
Rock (2325 , 1585)   -- 
Rock (2372 , 1498)   -- 
Rock (2417 , 1410)   -- 
Rock (2331 , 1640)   -- 
Rock (2254 , 1765)   -- 
Rock (2112 , 1758)   -- 
Rock (2034 , 2109)   -- 
Rock (1970 , 2182)   -- 
Rock (1892 , 2185)   -- 
Rock (1901 , 2250)   -- 
Rock (1853 , 2361)   -- 
Rock (1766 , 2396)   -- 
Rock (1764 , 2468)   -- 
Rock (1677 , 2481)   -- 
Rock (1744 , 2545)   -- 
Rock (1657 , 2645)   -- 
Rock (1806 , 2279)   -- 
Rock (1935 , 2074)   -- 

Rock (2015 , 1984)   -- rocks that close the very middle
Rock (2039 , 1868)   -- 
Rock (2077 , 1977)   -- 
Rock (2125 , 2047)   -- 
Rock (2262 , 1955)   -- 
Rock (2168 , 1954)   -- 

Tree (2234 , 1878)   -- trees
Tree (2065 , 1808)   -- 
Tree (1924 , 1957)   -- 
Tree (1866 , 2107)   -- 
Tree (2092 , 2197)   -- 
Tree (2387 , 2081)   -- 
Tree (2357 , 2210)   -- 
Tree (2237 , 2118)   -- 
Tree (2411 , 2016)   -- 
Tree (2291 , 2045)   -- 
Tree (1836 , 1884)   -- 
Tree (1807 , 1953)   -- 
Tree (1691 , 1970)   -- 
Tree (1767 , 2024)   -- 
Tree (1912 , 1851)   -- 
Tree (2585 , 2433)   -- 
Tree (2528 , 2524)   -- 
Tree (2465 , 2425)   -- 
Tree (1610 , 1711)   -- 
Tree (1598 , 1808)   -- 
Tree (1741 , 1687)   -- 
Tree (1408 , 1604)   -- 
Tree (2792 , 2216)   -- 
Tree (2038 , 2046)   -- 
Tree (1934 , 2233)   -- 

Rock2 (1984 , 3077)   -- rocks in water
Rock2 (2142 , 3192)   -- 
Rock2 (1844 , 3074)   -- 
Rock2 (2264 , 1196)   -- 
Rock2 (2482 , 1229)   -- 
Rock2 (2595 , 1392)   -- 
Rock2 (1623 , 2747)   -- 
Rock2 (1470 , 2645)   -- 
Rock2 (1132 , 3251)   -- 
Rock2 (1277 , 3017)   -- 
Rock2 (2879 , 3223)   -- 

RockSmall (1668 , 2570)   -- small extra rocks
RockSmall (2321 , 1704)   -- 
RockSmall (1573 , 2517)   -- 
RockSmall (2447 , 1504)   -- 

local a=200
for i=1,50 do
	Bush2 (2090+math.random (-a,a) , 2040+math.random (-a,a))
	a=a+10
end
return features