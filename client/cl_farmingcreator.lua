if Config.Enable['farmingcreator'] then
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("farming_creator:framework:ready", function() 
                exports["farming_creator"]:disableScriptEvent("farming_creator:notify")
            end)
            
            RegisterNetEvent("farming_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("farming_creator:framework:ready", function() 
                exports["farming_creator"]:disableScriptEvent("farming_creator:notify")
            end)
            
            RegisterNetEvent("farming_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end
    end

    if Config.Progressbar then 
        RegisterNetEvent("farming_creator:framework:ready", function() 
            exports["farming_creator"]:disableScriptEvent("farming_creator:internalProgressBar")
        end)
        
        RegisterNetEvent("farming_creator:internalProgressBar", function(time, text)
            Config.ProgressbarType(time, text)
        end)
    end

    if Config.PoliceNotify then 
        if Config.PoliceColored then 
            RegisterNetEvent("farming_creator:framework:ready", function() 
                exports["farming_creator"]:disableScriptEvent("farming_creator:alertedPolice")
            end)

            RegisterNetEvent("farming_creator:alertedPolice", function(coords, message)
                Config.ClientPoliceNotify(coords, message)
            end)
        else
            RegisterNetEvent("farming_creator:framework:ready", function() 
                exports["farming_creator"]:disableScriptEvent("farming_creator:alertedPolice")
            end)
        
            RegisterNetEvent("farming_creator:alertedPolice", function(coords, message)
                local uncoloredMessage = message:gsub("~.~", "")
            
                Config.ClientPoliceNotify(coords, uncoloredMessage)
            end)
        end
    end
end
