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
	Bush  (x+math.random(-60,60),z+math.random(-60,60))
--	Bush  (x+math.random(-60,60),z+math.random(-60,60))
end

Tree (3565 , 4918)   -- trees
Tree (3673 , 4802)   -- 
Tree (3708 , 4971)   -- 
Tree (3551 , 4774)   -- 
Tree (3639 , 4864)   -- 
Tree (3536 , 5010)   -- 
Tree (3537 , 5493)   -- 
Tree (3685 , 5510)   -- 
Tree (3610 , 5572)   -- 
Tree (3436 , 907)   -- 
Tree (3374 , 1017)   -- 
Tree (5269 , 459)   -- 
Tree (5217 , 405)   -- 
Tree (5219 , 3592)   -- 
Tree (5062 , 3649)   -- 
Tree (5003 , 3615)   -- 
Tree (5069 , 3521)   -- 
Tree (2960 , 3300)   -- 
Tree (3150 , 3526)   -- 
Tree (2902 , 3739)   -- 
Tree (2998 , 3490)   -- 
Tree (3174 , 3293)   -- 
Tree (2881 , 3116)   -- 
Tree (2835 , 3544)   -- 
Tree (3247 , 3788)   -- 
Tree (2976 , 3939)   -- 
Tree (2696 , 3016)   -- 
Tree (3125 , 3144)   -- 
Tree (3441 , 3052)   -- 
Tree (3419 , 3793)   -- 
Tree (3049 , 3804)   -- 

 Bush (2994 , 4267)   -- grass
Bush (2913 , 4298)   -- 
Bush (2990 , 4350)   -- 
Bush (3058 , 4276)   -- 
Bush (3088 , 4120)   -- 
Bush (2910 , 4100)   -- 
Bush (2817 , 4186)   -- 
Bush (2809 , 4371)   -- 
Bush (3760 , 3154)   -- 
Bush (3719 , 3216)   -- 
Bush (3662 , 3084)   -- 
Bush (3816 , 3233)   -- 
Bush (4183 , 1656)   -- 
Bush (4089 , 1694)   -- 
Bush (4204 , 1718)   -- 
Bush (4056 , 1727)   -- 
Bush (4030 , 1595)   -- 
Bush (4168 , 1537)   -- 
Bush (2021 , 1937)   -- 
Bush (2134 , 2031)   -- 
Bush (2227 , 1944)   -- 
Bush (2343 , 2038)   -- 
Bush (2208 , 1988)   -- 
Bush (2096 , 1914)   -- 
Bush (3029 , 2665)   -- 
Bush (3147 , 2704)   -- 
Bush (3178 , 2570)   -- 
Bush (3014 , 2609)   -- 
Bush (2993 , 2495)   -- 
Bush (3524 , 3426)   -- 
Bush (3545 , 3349)   -- 
Bush (3541 , 3211)   -- 
Bush (3330 , 3263)   -- 
Bush (2507 , 2944)   -- 
Bush (2441 , 3085)   -- 
Bush (2280 , 2960)   -- 
Bush (2436 , 2772)   -- 

Tree (3927 , 1628)   -- more trees
Tree (4043 , 1516)   -- 
Tree (3839 , 1480)   -- 
Tree (3703 , 1641)   -- 
Tree (3745 , 1752)   -- 
Tree (4206 , 1287)   -- 
Tree (2919 , 2044)   -- 
Tree (2816 , 2239)   -- 
Tree (3118 , 2199)   -- 
Tree (3194 , 1991)   -- 
Tree (3350 , 2142)   -- 
Tree (2964 , 2154)   -- 
Tree (1983 , 423)   -- 
Tree (2249 , 627)   -- 
Tree (2382 , 253)   -- 
Tree (1781 , 734)   -- 
Tree (1801 , 409)   -- 
Tree (2353 , 4796)   -- 
Tree (2112 , 4918)   -- 
Tree (1939 , 4785)   -- 
Tree (2521 , 4921)   -- 
Tree (2250 , 4876)   -- 
Tree (2203 , 5188)   -- 
Tree (4127 , 4480)   -- 
Tree (4776 , 4592)   -- 
Tree (4544 , 4528)   -- 
Tree (4468 , 4722)   -- 
Tree (268 , 2524)   -- 
Tree (312 , 2743)   -- 
Tree (1010 , 2646)   -- 
Tree (566 , 2872)   -- 
Tree (308 , 3000)   -- 
Tree (5391 , 5755)   -- 
Tree (5606 , 5666)   -- 
Tree (5433 , 5878)   -- 
Tree (4568 , 5736)   -- 
Tree (4415 , 5863)   -- 
Tree (1856 , 5718)   -- 
Tree (1969 , 5823)   -- 
Tree (2909 , 5594)   -- 
Tree (4383 , 1991)   -- 
Tree (4539 , 1665)   -- 
Tree (4839 , 1999)   -- 
Tree (4535 , 1937)   -- 
Tree (4060 , 2043)   -- 
Tree (4243 , 1908)   -- 

 
return features, true