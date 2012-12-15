local base = piece "base"
local GaiaTeamID  = Spring.GetGaiaTeamID ()

--local lid = piece "lid"

function script.Create()
	--Spring.Echo ("unit " .. unitID .. " was created!")
--	Turn (base, y_axis, math.rad(180))
end

function fall ()
	StartThread (fallThread)
end

function fallThread ()
	Turn (base, y_axis, math.rad(math.random(0,360)))
	Turn (base, x_axis, math.rad (90),math.rad(90))
	WaitForTurn (base,x_axis)	
	Move (base, y_axis, -50, 20)
	WaitForMove (base,y_axis)
	Spring.DestroyUnit (unitID, false ,false, unitID)
end

function shatter ()
	for id=1, 10 do
		Explode (id, SFX.SHATTER)
	end 
	StartThread (selfkillThread)
end

function selfkillThread ()
	Sleep (100)
	Spring.DestroyUnit (unitID, false ,false, unitID)	--victim==attacker : so forest gadget knows tree was not run over by other units, 
														--but instead just finishing doing its thing
end

function grow ()
	StartThread (growThread)
end

function growThread ()
	Move (base,y_axis, -150)
	Move (base, y_axis, 0, 60+math.random(30))
	--Move (base, y_axis, 0, 10)
	WaitForMove (base,y_axis)
	local x,y,z = Spring.GetUnitPosition (unitID)
	local h = Spring.GetUnitHeading (unitID)
	Spring.DestroyUnit (unitID, false, false, unitID)
	Spring.CreateFeature ("f_tptree",x,y-15,z ,h,GaiaTeamID)
	--Turn (lid, x_axis, -math.rad(100), math.rad(100))
end


function script.FireWeapon1()
	Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	
end