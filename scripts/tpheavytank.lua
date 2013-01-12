local mt = Spring.GetUnitMoveTypeData(unitID)
local originalspeed = mt.maxSpeed--Spring.MoveCtrl.GetGroundMoveTypeData(unitID, "maxSpeed")  --Spring.UnitScript.GetUnitValue(COB.MAX_SPEED)
local originalturnrate = mt.turnRate  --Spring.UnitScript.GetGroundMoveTypeData(unitID, "RurnRate")
local bunker = false		--bunkered up and immobile?
local bunkerdamagefactor = 0.25 --how much damage is taken when bunkered up
--main pieces
local base = piece "base"
local turret = piece "turret"
local body = piece "base"
--wheels
local wheel1r = piece "wr1"
local wheel2r = piece "wr2"
local wheel3r = piece "wr3"
local wheel1l = piece "wl1"
local wheel2l = piece "wl2"
local wheel3l = piece "wl3"
--weapon
local flare = piece "flare"
local barrel = piece "barrel"
local muzzleflash = SFX.CEG
local muzzleflash2 = SFX.CEG+1

local driving = true
local SIG_AIM = 2
local SIG_DRIVE = 1
local SIG_RESTORE = 4
-----------
local track = {}						--holds the track pieces, filled by gettracks()
--TRACK CONFIGS--
local trackn = 9 --15
local wheelradius = 12
local trackheightoffset = 16
local wheelr = 11						--wheel radius
local trackoffsetx = 24					--gauge of the tank, how far apart the tracks run
local D = 27	--distance between center of wheels
local U = (2*math.pi*wheelr) + D+D		--total perimeter/length of track per side
local ort = "nirgends"					--debug
local ut = 1
local u1 = D / 2						--several lengths to divide the track into certain parts
local u2 = u1 + (math.pi*wheelr)
local u3 = u2 + D
local u4 = u3 + (math.pi*wheelr)

local trackspeed = 1.2	--how fast the track revolves
local ut_left = 0	--track rotation counter
local ut_leftstep = 0	--how much the track rotation counter is increased.  can be changed when steering, ie negative for turning in place
local ut_right = 0
local ut_rightstep = 0
---heading
local currentheading = 0
local lastheading = 0
local deltaheading = 0
--
---blow off pieces defs--
pieces = {}
for i=1,8 do
	table.insert (pieces, piece ("turret" .. i))		
end
for i=1,19 do
	table.insert (pieces, piece ("b_sep" .. i+569))
end
for i=1,22 do 				--***
	if (math.random (0,10) > 4) then 	
		table.insert (pieces, piece ("t_sep" .. i+545	))
	end
end
table.insert (pieces, track[7])
table.insert (pieces, track[12])
table.insert (pieces, track[14])
table.insert (pieces, track[1])
table.insert (pieces, piece "barrel2")
table.insert (pieces, wheel2r)
table.insert (pieces, wheel2l)
exploType = SFX.FALL + SFX.NO_HEATCLOUD
notifyHealed = true
notifyDamaged = true
include "tpdamagepieces.lua"
-----------------
function script.Create()
	
	 --unitID,  scaleX,  scaleY,  scaleZ,  offsetX,  offsetY,  offsetX,  vType,  tType,  Axis	
	--Spring.SetUnitCollisionVolumeData (unitID,  10,  10, 10,  1, 1,  0,  0,  0 , 0)
	
	--Spring.SetUnitBlocking (unitID, false, false, false)
	
	Sleep (200)
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0)
	--Hide (piece "barrel3")
	--Spring.Echo ("unit " .. unitID .. " was created!")	
	get_tracks ()
	
	blockBuildingAnimation(10)
	--getTogether (300,200)
	--WaitForMove (base, x_axis)
	--WaitForMove (base, z_axis)
	tracks_null ()
	movetracks()
	driving=true
	--StartThread (drive)			--put track pieces into position even if tank does not instantly move after creation
	Move (wheel1r, x_axis, 2) Move (wheel2r, x_axis, 2) Move (wheel3r, x_axis, 2)
	Move (wheel1l, x_axis, -2) Move (wheel2l, x_axis, -2) Move (wheel3l, x_axis, -2)
	StartThread (healthRegainedThread)
	updateheading()	
end


--local function RestoreAfterDelay(unitID)
function RestoreAfterDelay()
	Sleep (2000)
	Turn (turret,y_axis,0,math.rad(30))
	Turn (barrel,x_axis,0,math.rad(30))
end

-----DRIVING------
function get_tracks ()
	for i=1,22 do 				--***
	local tname = "t_sep" .. i+545
	track[i] = {}
	track[i] = piece (tname)
	end
end

function script.StartMoving()
	if (bunker==true) then return end
	driving = true
	StartThread(drive) --move the tracks
end

function script.StopMoving()
	driving = false
	Signal (SIG_DRIVE)
	stopwheels ()
end

function updateheading()
	while (true) do
		lastheading = currentheading
		currentheading = Spring.GetUnitHeading(unitID)
		deltaheading = lastheading - currentheading
		
		Sleep (100)
		if (math.abs(deltaheading)<100) then
			ut_leftstep = trackspeed
			ut_rightstep = trackspeed
			--Spring.Echo ("^\t" .. deltaheading)
		end
		if (deltaheading<-1000) then 
			ut_leftstep = trackspeed/4
			ut_rightstep = trackspeed
			--Spring.Echo ("<\t" .. deltaheading)
		end
		if (deltaheading>1000) then 
			--Spring.Echo (">\t" .. deltaheading)
			ut_leftstep = trackspeed
			ut_rightstep = trackspeed/4
		end
			
	end	
end


--degreeshift: für t1 wäre das 0. für tn wäre das (pi*2/trackn)*i
function get_trackpiece_position (ut, degreeshift)
if ut > U then ut = ut-U end
if ut < 0 then ut = U-ut end
if (ut > u1 and ut < u2) then
	local w = (((u1-ut) / (u2-u1))*math.pi) - math.pi/2
	ort = "linkes rad " .. w
	return -D/2 + math.cos(w)*wheelr,  math.sin(w)*wheelr, -w-(math.pi/2) -- use -w+(math.pi/2) if track pieces are inverted
end

if (ut > u3 and ut < u4) then ort = "rechtes rad" 
	local w = ((u3-ut) / (u4-u3))*math.pi + math.pi/2
	ort = "rechtes rad " .. w
	return D/2 + math.cos(w)*wheelr,  math.sin(w)*wheelr, -w-(math.pi/2) -- use -w+(math.pi/2) if track pieces are inverted
end --auf rechtem rad

if (ut > u2 and ut < u3) then ort = "untere gerade" return ut-(u1+u2), wheelr, math.pi end --auf unterer gerade
if (ut < u1) then ort= "obere gerade linker teil" return -ut,-wheelr, math.pi end --auf oberer gerade
if (ut > u4) then ort= "obere gerade rechter teil" return U-ut,-wheelr, math.pi end --auf oberer gerade

return 0,0,0
end


function movetracks()
	for i=1,trackn do
		--Spring.Echo ("moving trackpiece " .. i)
		local zpos, ypos,rot = get_trackpiece_position ((ut_left)+(U/trackn)*i,0)
		Move (track[i], z_axis, zpos)
		Move (track[i], y_axis, ypos+trackheightoffset)
		Turn(track[i], x_axis, rot)
	end
	
	for i=trackn+1,2*trackn+1 do
		--Spring.Echo ("moving trackpiece " .. i)
		local ii = i - trackn
		local zpos, ypos,rot = get_trackpiece_position (ut_right+(U/trackn)*ii,0)
		Move (track[i], z_axis, zpos)
		Move (track[i], y_axis, ypos+trackheightoffset)
		Turn(track[i], x_axis, rot)
	end
end

function tracks_null ()
--distrubute track pieces to left and right wheels
	for i=1,table.getn (track) do
		Move (track[i], x_axis, trackoffsetx)
		--Move (track[i], z_axis, 0)
		--Move (track[i], y_axis, 100)
		--Spring.Echo ("moving trackpiece " .. i)
	end
	for i=trackn+1,trackn*2 do 
		Move (track[i], x_axis, -trackoffsetx)
		--Move (track[i], z_axis, 0)
		--Move (track[i], y_axis, 100)		
	end	
	--Hide unusued trackpieces
	for i=(trackn*2)+1,table.getn (track) do 
		Hide (track[i])
	end
end

function drive ()
	Signal(SIG_DRIVE)
	SetSignalMask(SIG_DRIVE)	
	while (true) do
		--Spring.Echo ("rolling'")
		movetracks()		
		Sleep (50)
		ut_left = ut_left + ut_leftstep
		ut_right = ut_right + ut_rightstep
		if ut_left > U then ut_left = ut_left-U end
		if ut_left < 0 then ut_left = U-ut_left end
		if ut_right > U then ut_right = ut_right-U end
		if ut_right < 0 then ut_right = U-ut_right end
		spinwheels()
	end
end

function spinwheels ()
	Spin (wheel1r, x_axis, ut_rightstep*4)
	Spin (wheel2r, x_axis, ut_rightstep*4)
	Spin (wheel3r, x_axis, ut_rightstep*4)
	Spin (wheel1l, x_axis, ut_leftstep*4)
	Spin (wheel2l, x_axis, ut_leftstep*4)
	Spin (wheel3l, x_axis, ut_leftstep*4)
end

function stopwheels ()
	StopSpin (wheel1r, x_axis)
	StopSpin (wheel2r, x_axis)
	StopSpin (wheel3r, x_axis)
	StopSpin (wheel1l, x_axis)
	StopSpin (wheel2l, x_axis)
	StopSpin (wheel3l, x_axis)
end
--------------


function script.Killed(recentDamage, maxHealth)

end
------------------------------

----BUNKER/MOBILE-------------
function script.Activate ( )
	gobunker()
end
function script.Deactivate ( )
	gomobile()	
end

function gobunker()
	---Spring.Echo ("bunker")
	--Spring.UnitScript.SetUnitValue(COB.ARMORED, 10) --does nothing?
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0)
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate",0)
	bunker = true
	script.StopMoving()	
	Move (body, y_axis, 10,50)
	for i=1,2*trackn+1 do
		local xpos, ypos,zpos = get_trackpiece_bunker_position (i)
		--Move (track[i], x_axis, xpos)
		Move (track[i], y_axis, ypos,80)
		Move (track[i], z_axis, zpos,80)
		Turn (track[i], x_axis,0,math.rad(90))
	end	
end
function get_trackpiece_bunker_position (i)	
	if (i > trackn) then i = i - trackn end
	local s = 12
	if (i <= 3) then return nil, -5, -22+i*s end
	if (i <= 6) then return nil, -5+s, -22+(i-3)*s end
	if (i <= 9) then return nil, -5+s+s, -22+(i-6)*s end	
	return 0,0,0
end

function gomobile ()
	--Spring.Echo ("mobile")
	--Spring.UnitScript.SetUnitValue(COB.ARMORED, 1)
	--Spring.UnitScript.SetUnitValue(COB.MAX_SPEED, originalspeed)
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", originalspeed)
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate",originalturnrate)
	bunker = false
	driving = true
	tracks_null ()
	movetracks()
	Move (body, y_axis, 0, 50)
	script.StartMoving()
end
------------------------------


function healed (heal, pID)
	--pieces fly back into position during repair
	--so track pieces have to be re-put to their sides
	--Spring.Echo ("heal")	
	StartThread (resetTracksThread, pID)
end

function resetTracksThread (pID)
	WaitForMove (pID, x_axis)
	--WaitForMove (pID, y_axis)
	--WaitForMove (pID, z_axis)
	tracks_null ()
	CEGAtPiece ("repairsparks", pID)
end

--SHOOTING
function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return base end

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(120)) --90
	if (math.deg(pitch) < -5) then pitch = math.rad(-5) end
	Turn(barrel, x_axis, -pitch, math.rad(90))
	WaitForTurn(turret, y_axis)
	WaitForTurn(barrel, x_axis)
	--StartThread(RestoreAfterDelay)
	return true
end

function script.FireWeapon1()
	EmitSfx(flare, muzzleflash)
	EmitSfx(flare, muzzleflash2)
--	
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0.5)
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate", 0.1)
	--EmitSfx(flare, muzzleflash)
	Move (barrel, z_axis, -6)
	--Sleep(10)	
	Move (barrel, z_axis, 0, 15)	
	if (bunker==false and driving == false) then StartThread(RestoreAfterDelay) end
	--RestoreAfterDelay()
end

function damaged (damage)
	StartThread (damageSmoke, "blacksmoke", "tpdamagefire_s")
end