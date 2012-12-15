function script.Create()
    Spring.Echo ("yo")
    Spring.AddUnitDamage (unitID, 9001)
end

function script.Deactivate()
end

function script.Killed(recentDamage, maxHealth)
    return 0
end 