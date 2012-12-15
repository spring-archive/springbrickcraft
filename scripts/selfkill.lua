local ich = unitID
function script.Create()	
	StartThread (selfkill)	
end

function selfkill ()
local SIG_BOM = 1
Signal(SIG_BOM)
SetSignalMask(SIG_BOM)

while (true) do
	Sleep (10)
	local  health,  maxHealth,  paralyzeDamage, captureProgress,  buildProgress = Spring.GetUnitHealth (ich)
	--Spring.Echo ("zoing!" .. buildProgress)
	if (buildProgress==1) then Spring.DestroyUnit (ich) end
--	Spring.AddUnitDamage (ich, 9001) end
	end
end