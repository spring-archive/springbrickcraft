function widget:GetInfo()
   return {
   version   = "1",
   name      = "Brickcraft | Statistics for Spectators & Replay",
   desc      = "guck was er baut",
   author    = "knorke",
   date      = "2011",
   license   = "Public Domain",
   layer     = 0,
   enabled   = true, --enabled by default
   --handler   = true, --access to handler   mit =true geht widgetHandler:RemoveWidget() nicht (?!)
   }
end

include "tp_clickbuttons.lua"

local gaiaTeamID = Spring.GetGaiaTeamID()

--units in this table will be displayed at top and in this order
local units = {}
units = {
{unitDefID=UnitDefNames["tphq"].id,},
{unitDefID=UnitDefNames["tpgripper"].id,},
--unitDefID=UnitDefNames["tpsmallfac"].id,
--unitDefID=UnitDefNames["tpfactory2"].id,

{unitDefID=UnitDefNames["tpdude"].id,},
{unitDefID=UnitDefNames["tpheavydude"].id,},

{unitDefID=UnitDefNames["tpjeep"].id,},
{unitDefID=UnitDefNames["tptank"].id,},
{unitDefID=UnitDefNames["tpvierling"].id,},
{unitDefID=UnitDefNames["tpheavytank"].id,},
{unitDefID=UnitDefNames["tpbigwheel"].id,},
{unitDefID=UnitDefNames["tplaunchbox"].id,},
{unitDefID=UnitDefNames["tpgunturret"].id,},
{unitDefID=UnitDefNames["tphubschrauber"].id,},
{unitDefID=UnitDefNames["tptiltjet"].id,},
}


--add the rest of the unit in whatever order they come
 for id,unitDef in pairs(UnitDefs) do
	local alreadyAdded = false
	--Spring.Echo (id)	
	for i=1,#units do	--***nub loop
		if (id==units[i].unitDefID) then alreadyAdded = true  break end
	end
	if (not alreadyAdded) then
		units[#units+1] = {unitDefID=id}
	end	
 end

 --set up the unit icons (build pictures)
 for i=1,#units do
	units[i].unitIcon = "unitpics/".. (UnitDefs[units[i].unitDefID].buildpicname or "placeholder.png")	
	--"unitpics/tpjeepblue.png"
 end
 
teams = {}
unitsAmountGlobal = {}	--[i]=amount   wird gebraucht um zu gucken ob es mindest eine solche unit gibt (falls nicht muss die spalte nicht gezeichnet werden)

local wPos = {x=0.01, y=0.5}

function widget:Initialize ()
	if (not Spring.IsReplay() and not Spring.GetSpectatingState ()) then		
		widgetHandler:RemoveWidget()
	end
	buildTeamNames ()
	makeStats ()
	--printStats ()
end

function widget:GameFrame (f)
	if (f%30==0) then makeStats () end
end

--\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\
--			stats making
function buildTeamNames ()
	for _,teamID in ipairs(Spring.GetTeamList()) do
		if (teamID~=gaiaTeamID) then
			teams[teamID] = {}
			teams[teamID].name = " " .. teamIDToPlayername (teamID)
			local r,g,b = Spring.GetTeamColor (teamID)
			teams[teamID].color = {r=r, g=g, b=b}
			Spring.Echo ("->"..teams[teamID].name)
		end
	end
end

--+++teams with multiple players
function teamIDToPlayername (teamID)
	local _, uplayer, _, isAiTeam = Spring.GetTeamInfo(teamID)
	local playername = "unknown playername"
	if (isAiTeam == true) then
		local _, skirmishAIID, name, hostingPlayerID, shortName, version = Spring.GetAIInfo(teamID)  --Spring.GetAIInfo(uplayer) 
		--playername = "BOT_" .. name .. skirmishAIID .."_"..shortName ..hostingPlayerID
		playername = "(AI)" .. skirmishAIID
	end
	if (isAiTeam == false) then playername = Spring.GetPlayerInfo(uplayer) or 'GetPlayerInfo fail' end
	local active,_,spec = Spring.GetPlayerInfo(uplayer)
	--if (spec == true) then playername = "#SPEC#" end
	--Spring.Echo ("<PLAYER0> did something")
	--Spring.SendMessage ("<PLAYER0>")
	return playername
end

--[[
[1]  .unitDefID .unitname .amount .healthSum
[2] "
--]]

function makeStats ()
	for i=1,#units do
		unitsAmountGlobal[i] = 0
	end
	for _,teamID in ipairs(Spring.GetTeamList()) do
		if (teamID~=gaiaTeamID) then
			teams[teamID].stats = teamStats (teamID)
		end
	end
end

function teamStats (teamID)
	local stats = {}
	local totalHealthSum = 0
	local totalAmount = 0
	stats.units = {}
	for i=1,#units do
		stats.units[i] = {}
		local amount, healthSum = unitStats (teamID, units[i].unitDefID)
		unitsAmountGlobal[i] = unitsAmountGlobal[i] + amount
		stats.units[i].amount, stats.units[i].healthSum, stats.units[i].healthPercent = amount, math.ceil (healthSum), math.ceil (healthPercent)
		totalHealthSum = totalHealthSum + healthSum
		totalAmount = totalAmount + amount
	end
	metal = math.floor ((Spring.GetTeamResources (teamID ,"metal") or 0)+0.5)
	stats.metalStored = metal or 0
	stats.totalAmount = totalAmount
	stats.totalHealthSum = math.ceil(totalHealthSum)
	return stats
end

function unitStats (teamID, unitDefID)
	local teamUnits = Spring.GetTeamUnitsByDefs (teamID, unitDefID)
	local amount = 0 --#teamUnits
	local healthSum = 0
	local maxHealthSum = 0
	for u=1, #teamUnits do
		local h, mh,_,_,bp = Spring.GetUnitHealth (teamUnits[u])
		if (bp==1) then		--do not count units that are in construction
			healthSum=healthSum + h
			maxHealthSum=maxHealthSum + mh
			amount=amount+1
		end
	end	
	healthPercent = math.floor ((healthSum/maxHealthSum)*100)
	return amount, healthSum, healthPercent
end

function printStats ()
	for teamID,_ in pairs(teams) do
		Spring.Echo ("=> TEAM:" .. teams[teamID].name)
		for i=1,#units do
			local s= "unit["..i.."] ->" .. UnitDefs [units[i].unitDefID].name .. " amount:" .. teams[teamID].stats.units[i].amount
			Spring.Echo (s)
		end
	end
end

--\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\
-- drawing

function widget:DrawScreen()
	drawWidget ()
end

function drawWidget ()
	--uiText ("XXX", wPos.x, wPos.y, 0.01, "vo")
	local xd = 0.1	--horizontal spacing
	local yd= 0.025	--vertical spacing
	local ts = 0.0125	--text size
	local iconS = 0.035 --icon size.
	--Zeile mit den player names
	x,y=xd,yd
	for teamID,_ in pairs(teams) do
		gl.Color (teams[teamID].color.r,teams[teamID].color.g,teams[teamID].color.b  , 1)
		uiRect (wPos.x+x, wPos.y+y-ts,  wPos.x+x+xd,wPos.y+y+yd-ts)
		local s = teams[teamID].name
		gl.Color (1,1,1,1)
		uiText (s, wPos.x+x, wPos.y+y, ts, "vo")
		x=x+xd
	end
	
	x,y=0,0
	for i=1,#units do
		if (unitsAmountGlobal[i] > 0) then
			--spalte mit den unit names
			--uiRect (wPos.x+x, wPos.y+y, wPos.x+x+xd, wPos.y+y+yd)
			s= UnitDefs [units[i].unitDefID].humanName		--store in units table?**
			uiText (s, wPos.x+x, wPos.y+y, ts, "vo")			
			--------unit icon: works, but hard to make it look good size wise
			--gl.Texture(units[i].unitIcon)
			--uiTextRect (wPos.x+x-iconS/2, wPos.y+y-iconS/2, wPos.x+x+iconS/2, wPos.y+y+iconS/2)
			--gl.TexRect (100,100,200,200)
			--gl.Texture (false)
			----------------
			--inhalt
			for teamID,_ in pairs(teams) do
				local a = teams[teamID].stats.units[i].amount
				if (a>0) then					
					local p = teams[teamID].stats.units[i].healthPercent					
					gl.Color (1-(p/100) ,(p/100),0, 1)
					uiTextRect (wPos.x+x+xd, wPos.y+y+yd/3,   wPos.x+x+xd+((p/100)*xd),    wPos.y+y-yd/3)
					s = "       " .. p .. "%"
					uiText (s, wPos.x+x+xd, wPos.y+y, ts*1.2, "vo")
					s = a  --.."x"
					uiText (s, wPos.x+x+xd, wPos.y+y, ts*1.5, "vo")					
				end
			x=x+xd
			end
			x=0
			y=y-yd
		end		
	end	
	--non-per units-stats
	---combined health of all units
	uiText ("total HP:", wPos.x+x, wPos.y+y, ts, "vo")	
	for teamID,_ in pairs(teams) do
		s = teams[teamID].stats.totalHealthSum or "---"
		uiText (s, wPos.x+x+xd, wPos.y+y, ts*1.5, "vo")
		x=x+xd
	end
	---metal stored
	x=0
	y=y-yd
	uiText ("metal stored:", wPos.x+x, wPos.y+y, ts, "vo")	
	for teamID,_ in pairs(teams) do
		s = teams[teamID].stats.metalStored or "---"
		uiText (s, wPos.x+x+xd, wPos.y+y, ts*1.5, "vo")
		x=x+xd
	end
end