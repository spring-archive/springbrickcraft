function gadget:GetInfo()
        return {
                name                    = "mana",
                desc                    = "handles unit mana",
                author          		= "knorke",
                date                    = "Oct 2011",
                license  				= "later horses dont be mean.",
                layer            		= 0,
                enabled  = true,
        }
end

local manaUnitNames = {
  [UnitDefNames["tppioneer"].id] = {recharge=0.1, maxMana=3,startMana=3, manaName="Bombs", manaSymbol="[#] ", showManaNumber=true, showInToolTip=true,},
  [UnitDefNames["tpbigwheel"].id] = {recharge=2, maxMana=50,startMana=50, manaName="Battery", manaSymbol="|", showManaNumber=false, showInToolTip=false,},
 }

local manaUnits = {}
--recharge: this is added every updateRate 
--maxMana: how high can you get
--startMana: unit gets this much mana on creation
--manaName: what the mana is called, for the player ie "Battery" or "Magic Power"
--manaSymbol: characters used for drawing für die progress bar
--showManaNumber: show current mana as number in tooltip?
--showInToolTip: show something in tooltip at all?

local updateRate = 30

if (not gadgetHandler:IsSyncedCode()) then return end

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)	
	if (manaUnitNames[unitDefID]) then
		GG.newManaUnit (unitID, manaUnitNames[unitDefID].recharge, manaUnitNames[unitDefID].maxMana, manaUnitNames[unitDefID].startMana, manaUnitNames[unitDefID].manaName, manaUnitNames[unitDefID].manaSymbol, manaUnitNames[unitDefID].showManaNumber, manaUnitNames[unitDefID].showInToolTip)
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID)
	manaUnits[unitID] = nil
end

function GG.newManaUnit (unitID, recharge, maxMana, currentMana, manaName, manaSymbol, showManaNumber, showInToolTip)
	manaUnits[unitID] = {}
	manaUnits[unitID].recharge = recharge or 1
	manaUnits[unitID].maxMana = maxMana or 10	
	manaUnits[unitID].currentMana = currentMana or maxMana
	manaUnits[unitID].manaName = manaName or "Mana"
	manaUnits[unitID].manaSymbol = manaSymbol or "|"
	manaUnits[unitID].showManaNumber = showManaNumber-- or true
	manaUnits[unitID].showInToolTip = showInToolTip
end

function GG.AdjustMana (unitID, difference)
	if (manaUnits[unitID]) then		
		local currm = manaUnits[unitID].currentMana or 0
		local maxm = manaUnits[unitID].maxMana
		currm = currm + difference
		if (currm > maxm) then currm = maxm end
		if (currm < 0) then currm = 0 end
		manaUnits[unitID].currentMana = currm
		local symbol = manaUnits[unitID].manaSymbol
		if (manaUnits[unitID].showInToolTip) then
			local s = manaUnits[unitID].manaName .. ": "
			if (manaUnits[unitID].showManaNumber) then s = s.. math.floor(currm) end
			s = s .. " \255\000\255\000" .. string.rep (symbol, currm) .. "\255\255\000\000" .. string.rep (symbol, math.ceil(maxm-currm)) .. "\b"
			Spring.SetUnitTooltip (unitID, s)
		end
	Spring.SetUnitRulesParam(unitID,"manaPercent",(currm/maxm)*100) --for hp bars widget	
	end
end

function GG.GetMana (unitID)
	if (not manaUnits[unitID]) then return -1 end	--return -1 if you dont want "compare string vs number" errors
	return manaUnits[unitID].currentMana or 0
end

function gadget:GameFrame (f)
	if (f%updateRate == 0) then		
		for unitID in pairs(manaUnits) do			
			GG.AdjustMana (unitID, manaUnits[unitID].recharge)
		end		
	end
end