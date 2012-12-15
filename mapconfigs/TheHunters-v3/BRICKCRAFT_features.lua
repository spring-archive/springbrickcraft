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
	for i = 1,10 do
	local r = math.random (1,2)
	if r == 1 then Tree  (x+math.random(-150,150),y+math.random(-150,150)) end
	if r == 2 then MultiBush  (x+math.random(-300,300),y+math.random(-300,300)) end
	end
end

Stuff (3092 , 7317)   -- 
Stuff (4017 , 7730)   -- 
Stuff (4353 , 7136)   -- 
Stuff (4936 , 6106)   -- 
Stuff (6878 , 7773)   -- 
Stuff (7375 , 7114)   -- 
Stuff (4421 , 4190)   -- 
Stuff (3724 , 3809)   -- 
Stuff (4634 , 3524)   -- 
Stuff (4106 , 3459)   -- 
Stuff (6739 , 5189)   -- 
Stuff (7170 , 5555)   -- 
Stuff (5994 , 4103)   -- 
Stuff (6531 , 2425)   -- 
Stuff (2600 , 1886)   -- 
Stuff (4479 , 2628)   -- 
Stuff (2304 , 3870)   -- 
Stuff (1576 , 5785)   -- 
Stuff (2758 , 5158)   -- 
Stuff (3542 , 5750)   -- 
Stuff (1718 , 5019)   -- 
Stuff (4783 , 4243)   -- 
Stuff (6059 , 1847)   -- 
Stuff (6321 , 2144)   -- 
Stuff (6666 , 4064)   -- 
Stuff (5476 , 5770)   -- 

 
return features, true