--wall1 ... wall52
--chim1high, chim1low .. chim4high, chim4low
--groundcenter, groundcenterforward
pieces = {}
--local chim1high = piece "chim1high"
--local chim2high = piece "chim2high"
--local chim3high = piece "chim3high"
--local chim4high = piece "chim4high"
local smokef = {}	--smoke emit points
local chim= {}		--pumping chimneys
for i=1,4 do
	smokef[i] = piece ("smokef"..i)
	chim[i] = piece ("chim"..i.."high")
end

local base = piece "base"
local pad = piece "groundcenter"
local nano = piece "groundcenterforward"
local greenbar = piece "greenbar"

local door5 = piece "door5"

---blow off pieces defs--
exploType = SFX.FALL + SFX.NO_HEATCLOUD
for i=1,4 do
	table.insert (pieces, piece ("chim"..i.."high"))
	table.insert (pieces, piece ("chim"..i.."low"))
end

for i=1,13 do
	table.insert (pieces, piece ("wall1_" .. i))
	table.insert (pieces, piece ("wall2_" .. i))
	end
for i=1,16 do
	table.insert (pieces, piece ("wall3_" .. i))
	end
for i=1,5 do
	table.insert (pieces, piece ("wall4_" .. i))
	end
for i=1,6 do
	table.insert (pieces, piece ("door" .. i))
	end
include "tpdamagepieces.lua"
-------------------------
SIG_PUMP = 1
SIG_PUMP = 2
local smoke = SFX.CEG
local debrisSmoke = SFX.CEG+1
local pumpspeed = 20
local building = false
local allpieces = Spring.GetUnitPieceMap  (unitID)
--local smokepoint1 = {}  --x, y, z von den chimXhigh pieces
--local smokepoint2 = {}
--local smokepoint3 = {}
--local smokepoint4 = {}
--smokepoint1.x,smokepoint1.y,smokepoint1.z = Spring.GetUnitPiecePosDir (unitID, allpieces ["chim1high"])
--smokepoint2.x,smokepoint2.y,smokepoint2.z = Spring.GetUnitPiecePosDir (unitID, allpieces ["chim2high"])
--smokepoint3.x,smokepoint3.y,smokepoint3.z = Spring.GetUnitPiecePosDir (unitID, allpieces ["chim3high"])
--smokepoint4.x,smokepoint4.y,smokepoint4.z = Spring.GetUnitPiecePosDir (unitID, allpieces ["chim4high"])

local bID = Spring.GetUnitIsBuilding (unitID)	--get the ID of the unit the factory is building

function script.Create(unitID)
	StartThread(blockBuildingAnimation)
	updatestatusbar ()
--	Spin(chim2high, x_axis, 7)
end


---------------------------------------------------
--[[
local buildSpots = {
  [UnitDefNames["tppioneer"].id] = piece "wall1_1",
  [UnitDefNames["tptank"].id] = piece "door3",
}
--]]

function script.QueryBuildInfo() 
	return pad
	--return buildSpots [bdefID] or pad 	
	--di = math.random (1,10)
	--if (di > 5) then return pad else return door5 end
end

function script.QueryNanoPiece() return nano end
---------------------------------------------------


function script.Activate()
	SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.BUGGER_OFF, 1)
	return 1
end

function script.Deactivate()
	SetUnitValue(COB.YARD_OPEN, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	SetUnitValue(COB.BUGGER_OFF, 0)
	return 0
end

---Pump chimneys when building
local function pump ()
	Signal(SIG_PUMP)
	SetSignalMask(SIG_PUMP)
	if (string.find (unitName (bID), "upgrade")) then
		--upgrade research animation		
		Spin (chim[1], y_axis, -3)
		Spin (chim[2], y_axis, 3)
		Spin (chim[3], y_axis, -3)
		Spin (chim[4], y_axis, 3)
		while (building) do	
			updatestatusbar()
			Sleep (100)
		end
	else	--normal unit building animation
		local c = 1
		while (building) do
			local _, metalUse = Spring.GetUnitResources (unitID)
			if (metalUse > 0) then
				c=c+1
				if (c>4) then c = 1 end
				Move (chim[c], y_axis, -20, pumpspeed)
				WaitForMove (chim[c], y_axis)
				EmitSfx (smokef[c], smoke)
				Move (chim[c], y_axis, 0, pumpspeed)
				WaitForMove (chim[c], y_axis)			
				Sleep (100)
				updatestatusbar()
			else
				Hide (greenbar)
				Sleep (200)
				Show (greenbar)
				Sleep (200)
				Hide (greenbar)
				Sleep (200)
				Show (greenbar)
			end
		end
	end
end

--update the green status bar thing for buildprogress
function updatestatusbar ()
	bID = Spring.GetUnitIsBuilding (unitID)	--get the ID of the unit the factory is building	
	if (bID) then
		--the last returned arguement of GetUnitHealth is the buildprogress
		--it goes from 0 to 1
		local _,  _,  _, _,  buildprogress = Spring.GetUnitHealth (bID)
		if (buildprogress) then
			--as buildprogress gets closer to 1, the greenbar moves up
			Move (greenbar, y_axis, -3.5 + 3.5*buildprogress)
		end
	else
		--bID is nil, that means no unit is being build - hide the greenbar by moving it to 0% position
		Move (greenbar, y_axis, -3.5)
	end
end

function script.StartBuilding()	
	Sleep (10)
	--local bums = Spring.GetUnitIsBuilding (unitID)--für die ct nubs, lösch mich
	--bdefID = Spring.GetUnitDefID (bums)--für die ct nubs, lösch mich
	updatestatusbar()
	building = true
	--SetUnitValue(COB.INBUILDSTANCE, 1)	
	StartThread (pump)
end

--closing and opening of the door
function script.StopBuilding()
	building = false
	bID = nil
	--SetUnitValue(COB.INBUILDSTANCE, 0)
	Signal(SIG_PUMP)	
	local x,y,z = Spring.GetUnitPosition (unitID)
	Sleep (100)
	local unitsatfactory = Spring.GetUnitsInCylinder (x,z, 40)
	--Spring.Echo ("unitsatfac:" .. table.getn (unitsatfactory))
	if (table.getn (unitsatfactory) > 1) then 		--was building completed or canceled? lets see if there is someone else beside the fac
		--Spring.Echo ("fertig mit bauen")
		Turn (door5, x_axis, -math.rad(170), math.rad(90))
		Sleep (2000)
		Turn (door5, x_axis, 0, math.rad(90))		
	end
	updatestatusbar()
		for i=1,4 do
			StopSpin (chim[i], y_axis, 3)
			Turn (chim[i], y_axis, 0, 3)
			Move (chim[i], y_axis, 0, pumpspeed)
		end
end

---------------------------------


function script.Killed(recentDamage, maxHealth)
	StartThread (deathRumble)
	Sleep (1000)
	Move (base, y_axis, -200, 80)
	WaitForMove (base,y_axis)
end

function deathRumble ()
	while (true) do
		Move (base, x_axis, math.random (-30,30), 40)
		Move (base, z_axis, math.random (-30,30), 40)
		EmitSfx (math.random(5,20), debrisSmoke)
		EmitSfx (base, debrisSmoke)
		Sleep (100)
	end
end

function unitName (unitID)
	if (not Spring.ValidUnitID (unitID)) then return "!invalid unitID in unitName()!" end
	local udID =Spring.GetUnitDefID(unitID)
	local uDef = UnitDefs [udID]
	return uDef.name
end