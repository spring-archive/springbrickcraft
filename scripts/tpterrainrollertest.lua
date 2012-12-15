local base = piece "base"

function script.Create ()
	Spring.MoveCtrl.Enable(unitID)
	StartThread (roll)
end

function roll ()
	local slidespeed = 1
	local maxspeed = 10
	local minn = 0.05
	local vx = 0
	local vz = 0
	local vy = 0
	while (true) do
		local x,y,z = Spring.GetUnitBasePosition  (unitID)
		local gnx,gny,gnz = Spring.GetGroundNormal (x,z)
		if (x > Game.mapSizeX) then vx=-vx end
		if (x < 0) then vx=-vx end
		if (z > Game.mapSizeX) then vz=-vz end
		if (z < 0) then vz=-vz end
		vx=vx+gnx
		vz=vz+gnz
		--Spring.Echo (gnx.." "..gny.." "..gnz.." ")
		--if (gnx < minn) then gnx=0 end
		--if (gnz < minn) then gnz=0 end
		local mx = x+(vx*slidespeed)
		local mz = z+(vz*slidespeed)
		local my = Spring.GetGroundHeight (mx,mz)
		Spring.MoveCtrl.Enable(unitID)
		Spring.MoveCtrl.SetPosition (unitID, mx, my ,mz)
		Spring.MoveCtrl.Disable(unitID)
		--Spring.Echo (my-y)
		if (gnz > minn and my < y and slidespeed < maxspeed) then slidespeed=slidespeed+0.1 end
		if (my > y and slidespeed > 5) then slidespeed=slidespeed-0.12 end
		if (vx < -maxspeed) then vx=-maxspeed end
		if (vx > maxspeed) then vx=maxspeed end
		if (vz < -maxspeed) then vz=-maxspeed end
		if (vz > maxspeed) then vz=maxspeed end		
		Sleep (10)
		--
	end
end

