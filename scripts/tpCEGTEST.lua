function blub ()
	while (true) do
		Sleep (5000)
		local x,y,z = Spring.GetUnitPosition (unitID)
		Spring.SpawnCEG("tpsmokeflare", x, y, z)
	end
end

function script.Create()
	StartThread (blub)
end


function script.Killed(recentDamage, maxHealth)

end
