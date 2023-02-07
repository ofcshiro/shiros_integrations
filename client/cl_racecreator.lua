if Config.Enable['racecreator'] then
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("races_creator:framework:ready", function() 
                -- Disables the default script notification (otherwise there would be 2 notifications)
                exports["races_creator"]:disableScriptEvent("races_creator:notify")
            end)
            
            RegisterNetEvent("races_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("races_creator:framework:ready", function() 
                -- Disables the default script notification (otherwise there would be 2 notifications)
                exports["races_creator"]:disableScriptEvent("races_creator:notify")
            end)
            
            RegisterNetEvent("races_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end
    end

    if Config.PoliceNotify then 
        if Config.PoliceColored then 
            RegisterNetEvent("races_creator:framework:ready", function() 
                exports["races_creator"]:disableScriptEvent("races_creator:alertedPolice")
            end)

            RegisterNetEvent("races_creator:alertedPolice", function(coords, message)
                Config.ClientPoliceNotify(coords, message)
            end)
        else
            RegisterNetEvent("races_creator:framework:ready", function() 
                exports["races_creator"]:disableScriptEvent("races_creator:alertedPolice")
            end)

            RegisterNetEvent("races_creator:alertedPolice", function(coords, message)
                local uncoloredMessage = message:gsub("~.~", "")
            
                Config.ClientPoliceNotify(coords, uncoloredMessage)
            end)
        end
    end
end