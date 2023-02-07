if Config.Enable['trackerscreator'] then
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("trackers_creator:framework:ready", function() 
                exports["trackers_creator"]:disableScriptEvent("trackers_creator:notify")
            end)
            
            RegisterNetEvent("trackers_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else 
            RegisterNetEvent("trackers_creator:framework:ready", function() 
                exports["trackers_creator"]:disableScriptEvent("trackers_creator:notify")
            end)
            
            RegisterNetEvent("trackers_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end
    end
end