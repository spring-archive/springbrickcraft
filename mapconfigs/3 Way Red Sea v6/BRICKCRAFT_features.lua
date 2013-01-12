local features = {}

function Bush  (x,z)	
	if (math.random (0,100) > 25) then MultiBush (x,z) return end
	newBush = {}
	newBush.x = x
	newBush.z = z	
	newBush.name = "f_tptribush"
	table.insert (features, newBush)
end

function MultiBush  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z	
	newBush.name = "f_tptribush_multi"
	table.insert (features, newBush)
end

function Tree  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z	
	newBush.name = "f_tptree"
	table.insert (features, newBush)
	--extra grass around tree
	--Bush  (x+math.random(-60,60),z+math.random(-60,60))
	--Bush  (x+math.random(-60,60),z+math.random(-60,60))
end

function Stuff (x,y)
	for i = 1,3 do
	local r = math.random (1,2)
	if r == 1 then Tree  (x+math.random(-150,150),y+math.random(-150,150)) end
	if r == 2 then MultiBush  (x+math.random(-300,300),y+math.random(-300,300)) end
	end
end

Tree (4124 , 3864)   -- trees middle
MultiBush (3594 , 4506)   -- 
Tree (3792 , 4331)   -- 
Tree (3714 , 4465)   -- 
Tree (3612 , 4326)   -- 
Tree (4625 , 4676)   -- 
Tree (4593 , 4524)   -- 
Tree (4754 , 4442)   -- 
Tree (4261 , 4719)   -- 
Tree (5057 , 3961)   -- 
Tree (4827 , 3932)   -- 
Tree (4983 , 3887)   -- 
Tree (4920 , 4059)   -- 
Tree (4515 , 3067)   -- 
Tree (4437 , 3142)   -- 
Tree (4535 , 3273)   -- 
Tree (4732 , 3221)   -- 
Tree (3866 , 3072)   -- 
Tree (3895 , 3190)   -- 
Tree (3983 , 3072)   -- 
MultiBush (2962 , 3182)   -- grass
MultiBush (3041 , 3095)   -- 
MultiBush (3127 , 3171)   -- 
MultiBush (3049 , 3317)   -- 
MultiBush (3029 , 3204)   -- 
MultiBush (2831 , 3040)   -- 
MultiBush (5275 , 3187)   -- 
MultiBush (5197 , 3143)   -- 
MultiBush (5348 , 3050)   -- 
MultiBush (5108 , 3254)   -- 
MultiBush (5198 , 3320)   -- 
MultiBush (4190 , 5171)   -- 
MultiBush (4146 , 4988)   -- 
MultiBush (4048 , 5160)   -- 
MultiBush (4161 , 5235)   -- 
MultiBush (3981 , 5034)   -- 
MultiBush (3961 , 5238)   -- 
Stuff (3574 , 6772)   -- trees or grass in start areas
Stuff (3644 , 6486)   -- 
Stuff (3706 , 6633)   -- 
Stuff (3424 , 6579)   -- 
Stuff (4041 , 7396)   -- 
Stuff (4133 , 7269)   -- 
Stuff (4744 , 6919)   -- 
Stuff (4633 , 6786)   -- 
Stuff (1106 , 2691)   -- 
Stuff (1243 , 2761)   -- 
Stuff (1215 , 2546)   -- 
Stuff (1917 , 1897)   -- 
Stuff (1851 , 1786)   -- 
Stuff (2086 , 2735)   -- 
Stuff (7223 , 2655)   -- 
Stuff (7101 , 2792)   -- 
Stuff (7249 , 2851)   -- 
Stuff (6434 , 1752)   -- 
Stuff (6268 , 1941)   -- 
Stuff (6600 , 1953)   -- 
Stuff (5454 , 2643)   -- 
Stuff (5385 , 2781)   -- 
Stuff (5456 , 2877)   -- 
Stuff (5511 , 2765)   -- 
Stuff (5303 , 2742)   -- 

 
return features, true