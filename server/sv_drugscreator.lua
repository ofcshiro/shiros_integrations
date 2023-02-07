if Config.EnableSV['drugscreator'] then
    if Config.ExtendedDrugs then 
        if Config.Framework == 'esx' then
            ESX = exports["es_extended"]:getSharedObject()

            for itemname,data in pairs(Config.Drugs) do
                ESX.RegisterUsableItem(itemname, function(source)
                    local xPlayer = ESX.GetPlayerFromId(source)
                    local time = data.effectDuration * 100
                    local hcount, fcount, dcount = 0, 0, 0
                    xPlayer.removeInventoryItem(itemname, 1)
    
                    TriggerClientEvent("advanced_drugs_creator:drugEffects", source, data.takingMethod, data.drugEffects, data.effectDuration)
                    
                    if data.thirst['enable'] then
                        if data.thirst['positive'] then 
                            if data.thirst['overtime'] then
                                repeat
                                    TriggerClientEvent("esx_status:add",source,"thirst",data.thirst['amount'])
                                    Wait(time)
    
                                    dcount = dcount + 1
                                until dcount == 11
                            else
                                TriggerClientEvent("esx_status:add",source,"thirst",data.thirst['amount'])
                            end
                        else
                            if data.thirst['overtime'] then
                                repeat
                                    TriggerClientEvent("esx_status:add",source,"thirst", -data.thirst['amount'])
                                    Wait(time)
    
                                    dcount = dcount + 1
                                until dcount == 11
                            else
                                TriggerClientEvent("esx_status:add",source,"thirst", -data.thirst['amount'])
                            end
                        end
                    end
    
                    if data.hunger['enable'] then
                        if data.hunger['positive'] then 
                            if data.hunger['overtime'] then
                                repeat
                                    TriggerClientEvent("esx_status:add",source,"hunger",data.hunger['amount'])
                                    Wait(time)
                                    
                                    fcount = fcount + 1
                                until fcount == 11
                            else
                                TriggerClientEvent("esx_status:add",source,"hunger",data.hunger['amount'])
                            end
                        else
                            if data.hunger['overtime'] then
                                repeat
                                    TriggerClientEvent("esx_status:add",source,"hunger", -data.hunger['amount'])
                                    Wait(time)
    
                                    fcount = fcount + 1
                                until fcount == 11
                            else
                                TriggerClientEvent("esx_status:add",source,"hunger", -data.hunger['amount'])
                            end
                        end 
                    end
    
                    if data.health['enable'] then
                        if data.health['positive'] then
                            if data.health['overtime'] then
                                repeat
                                    TriggerClientEvent('integrationEvents:playerHealth', source, data.health['amount'], data.health['positive'])
                                    Wait(time)
    
                                    hcount = hcount + 1
                                until hcount == 11
                            else    
                                TriggerClientEvent('integrationEvents:playerHealth', source, data.health['amount'], data.health['positive'])
                            end
                        else
                            if data.health['overtime'] then 
                                repeat
                                    TriggerClientEvent('integrationEvents:playerHealth', source, data.health['amount'], data.health['positive'])
                                    Wait(time)
                                    hcount = hcount + 1
                                until hcount == 1
                            else
                                TriggerClientEvent('integrationEvents:playerHealth', source, data.health['amount'], -data.health['positive'])
                            end
                        end
                    end
                end)
            end
        elseif Config.Framework == 'qbcore' then 
            QBCore = exports['qb-core']:GetCoreObject()

            for itemname,data in pairs(Config.Drugs) do
                QBCore.Functions.CreateUseableItem(itemname, function(source)
                    local Player = QBCore.Functions.GetPlayer(source)  
                    local time = data.effectDuration * 100
                    local hcount, fcount, dcount = 0, 0, 0
                    Player.Functions.RemoveItem(itemname, 1)
                    TriggerClientEvent("advanced_drugs_creator:drugEffects", source, data.takingMethod, data.drugEffects, data.effectDuration)
                    if data.thirst['enable'] then
                        if data.thirst['positive'] then 
                            if data.thirst['overtime'] then
                                repeat
                                    Player.Functions.SetMetaData(source,"thirst",data.thirst['amount'])
                                    Wait(time)
        
                                    dcount = dcount + 1
                                    print(dcount)
                                until dcount == 11
                            else
                                Player.Functions.SetMetaData(source,"thirst",data.thirst['amount'])
                            end
                        else
                            if data.thirst['overtime'] then
                                repeat
                                    Player.Functions.SetMetaData(source,"thirst", -data.thirst['amount'])
                                    Wait(time)
            
                                            dcount = dcount + 1
                                        until dcount == 11
                                    else
                                        Player.Functions.SetMetaData(source,"thirst", -data.thirst['amount'])
                                    end
                                end
                            end
            
                            if data.hunger['enable'] then
                                if data.hunger['positive'] then 
                                    if data.hunger['overtime'] then
                                        repeat
                                            Player.Functions.SetMetaData(source,"hunger",data.hunger['amount'])
                                            Wait(time)
                                            
                                            fcount = fcount + 1
                                        until fcount == 11
                                    else
                                        Player.Functions.SetMetaData(source,"hunger",data.hunger['amount'])
                                    end
                                else
                                    if data.hunger['overtime'] then
                                        repeat
                                            Player.Functions.SetMetaData(source,"hunger", -data.hunger['amount'])
                                            Wait(time)
            
                                            fcount = fcount + 1
                                        until fcount == 11
                                    else
                                        Player.Functions.SetMetaData(source,"hunger", -data.hunger['amount'])
                                    end
                                end 
                            end
                            if data.health['enable'] then
                                if data.health['positive'] then
                                    if data.health['overtime'] then
                                        repeat
                                            TriggerClientEvent('integrationEvents:playerHealth', source, data.health['amount'], data.health['positive'])
                                            Wait(time)
            
                                            hcount = hcount + 1
                                        until hcount == 11
                                    else    
                                        TriggerClientEvent('integrationEvents:playerHealth', source, data.health['amount'], data.health['positive'])
                                    end
                                else
                                    if data.health['overtime'] then 
                                        repeat
                                            TriggerClientEvent('integrationEvents:playerHealth', source, data.health['amount'], data.health['positive'])
                                            Wait(time)
                                            hcount = hcount + 1
                                        until hcount == 1
                                    else
                                        TriggerClientEvent('integrationEvents:playerHealth', source, data.health['amount'], -data.health['positive'])
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end 
end
