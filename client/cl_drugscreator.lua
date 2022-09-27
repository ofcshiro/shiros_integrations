if Config.Enable['drugscreator'] then 
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("advanced_drugs_creator:framework:ready", function() 
                exports["advanced_drugs_creator"]:disableScriptEvent("advanced_drugs_creator:notify")
            end)
            
            RegisterNetEvent("advanced_drugs_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("advanced_drugs_creator:framework:ready", function() 
                exports["advanced_drugs_creator"]:disableScriptEvent("advanced_drugs_creator:notify")
            end)
            
            RegisterNetEvent("advanced_drugs_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end
    end

    if Config.Progressbar then 
        RegisterNetEvent("advanced_drugs_creator:framework:ready", function() 
            exports["advanced_drugs_creator"]:disableScriptEvent("advanced_drugs_creator:internalProgressBar")
        end)

        RegisterNetEvent("advanced_drugs_creator:internalProgressBar", function(time, text)
            Config.ProgressbarType(time, text)
        end)
    end
end