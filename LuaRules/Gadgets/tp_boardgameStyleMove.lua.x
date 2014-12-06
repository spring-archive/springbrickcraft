--http://springrts.com/phpbb/viewtopic.php?f=14&t=32730
function gadget:GetInfo()
        return {
                name                    = "boardgame style move",
                desc                    = "knight jumps queen",
                author          		= "knorke",
                date                    = "Nov 2014",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true,
        }
end

if (gadgetHandler:IsSyncedCode()) then

gridSize=100
function MoveUnits ()
	for _,unitID in pairs(Spring.GetAllUnits()) do
	Spring.MoveCtrl.Enable  (unitID)
		local cQueue = Spring.GetCommandQueue(unitID,10)
		local x,y,z=Spring.GetUnitPosition (unitID)		
		if cQueue then			
			if cQueue[1] and cQueue[1].id == CMD.MOVE then
				tx,ty,tz = cQueue[1].params[1],cQueue[1].params[2],cQueue[1].params[3]
				local gridx = ElmoToGrid(x)
				local gridz = ElmoToGrid(z)
				local gridTx = ElmoToGrid(tx)
				local gridTz = ElmoToGrid(tz)				
				local movex=gridTx-gridx
				local movez=gridTz-gridz
				if math.abs (movex)>math.abs (movez) then movez=0 else movex=0 end --no diagonal
				movex = math.clamp (-1,movex,1)
				movez = math.clamp (-1,movez,1)				
				gridx=gridx+movex
				gridz=gridz+movez				
				Spring.SetUnitPosition (unitID, GridToElmo(gridx),y,GridToElmo(gridz))
			end
		end
	end
end

--converting between world coordinates and grid coordinates
function ElmoToGrid (elmo)
	return math.floor ( ((elmo)/gridSize +0.5) )
end

function GridToElmo (grid)
	return(grid*gridSize)
end

function math.clamp(low, x, high) 
	return math.min(math.max(x, low), high) 
end

function gadget:GameFrame (f)
	if f%30==0 then
		MoveUnits ()
	end
end


else --- UNSYNCED ---

gridSize=100

function gadget:DrawWorldPreUnit()
	for x=0,Game.mapSizeX, gridSize do
		for z=0,Game.mapSizeX, gridSize do
			gl.DrawGroundCircle (x,100,z, gridSize/4,10)
		end
	end

end

end