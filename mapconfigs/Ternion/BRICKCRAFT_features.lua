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

Tree (2986 , 3254)   -- trees in middle
Tree (3046 , 3064)   -- 
Tree (3225 , 3109)   -- 
Tree (3498 , 3194)   -- 
Tree (3198 , 3277)   -- 
Tree (3252 , 2923)   -- 
Tree (3172 , 3034)   -- 
Tree (3324 , 3015)   -- 
Tree (2996 , 2417)   -- 
Tree (3162 , 2400)   -- 
Tree (3258 , 2534)   -- 
Tree (3100 , 2577)   -- 
Tree (2962 , 2544)   -- 
Tree (2925 , 2387)   -- 
Tree (3089 , 2676)   -- 
Tree (1093 , 3495)   -- trees on ring
Tree (1033 , 3564)   -- 
Tree (1173 , 3752)   -- 
Tree (1181 , 3982)   -- 
Tree (1125 , 2996)   -- 
Tree (1050 , 3067)   -- 
Tree (948 , 3097)   -- 
Tree (839 , 3126)   -- 
Tree (845 , 2968)   -- 
Tree (985 , 2905)   -- 
Tree (4826 , 4579)   -- 
Tree (4880 , 4709)   -- 
Tree (4656 , 4926)   -- 
Tree (4709 , 4808)   -- 
Tree (3910 , 696)   -- 
Tree (4035 , 760)   -- 
Tree (4102 , 934)   -- 
Tree (3802 , 688)   -- 

Bush (2921 , 5206)   -- 
Bush (2932 , 5087)   -- 
Bush (2856 , 5202)   -- 
Bush (3169 , 5334)   -- 
Bush (3281 , 5279)   -- 
Bush (3351 , 5231)   -- 
Bush (3493 , 5264)   -- 
Bush (3412 , 5018)   -- 
Bush (3031 , 5377)   -- 
Bush (5131 , 1765)   -- 
Bush (4936 , 1637)   -- 
Bush (5004 , 1747)   -- 
Bush (5074 , 1647)   -- 
Bush (5079 , 1722)   -- 
Bush (1143 , 1618)   -- 
Bush (1217 , 1752)   -- 
Bush (1343 , 1671)   -- 
Bush (1247 , 1639)   -- 
Bush (1370 , 1043)   -- 
Bush (1184 , 1073)   -- 
Bush (1042 , 1135)   -- 
Bush (1269 , 1106)   -- 
Bush (2779 , 2884)   -- 
Bush (2872 , 2933)   -- 
Bush (3012 , 2823)   -- 
Bush (3324 , 3511)   -- 
Bush (3373 , 3581)   -- 
Bush (3444 , 3427)   -- 
Bush (3591 , 2954)   -- 
Bush (3508 , 2882)   -- 
Bush (3566 , 2970)   -- 
Bush (3471 , 2969)   -- 
Bush (3537 , 3024)   -- 
Bush (2193 , 3782)   -- 
Bush (2158 , 3929)   -- 
 
return features, true