RegisterNetEvent('integrationEvents:playerHealth')
AddEventHandler('integrationEvents:playerHealth', function(amount, positive)

    local Player = PlayerPedId()
    local Health = GetEntityHealth(Player)

    
    if positive then
        local NewHealth = Health + amount
        SetEntityHealth(Player, NewHealth)
    else
        local NewHealth = Health - amount
        SetEntityHealth(Player, NewHealth)
    end
end)

function fillFuel(vehicle)
    if Config.FuelScript == 'legacy' then 
        exports["LegacyFuel"]:SetFuel(vehicle, 100)
    elseif Config.FuelScript == 'ox' then 
        Entity(vehicle).state.fuel = 100
    end
end