if Config.Enable['shopscreator'] then
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("shops_creator:framework:ready", function() 
                exports["shops_creator"]:disableScriptEvent("shops_creator:notify")
            end)
            
            RegisterNetEvent("shops_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("shops_creator:framework:ready", function() 
                exports["shops_creator"]:disableScriptEvent("shops_creator:notify")
            end)
            
            RegisterNetEvent("shops_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end
    end

    if Config.PoliceNotify then
        if Config.PoliceColored then
            RegisterNetEvent("shops_creator:framework:ready", function() 
                exports["shops_creator"]:disableScriptEvent("robberies_creator:alertedPolice")
            end)

            RegisterNetEvent("shops_creator:alertedPolice", function(coords, message)
                Config.ClientPoliceNotify(coords, message)
            end)
        else
            RegisterNetEvent("shops_creator:framework:ready", function() 
                exports["shops_creator"]:disableScriptEvent("robberies_creator:alertedPolice")
            end)

            RegisterNetEvent("shops_creator:alertedPolice", function(coords, message)
                local uncoloredMessage = message:gsub("~.~", "")
            
                Config.ClientPoliceNotify(coords, uncoloredMessage)
            end)
        end
    end
end 