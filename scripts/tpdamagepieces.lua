unblownpieces = pieces
local unitDef = UnitDefs[Spring.GetUnitDefID(unitID)]
local maxhealth = unitDef.health
local maxpieces = table.getn (pieces)
local blowstepdamage = (maxhealth*(healthmulti or 1.3) / maxpieces)
local blowdamage = 0
local blownpieces = {}

------react to enemy fire-----
function script.HitByWeapon (x, z, weaponDefID, damage)	
--Spring.Echo ("getroffen!")
	blowdamage = blowdamage + damage
	if (blowdamage < blowstepdamage) then return damage end	
	blownnumber = math.ceil(damage / blowstepdamage)	
	for i = 1, blownnumber , 1 do
		if (table.getn(unblownpieces) > 0) then
			local exploID = math.random(table.getn(unblownpieces))
			local explo = unblownpieces [exploID]
			if (explo) then
				blowdamage = blowdamage - blowstepdamage
				if (exploType) then Explode (explo, exploType) end
				Hide (explo)
				table.remove (unblownpieces, exploID)
				table.insert (blownpieces, explo)			
			else
				blowdamage = 0 
			end
		end
	end	
	if (notifyDamaged) then damaged (damage) end
	return damage
end
------------------------------


-----building animation------
function blockBuildingAnimation (blockSpawnHeight, blockSpeedy)
	if (blockSpawnHeight==nil) then blockSpawnHeight = 300 end
	Sleep (10)	--short wait so buildprog can finish if unit was instantly created/already exists
	local  _,  _,  _, _,  buildprog = Spring.GetUnitHealth (unitID)
	if (buildprog == 1) then return end
	--for i = 1, table.getn(pieces) , 1 do		
	for _,i in ipairs(pieces) do
		Hide (i)
	end	
	--local notBuildPieces=pieces	--*** this fucks up the "pieces" table if notBuildPieces is changed?!?!?!
	local notBuildPieces = {}
	for k, v in pairs (pieces) do
		notBuildPieces [k] = v
	end
	local BuildPieces = {}
	buildprogstep = 1 / table.getn(pieces)
	--Spring.Echo ("buildprogstep = " ..buildprogstep)
	buildprog = 0
	while (buildprog < 1) do		
		--Spring.Echo ("buildprog = " .. buildprog)
		
		--Spring.Echo ("#unblown * buildprogstep =" .. table.getn(unblownpieces) .. " * " .. buildprogstep .. "=" .. table.getn(unblownpieces)*buildprogstep)
		--Spring.Echo ("  #blownpieces:" .. table.getn(blownpieces) ..  "   #unblownpieces:" .. table.getn(unblownpieces))
		while (buildprog >  table.getn(BuildPieces) * buildprogstep and table.getn(notBuildPieces) > 0) do
			--Spring.Echo ("DRINNE!")
		--while (table.getn(blownpieces) > 0) do			
			--if (table.getn (blownpieces) > 0) then
			--Spring.Echo ("#pieces original table:" .. table.getn (pieces))
			local showID = math.random(table.getn(notBuildPieces))
			local showp = notBuildPieces [showID]
			if (showp) then
				Move (showp, y_axis, blockSpawnHeight) Move (showp, x_axis, math.random (-50,50)) Move (showp, z_axis, math.random (-50,50)) --y 75
				local a =  math.random(1,2)
				Turn (showp,a, math.rad(180))
				Move (showp, y_axis, 0,blockSpeedy or 360) Move (showp, x_axis, 0,40) Move (showp, z_axis, 0,40) --y 160
				Turn (showp, a, 0, math.rad(200))
				Show (showp)
				table.remove (notBuildPieces, showID)
				table.insert (BuildPieces, showID)				
			end
			Sleep (10)
		end
		
		_,  _,  _, _,  buildprog = Spring.GetUnitHealth (unitID)
	Sleep (50)	
	end	
	--just to make sure:
	--unblownpieces = pieces
	--blownpieces = {}
	--Spring.Echo ("finished blockBuildingAnimation")
end

--teile fliegen auseinander
function disintegrateUnit (d,s)
	local allpieces = Spring.GetUnitPieceList (unitID)
	local piece_n = table.getn (allpieces)	
	for pID=1, piece_n,1  do
		local a = math.rad(math.random (-180,180))
		local dx =math.sin (a)*d
		local dz =math.cos (a)*d
		local dy = d/3
		Move (pID, x_axis, dx, s)
		Move (pID, z_axis, dz, s)
		Move (pID, y_axis, dy, s)
		--Spin (pID, y_axis, math.random (-5,5))
	end
end

--teile kommen angeflogen und basteln sich zusammen
function getTogether (d,s)
	local allpieces = Spring.GetUnitPieceList (unitID)
	local piece_n = table.getn (allpieces)
	for pID=2, piece_n,1  do	--1=base, dann fliegt alles leicht seitlich weg
		FlyPieceTo000 (pID, d,s)
	end
end

function FlyPieceTo000 (pID, d,s)
	local a = math.rad(math.random (-180,180))
	local dx =math.sin (a)*d
	local dz =math.cos (a)*d
	local dy = d/3
	Move (pID, x_axis, dx)
	Move (pID, z_axis, dz)
	Move (pID, y_axis, dy)
	Move (pID, x_axis, 0, s)
	Move (pID, z_axis, 0, s)
	Move (pID, y_axis, 0, s)
end

---repair---
function healthRegained (heal)
	Spring.Echo ("healthRegained " .. heal)
	local grownumber = math.ceil(heal / blowstepdamage)	
	for i = 1, grownumber , 1 do
		if (table.getn(blownpieces) > 0) then
			local exploID = math.random(table.getn(blownpieces))
			local explo = blownpieces [exploID]
			if (explo) then
				heal = heal - blowstepdamage
				--if (exploType) then Explode (explo, exploType) end
				FlyPieceTo000 (explo, 50, 50)
				Show (explo)
				table.remove (blownpieces, exploID)
				table.insert (unblownpieces, explo)
				if (notifyHealed) then healed (heal, explo) end
			else
				heal = 0
			end
		end
	end
end

function healthRegainedThread ()
	local health = Spring.GetUnitHealth (unitID)
	healthOld = health
	local heal = 0
	while (true) do
		local health = Spring.GetUnitHealth (unitID)
		if (health > healthOld) then
			--Spring.Echo ("healing!")
			heal = heal + (health - healthOld)
			--Spring.Echo ("heal="..heal)
			if heal > blowstepdamage then			
			--
			local grownumber = math.ceil(heal / blowstepdamage)	
			for i = 1, grownumber , 1 do
				if (table.getn(blownpieces) > 0) then
					local exploID = math.random(table.getn(blownpieces))
					local explo = blownpieces [exploID]
					if (explo) then
						heal = heal - blowstepdamage
						--if (exploType) then Explode (explo, exploType) end
						FlyPieceTo000 (explo, 50, 50)
						Show (explo)
						table.remove (blownpieces, exploID)
						table.insert (unblownpieces, explo)
						if (notifyHealed) then healed (heal, explo) end
					else
						heal = 0
					end
				end
			end	
		--				
			end
		end
		healthOld = health
		Sleep (1000)
	end
end