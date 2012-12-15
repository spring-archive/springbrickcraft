ich = unitID
--local pinfo = Spring.GetUnitPieceInfo (ich, pieces[2])		
		--local x = pinfo["offset"][1]
		--local ux = Spring.GetUnitPosition (ich)
		--x=x-ux
		--local x = Spring.GetUnitPiecePosDir (ich, pieces[2])		
		--local x = Spring.GetUnitPieceDirection (ich, pieces[2])

--local wheel = piece "w1"
local pieces = {}
local allpieces = Spring.GetUnitPieceList (ich)
local editmode = "move" --"move" or "turn"
step = {}
step["move"] = ({0.1, 0.5, 1,10})
step["turn"] = ({math.rad(0.1), math.rad(1), math.rad(10), math.rad(45)})
stepi = 3

epID = 1	 --piece that currently gets edited


for _,id in ipairs(allpieces) do
	if (id) then table.insert (pieces, piece (id)) end
	Spring.Echo (id)
end

function script.Create()
	Spring.Echo ("HEY, here is keyframing unit " .. ich)
	show_all_pieces ()
	StartThread (flashselectedpiece)
end

function unitmessage (msg, playerID)
	--Spring.Echo ("unitmessage: " .. msg .. " from " .. playerID)
	local pre = "tpkey"	
	local data = explode( '|', msg:sub(#pre+1) )
	local key = data[2]	
	--Spring.Echo ("unitscript key=" .. key)		
	if (key=="A" and editmode=="move") then editmode="turn" Spring.Echo (editmode) return end
	if (key=="A" and editmode=="turn") then editmode="move" Spring.Echo (editmode) return end
	if (key=="5") then 
		stepi=stepi+1
		if (stepi>table.getn(step[editmode])) then stepi=1 end
		local d = step[editmode][stepi]
		if (editmode=="turn") then d=math.deg(step[editmode][stepi]) end
		Spring.Echo ("now \t" .. editmode .."ing \tin a grid of " .. d)
		return
	end
	
	if (key=="W" or key =="S") then 
		Show (pieces[epID])		
		if (key=="W") then 
			epID = epID + 1 
			if (epID > table.getn(pieces)) then epID = 1 end
		end
		if (key=="S") then
			epID = epID - 1
			if (epID < 1) then epID = table.getn(pieces) end
		end
		
		local peinfo = Spring.GetUnitPieceInfo  (ich, pieces[epID])
		Spring.Echo ("selected piece:\t" .. peinfo["name"] .. "\t\t" .. epID)
		return
	end
	local x,y,z =0,0,0
	if (editmode=="move") then		
		x,y,z = Spring.UnitScript.GetPieceTranslation (pieces[epID])
	end
	if (editmode=="turn") then
		x,y,z = Spring.UnitScript.GetPieceRotation  (pieces[epID])
	end	
	
	Spring.Echo ("BEFORE x="..x .. " y=" ..y .. " z="..z)
	local cstep = step[editmode][stepi]
	if (x and y and z) then
		if (key=="4") then
			x=x+cstep
		end	
		if (key=="6") then			
			x=x-cstep
		end
		if (key=="8") then 						
			z=z+cstep
		end	
		if (key=="2") then			
			z=z-cstep
		end
		if (key=="7") then			
			y=y-cstep
		end
		if (key=="9") then			
			y=y+cstep			
		end
		
	--Spring.Echo ("editing piece " .. epID)
	Spring.Echo ("AFTER x="..x .. " y=" ..y .. " z="..z)
	if (editmode=="move") then
		Move (pieces[epID], x_axis, x)
		Move (pieces[epID], y_axis, y)
		Move (pieces[epID], z_axis, z)
	end
	
	if (editmode=="turn") then
		Turn (pieces[epID], x_axis, x)
		Turn (pieces[epID], y_axis, y)
		Turn (pieces[epID], z_axis, z)
	end
	end
	
end

function exportcurrent ()
	local allpieces = Spring.GetUnitPieceList (ich)
	for _,id in ipairs(allpieces) do
		Spring.Echo (id .. " = piece .. \"" .. id .."\"")
	end
	for _,id in ipairs(allpieces) do
		local p = piece (id)
		local mx,my,mz = Spring.UnitScript.GetPieceTranslation (p)
		Spring.Echo ("Move (" .. id .. ", x_axis, " ..mx ..", mspeed)")
		Spring.Echo ("Move (" .. id .. ", y_axis, " ..my ..", mspeed)")
		Spring.Echo ("Move (" .. id .. ", z_axis, " ..mz ..", mspeed)"	)	
		local tx,ty,tz = Spring.UnitScript.GetPieceRotation  (p)		
		Spring.Echo ("Turn (" .. id .. ", x_axis, math.rad(" .. math.deg(tx) .."), tspeed)")
		Spring.Echo ("Turn (" .. id .. ", y_axis, math.rad(" .. math.deg(ty) .."), tspeed)")
		Spring.Echo ("Turn (" .. id .. ", z_axis, math.rad(" .. math.deg(tz) .."), tspeed)")
	end
end




function flashselectedpiece ()
	while (true) do
	Hide (pieces[epID])	
	Sleep (20)
	Show (pieces[epID])
	Sleep (20)
	Hide (pieces[epID])	
	Sleep (20)
	Show (pieces[epID])
	Sleep (60)	
	end
end




function show_all_pieces ()
	for _,id in ipairs(allpieces) do
		Spring.Echo ("es gibt: " .. id)
	end
end


function explode(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  -- for each divider found
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
    pos = sp + 1 -- Jump past current divider
  end
  table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
  return arr
end