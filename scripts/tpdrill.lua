local blatest = piece "t5"
track = {}
pieces = {}
local ich =0
--Spring.MoveCtrl.GetGroundMoveTypeData(unitID, "maxSpeed", 0.5)
local mt = Spring.GetUnitMoveTypeData(unitID)
local originalspeed = mt.maxSpeed--Spring.MoveCtrl.GetGroundMoveTypeData(unitID, "maxSpeed")  --Spring.UnitScript.GetUnitValue(COB.MAX_SPEED)
local originalturnrate = mt.turnRate  --Spring.UnitScript.GetGroundMoveTypeData(unitID, "RurnRate")
--main pieces
local flare_high = piece "flare_high"
local turretbase_flare = piece "turretbase_flare"
local base = piece "base"
local turretbase = piece "turretbase"
--wheels
local wheel1 = piece "wheel1"		--table.insert (pieces, wheel1)
local wheel2 = piece "wheel2"		--table.insert (pieces, wheel2)
local wheel3 = piece "wheel3"		--table.insert (pieces, wheel3)
local wheel4 = piece "wheel4"		--table.insert (pieces, wheel4)
local wheel5 = piece "wheel5"		--table.insert (pieces, wheel5)
local wheel6 = piece "wheel6"		--table.insert (pieces, wheel6)
--wheel guards
local wheelguard1  = piece "wheelguar1"
local wheelguard2  = piece "wheelguar2"
local wheelguard3  = piece "wheelguar3"
local wheelguard4  = piece "wheelguar4"
--------
--arm
local arm1 = piece "arm1"			--table.insert (pieces, wheel1)
local arm2 = piece "arm2"			--table.insert (pieces, wheel2)
local drillhead = piece "drillhead"			--table.insert (pieces, wheel2)
local armpiston = piece "armpiston"
---other pieces
local base1 = piece "base1"		table.insert (pieces, base1)
local base2 = piece "base2"		table.insert (pieces, base2)
local base3 = piece "base3"		table.insert (pieces, base3)
local base4 = piece "base4"		table.insert (pieces, base4)
local base5 = piece "base5"		table.insert (pieces, base5)
local base6 = piece "base6"		table.insert (pieces, base6)
local base1 = piece "base1"		table.insert (pieces, base1)
for i=1,19 do
	table.insert (pieces, piece ("turret" .. i))
end
for i=1,8 do
	table.insert (pieces, piece ("cockpit" .. i))
end
---
local unblownpieces = pieces
local unitDef = UnitDefs[Spring.GetUnitDefID(unitID)]
local maxhealth = unitDef.health
local	maxpieces = table.getn (pieces)
local blowstepdamage = maxhealth / maxpieces
local	blowdamage = 0
local	blownpieces = {}
--SIGNALS--
local driving = true
local SIG_AIM = 2
local SIG_DRIVE = 1
local SIG_RESTORE = 4
-----------
--TRACK CONFIGS--
local trackn = 13
local wheelradius = 12
local trackspeed = 10
local trackheightoffset = 10
local wheel1x = 9
local wheel2x = 46
local wheelr = 10
local wheely = 0
local trackoffsetx = 20
local D = math.abs (wheel1x - wheel2x)
local U = (2*math.pi*wheelr) + D+D
local ort = "nirgends"
local ut = 1
local u1 = D / 2			--100
local u2 = u1 + (math.pi*wheelr)	--100 + 157 = 257
local u3 = u2 + D					--100+157+200 = 457
local u4 = u3 + (math.pi*wheelr)
---other things
local cargobaybaseplate = piece "cargobaybaseplate"
local cargop = {}		--die ladungs klötze
local cargoplane = piece "cargoplane"
local maxcargo = 600
local currentcargo = 0
-----------------
function script.Create()	
	Hide (cargoplane)
	---cargo pieces
	for i=1,6 do
		cargop[i] = {}
		cargop[i] = piece ("cargo" .. i)
		if (i > 3) then Hide (cargop[i]) end
	end
	
	--Spring.Echo ("unit " .. unitID .. " was created!")
	get_tracks ()
	for i=1,28 do 
		Move (track[i], x_axis, trackoffsetx)
		Move (track[i], z_axis, 0)
		Move (track[i], y_axis, 100)
		--Spring.Echo ("moving trackpiece " .. i)
	end
	for i=trackn+1,trackn*2 do 
		Move (track[i], x_axis, -trackoffsetx)
		Move (track[i], z_axis, 0)
		Move (track[i], y_axis, 100)
		--Spring.Echo ("moving trackpiece " .. i)
	end	
	Spin(wheel1, x_axis, 7)
	Spin(wheel2, x_axis, 7)
	Spin(wheel3, x_axis, 7)
	Spin(wheel4, x_axis, 7)
	Spin(wheel5, x_axis, 7)
	Spin(wheel6, x_axis, 7)	
	Hide (wheelguard1)
	Hide (wheelguard2)
	Hide (wheelguard3)
	Hide (wheelguard4)
	Hide (track[28])
	Hide (track[27])
	--Hide (track[26])
	--Hide (track[13])
	--Hide (track[30])
	--StartThread (show_cargo)
	--StartThread(RestoreAfterDelay)
end

--degreeshift: für t1 wäre das 0. für tn wäre das (pi*2/trackn)*i
function get_trackpiece_position (ut, degreeshift)
if ut > U then ut = ut-U end --echt?
if ut < 0 then ut = U-ut end --echt?
if (ut > u1 and ut < u2) then
	local w = (((u1-ut) / (u2-u1))*math.pi) - math.pi/2
	ort = "linkes rad " .. w
	return -D/2 + math.cos(w)*wheelr,  math.sin(w)*wheelr, -w+(math.pi/2) --end --auf linkem rad
end

if (ut > u3 and ut < u4) then ort = "rechtes rad" 
	local w = ((u3-ut) / (u4-u3))*math.pi + math.pi/2
	ort = "rechtes rad " .. w
	return D/2 + math.cos(w)*wheelr,  math.sin(w)*wheelr, -w+(math.pi/2)
end --auf rechtem rad

if (ut > u2 and ut < u3) then ort = "untere gerade" return ut-(u1+u2), wheelr, 0 end --auf unterer gerade
if (ut < u1) then ort= "obere gerade linker teil" return -ut,-wheelr, 0 end --auf oberer gerade
if (ut > u4) then ort= "obere gerade rechter teil" return U-ut,-wheelr, 0 end --auf oberer gerade

return 0,0,0
end


--local function RestoreAfterDelay(unitID)
function RestoreAfterDelay()
	Signal(SIG_RESTORE)
	SetSignalMask(SIG_RESTORE)	
	Sleep(1000)	
	Move (armpiston, z_axis, 0, 8)
	WaitForMove(armpiston, z_axis)
	StopSpin(drillhead, z_axis)	
	Turn(drillhead, z_axis, 0, math.rad(50))
	Turn(turretbase, y_axis, 0, math.rad(90))
	Turn(arm1, x_axis, 0, math.rad(50))
	Move (arm2, z_axis, 0, 3)	
	--Spring.UnitScript.SetUnitValue(COB.MAX_SPEED, originalspeed)
	--die richtigen:
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 100)
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate",800) -- originalturnrate)
end

function dumpcargo ()
	--Spring.Echo ("kippe ab")
	Turn (cargobaybaseplate, z_axis, math.rad(90), math.rad(90))	
	local i = 0
		for x=1, currentcargo-100, 100 do
		i = i + 1	
		if i < 7 then Spring.UnitScript.Explode (cargop[i], SFX.FALL) end
		end	
	WaitForTurn (cargobaybaseplate, z_axis)
	Turn (cargobaybaseplate, z_axis, 0, math.rad(90))
	currentcargo = 0
end


function cargostatus(newcargo)
	--Spring.Echo ("currentcargo="..currentcargo .. " , newcargo=" .. newcargo)
	if (newcargo==nil) then return end  
	if (currentcargo > newcargo) then
		StartThread (dumpcargo)	
	else
		currentcargo = newcargo
	end
	for i=1,6 do
		Hide (cargop[i])
	end  
  if (newcargo < 100) then return end
  --if newcargo==currentcargo then return end
  local i = 0
  for x=1, newcargo-100, 100 do
	i = i + 1	
	if i < 7 then Spring.UnitScript.Show  (cargop[i]) end
	--Spring.UnitScript.Explode (cargop[i], SFX.SHATTER)
	--Spring.Echo ("X" .. i)
  end	
  --Spring.Echo('unit ' .. unitID .. ' received a message: ' .. newcargo)
end

-----DRIVING------
function script.StartMoving()
	driving = true
	Spin(wheel1, x_axis, 7)	--räder drehen erstmal nur so
	Spin(wheel2, x_axis, 7)
	Spin(wheel3, x_axis, 7)
	Spin(wheel4, x_axis, 7)
	Spin(wheel5, x_axis, 7)
	Spin(wheel6, x_axis, 7)	
	StartThread(drive) --move the tracks
end

function script.StopMoving()
	driving = false
	Signal (SIG_DRIVE)
	StopSpin(wheel1, x_axis)
	StopSpin(wheel2, x_axis)
	StopSpin(wheel3, x_axis)
	StopSpin(wheel4, x_axis)
	StopSpin(wheel5, x_axis)
	StopSpin(wheel6, x_axis)
end

function drive ()
	Signal(SIG_DRIVE)
	SetSignalMask(SIG_DRIVE)
	local ut = 1
	while (driving==true) do	

	for i=1,trackn do
	--Spring.Echo ("moving trackpiece " .. i)
	local zpos, ypos,rot = get_trackpiece_position (ut+(U/trackn)*i,0)
	Move (track[i], z_axis, zpos)
	Move (track[i], y_axis, ypos+trackheightoffset)
	Turn(track[i], x_axis, rot)
	end
	
	for i=trackn,2*trackn do
	--Spring.Echo ("moving trackpiece " .. i)
	local ii = i - trackn
	local zpos, ypos,rot = get_trackpiece_position (ut+(U/trackn)*ii,0)
	Move (track[i], z_axis, zpos)
	Move (track[i], y_axis, ypos+trackheightoffset)
	Turn(track[i], x_axis, rot)
	end
	
	Sleep (50)
	ut = ut + 2
	if ut > U then ut = ut-U end --echt?
	if ut < 0 then ut = U-ut end --echt?
	
	end
end
--------------

------react to enemy fire-----
function script.HitByWeapon (x, z, weaponDefID, damage)
	--auch wenn selfdamage geblockt wird, wird das hier aufgerufen. also noch if weapondefid = drill then return
	blowdamage = blowdamage + damage
	if (blowdamage < blowstepdamage) then return end	
	blownnumber = math.ceil(damage / blowstepdamage)	
	for i = 1, blownnumber , 1 do
		if (table.getn(unblownpieces) > 0) then
			local exploID = math.random(table.getn(unblownpieces))
			local explo = unblownpieces [exploID]
			if (explo) then
				blowdamage = blowdamage - blowstepdamage
				Spring.UnitScript.Explode (explo, SFX.EXPLODE)	
				Spring.UnitScript.Hide (explo)
				table.remove (unblownpieces, exploID)
				table.insert (blownpieces, explo)			
			else
				blowdamage = 0 
			end
		end
	end	
end
	

------------------------------


function script.QueryWeapon1() return turretbase_flare end

function script.AimFromWeapon1() return turretbase end

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	--no turning & moving during drilling
	--Spring.UnitScript.SetUnitValue(COB.MAX_SPEED, 1)	
	
	Turn(turretbase, y_axis, heading, math.rad(90))
	
	--test mal nach fireweapon1, hier hats aber schon geklappt im prinzip
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0.5)
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate", 0.1)
	
	--if (math.deg(pitch) < 0) then pitch = 0 end
	--Turn(arm_r, x_axis, -pitch-math.rad(90), math.rad(180))
	--WaitForTurn(turretbase, y_axis) --war vorher drin
	Turn(arm1, x_axis, math.rad(90), math.rad(90)) --den arm senkrecht stellen
	--Turn(arm1, x_axis, math.rad(90)+pitch, math.rad(90)) --versuchen in den anvisierten punkt zu bohren
	WaitForTurn(arm1, x_axis)  ----war vorher drin
	--Move (arm2, z_axis, 20, 3)	--ganz in den boden stecken oder nur fräsen?
	Move (armpiston, z_axis, 30, 5)
	Spin(drillhead, z_axis, 3)	
	return true
end

function script.FireWeapon1()
--	EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0.5)
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate", 0.1)
	Sleep(10)
	--StartThread(RestoreAfterDelay)
	RestoreAfterDelay()
end

function script.Killed(recentDamage, maxHealth)
	Sleep(30)
end

function get_tracks ()
	--Spring.Echo ("----------------------------------------hi, drill here")
	for i=1,28 do 
	local tname = "t" .. i
	--Spring.Echo ("adding track piece: " .. tname)
	track[i] = {}
	track[i] = piece (tname)
	--track[i] = piece [[tname]]
	end

--for k, v in pairs(Spring.GetUnitPieceMap(unitID)) do
--	Spring.Echo('piece ' .. k)
--end	
end

--no self damage
function script:UnitPreDamaged (unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam) 
return 0
end