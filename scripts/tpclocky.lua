local drum1 = piece "drum1"
local drum2 = piece "drum2"
local drum3 = piece "drum3"
local base = piece "base"
local bla = piece "c2_1"
local bla2 = piece "c1_2"
local SIG_AIM = 1
local SIG_COUNT = 2
local countstarted = false
local ich = unitID

-------FALL OF PIECES--------
pieces = {}
exploType = SFX.FALL + SFX.NO_HEATCLOUD
for i=1,8 do
	table.insert (pieces, piece ("c1_"..i))
	table.insert (pieces, piece ("c2_"..i))
end

include "tpdamagepieces.lua"
------------------


function script.Create()
	--Spring.Echo ("unit " .. unitID .. " was created! its clocky.")
	local ts = math.rad(90)
	Turn (drum1, z_axis, 0)
	Turn (drum2, z_axis, 0)
	Turn (drum3, z_axis, 0)	
	--Move (base, y_axis, -20)	
	--Spin (drum1, z_axis, ts)
	--Spin (drum2, z_axis, ts*10)
	getTogether (50,100)
	WaitForMove (base,y_axis)
	StartThread(CountDown)
end

function CountDown (unitID)
	Signal(SIG_COUNT)
	SetSignalMask(SIG_COUNT)
	if countstarted==true then return Spring.Echo ("war schon true") end
	countstarted = true	
	--Spring.Echo ("gehts los, countstarted=")
	local a = 500
	local as = (2*math.pi)/10
	local realcount = 0
	Turn (drum3, z_axis, a*as)
	Turn (drum2, z_axis, (a/10)*as)
	Turn (drum1, z_axis, (a/100)*as)	
	while (true) do
		realcount = realcount + 1
		--Spring.UnitScript.Explode (bla, SFX.SHATTER)	
		a= a + 1
		Turn (drum3, z_axis, a*as)
		--WaitForTurn (drum3, z_axis)		
		Sleep (10)
		if (a%10==0) then
			Turn (drum2, z_axis, (a/10)*as)
		end
		if (a%100==0) then
			Turn (drum1, z_axis, (a/100)*as)
		end
		--Spring.Echo ("realcount=" .. realcount)
		if (realcount > 500) then
			Spring.UnitScript.Explode (bla2, SFX.FIRE)			
			Spring.UnitScript.Explode (bla, SFX.SHATTER)
			Spring.UnitScript.Explode (bla, SFX.SHATTER)
			Spring.UnitScript.Explode (bla, SFX.SHATTER)
			Spring.UnitScript.Explode (bla, SFX.SHATTER)
			Spring.AddUnitDamage (ich, 9000,0,ich, -1000)--1000=weaponID, default would be -1:same as debris
		end
		Spring.SetUnitTooltip (ich, "Time until explosion:" .. "\255\255\000\000 " .. 500-realcount .. "\b") --255 is NOT alpha but escape code for color \b=color reset
	end	
end

function script.QueryWeapon1() return bla2 end

function script.AimFromWeapon1() return base end

function script.AimWeapon(weapn, heading, pitch )
	--Spring.Echo ("AimWeapon")
	--Signal(SIG_AIM)
	--SetSignalMask(SIG_AIM)
	--if (not countstarted) then StartThread(CountDown) end
	--Turn (bla, y_axis, math.rad (180), 1)
	--WaitForTurn (bla, y_axis)
	--Spring.Echo ("AimWeapon return")
	--Sleep (800)
	--Spring.UnitScript.Explode (bla, SFX.SHATTER)
	--Spring.UnitScript.Explode (bla, SFX.SHATTER)
	--Spring.AddUnitDamage (unitID, 9001)
	return false
end

function script.FireWeapon1()
	--Spring.Echo ("FireWeapon")
	--Spring.UnitScript.Explode (bla, SFX.SHATTER)
	--Spring.UnitScript.Explode (bla, SFX.SHATTER)
	--Spring.UnitScript.Explode (bla, SFX.SHATTER)
	--Spring.AddUnitDamage (unitID, 9001)
	--Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	Sleep(100)
end