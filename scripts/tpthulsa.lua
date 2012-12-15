
--main pieces
local base = piece "base"
local turret = piece "turret"
local barrel = piece "barrel"
local flare = piece "flare"
--wheels
local wheel1r = piece "wheel1r"
local wheel2r = piece "wheel2r"
local wheel3r = piece "wheel3r"
local wheel4r = piece "wheel4r"
local wheel5r = piece "wheel5r"
local wheel1l = piece "wheel1l"
local wheel2l = piece "wheel2l"
local wheel3l = piece "wheel3l"
local wheel4l = piece "wheel4l"
local wheel5l = piece "wheel5l"

local driving = true
local SIG_AIM = 2
local SIG_DRIVE = 1
local SIG_RESTORE = 4
-----------
local track = {}						--holds the track pieces, filled by gettracks()
--TRACK CONFIGS--
local trackn = 14 --15
local wheelradius = 12
local trackspeed = 10
local trackheightoffset = 10
local wheel1x = 0
local wheel2x = 45
local wheelr = 10						--wheel radius
--local wheely = 0
local trackoffsetx = 20					--gauge of the tank, how far apart the tracks run
local D = math.abs (wheel1x - wheel2x)	--distance between center of wheels
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


-----------------
function script.Create()	
	--Spring.Echo ("unit " .. unitID .. " was created!")
	get_tracks ()	
	--distrubute track pieces to left and right wheels
	for i=1,table.getn (track) do
		Move (track[i], x_axis, trackoffsetx)
		Move (track[i], z_axis, 0)
		Move (track[i], y_axis, 100)
		--Spring.Echo ("moving trackpiece " .. i)
	end
	for i=trackn+1,trackn*2 do 
		Move (track[i], x_axis, -trackoffsetx)
		Move (track[i], z_axis, 0)
		Move (track[i], y_axis, 100)		
	end	
	--Hide unusued trackpieces
	for i=(trackn*2)+1,table.getn (track) do 
		Hide (track[i])
	end
	updateheading()
	driving=true
	StartThread (drive)			--put track pieces into position even if tank does not instantly move after creation
end




--local function RestoreAfterDelay(unitID)
function RestoreAfterDelay()

end




-----DRIVING------
function get_tracks ()
	for i=1,40 do 
	local tname = "t" .. i	
	track[i] = {}
	track[i] = piece (tname)	
	end
end

function script.StartMoving()
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
		
		Sleep (200)
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


function drive ()	
	Signal(SIG_DRIVE)
	SetSignalMask(SIG_DRIVE)	
	while (true) do
		--Spring.Echo ("rolling'")
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
	Spin (wheel1r, x_axis, ut_rightstep*2)
	Spin (wheel2r, x_axis, ut_rightstep*5)
	Spin (wheel3r, x_axis, ut_rightstep*5)
	Spin (wheel4r, x_axis, ut_rightstep*5)
	Spin (wheel5r, x_axis, ut_rightstep*2)
	Spin (wheel1l, x_axis, ut_leftstep*2)
	Spin (wheel2l, x_axis, ut_leftstep*5)
	Spin (wheel3l, x_axis, ut_leftstep*5)
	Spin (wheel4l, x_axis, ut_leftstep*5)
	Spin (wheel5l, x_axis, ut_leftstep*2)
end

function stopwheels ()
	StopSpin (wheel1r, x_axis)
	StopSpin (wheel2r, x_axis)
	StopSpin (wheel3r, x_axis)
	StopSpin (wheel4r, x_axis)
	StopSpin (wheel5r, x_axis)
	StopSpin (wheel1l, x_axis)
	StopSpin (wheel2l, x_axis)
	StopSpin (wheel3l, x_axis)
	StopSpin (wheel4l, x_axis)
	StopSpin (wheel5l, x_axis)
end
--------------

------react to enemy fire-----
function script.HitByWeapon (x, z, weaponDefID, damage)

end
	

------------------------------

--SHOOTING
function script.QueryWeapon1() return flare end

function script.AimFromWeapon1() return turret end

function script.AimWeapon1( heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(90)) --90
	if (math.deg(pitch) < -10) then pitch = math.rad(-10) end
	Turn(barrel, x_axis, -pitch, math.rad(50))
	WaitForTurn(turret, y_axis)
	WaitForTurn(barrel, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.FireWeapon1()
--	EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0.5)
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate", 0.1)
	Move (barrel, z_axis, -10)
	Move (barrel, z_axis, 0,7)
	Sleep(10)
	--StartThread(RestoreAfterDelay)
	RestoreAfterDelay()
end

function script.Killed(recentDamage, maxHealth)
	Spring.UnitScript.Explode (turret, SFX.FIRE)
	Spring.UnitScript.Explode (barrel, SFX.SMOKE)
	Spring.UnitScript.Explode (base, SFX.SHATTER)
	Sleep(30)
end