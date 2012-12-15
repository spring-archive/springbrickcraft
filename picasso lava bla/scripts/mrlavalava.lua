--[[
[f=0004447] base
[f=0004447] -hip
[f=0004447] --legr
[f=0004447] ---leg1
[f=0004447] ----leg2
[f=0004447] -----leg3
[f=0004447] --belly1
[f=0004447] ---belly2
[f=0004447] --armr
[f=0004447] ---arm3
[f=0004447] ----arm4
[f=0004447] -----flare_arml
[f=0004447] --arml
[f=0004447] ---arm3
[f=0004447] ----arm4
[f=0004447] -----flare_arml
[f=0004447] --legl
[f=0004447] ---leg4
[f=0004447] ----leg5
[f=0004447] -----leg6
[f=0004447] --head
[f=0004447] ---head1
[f=0004447] ----eye1
[f=0004447] ----eye2
[f=0004447] ----flare_head

--]]


local SIG_BOUNCE = 1
local SIG_AIM = 2
local SIG_DO_THE_BENDER = 8
local SIG_BOUNCE_ARMS = 64

local hip = piece "hip"
local eye1 = piece "eye1"
local eye2 = piece "eye2"
local armr = piece "armr"
local arml = piece "arml"
local belly1 = piece "belly1"
local flare_arml = piece "flare_arml"
local flare_armr = piece "flare_armr"
local flare_head = piece "flare_head"

legs = {}
arms = {}
for i=1,4 do
	arms[i] = piece ("arm" .. i)
end
for i=1,6 do
	legs[i] = piece ("leg" .. i)	
end

function script.Create()
   StartThread (bounceThread)
   Spin (eye1, z_axis, math.rad(180))
   Spin (eye2, z_axis, -math.rad(180))
   StartThread (bounceArmsThread)
   StartThread (bendArmsThread)
   Spin (belly1, y_axis, math.rad (45))
   
end

---bounce-------------
function bounceThread ()
	Signal(SIG_BOUNCE)
    SetSignalMask(SIG_BOUNCE)
    while (true) do
		bounceTo (10,20)
		Sleep (500)
		bounceTo (0,20)
		Sleep (500)
		EmitSfx (flare_head, 1023)
    end
end

function bounceTo (bounceDist, bounceSpeed)
	Move (hip, y_axis, -bounceDist*3, bounceSpeed*3)
	for i=1,6 do
		Move (legs[i], y_axis, bounceDist, bounceSpeed)
	end		
	WaitForMove (hip, y_axis)
end
-----------------------
function bounceArmsThread ()
	Signal(SIG_BOUNCE_ARMS)
    SetSignalMask(SIG_BOUNCE_ARMS)
    while (true) do
		for n=1, 3 do
			ExtendLeftArmTo (-10,20)
			WaitForArmsMoveX()		
			ExtendLeftArmTo (0,20)
			WaitForArmsMoveX()		
			--
			ExtendRightArmTo (-10,20)
			WaitForArmsMoveX()		
			ExtendRightArmTo (0,20)
			WaitForArmsMoveX()		
			--
		end
		for n=1, 3 do
			ExtendLeftArmTo (-10,25)
			ExtendRightArmTo (-10,25)
			WaitForArmsMoveX()			
			--
			ExtendLeftArmTo (0,20)
			ExtendRightArmTo (0,20)
			WaitForArmsMoveX()
			--
		end			
    end
end

function ExtendLeftArmTo (dist, speed)
	Move (arms[3], x_axis, dist, speed)
	Move (arms[4], x_axis, dist, speed)	
end

function ExtendRightArmTo (dist, speed)
	Move (arms[1], x_axis, -dist, speed)
	Move (arms[2], x_axis, -dist, speed)	
end

function WaitForArmsMoveX ()
	for i=1,4 do
		WaitForMove (arms[i], x_axis)
	end
end

function WaitForArmsTurnAll ()
	--for axis=1,3 ... blabla****
	for i=1,4 do
		WaitForTurn (arms[i], x_axis)
		WaitForTurn (arms[i], y_axis)
		WaitForTurn (arms[i], z_axis)
	end
	WaitForTurn (armr, x_axis)
	WaitForTurn (armr, y_axis)
	WaitForTurn (armr, z_axis)
	WaitForTurn (arml, x_axis)
	WaitForTurn (arml, y_axis)
	WaitForTurn (arml, z_axis)	
end

--------------------------DO THE BENDER------
function bendArmsThread ()
	Signal(SIG_DO_THE_BENDER)
    SetSignalMask(DO_THE_BENDER)
    while (true) do
		BendRightArmTo (z_axis, -math.rad(90),math.rad(45))
		BendLeftArmTo (z_axis, math.rad(20),math.rad(45))
		WaitForArmsTurnAll ()
		BendRightArmTo (z_axis, math.rad(20),math.rad(45))
		BendLeftArmTo (z_axis, -math.rad(90),math.rad(45))
		WaitForArmsTurnAll ()
    end
end

function BendRightArmTo (axis, a, as)
	Turn (armr, axis, a/3, as)
	Turn (arms[1], axis, a/3, as)
	Turn (arms[2], axis, a/3, as)
end

function BendLeftArmTo (axis, a, as)
	Turn (arml, axis, -a/3, as)
	Turn (arms[3], axis, -a/3, as)
	Turn (arms[4], axis, -a/3, as)
end


---WALKING---
local function walk()
        Signal(SIG_WALK)
        SetSignalMask(SIG_WALK)
        while (true) do

        end
end


---AIMING & SHOOTING---

function script.QueryWeapon1()
	return flare_arml
end

function script.AimWeapon1( heading, pitch )
        Signal(SIG_AIM_1)
        SetSignalMask(SIG_AIM_1)
        return true
end

--called after the weapon has fired
function script.FireWeapon1()
       
end

--------------------------- 2 ----------------
function script.QueryWeapon2()
	return flare_armr
end

function script.AimWeapon2( heading, pitch )
        Signal(SIG_AIM_2)
        SetSignalMask(SIG_AIM_2)
        return true
end

function script.FireWeapon2()
       
end



function script.Killed(recentDamage, maxHealth)

end