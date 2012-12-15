local features = {}

function Bush  (x,z)	
	newBush = {}
	newBush.x = x
	newBush.z = z	
	newBush.name = "f_tptribush"
	table.insert (features, newBush)
end

function MultiBush  (x,z)
	if (math.random (0,100) > 80) then Tree (x,z) return end
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

Bush (1669 , 1147)   -- trees start area 1
Tree (1518 , 1316)   -- 
Tree (1767 , 1281)   -- 
Tree (1980 , 1075)   -- 
Tree (1794 , 1163)   -- 
Tree (1792 , 969)   -- 
Tree (1522 , 1898)   -- 
Tree (1509 , 1767)   -- 
Tree (1410 , 1956)   -- 
Tree (1667 , 1787)   -- 
Tree (1306 , 148)   -- 
Tree (1441 , 366)   -- 
Tree (1229 , 376)   -- 
Tree (3814 , 5359)   -- trees start area 2
Tree (3914 , 5172)   -- 
Tree (3749 , 5227)   -- 
Tree (4017 , 5287)   -- 
Tree (3789 , 5490)   -- 
Tree (3637 , 5431)   -- 
Tree (4496 , 5389)   -- 
Tree (4572 , 5185)   -- 
Tree (4674 , 5336)   -- 
Tree (4406 , 5117)   -- 
Tree (5554 , 4654)   -- 
Tree (5463 , 4727)   -- 
Tree (5379 , 4633)   -- 
Tree (5488 , 4595)   -- 
Tree (5345 , 4720)   -- 
Tree (5223 , 4657)   -- 
MultiBush (1821 , 3558)   -- grass left side
MultiBush (1528 , 3348)   -- 
MultiBush (1718 , 3221)   -- 
MultiBush (2078 , 3563)   -- 
MultiBush (1522 , 3651)   -- 
MultiBush (1889 , 3813)   -- 
MultiBush (2267 , 3915)   -- 
MultiBush (1715 , 3673)   -- 
MultiBush (1320 , 3364)   -- 
MultiBush (1519 , 3049)   -- 
MultiBush (2009 , 3292)   -- 
MultiBush (2322 , 3787)   -- 
MultiBush (2099 , 3795)   -- 
MultiBush (1278 , 3059)   -- 
MultiBush (1717 , 3049)   -- 
MultiBush (1342 , 2772)   -- 
MultiBush (1562 , 2908)   -- 
MultiBush (2376 , 4239)   -- 
MultiBush (2777 , 4230)   -- 
MultiBush (2239 , 4791)   -- 
MultiBush (2211 , 4528)   -- 
MultiBush (2618 , 4645)   -- 
MultiBush (2419 , 4663)   -- 
MultiBush (2628 , 4490)   -- 
MultiBush (2047 , 4050)   -- 
MultiBush (2378 , 4118)   -- 
MultiBush (2606 , 4122)   -- 
MultiBush (2201 , 4247)   -- 
MultiBush (4466 , 2958)   -- grass right side
MultiBush (4669 , 3002)   -- 
MultiBush (4477 , 3107)   -- 
MultiBush (4788 , 3186)   -- 
MultiBush (4854 , 3024)   -- 
MultiBush (4940 , 2777)   -- 
MultiBush (4631 , 2774)   -- 
MultiBush (4540 , 2571)   -- 
MultiBush (4210 , 2820)   -- 
MultiBush (4318 , 2977)   -- 
MultiBush (3610 , 1713)   -- 
MultiBush (3754 , 1874)   -- 
MultiBush (3910 , 1663)   -- 
MultiBush (3831 , 1427)   -- 
MultiBush (3757 , 1631)   -- 
MultiBush (3879 , 1804)   -- 
MultiBush (3688 , 1739)   -- 
MultiBush (3800 , 1736)   -- 
MultiBush (3916 , 1532)   -- 
MultiBush (3550 , 1427)   -- 
Bush (1893 , 452)   -- grass on small hills
Bush (1974 , 371)   -- 
Bush (1961 , 436)   -- 
Bush (1976 , 659)   -- 
Bush (1802 , 642)   -- 
Bush (1643 , 458)   -- 
Bush (1556 , 499)   -- 
Bush (5215 , 877)   -- 
Bush (5266 , 945)   -- 
Bush (5243 , 1112)   -- 
Bush (5043 , 1209)   -- 
Bush (5263 , 1023)   -- 
Bush (5151 , 1154)   -- 
Bush (4908 , 1141)   -- 
Bush (5009 , 1069)   -- 
Bush (4503 , 5425)   -- 
Bush (4570 , 5474)   -- 
Bush (4512 , 5700)   -- 
Bush (4486 , 5754)   -- 
Bush (4380 , 5834)   -- 
Bush (4425 , 5775)   -- 
Bush (4458 , 5702)   -- 
Bush (4223 , 5687)   -- 
Bush (612 , 5202)   -- 
Bush (724 , 5247)   -- 
Bush (625 , 5311)   -- 
Bush (879 , 4946)   -- 
Bush (996 , 4970)   -- 
Bush (917 , 5057)   -- 
Bush (1006 , 5153)   -- 
Bush (1133 , 5063)   -- 
Bush (1124 , 5199)   -- 
Bush (582 , 5973)   -- 
Bush (606 , 6048)   -- 
Bush (701 , 6001)   -- 
Bush (636 , 5996)   -- 
Bush (676 , 6084)   -- 
Bush (619 , 6103)   -- 

 
return features, true