if Config.Enable['luxuryclothes'] then 
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("luxury_clothes_theft:framework:ready", function() 
                exports["luxury_clothes_theft"]:disableScriptEvent("luxury_clothes_theft:notify")
            end)
            
            RegisterNetEvent("luxury_clothes_theft:notify", function(message)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("luxury_clothes_theft:framework:ready", function() 
                exports["luxury_clothes_theft"]:disableScriptEvent("luxury_clothes_theft:notify")
            end)
            
            RegisterNetEvent("luxury_clothes_theft:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end
    end
end