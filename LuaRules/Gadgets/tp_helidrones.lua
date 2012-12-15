function gadget:GetInfo()
	return {
	name                    = "Drones",
	desc                    = "controlls heli drones",
	author                          = "knorke, googlefrog made drones respawn",
	date                    = "Feb 2010",
	license                              = "later horses dont be mean.",
	layer                          = 1,
	enabled  = true, --      loaded by default?
	}
end
 
local markers = false
local SPAWN_DELAY = 30*20
 
if (gadgetHandler:IsSyncedCode()) then
local unitsWIPbuilder = {}      --stores the builder of a unit whose construction just began. because unitfinished does not give builderID, only unitcreated does that.
local droneParent = {}
local droneSpawns = {}
local basesToSpawnDrones = {} -- for multiple drones this will need extending.
local baseData = {}
 
function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
		if (builderID==nil) then return end
		marker_on_unit (unitID, "new unit:" .. unitname (unitID) .. " built by " .. unitname (builderID))
		buildername = unitname (builderID)
		newunitname = unitname (unitID)
		--spawn a drone with every turret. the drone patrols between turret and builder.
		if (newunitname == "tpgunturret") then unitsWIPbuilder [unitID] = builderID end
end
 
function gadget:UnitFinished(unitID, unitDefID, teamID) 
		local builderID = unitsWIPbuilder [unitID]
		if (builderID==nil) then return end
		marker_on_unit (unitID, "new unit:" .. unitname (unitID) .. " built by " .. unitname (builderID))
		buildername = unitname (builderID)
		newunitname = unitname (unitID)
		--spawn a drone with every turret. the drone patrols between turret and builder.
		if (newunitname == "tpgunturret") then
				--Spring.Echo ("new drone!")
				local x1,y1,z1 = Spring.GetUnitPosition (builderID)
				local drone = Spring.CreateUnit ("tphelidrone", x1,y1,z1, 0, teamID)
				GG.addLinkedUnit (builderID, drone)
		droneParent[drone] = unitID
				local x2,y2,z2 = Spring.GetUnitPosition (unitID)
				--calc patrol end point position
				local tx = x1 + ((x2-x1)*5)
				local tz = z1 + ((z2-z1)*5)
				local ty = y1
		baseData[unitID] = {tx = tx, ty = ty, tz = tz, x1 = x1, y1 = y1, z1 = z1, teamID = teamID, baseUnitID=builderID}
				Spring.GiveOrderToUnit(drone, CMD.PATROL , {tx, ty, tz  }, {})
				Spring.GiveOrderToUnit(drone, CMD.MOVE_STATE, { 2 }, {})        --fire at will
				Spring.GiveOrderToUnit(drone, CMD.FIRE_STATE , { 2 }, {})       --was 2=roam, mit 1 sind sie nicht aktiv genug
				Spring.SetUnitNoSelect (drone, true)
				unitsWIPbuilder [unitID] = nil
		end
end
 
function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID)
		unitsWIPbuilder [unitID] = nil
		if (unitname (unitID) == "tphelidronebig") then
				local x,y,z = Spring.GetUnitPosition (unitID, teamID)
				createDroneSwarm (x,y,z, teamID)
		end
	if droneParent[unitID] then
		local frame = Spring.GetGameFrame() + SPAWN_DELAY
		if not droneSpawns[frame] then
			droneSpawns[frame] = {n = 0, d = {}}
		end
		droneSpawns[frame].n = droneSpawns[frame].n + 1
		droneSpawns[frame].d[droneSpawns[frame].n] = droneParent[unitID]
		basesToSpawnDrones[droneParent[unitID]] = {n = droneSpawns[frame].n, frame = frame}
		droneParent[unitID] = nil
	end
	if basesToSpawnDrones[unitID] then
		local frame = basesToSpawnDrones[unitID].frame
		local n = basesToSpawnDrones[unitID].n
		droneSpawns[frame].d[n] = droneSpawns[frame].d[droneSpawns[frame].n]
		droneSpawns[frame].n = droneSpawns[frame].n - 1
		basesToSpawnDrones[unitID] = nil
	end
	if baseData[unitID] then
		baseData[unitID] = nil
	end
end
 
function gadget:GameFrame(frame)
	if droneSpawns[frame] then
		for i = 1, droneSpawns[frame].n do
			local unitID = droneSpawns[frame].d[i]
			if Spring.ValidUnitID(unitID) then
				local drone = Spring.CreateUnit ("tphelidrone", baseData[unitID].x1,baseData[unitID].y1,baseData[unitID].z1, 0, baseData[unitID].teamID)
				GG.addLinkedUnit (baseData[unitID].baseUnitID, drone)
				droneParent[drone] = unitID
				Spring.GiveOrderToUnit(drone, CMD.PATROL , {baseData[unitID].tx, baseData[unitID].ty, baseData[unitID].tz  }, {})
				Spring.GiveOrderToUnit(drone, CMD.MOVE_STATE, { 2 }, {})        --fire at will
				Spring.GiveOrderToUnit(drone, CMD.FIRE_STATE , { 2 }, {})       --roam
				Spring.SetUnitNoSelect (drone, true)
			end
			basesToSpawnDrones[unitID] = nil
		end
		droneSpawns[frame] = nil
	end
end
 
function createDroneSwarm (x,y,z, teamID)
		local n = 8
		for i=1,n do       
				local drone = Spring.CreateUnit ("tphelidrone", x,y,z, 0, teamID)
				Spring.MoveCtrl.Enable(drone)
				Spring.MoveCtrl.SetPosition (drone,  x+math.random(-20,20),y+math.random(-20,20),z+math.random(-20,20))
				Spring.MoveCtrl.Disable(drone)
				--calc patrol end point position
				--local x2,y2,z2 = Spring.GetUnitPosition (drone)              
				--local tx = x1 + ((x2-x1)*5)
				--local tz = z1 + ((z2-z1)*5)
				--local ty = y1
				local tx = x + (math.sin (((2*math.pi)/n) * i) * 300)
				local tz = z + (math.cos (((2*math.pi)/n) * i) * 300)
				local ty = y
				Spring.GiveOrderToUnit(drone, CMD.PATROL , {tx, ty, tz  }, {})
				Spring.GiveOrderToUnit(drone, CMD.MOVE_STATE, { 2 }, {})        --fire at will
				Spring.GiveOrderToUnit(drone, CMD.FIRE_STATE , { 2 }, {})       --roam
				Spring.SetUnitNoSelect (drone, true)
		end
end
 
function unitname (unitID)--****
		if (not unitID) then return "unitname () no unitID given" end
		local unitDefID = Spring.GetUnitDefID(unitID)
		if (unitDefID) then
				local unitDef = UnitDefs[unitDefID]
				if (unitDef) then
						return unitDef.name
				end
		end
		return "unitname(): invalid unit id"
end
 
function marker_on_unit (_uID, _text)
		if (markers == false) then return end
		if (_uID == nil) then return end
		if (_text == nil) then return end
		local x,y,z=Spring.GetUnitPosition (_uID)
		if (x == nil or y == nil or z == nil) then return end
		Spring.MarkerAddPoint (x,y,z, _text .. "id:" .. _uID)
end
 
end 