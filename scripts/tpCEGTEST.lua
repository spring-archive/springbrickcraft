function blub ()
	while (true) do
		Sleep (2000)
		local x,y,z = Spring.GetUnitPosition (unitID)
		Spring.SpawnCEG("tptestceg", x, y, z)
	end
end

function script.Create()
	StartThread (blub)
end


function script.Killed(recentDamage, maxHealth)

end
