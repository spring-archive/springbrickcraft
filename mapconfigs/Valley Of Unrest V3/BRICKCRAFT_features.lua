local features = {}

function Bush  (x,z)
	if (math.random (0,100) > 75) then Tree (x,z) return end
	newBush = {}
	newBush.x = x
	newBush.z = z	
	newBush.name = "f_tptribush"
	table.insert (features, newBush)
end

function Tree  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z	
	newBush.name = "f_tptree"
	table.insert (features, newBush)
	--extra grass around tree
	if (math.random (0,10) > 8) then
		Bush  (x+math.random(-60,60),z+math.random(-60,60))
		Bush  (x+math.random(-60,60),z+math.random(-60,60))
		Bush  (x+math.random(-60,60),z+math.random(-60,60))
	end
end

Tree (4329 , 1277)   -- trees
Tree (4246 , 1282)   -- 
Tree (4008 , 1408)   -- 
Tree (4259 , 1584)   -- 
Tree (4607 , 1317)   -- 
Tree (4256 , 966)   -- 
Tree (4223 , 1403)   -- 
Tree (4032 , 1057)   -- 
Tree (4633 , 373)   -- 
Tree (4750 , 454)   -- 
Tree (4587 , 566)   -- 
Tree (4627 , 448)   -- 
Tree (4353 , 309)   -- 
Tree (451 , 3373)   -- 
Tree (519 , 3581)   -- 
Tree (795 , 3548)   -- 
Tree (592 , 3752)   -- 
Tree (634 , 3476)   -- 
Tree (450 , 3493)   -- 
Tree (595 , 4704)   -- 
Tree (488 , 4740)   -- 
Tree (655 , 4825)   -- 
Tree (719 , 4595)   -- 
Tree (2264 , 3907)   -- 
Tree (2197 , 3973)   -- 
Tree (2330 , 4130)   -- 
Tree (2358 , 3803)   -- 
Tree (2132 , 3613)   -- 
Tree (5826 , 1538)   -- 
Tree (5613 , 1656)   -- 
Tree (5944 , 1748)   -- 
Tree (5922 , 1356)   -- 
Tree (5721 , 1450)   -- 
Tree (5784 , 1665)   -- 
Tree (5598 , 447)   -- 
Tree (5752 , 524)   -- 
Tree (5829 , 598)   -- 
Tree (5641 , 686)   -- 
Tree (3731 , 3238)   -- 
Tree (3451 , 3286)   -- 
Tree (2537 , 1916)   -- 
Tree (2723 , 1764)   -- 
Tree (2884 , 1937)   -- 
 
return features, true