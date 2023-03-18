if Config.Enable['vehiclekeys'] then
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("vehicles_keys:framework:ready", function() 
                -- Disables the default script notification (otherwise there would be 2 notifications)
                exports["vehicles_keys"]:disableScriptEvent("vehicles_keys:notify")
            end)
            
            RegisterNetEvent("vehicles_keys:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("vehicles_keys:framework:ready", function() 
                -- Disables the default script notification (otherwise there would be 2 notifications)
                exports["vehicles_keys"]:disableScriptEvent("vehicles_keys:notify")
            end)
            
            RegisterNetEvent("vehicles_keys:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end
    end

    if Config.HelpNotify then
        RegisterNetEvent("vehicles_keys:framework:ready", function() 
            exports["vehicles_keys"]:replaceShowHelpNotification(Config.ClientHelpNotify)
        end)
    end
    
    if Config.Progressbar then 
        RegisterNetEvent("vehicles_keys:framework:ready", function() 
            exports["vehicles_keys"]:disableScriptEvent("vehicles_keys:internalProgressBar")
        end)

        RegisterNetEvent("vehicles_keys:internalProgressBar", function(time, text)
            Config.ProgressbarType(time, text)
        end)        
    end

    if Config.PoliceNotify then 
        if Config.PoliceColored then 
            RegisterNetEvent("vehicles_keys:framework:ready", function() 
                exports["vehicles_keys"]:disableScriptEvent("vehicles_keys:alertedPolice")
            end)
        
            RegisterNetEvent("vehicles_keys:alertedPolice", function(coords, message)
            
                Config.ClientPoliceNotify(coords, message)
            end)
        else
            RegisterNetEvent("vehicles_keys:framework:ready", function() 
                exports["vehicles_keys"]:disableScriptEvent("vehicles_keys:alertedPolice")
            end)
        
            RegisterNetEvent("vehicles_keys:alertedPolice", function(coords, message)
                local uncoloredMessage = message:gsub("~.~", "")
            
                Config.ClientPoliceNotify(coords, uncoloredMessage)
            end)
        end
    end
end