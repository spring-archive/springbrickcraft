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
	--Bush  (x+math.random(-60,60),z+math.random(-60,60))
	--Bush  (x+math.random(-60,60),z+math.random(-60,60))
end

Bush (3975 , 5300)   -- grass lower middle hill
Bush (4071 , 5290)   -- 
Bush (4031 , 5366)   -- 
Bush (3909 , 5328)   -- 
Bush (3925 , 5205)   -- 
Bush (4021 , 5158)   -- 
Bush (4223 , 5319)   -- 
Bush (4196 , 5477)   -- 
Bush (4037 , 5429)   -- 
Bush (4149 , 5371)   -- 
Bush (4326 , 5384)   -- 
Bush (4465 , 5357)   -- 
Bush (4032 , 5565)   -- 
Bush (3902 , 5422)   -- 
Bush (3794 , 5207)   -- 
Bush (3352 , 4755)   -- 
Bush (3448 , 4738)   -- 
Bush (3448 , 4653)   -- 
Bush (3521 , 4743)   -- 
Bush (3403 , 4818)   -- 
Bush (3471 , 4914)   -- 
Bush (3582 , 4829)   -- 
Bush (3703 , 4872)   -- 
Bush (3645 , 4928)   -- 
Bush (3568 , 4872)   -- 
Bush (3682 , 4734)   -- 
Bush (3602 , 4633)   -- 
Bush (3313 , 4872)   -- 
Bush (4496 , 3324)   -- grass right middle hill
Bush (4407 , 3299)   -- 
Bush (4478 , 3206)   -- 
Bush (4554 , 3074)   -- 
Bush (4388 , 3079)   -- 
Bush (4322 , 3155)   -- 
Bush (4406 , 3135)   -- 
Bush (4279 , 3299)   -- 
Bush (4252 , 3409)   -- 
Bush (4446 , 3409)   -- 
Bush (4677 , 3256)   -- 
Bush (5050 , 4196)   -- 
Bush (5111 , 4108)   -- 
Bush (5206 , 4078)   -- 
Bush (5217 , 4224)   -- 
Bush (5136 , 4233)   -- 
Bush (5166 , 4165)   -- 
Bush (5299 , 4132)   -- 
Bush (5269 , 4226)   -- 
Bush (5364 , 4162)   -- 
Bush (5462 , 4097)   -- 
Bush (5447 , 4193)   -- 
Bush (5379 , 4314)   -- 
Bush (5271 , 4304)   -- 
Bush (5348 , 5663)   -- 4x pimple grass
Bush (5289 , 5682)   -- 
Bush (5296 , 5648)   -- 
Bush (5277 , 5560)   -- 
Bush (5347 , 5133)   -- 
Bush (5286 , 5185)   -- 
Bush (5239 , 5245)   -- 
Bush (5290 , 5307)   -- 
Bush (5371 , 5305)   -- 
Bush (5725 , 5338)   -- 
Bush (5714 , 5264)   -- 
Bush (5675 , 5313)   -- 
Bush (5750 , 5292)   -- 
Bush (5744 , 5664)   -- 
Bush (5729 , 5715)   -- 
Bush (5673 , 5681)   -- 
Bush (5617 , 5664)   -- 
Bush (5809 , 5656)   -- 
Bush (5414 , 5714)   -- 
Bush (5560 , 5750)   -- 
Bush (5296 , 5403)   -- 
 
return features, true