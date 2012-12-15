Spring.Echo ("---units\tpugrages.lua: generate ALL the tech & upgrades---")

local unitDef = {
script = "tpcivvehicle.lua",
buildPic = "placeholder.png",
objectName = "fatdude.s3o",
script = "selfkill.lua",
--cost
buildCostMetal = 500,
buildCostEnergy = 0,
buildTime = 25,
reclaimable = false,
--Health
maxDamage = 1500,
idleAutoHeal = 0,
sightDistance = 0,
activateWhenBuilt = true,
Category = [[NEUTRAL]],
}

local techs = {}
local techsn = 3 -- <<--
for c=1, techsn do
	techs[c] = {}
	for j,x in pairs(unitDef) do
		techs[c][j] = x
	end
end

techs[1].name = "High Speed Dirt (Upgrade!)"
techs[1].description ="More speed for the 'Rough Rider'"
techs[1].unitname = "tpupgradewheels"
techs[1].buildCostMetal = 500	--1000
techs[1].buildCostEnergy = 500 --0
techs[1].buildPic = "tpupgradewheels.png"


techs[2].name = "Quad Cannon (Upgrade!)"
techs[2].description ="Adds two extra barrels to the 'Dragonaut'"
techs[2].unitname = "tpupgradequadcannon"
techs[2].buildCostMetal = 1000	--2000
techs[2].buildCostEnergy = 1000 --0
techs[2].buildPic = "tpupgradequadcannon.png"

techs[3].name = "Electric Funeral (Upgrade!)"
techs[3].description ="Increases combat effectiveness of the 'Reflex'"
techs[3].unitname = "tpupgradechaindamage"
techs[3].buildCostMetal = 750 --2000  --1000
techs[3].buildCostEnergy = 750 --0
techs[3].buildPic = "tpupgradechaindamage.png"

local finishedtechs = {}
for i=1, #techs do
	finishedtechs[techs[i].unitname]=techs[i]
end

return (lowerkeys(finishedtechs))

--[[
return lowerkeys({
["tpcar_1"] = techs[1],
["tpcar_2"] = techs[2],
["tpcar_3"] = techs[3],
["tpcar_4"] = techs[4],
["tpcar_5"] = techs[5],
["tpcar_6"] = techs[6],
["tpcar_7"] = techs[7],
["tpcar_8"] = techs[8],
})
--]]