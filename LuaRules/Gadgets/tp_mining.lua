--works in 91 not in 94:                Spring.AddUnitDamage(unitID, select(1, Spring.GetUnitHealth(unitID)) - res.health,0, unitID, -666) ----!!! -2



--problem: tptetra unit remains and blocks shots / small units can hide in its colvol. and blob shadows draws shadow
--fixed by making colvol of tptetra very small. but now it is harder to click on them with miners

--speichern welcher miner gerade welches mineral mined
--wenn dieses dann destroyed ist, muss er ein neues suchen
--thanks  Andrej,  zwzsg, quantum and #ca and google_frog
function gadget:GetInfo()
  return {
    name      = "mining blabla2",
    desc      = "some broken stuff",
    author    = "knorke, mineral los handling by google frog",
    date      = "4 Okt 2010",
    license   = "oh",
    layer     = 1000,
    enabled   = true  --  loaded by default	
  }
end

if (gadgetHandler:IsSyncedCode()) then
include("LuaRules/Configs/tp_CMDID.lua")
local currentframe = 0	--what frame the game is currently in (orly)
local miners = {} 		-- [unitID] alive: true/false   cargo: metal being carried  last_mined_id: which resourceunit was last mined from status: what miner is doing: "search" "loading" "unloading" "mining" "to_res" "to_hq" <-only "search" is really used to controll things, the others are just for displaying
						--.manualTimer: is increased when player manually controlls the miner. miner will not automine if timer>0
						--.lastMineActionTimer: increases in gameframe, gets reset when the miner attacks a mineral. used to stop the mining animation
local dropoffs = {} 	-- [unitID]

local resources = {} 
local resourcesCount = 0
local resourcesUnit = {}

local debug = false
function DoNotWantEchoSpam ()
end
--Spring.Echo = DoNotWantEchoSpam
-----config-----
local fake_unit = "fakeunit"
local fake_block_unit = "fakeblockunit"
local miner_name = {"tpgripper"};			--the unit used for mining
local resource_name = {"tptetra"} 	--{"bminerals","bmeteorimpact","bmeteorimpact_big"}		--the stuff that gets mined
local dropoff_name = {"tphq_small", "tphq",}	--where the miners bring the resources to
local dropoff_distance = 200		--how near do miners have to get to a dropoff to drop their cargo? (this value is added to unitRadius)
local maxcargo = 500--600--500			--how much a miner can carry before having to return to a drop off
local resreturneffect = "tpsmokecloud"	--ceg effect played at miners location when a miner returns its cargo
local animationStopTime = 10			--time without mineral-attack until the unitscript is asked to stop the mining animation. compared vs lastMineActionTimer
----------------

local fake_unit_DefID = UnitDefNames[fake_unit].id
local fake_block_unit_DefID = UnitDefNames[fake_block_unit].id

----------------"go mining" command
local goMiningCmd = {
      id      = CMD_GO_MINING,
      --name    = " Mine\nMinerals!",	--text on the button
      action  = "goMining",
      type    = CMDTYPE.ICON_MODE, -- CMDTYPE.NUMBER 
	  --texture = "&.9x.9&unitpics/sigterm.png&bitmaps/frame.tga",
	  texture = "unitpics/mining.png&", --& = larger icon due to no frame
      tooltip = "Mine resources!   Hotkey: m",
      params  = { 'do it!'}
}


-----RESOURCE HANDLER-----

local spSetUnitLosState		= Spring.SetUnitLosState
local spSetUnitLosMask		= Spring.SetUnitLosMask

local function SpawnResource (sx,sz, unitname)
    if (sx == nil or sz == nil) then
		Spring.Echo ("tp_resourcespawner: sx or sz was NIL in SpawnResource (sx,sz)")
		return
	end
    unitname = unitname or resource_name[1]	
	local sh = Spring.GetGroundHeight(sx, sz)	
	---oil pumps---
	if (unitname == "tpoilpump") then
		local unitID = Spring.CreateUnit(unitname, sx, sh, sz, rotation, Spring.GetGaiaTeamID())
		Spring.SetUnitAlwaysVisible(unitID, true)
		return
	end
	---------------
	Spring.Echo ("gaia=" .. Spring.GetGaiaTeamID() )
	Spring.Echo ("fake_unit=" .. fake_unit)
    Spring.Echo ("tp_resourcespawner: spawning resource at " .. sx ..":"..sz .. " in height " .. sh)
	resourcesCount = resourcesCount + 1
    local losCheck = Spring.CreateUnit(fake_unit, sx, sh, sz, 0, Spring.GetGaiaTeamID())	
    Spring.Echo ("returned unitID:   losCheck=" .. (losCheck or "nil") )
	local block = Spring.CreateUnit(fake_block_unit, sx, sh, sz, 0, Spring.GetGaiaTeamID())    
	Spring.SetUnitCollisionVolumeData(losCheck, 1,1,1,0,-10,0,0,0,0)
	Spring.SetUnitCollisionVolumeData(block, 1,1,1,0,-10,0,0,0,0)
  
    resources[resourcesCount] = {unit = {}, health = UnitDefNames[unitname].health, losCheck = losCheck, block = block}
    resourcesUnit[losCheck] = resourcesCount
    
    local rotation = math.random(0,math.pi)
    
    for _,allyTeam in ipairs(Spring.GetAllyTeamList()) do
        local unitID = Spring.CreateUnit(unitname, sx, sh, sz, rotation, Spring.GetGaiaTeamID())
        Spring.SetUnitCollisionVolumeData(unitID, 10,10,10  ,0,0,0, 0,1,0)	 --test
		Spring.SetUnitBlocking(unitID, false, false)
        resources[resourcesCount].unit[allyTeam] = unitID
        resourcesUnit[unitID] = resourcesCount
        Spring.GiveOrderToUnit(unitID, CMD.ONOFF, { 0 }, {} )
        Spring.SetUnitAlwaysVisible(unitID, true)
        for _,otherAllyTeam in ipairs(Spring.GetAllyTeamList()) do
            if otherAllyTeam ~= allyTeam then
                spSetUnitLosMask(unitID, otherAllyTeam, {los=true,radar = true, prevLos = true, contRadar = true} )
            end
        end
    end
end

GG.SpawnResource = SpawnResource

function gadget:UnitEnteredLos(unitID, unitTeam, allyTeam, unitDefID)
    if unitDefID == fake_unit_DefID then
        local res = resources[resourcesUnit[unitID]]
        local resID = res.unit[allyTeam]
        if Spring.ValidUnitID(resID) and select(1, Spring.GetUnitHealth(resID)) ~= res.health then
            if res.health then
                --Spring.AddUnitDamage(resID, select(1, Spring.GetUnitHealth(resID)) - res.health)				
                Spring.AddUnitDamage(unitID, select(1, Spring.GetUnitHealth(unitID)) - res.health,0, unitID, -2) ----!!! -2
				--Spring.SetUnitHealth(resID, res.health)
            else
                Spring.DestroyUnit(resID)
            end
        end
    end
end

local function damageResource(resourceID, damage)
    local res = resources[resourceID]
    if not res then --to prevent "res.health is nil" error in line below
		--Spring.Echo ("res was nil in damageResource") 
		return 
	end	
	if res.health then
        res.health = res.health - damage
        if res.health <= 0 then
            Spring.DestroyUnit(res.block)
            res.health = nil
        end
    end
    for _,allyTeam in ipairs(Spring.GetAllyTeamList()) do
        local unitID = res.unit[allyTeam]
        if Spring.ValidUnitID(unitID) then
            local los = Spring.GetUnitLosState(res.losCheck, allyTeam)
            if los and los.los then
                if res.health then
                    --Spring.AddUnitDamage(unitID, select(1, Spring.GetUnitHealth(unitID)) - res.health)
                    --Spring.Echo ("Spring.AddUnitDamage(unitID, select(1, Spring.GetUnitHealth(unitID)) - res.health,0, unitID, -2)")
					Spring.AddUnitDamage(unitID, select(1, Spring.GetUnitHealth(unitID)) - res.health,0, unitID, -2) -- -2 ---!!!					
					--Spring.SetUnitHealth(unitID, res.health)
                else
                    Spring.DestroyUnit(unitID)
                end
            end
        end
    end
end

----------------


function gadget:UnitFinished(unitID, unitDefID, teamID)
	if (is_miner_type (unitDefID) == true) then 
		Spring.GiveOrderToUnit(unitID, CMD.FIRE_STATE , { 0 }, {}) --hold fire
		add_miner (unitID)
		--search_res (unitID)
	end
	if (is_dropoff_type (unitDefID) == true) then add_dropoff (unitID) end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	--remove destroyed miners:
	if is_miner (unitID) then remove_miner (unitID) end
	--remove destroyed dropoffs:
	if is_dropoff (unitID) then remove_dropoff (unitID) end
	--wenn etwas geerntet wurde:
	--if (is_resource_type (unitDefID) and is_miner (attackerID)) then Spring.Echo ("resource mined out") end
	--if (is_miner(attackerID)) then Spring.Echo ("miner mined") end
	if resourcesUnit[unitID] then
        if unitDefID ~= fake_block_unit and unitDefID ~= fake_unit then
            resources[resourcesUnit[unitID]].unit[Spring.GetUnitAllyTeam(unitID)] = nil
        end
        resourcesUnit[unitID] = nil
    end
    --[[
    if (is_resource_type (unitDefID) and is_miner(attackerID)) then
		--send full miners to dropoff:
		--if (miners[attackerID].cargo > 25) then 
			--return_to_dropoff (attackerID)
			miners[attackerID].cargo = maxcargo
			miners[attackerID].last_mined_id = nil
			--miners[attackerID].status = "search"
			env = Spring.UnitScript.GetScriptEnv(attackerID)
			if (env) then Spring.UnitScript.CallAsUnit(attackerID, env.miningEnd) end
			return_to_dropoff (attackerID)
			--return_to_mine (attackerID)
			--search_res (attackerID)
		--end
		end	--]]	
	--end
end


--function gadget:UnitPreDamaged (unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam) -- pre 94: different paramter order because no projectileID
function gadget:UnitPreDamaged (unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam) 		

	--try to fix: minerals get damaged by units but look unharmed until they get mined: then they suddendly lose all pieces
	--das passiert aber weil script.hitbyweapon for unitpredamaged aufgerufen wird (?)
	--Spring.Echo (unitID.."attacked by " .. (attackerID or "nil"))
	--Spring.Echo ("attacked unit is a "  .. UnitDefs[Spring.GetUnitDefID(unitID)].name .. " of team " .. unitTeam)
	
	
	if (unitDefID == fake_unit_DefID or unitDefID == fake_block_unit_DefID) and (attackerID ~=unitID) then return 0,0 end
	if (is_resource_type (unitDefID) and not is_miner(attackerID) and unitID~=attackerID) then return 0,0 end	--other units can not damage minerals. unitID~=attackerID because AddUnitDamage uses attackerID=unitID in damageresource() and that should not be blocked
	--test
	
	if (is_resource_type (unitDefID) and is_miner(attackerID)) then
		miners[attackerID].lastMineActionTimer = 0
		--fill the cargo bay of the miner, alot of options here....:
		if (miners[attackerID].cargo < maxcargo) then 
			miners[attackerID].cargo = miners[attackerID].cargo + 10--damage--math.ceil(damage)
			env = Spring.UnitScript.GetScriptEnv(attackerID)		
			if (env) then Spring.UnitScript.CallAsUnit(attackerID, env.miningWork, miners[attackerID].cargo,math.ceil(damage)) end			
		end
		if (unitID ~=nil and attackerID~=nil) then --added attackerID~=nil check after getting "attempt to index field '?' (a nil value)"
            
			--originally there was only this line by googlefrog:
				--miners[attackerID].last_mined_id = resources[resourcesUnit[unitID]].unit[Spring.GetUnitAllyTeam(attackerID)]
			
			if (Spring.ValidUnitID (unitID)) then
				-- Set last mined to the unit that that team can see
				local u = resources[resourcesUnit[unitID]]
				if (u) then
					miners[attackerID].last_mined_id = u.unit[Spring.GetUnitAllyTeam(attackerID)]
				else
					Spring.Echo ("u was nil - last_mined_id not set")
					Spring.Echo ("resourcesUnit[unitID] :" .. (resourcesUnit[unitID] or "nil!") .. " | resourcesCount:" .. resourcesCount)
				end
			end
			
			--resources[unitID] = {} --*** -> add_resource und so...
			--resources[unitID].frame_last_mined = currentframe
		end
		
		--send full miners to dropoff:
		if (miners[attackerID].cargo >= maxcargo) then 
			return_to_dropoff (attackerID)
			env = Spring.UnitScript.GetScriptEnv(attackerID)
			if (env) then Spring.UnitScript.CallAsUnit(attackerID, env.miningEnd) end
		end
		--no self damaging miners
		if (unitID == attackerID) then
			return 0,0
		end
		--Spring.Echo ("damageResource(resourcesUnit[unitID], 10)") --called in 91 not called in 94
        damageResource(resourcesUnit[unitID], 10)
		--tell the mineral it was indeed mined so it can lose pieces:
		--env = Spring.UnitScript.GetScriptEnv(unitID)
		--if (env) then Spring.UnitScript.CallAsUnit(unitID, env.notifyDamage, 10) end
        return 0
	end
    if unitDefID == fake_unit_DefID then
        return 0
    end
	return (damage or 0)	--added due to "..should return a number"
end


function gadget:GameFrame(frameNum)
	_G.miners = miners
	_G.dropoffs = dropoffs		
	currentframe=frameNum
	if (frameNum % 16 ~=0) then return end
	for i in pairs(miners) do
		--send cargo values to the unit scripts
		env = Spring.UnitScript.GetScriptEnv(i)		
		if (env) then Spring.UnitScript.CallAsUnit(i, env.miningCargo, (miners[i].cargo or -1)) end
		if (miners[i].lastMineActionTimer < 9001) then miners[i].lastMineActionTimer = miners[i].lastMineActionTimer+1 end	--if ist nur wegen evtl overflow in seeehr langen games
		--Spring.Echo ("lastmine timer:" .. miners[i].lastMineActionTimer )
		if (miners[i].lastMineActionTimer > animationStopTime) then
			env = Spring.UnitScript.GetScriptEnv(i)
			if (env) then Spring.UnitScript.CallAsUnit(i, env.miningEnd) end
		end
		----*****with this, miners REALLY want to mine
		--if (frameNum % 64 == 0 and miners[i].status == "search") then
			--search_res (i)
		--end
		
		if (miners[i].manualTimer < 0) then
			--if (frameNum % 64 == 0 and miners[i].status == "search") then
				--search_res (i)
			--end
		
			if (frameNum % 64 == 0 and miners[i].status == "to_hq") then
				--return_to_dropoff (i)
			end			
		else
			miners[i].manualTimer=miners[i].manualTimer-1
			--Spring.Echo ("timer:" ..miners[i].manualTimer)
		end
		
		
		
		if (miners[i].cargo > 5 and is_miner_at_dropoff (i)) then	--drop the cargo
			local minerteam = Spring.GetUnitTeam (i)
			Spring.AddTeamResource (minerteam, "metal", miners[i].cargo)			
			local x,y,z=Spring.GetUnitPosition (i)
			if (x and y and z) then 
				for i = 1, miners[i].cargo/50 , 1 do
					Spring.SpawnCEG(resreturneffect, x, y, z)
				end
			end
			env = Spring.UnitScript.GetScriptEnv(i)		
			if (env) then Spring.UnitScript.CallAsUnit(i, env.miningUnload, miners[i].cargo) end
			miners[i].cargo = 0
			return_to_mine (i)
		end
	end
end

function gadget:Initialize()
	make_miner_table()
	make_resource_name_table ()
	_G.miners = miners;
	_G.dropoffs = dropoffs
	_G.dropoff_distance = dropoff_distance
end

function marker_on_unit (_uID, _text)
	if (not debug) then return end
	if (markers == false) then return end
	if (_uID == nil) then return end
	if (_text == nil) then return end
	local x,y,z=Spring.GetUnitPosition (_uID)
	if (x == nil or y == nil or z == nil) then return end
	Spring.MarkerAddPoint (x,y,z, _text .. "id:" .. _uID)
end

function make_miner_table()
	miners = {}
	local all_units = Spring.GetAllUnits ()
	for i in pairs(all_units) do
		local unitDefID = Spring.GetUnitDefID(all_units[i])
		if (is_miner_type (unitDefID)==true) then
			add_miner (all_units[i])
		end
		if (is_dropoff_type (unitDefID)==true) then
			add_dropoff (all_units[i])
		end
	end
end

function make_resource_name_table ()
if (debug) then Spring.Echo ("tp_mining.lua: looking for mineable unitdefs") end
	for id,unitDef in pairs(UnitDefs) do
		local cp = UnitDefs[id].customParams
		if (cp) then
			if (cp.is_mineable) then
				local resname = unitDef.name
				if (debug) then Spring.Echo ("tp_mining.lua: found mineable resource:" .. resname) end
				table.insert (resource_name, resname)
			end
		end
	end
end

function is_miner_type (unitDefID)
	if (unitDefID == nil) then return false end
	local unitDef = UnitDefs[unitDefID]
	if (unitDef == nil) then return false end
	local unitname = unitDef.name	
	for _,v in pairs(miner_name) do
		if v == unitname then return true end
	end	
	return false
end


function is_dropoff_type (unitDefID)
	if (unitDefID == nil) then return false end
	local unitDef = UnitDefs[unitDefID]
	if (unitDef == nil) then return false end
	local unitname = unitDef.name
	for _,v in pairs(dropoff_name) do
		if v == unitname then return true end
	end    
    return false 
end


function is_resource_type (unitDefID)
	if (unitDefID == nil) then return false end
	local unitDef = UnitDefs[unitDefID]
	if (unitDef == nil) then return false end
    for schluessel, wert in pairs(resource_name) do                            
		if (wert == unitDef.name) then return true end
	end	
	--if (unitDef.name == resource_name) then return true end
	return false
end


function is_miner (unitID)
	if (miners [unitID] ~= nil) then return true else return false end
end

function is_dropoff (unitID)	
	if (dropoffs [unitID] ~= nil) then return true else return false end
end


function nearest_dropoff_position_from_miner (minerID)
	local minerteam = Spring.GetUnitTeam (minerID)
	local nearest_distance = 9999999999
	local nearest_dropoffID = nil
	for i in pairs (dropoffs) do
		local dropoffteam = Spring.GetUnitTeam (i)	
		if (minerteam == dropoffteam) then 
			local d = Spring.GetUnitSeparation (minerID, i)
			if (d < nearest_distance) then
				nearest_distance = d
				nearest_dropoffID = i
			end
		end
	end
	if (nearest_dropoffID ~= nil) then
		return Spring.GetUnitPosition (nearest_dropoffID)
	else
		return nil
	end
end


 --( number x, number z, number radius [,number teamID] )
--*** nicht wirklich das nächste mineral sondern erstmal nur das nächstbeste  
function nearest_resID_from_miner (minerID)
	local nearest_resID = nil
	local nearest_res_distance = 9999999999
	local nearest_unmined_res = nil
	local nearest_unmined_res_distance = 9999999999
	local x,y,z = Spring.GetUnitPosition(minerID)
	local res=CallAsTeam(Spring.GetUnitTeam(minerID), function () return Spring.GetUnitsInCylinder (x,z, 5000, Spring.GetGaiaTeamID()) end)
	if (res == nil) then return nil end	--no near units at all :/
	for i in pairs (res) do
		if (is_resource_type (Spring.GetUnitDefID(res[i])) == true) then
			if (not Spring.GetUnitIsDead (res[i])) then		--when miners are asked to search a new mineral in UnitDestroyed, the mined out mineral is still "alive" for 1 frame. So they try to mine that again but it actually does not exist anymore -> miner sits around
				local d = Spring.GetUnitSeparation (minerID, res[i])
				if (d < nearest_res_distance) then
					nearest_res_distance = d
					nearest_resID = res[i]
				end
			end
		end		 
	end
	if (nearest_resID~=nil) then return nearest_resID else return nil end
end

function add_miner (unitID)
	miners [unitID] = {}
	miners [unitID].alive = true
	miners [unitID].cargo = 0
	miners[unitID].manualTimer = 0
	miners[unitID].lastMineActionTimer = 0
	Spring.InsertUnitCmdDesc(unitID, goMiningCmd)
	marker_on_unit (unitID, "miner added")
end

function add_dropoff (unitID)
	dropoffs [unitID] = {}
	dropoffs [unitID].alive = true
	dropoffs [unitID].cargo = 0
	marker_on_unit (unitID, "droppoff added")
end

function remove_miner (unitID)
	if (debug) then Spring.Echo ("removing miner id=" .. unitID) end
--	if (Spring.ValidUnitID  (miners[unitID].last_mined_id)) then 
--		if (resources [miners[unitID].last_mined_id] ~= nil) then resources [miners[unitID].last_mined_id].mined_by=nil end
--	end
	miners [unitID].alive=false
	miners [unitID] = nil	
end

function remove_dropoff (unitID)
	if (debug) then Spring.Echo ("removing dropoff id=" .. unitID) end
	dropoffs [unitID].alive=false
	dropoffs [unitID] = nil
end

function is_miner_at_dropoff (miner_unitID)
local minerteam = Spring.GetUnitTeam (miner_unitID)
	for i in pairs (dropoffs) do
		local dropoffteam = Spring.GetUnitTeam (i)
		if (minerteam == dropoffteam) then
			local d = Spring.GetUnitRadius (i) + dropoff_distance
			if Spring.GetUnitSeparation (miner_unitID, i) < d then return true end
			end
		end
	return false
end

-----MINER AI-----
--idle miners will go search for minerals if set not set to "hold pos"
--if you want miners to stay in place, you have to use "wait" command
--probally still most noob friendly this way...
function gadget:UnitIdle(unitID, unitDefID, teamID)
    if (is_miner (unitID)) then
		local unitstates = Spring.GetUnitStates (unitID)
		local movestate = unitstates["movestate"]
		if (debug) then Spring.Echo ("miner " .. unitID .. " movestate=" .. movestate) end
		--if (movestate ==0) then return end
		if (debug) then Spring.Echo ("idle miner" .. unitID) end

        --if (movestate ~=0) then --roam or manoever
            
            if (miners[unitID].cargo < maxcargo) then 
                search_res(unitID)
            else
                return_to_dropoff (unitID) 
            end
        --end
	end
end


function return_to_mine (unitID)
	if (Spring.ValidUnitID  (miners[unitID].last_mined_id)) then
		if (debug) then Spring.Echo ("miner " .. i .. " returns to mineral") end
		--Spring.SetUnitTarget (unitID, miners[i].last_mined_id) --return to the mineral last mined from
		--Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, { 2 }, {})
		--Spring.GiveOrderToUnit(unitID, CMD.FIRE_STATE , { 2 }, {}) 
		Spring.GiveOrderToUnit(unitID, CMD.ATTACK  , { miners[unitID].last_mined_id  }, {CMD.OPT_INTERNAL}) 
		miners[unitID].status = "to_res"
	else
		--search for new minerals
		search_res (unitID)
	end
end

function search_res (unitID)
	local x, y, z = Spring.GetUnitPosition(unitID)
	--Spring.GiveOrderToUnit(unitID, CMD.FIRE_STATE , { 2 }, {})
	--Spring.GiveOrderToUnit(unitID, CMD.AREA_ATTACK  , { x, y, z,50000  }, {})
	--miners[unitID].last_mined_id = nil
	--miners[unitID].status = "send to search"
	local res = nearest_resID_from_miner (unitID)
	if (res) then 
        Spring.GiveOrderToUnit(unitID, CMD.ATTACK  , { res }, {CMD.OPT_INTERNAL}) 
    end
	miners[unitID].status = "search finished"
end

function return_to_dropoff (unitID)
	local x, y, z = Spring.GetUnitPosition(unitID)
	local tx, ty, tz = nearest_dropoff_position_from_miner (unitID)
	if (tx ~= nil) then
--		Spring.GiveOrderToUnit(unitID, CMD.FIRE_STATE , { 0 }, {}) 
--		Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, { 0 }, {})
		Spring.GiveOrderToUnit(unitID, CMD.MOVE , {tx, ty, tz  }, {CMD.OPT_INTERNAL})
		miners[unitID].status = "to_hq"
		if (debug) then Spring.Echo ("returning to base with cargo:" .. miners[unitID].cargo) end
	end
end

--currently only for AI because of recursion bla when it uses GiveOrder (... CMD_GO_MINING)
function GG.cmd_go_mining (unitID)
	if (miners[unitID]) then
		if (miners[unitID].cargo > 450) then
			return_to_dropoff (unitID)
			return false --cmd taken care of
		else
			--return_to_mine (unitID)
			search_res (unitID)
			return false --cmd taken care of
		end
	end
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions,cmdTag, synced)
	if (miners[unitID]) then
	--------------"resume/go back to mining" button:
		if (cmdID == CMD_GO_MINING) then
			if (miners[unitID].cargo > 450) then
				return_to_dropoff (unitID)
				return false --cmd taken care of
			else
				--return_to_mine (unitID)
				search_res (unitID)
				return false --cmd taken care of
			end
		end
		--for k,v in pairs (cmdOptions) do
			--Spring.Echo (k, v)
		--end
	--------------various test crap:
		--[[
		local cmdq = Spring.GetCommandQueue(unitID)
		local manualCommand = false
		if (#cmdq>0) then
			--Spring.Echo ("internal:" , cmdq[1].options.internal)
			manualCommand = not cmdq[1].options.internal or false
		end
		--Spring.Echo ("cmdID:"..cmdID,CMD[cmdID], " | ",  "synced:",synced)
		if (cmdID == CMD.MOVE) then Spring.Echo ("move!") end
		--Spring.Echo (synced)
		--for k,v in pairs (cmdOptions) do
			--Spring.Echo (k, v)
		--end
		--Spring.Echo ("CMD.OPT_INTERNAL:" .. cmdOptions.internal)
		--Spring.Echo ("CMD.OPT_SHIFT:" .. cmdOptions["internal"]) --CMD.OPT_SHIFT
		--Spring.Echo ("command to miner " .. unitID .."->" .. CMD.OPT_INTERNAL)
		if (manualCommand) then			
			--if (cmdID == CMD.MOVE) then
				miners[unitID].manualTimer = 30
				Spring.Echo ("manual miner micro!")
			--end
		end
		--]]
	end
	return true
end

--------------------------------------------------------
--Border between SYNC and UNSYNC
--when i wear my frilly dress im a real touhou
end

if (not gadgetHandler:IsSyncedCode()) then
--------------------------------------------------------

--Length of table, for synced (using spairs)
function sxlen(tbl)
	local qq = 0;
	for v in spairs(tbl) do
		qq = qq + 1;
	end
	return qq;
end


--[[
function gadget:DrawScreen()


	gl.Color(0.5, 0.5, 0.5, 1)
	local ty = 0
	for i in spairs(SYNCED.miners) do
		ty = ty + 1
		gl.Text (ty .."| [" .. i .. "]".. "cargo:" .. SYNCED.miners[i].cargo, 100,300-ty*25 , 25, 'o')
	end
	gl.Text ("miners counted="..ty .. "#miners:" .. sxlen(SYNCED.miners), 100,300 , 25, 'o')
end
--]]

--[[
function gadget:DrawWorldPreUnit()	
	local localplayerally = Spring.GetMyAllyTeamID ()	
	gl.LineWidth(5.0)
	for i in spairs(SYNCED.dropoffs) do
		local unitally = Spring.GetUnitAllyTeam  (i)
		if (unitally == localplayerally) then ----only mark our own dropoffs
			local x,y,z=Spring.GetUnitPosition (i)							--das nicht jeden drawframe machen sondern zwischenspeichern
			if (x ~= nil and y ~= nil and z ~= nil) then				
				local d = Spring.GetUnitRadius (i) + SYNCED.dropoff_distance
				gl.Color(1, 1, 1, 1)
				gl.DrawGroundCircle (x,y,z, d, 8) --all dropoffs marked with octagon
			end
		end
	end
	
	for i in spairs(SYNCED.miners) do
			if (SYNCED.miners[i].alive == true and i ~= nil and SYNCED.miners[i] ~=nil) then
				local unitally = Spring.GetUnitAllyTeam  (i)
				if (unitally == localplayerally) then --only mark our own miners
					local x,y,z=Spring.GetUnitPosition (i)
					if (x ~= nil and y ~= nil and z ~= nil) then
						gl.Color(0, 1, 0, 1)
						--gl.DrawGroundCircle (x,y,z, 50, 4) --all miners marked with a diamond shape
						--cargo status
						--gl.Color(1, 0, 0, 1)
						--gl.DrawGroundCircle (x,y,z, 30, 3)
--						gl.Color(1, 1, 0, 1)
--						gl.DrawGroundCircle (x,y,z, SYNCED.miners[i].cargo, 3)  --growing triangle shows cargo status
						--mark last_mined minerals
--						if (Spring.ValidUnitID  (SYNCED.miners[i].last_mined_id)) then
--							local x,y,z=Spring.GetUnitPosition (SYNCED.miners[i].last_mined_id)
--							gl.Color(0, 0.8, 0, 1)
--							gl.DrawGroundCircle (x,y,z, 30, 15)  --growing triangle shows cargo status							
--						end
					end
				end
			end
	end
end
--]]
end