--wall1 ... wall52
--chim1high, chim1low .. chim4high, chim4low
--groundcenter, groundcenterforward
local pieces = {}
local chim1high = piece "chim1high"
local chim2high = piece "chim2high"
local chim3high = piece "chim3high"
local chim4high = piece "chim4high"
local pad = piece "groundcenter"
local nano = piece "groundcenterforward"

--wall pieces--
local wall1 = piece "wall1" table.insert (pieces, wall1)
local wall2 = piece "wall2" table.insert (pieces, wall2)
local wall3 = piece "wall3" table.insert (pieces, wall3)
local wall4 = piece "wall4" table.insert (pieces, wall4)
local wall5 = piece "wall5" table.insert (pieces, wall5)
local wall6 = piece "wall6" table.insert (pieces, wall6)
local wall7 = piece "wall7" table.insert (pieces, wall7)
local wall8 = piece "wall8" table.insert (pieces, wall8)
local wall9 = piece "wall9" table.insert (pieces, wall9)
local wall10= piece "wall10" table.insert (pieces, wall10)
local wall11 = piece "wall11" table.insert (pieces, wall11)
local wall12 = piece "wall12" table.insert (pieces, wall12)
local wall13 = piece "wall13" table.insert (pieces, wall13)
local wall14 = piece "wall14" table.insert (pieces, wall14)
local wall15 = piece "wall15" table.insert (pieces, wall15)
local wall16 = piece "wall16" table.insert (pieces, wall16)
local wall17 = piece "wall17" table.insert (pieces, wall17)
local wall18 = piece "wall18" table.insert (pieces, wall18)
local wall9 = piece "wall9" table.insert (pieces, wall19)
local wall20 = piece "wall20" table.insert (pieces, wall20)
--... ...
local wall40 = piece "wall4" table.insert (pieces, wall40)
local wall41 = piece "wall41" table.insert (pieces, wall41)
local wall42 = piece "wall42" table.insert (pieces, wall42)
local wall43 = piece "wall43" table.insert (pieces, wall43)
local wall44 = piece "wall44" table.insert (pieces, wall44)
local wall45 = piece "wall45" table.insert (pieces, wall45)
local wall46 = piece "wall46" table.insert (pieces, wall46)
local wall47 = piece "wall47" table.insert (pieces, wall47)
local wall48 = piece "wall48" table.insert (pieces, wall48)
local wall49 = piece "wall49" table.insert (pieces, wall49)
local wall50 = piece "wall4" table.insert (pieces, wall50)

---blow off pieces defs--
local unblownpieces = pieces
local unitDef = UnitDefs[Spring.GetUnitDefID(unitID)]
local maxhealth = unitDef.health
local maxpieces = table.getn (pieces)
local blowstepdamage = maxhealth / maxpieces
local blowdamage = 0
local blownpieces = {}
-------------------------
SIG_PUMP = 1
--local tpsmokecloud = SFX.CEG
local pumpspeed = 20
local building = false
local pieces = Spring.GetUnitPieceMap  (unitID)
local smokepoint1 = {}  --x, y, z von den chimXhigh pieces
local smokepoint2 = {}
local smokepoint3 = {}
local smokepoint4 = {}
smokepoint1.x,smokepoint1.y,smokepoint1.z = Spring.GetUnitPiecePosDir (unitID, pieces ["chim1high"])
smokepoint2.x,smokepoint2.y,smokepoint2.z = Spring.GetUnitPiecePosDir (unitID, pieces ["chim2high"])
smokepoint3.x,smokepoint3.y,smokepoint3.z = Spring.GetUnitPiecePosDir (unitID, pieces ["chim3high"])
smokepoint4.x,smokepoint4.y,smokepoint4.z = Spring.GetUnitPiecePosDir (unitID, pieces ["chim4high"])

------react to enemy fire-----
function script.HitByWeapon (x, z, weaponDefID, damage)	
	blowdamage = blowdamage + damage
	if (blowdamage < blowstepdamage) then return end	
	blowdamage = 0	
	if (table.getn(unblownpieces) > 0) then
		local exploID = math.random(table.getn(unblownpieces))
		local explo = unblownpieces [exploID]
		if (explo) then			
			Spring.UnitScript.Explode (explo, SFX.SHATTER)
			Spring.UnitScript.Hide (explo)
			table.remove (unblownpieces, exploID)
			table.insert (blownpieces, explo)
		end
	end
end
------------------------------

function script.Create(unitID)
--	Spin(chim2high, x_axis, 7)
end

function script.QueryBuildInfo() return pad end

function script.QueryNanoPiece() return nano end

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

---Pump chimneys when building---
local function pump ()
	Signal(SIG_PUMP)
	SetSignalMask(SIG_PUMP)
	while (building) do
		Move (chim1high, y_axis, -20, pumpspeed)
		WaitForMove (chim1high, y_axis)		
		Spring.SpawnCEG ("tpsmokecloud", smokepoint1.x,smokepoint1.y,smokepoint1.z)
		Move (chim1high, y_axis, 0, pumpspeed)
		WaitForMove (chim1high, y_axis)		
		Sleep (100)
		Move (chim2high, y_axis, -20, pumpspeed)
		WaitForMove (chim2high, y_axis)
		Spring.SpawnCEG ("tpsmokecloud", smokepoint2.x,smokepoint2.y,smokepoint2.z)
		Move (chim2high, y_axis, 0, pumpspeed)
		WaitForMove (chim2high, y_axis)		
		Sleep (100)
		Move (chim3high, y_axis, -20, pumpspeed)
		WaitForMove (chim3high, y_axis)
		Spring.SpawnCEG ("tpsmokecloud", smokepoint3.x,smokepoint3.y,smokepoint3.z)		
		Move (chim3high, y_axis, 0, pumpspeed)
		WaitForMove (chim3high, y_axis)		
		Sleep (100)
		Move (chim4high, y_axis, -20, pumpspeed)
		WaitForMove (chim4high, y_axis)
		Spring.SpawnCEG ("tpsmokecloud", smokepoint4.x,smokepoint4.y,smokepoint4.z)
		Move (chim4high, y_axis, 0, pumpspeed)
		WaitForMove (chim4high, y_axis)
		Sleep (100)
	end
end

function script.StartBuilding()	
	building = true
	StartThread (pump)
end
function script.StopBuilding()
	building = false
	Signal(SIG_PUMP)
end
---------------------------------

function script.Killed(recentDamage, maxHealth)
	return 0
end