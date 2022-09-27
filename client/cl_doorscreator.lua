if Config.Enable['doorscreator'] then 
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("doors_creator:framework:ready", function() 
                -- Disables the default script notification (otherwise there would be 2 notifications)
                exports["doors_creator"]:disableScriptEvent("doors_creator:notify")
            end)
            
            RegisterNetEvent("doors_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("doors_creator:framework:ready", function() 
                -- Disables the default script notification (otherwise there would be 2 notifications)
                exports["doors_creator"]:disableScriptEvent("doors_creator:notify")
            end)
            
            RegisterNetEvent("doors_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end
    end
end