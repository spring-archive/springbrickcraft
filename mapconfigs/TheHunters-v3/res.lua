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

SpawnResource (495 , 548)   -- 1
SpawnResource (561 , 432)   -- 
SpawnResource (659 , 290)   -- 
SpawnResource (455 , 679)   -- 
SpawnResource (434 , 1210)   -- 
SpawnResource (3458 , 313)   -- 2
SpawnResource (3340 , 428)   -- 
SpawnResource (3277 , 570)   -- 
SpawnResource (5072 , 331)   -- 
SpawnResource (5175 , 503)   -- 
SpawnResource (7674 , 302)   -- 3
SpawnResource (7811 , 382)   -- 
SpawnResource (7938 , 491)   -- 
SpawnResource (7998 , 1712)   -- 
SpawnResource (7882 , 1860)   -- 
SpawnResource (7708 , 3348)   -- 4
SpawnResource (7565 , 3299)   -- 
SpawnResource (7411 , 3293)   -- 
SpawnResource (7884 , 5182)   -- 
SpawnResource (7757 , 5286)   -- 
SpawnResource (7737 , 6969)   -- 5
SpawnResource (7760 , 7088)   -- 
SpawnResource (7770 , 7291)   -- 
SpawnResource (7674 , 7606)   -- 
SpawnResource (7558 , 7814)   -- 
SpawnResource (4715 , 7450)   -- 6
SpawnResource (4638 , 7610)   -- 
SpawnResource (4511 , 7778)   -- 
SpawnResource (3112 , 8029)   -- 
SpawnResource (3254 , 8072)   -- 
SpawnResource (1746 , 7853)   -- 7
SpawnResource (1244 , 8037)   -- 
SpawnResource (807 , 7986)   -- 
SpawnResource (545 , 7856)   -- 
SpawnResource (309 , 7609)   -- 
SpawnResource (207 , 3890)   -- 8
SpawnResource (338 , 3969)   -- 
SpawnResource (1938 , 3096)   -- 
SpawnResource (493 , 4041)   -- 
SpawnResource (954 , 4116)   -- 
SpawnResource (2967 , 1601)   -- 1+2
SpawnResource (2800 , 1319)   -- 
SpawnResource (2594 , 1256)   -- 
SpawnResource (3016 , 2106)   -- 
SpawnResource (2932 , 2243)   -- 
SpawnResource (2381 , 1304)   -- 
SpawnResource (5953 , 2657)   -- e3
SpawnResource (5816 , 2779)   -- 
SpawnResource (5746 , 2999)   -- 
SpawnResource (5737 , 3212)   -- 
SpawnResource (5630 , 3436)   -- 
SpawnResource (5459 , 3618)   -- 
SpawnResource (5129 , 5524)   -- e5
SpawnResource (5074 , 5640)   -- 
SpawnResource (5288 , 5604)   -- 
SpawnResource (5196 , 5348)   -- 
SpawnResource (4977 , 5460)   -- 
SpawnResource (4879 , 5644)   -- 
SpawnResource (3170 , 5199)   -- e6
SpawnResource (3302 , 5305)   -- 
SpawnResource (3527 , 5332)   -- 
SpawnResource (3180 , 4970)   -- 
SpawnResource (2639 , 5624)   -- 
SpawnResource (2799 , 5756)   -- 
SpawnResource (1221 , 5349)   -- e7
SpawnResource (1195 , 5503)   -- 
SpawnResource (1144 , 5700)   -- 
SpawnResource (1898 , 5357)   -- 
SpawnResource (1914 , 5566)   -- 
SpawnResource (1369 , 5204)   -- 
SpawnResource (2712 , 3970)   -- e8
SpawnResource (2682 , 4084)   -- 
SpawnResource (2626 , 4173)   -- 
SpawnResource (2514 , 4265)   -- 
SpawnResource (2342 , 4285)   -- 
SpawnResource (2451 , 4125)   -- 
Pump (4234 , 3771)   -- oil middle



return {lolfactor=95, res=res}

