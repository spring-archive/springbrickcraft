--wall1 ... wall52
--chim1high, chim1low .. chim4high, chim4low
--groundcenter, groundcenterforward
pieces = {}
local chim1high = piece "funnel_hig"
local smokepoint = piece "smokepoint"
local pad = piece "nano"
local nano = piece "nano"
local greenbar = piece "progbar"
local base = piece "base"
local door = piece "door"

---blow off pieces defs--
exploType = SFX.EXPLODE + SFX.NO_HEATCLOUD + SFX.FIRE
for i=29,52 do
	if (i~=47) then table.insert (pieces, piece ("b_sep" .. i)) end
end
table.insert (pieces, chim1high)
table.insert (pieces, piece ("funnel_low"))
include "tpdamagepieces.lua"
-------------------------
SIG_PUMP = 1
local smoke = SFX.CEG
local debrisSmoke = SFX.CEG+1
local pumpspeed = 20
local building = false
--local allpieces = Spring.GetUnitPieceMap  (unitID)



function script.Create(unitID)
	Turn (greenbar, y_axis, math.rad(180))
	updatestatusbar ()
	StartThread(blockBuildingAnimation, 200,450)
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
	updatestatusbar()
	return 0
end

---Pump chimneys when building, closing and opening of the door---
local function pump ()
	Signal(SIG_PUMP)
	SetSignalMask(SIG_PUMP)
	while (building) do
		local _, metalUse = Spring.GetUnitResources (unitID)
		if (metalUse > 0) then
			Move (chim1high, y_axis, -5, pumpspeed)
			WaitForMove (chim1high, y_axis)		
			EmitSfx (smokepoint, smoke)
			Move (chim1high, y_axis, 0, pumpspeed)
			WaitForMove (chim1high, y_axis)
			Sleep (10)
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
	building = true
	--SetUnitValue(COB.INBUILDSTANCE, 1)
	StartThread (pump)
end
function script.StopBuilding()
	building = false
	--SetUnitValue(COB.INBUILDSTANCE, 0)
	Signal(SIG_PUMP)	
	local x,y,z = Spring.GetUnitPosition (unitID)
	Sleep (100)
	local unitsatfactory = Spring.GetUnitsInCylinder (x,z, 40)--20 HAX: instead 
	--Spring.Echo ("unitsatfac:" .. table.getn (unitsatfactory))	
	if (table.getn (unitsatfactory) > 1) then 		--was building completed or canceled? lets see if there is someone else beside the fac
		--Spring.AddUnitImpulse (bID, 1, 5, 0) --naja		
		--Spring.Echo ("GG.HopOutOfFactory (bID, unitID)")
		GG.HopOutOfFactory (bID, unitID)
		--Spring.Echo ("fertig mit bauen")
		--Turn (door, x_axis, -math.rad(170), math.rad(180))
		--Sleep (2000)
		--Turn (door, x_axis, 0, math.rad(180))
		Turn (chim1high, x_axis, -math.rad(90), math.rad(360))
		Sleep (1000)
		Turn (chim1high, x_axis, 0, math.rad(360))		
	end
	updatestatusbar()
end



---------------------------------

function script.Killed(recentDamage, maxHealth)
	StartThread (deathRumble)
	Sleep (1000)
	Move (base, y_axis, -100, 80)
	WaitForMove (base,y_axis)
	return 0
end

function deathRumble ()
	while (true) do
		Move (base, x_axis, math.random (-10,10), 20)
		Move (base, z_axis, math.random (-10,10), 20)
		Sleep (100)
		EmitSfx (base, debrisSmoke)
	end
end