--BUG: er fängt nicht an zu bauen bis die vorherige unit vom spieler einmal bewegt wurde Oo

local nano = piece "padtopcenter"
local pad = piece "pad"
local frame = piece "frame"
local isbuilding = false
local SIG_BUILD = 1
local bID = nil

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.SHATTER + SFX.NO_HEATCLOUD
for i=1,8 do
	table.insert (pieces, piece ("rod" .. i .. "a"))
	table.insert (pieces, piece ("rod" .. i .. "b"))
end
for i=1,12 do
	table.insert (pieces, piece ("frame" .. i))
end
for i=1,9 do
	table.insert (pieces, piece ("pad" .. i))
end
for a=1,4 do
	for b=1,3 do
		table.insert (pieces, piece ("pillar" .. a .. "_" ..b))
	end
end

healthmulti = 1.5
include "tpdamagepieces.lua"
--Spring.Echo ("blowstepdamage:"..blowstepdamage)
----------------------------

function script.Create()
	--Spring.Echo ("Heliport " .. unitID .. " was created!")
	--Spin (pad, x_axis, math.rad(45))	
	--StartThread (tumble)
	blockBuildingAnimation(50)
	bID = nil
	isbuilding = false
	nullposition ()
	Move (nano,y_axis, 5) ---
	StartThread (rotatepad)
end

local function RestoreAfterDelay(unitID)

end

function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return turret end

function script.AimWeapon1( heading, pitch )

	return true
end

---nullposition: frame ist unten! pad ist aufm kopf!
function nullposition ()
	Sleep (800)
	Move (frame, y_axis, -75)
	Turn (pad, z_axis, math.rad(0)) --180
end

function nullposition_slow ()
	Move (frame, y_axis, -75, 18)
	Turn (pad, z_axis, math.rad(0), math.rad(90))---180
end

--------BUILDING---------
function script.QueryBuildInfo() return nano end

function script.QueryNanoPiece() return nano end

function script.StartBuilding()	
	--Spring.Echo ("start building")
	isbuilding = true	
end

function rotatepad ()
	--Spring.Echo ("start rotatepade")
	--Signal(SIG_BUILD)
	--SetSignalMask(SIG_BUILD)
	while (true) do
		--Turn (pad, z_axis, math.rad(0))		
		Sleep (500)
		local a = 0	
		bID = Spring.GetUnitIsBuilding (unitID)
		if (bID) then
			--Spring.Echo ("found buildunit:" .. bID)
			local  health,  maxHealth,  paralyzeDamage, captureProgress,  buildprog = Spring.GetUnitHealth (bID)
			--Spring.MoveCtrl.Enable(bID)			
			--Spring.SetUnitRotation (bID, math.rad(180),0,0)
			while (bID ~= nil) do
				bID = Spring.GetUnitIsBuilding (unitID)
				--Spring.Echo ("dreher!" .. bID)
				if (Spring.ValidUnitID (bID)) then					
					health,  maxHealth,  paralyzeDamage, captureProgress,  buildprog = Spring.GetUnitHealth (bID)
					if (not buildprog) then buildprog = 0 end
				else
					buildprog = nil
				end
				--if (buildprog ~= nil) then 
					--Spring.MoveCtrl.Enable(bID)
					--Spring.Echo ("building " .. bID .. " a=" .. a .. " bprog=" .. buildprog)
					Move (frame, y_axis, -75 * (1-buildprog))
				--end
				--Spring.SetUnitRotation (bID, a,0,0)
				--Spring.MoveCtrl.SetRotation (bID, 0,0,a)
				--if (buildprog and buildprog < 1 and buildprog > 0.7) then
				--	a = (((1-buildprog)) * math.pi)
				--	Turn (pad, z_axis, a)
				--end
				if (buildprog == 1) then 
					--Spring.Echo (bID .. " ist fertig gebaut!")
					--Spring.MoveCtrl.Disable(bID)
					isbuilding = false
					bID = nil
					--return
				end			
			Sleep (50)
			end
		else
				--Spring.Echo ("nothing to do..")
		end
	end
end

function script.StopBuilding()
	--Spring.Echo ("stop building")
	--SetUnitValue(COB.YARD_OPEN, 0)
	--SetUnitValue(COB.INBUILDSTANCE, 0)
	--SetUnitValue(COB.BUGGER_OFF, 0)
	--Move (frame, y_axis, -50)
	--isbuilding=false
	--Signal(SIG_BUILD)
	--frame down, pad drehen - nullpos	
	nullposition_slow ()
	if (bID) then Spring.MoveCtrl.Disable(bID) bID=nil end
end

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
	if (bID) then Spring.MoveCtrl.Disable(bID) bID=nil end
	--isbuilding=false
	--bID=nil
	--Signal(SIG_BUILD)
	nullposition_slow ()
	return 0
end

---------------------
function script.FireWeapon1()

	Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	Sleep(30)
end

--einheiten in der nähe rumwerfen. naja.
function tumble ()
local a = 0
while (true) do
local x,y,z = Spring.GetUnitPosition (unitID)
		bID = Spring.GetUnitsInSphere (x,y,z, 300)	

if (bID and table.getn(bID)>1) then
		a=a+0.2
		local b = bID[1]
		if unitID == b then b = bID[2] end
		--Spring.MoveCtrl.Enable(b)
		--Spring.Echo ("drehe: " .. b)
		--Spring.SetUnitRotation (b, a,0,0)
		Spring.AddUnitImpulse (b,0,1,0)
		Spring.MoveCtrl.Disable(b)
	end
	Sleep (100)
end
end