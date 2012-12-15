attachpiece = 1
local passengers = {}
local smoke = SFX.CEG+1

function script.Create()
	--Spring.Echo ("MAGNET unit " .. unitID .. " was created!")
	allpieces = Spring.GetUnitPieceList  (unitID)
	StartThread (magnet)	
	--Spring.Echo ("n="..table.getn(allpieces))
	for i = 1, table.getn(allpieces) , 1 do		
		Move (i, y_axis, i*math.abs(math.sin(i))*5)
		Move (i, x_axis, math.sin(i)*5)
		Move (i, z_axis, math.cos(i)*5)
		local d = math.sqrt (i)*10
		Spin (i, y_axis, math.rad(d)*math.cos(i) )
		Spin (i, x_axis, math.rad(d)*math.sin(i) )
		Spin (i, z_axis, math.rad(d)*math.sin(i) )
		Hide (i)
		--Spring.Echo ("i=" .. i)
	end
end

function magnet ()
	while (true) do
		local x,y,z = Spring.GetUnitPosition (unitID)
		nearunits=Spring.GetUnitsInSphere  (x,y,z, 150) or "nothing"
		if (nearunits~="nothing") then		
			for _, nearunitid in ipairs (nearunits) do
				if (nearunitid~=unitID) then
					if (math.random (1,100) == 1) then Spring.AddUnitImpulse( nearunitid, 0.001, 1, 0.001) end
					script.TransportPickup (nearunitid)
					--Spring.AddUnitImpulse( nearunitid, 0, 0.5, 0)
					--Spring.SetUnitRotation  (nearunitid, 20, 20,0)
					--Spring.SetUnitPhysics (nearunitid, _, _, _, 2)
				end
			end
		end		
		Sleep (100)
	
	--for i = 1, table.getn(allpieces) , 1 do		
		--EmitSfx(i, smoke)
	--end
	
	end
end

local function RestoreAfterDelay(unitID)

end

--function script.QueryWeapon1() return flare end

--function script.AimFromWeapon1() return turret end

--function script.AimWeapon1( heading, pitch )

--	return true
--end


-------Transporting-----
function script.BeginTransport(passengerID)
end

function script.QueryTransport(passengerID)
	return attachpiece
end

function script.EndTransport(each, passengerID)
end

function script.TransportPickup (passengerID)	
	if (passengers [passengerID] or attachpiece > table.getn(allpieces)) then return end
	Spring.UnitScript.AttachUnit (attachpiece, passengerID)
	attachpiece = attachpiece +1
	passengers [passengerID] = true
end
------------------------

function script.FireWeapon1()
--EmitSfx(flare, orc_machinegun_flash)
--	EmitSfx(flare, orc_machinegun_muzzle)	       
	Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	Sleep(30)
end