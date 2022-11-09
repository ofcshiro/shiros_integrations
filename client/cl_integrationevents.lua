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