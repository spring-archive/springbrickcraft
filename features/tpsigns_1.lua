local featureDef	=	{
	--name = "--will be replaced anyway--",
	--description = "--will be replaced anyway--",
	--object = "--will be replaced anyway--",
	footprintx = 3,
	footprintz = 1,
	height = 30,
	blocking = true,
	upright = false,	
	energy = 0,
	metal = 0,
	damage = 50000,
	flammable = false,
	reclaimable = false,
	autoreclaimable = false,
	noselect = false,
	mass = 90000,
	indestructible  = true,
} 
--[[
local features = {}
for i=1,10,1 do
	features[i] = {}
	for j,x in pairs(featureDef) do
	features[i][j] = x
end
--]]

--+++use some loops instead of this c&p
local tpsign_1 = {}
local tpsign_2 = {}
local tpsign_3 = {}
local tpsign_4 = {}
local tpsign_5 = {}
local tpsign_6 = {}
local tpsign_7 = {}
local tpsign_8 = {}
local tpsign_9 = {}
local tpsign_10 = {}

for j,x in pairs(featureDef) do
	tpsign_1[j] = x
	tpsign_2[j] = x
	tpsign_3[j] = x
	tpsign_4[j] = x
	tpsign_5[j] = x	
	tpsign_6[j] = x	
	tpsign_7[j] = x	
	tpsign_8[j] = x	
	tpsign_9[j] = x
	tpsign_10[j] = x
end

tpsign_1.name = "tpsign_1"
tpsign_1.object = "tpsign_1.s3o"
tpsign_1.description ="Woof Woof"

tpsign_2.name = "tpsign_2"
tpsign_2.object = "tpsign_2.s3o"
tpsign_2.description ="Derp."

tpsign_3.name = "tpsign_3"
tpsign_3.object = "tpsign_3.s3o"
tpsign_3.description ="Nothing is cooler."

tpsign_4.name = "tpsign_4"
tpsign_4.object = "tpsign_4.s3o"
tpsign_4.description ="Join us or DIE!"

tpsign_5.name = "tpsign_5"
tpsign_5.object = "tpsign_5.s3o"
tpsign_5.description ="Respect your local newb."

tpsign_6.name = "tpsign_6"
tpsign_6.object = "tpsign_6.s3o"
tpsign_6.description ="The game with the funny Lua."

tpsign_7.name = "tpsign_7"
tpsign_7.object = "tpsign_7.s3o"
tpsign_7.description ="Google for >Gala Bufett< to get your stomage blown to heaven."

tpsign_8.name = "tpsign_8"
tpsign_8.object = "tpsign_8.s3o"
tpsign_8.description ="ding!"

tpsign_9.name = "tpsign_9"
tpsign_9.object = "tpsign_9.s3o"
tpsign_9.description ="The Iamman people could never balance on the knife’s edge of peace."

tpsign_10.name = "tpsign_10"
tpsign_10.object = "tpsign_10.s3o"
tpsign_10.description ="Sieg Zeon!"

return lowerkeys({
["tpsign_1"] = tpsign_1,
["tpsign_2"] = tpsign_2,
["tpsign_3"] = tpsign_3,
["tpsign_4"] = tpsign_4,
["tpsign_5"] = tpsign_5,
["tpsign_6"] = tpsign_6,
["tpsign_7"] = tpsign_7,
["tpsign_8"] = tpsign_8,
["tpsign_9"] = tpsign_9,
["tpsign_10"] = tpsign_10,
}
)