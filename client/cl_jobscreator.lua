if Config.Enable['jobscreator'] then 
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("jobs_creator:framework:ready", function() 
                exports["jobs_creator"]:disableScriptEvent("jobs_creator:notify")
            end)
            
            RegisterNetEvent("jobs_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("jobs_creator:framework:ready", function() 
                exports["jobs_creator"]:disableScriptEvent("jobs_creator:notify")
            end)
            
            RegisterNetEvent("jobs_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end    
    end

    if Config.Progressbar then 
        RegisterNetEvent("jobs_creator:framework:ready", function() 
            exports["jobs_creator"]:disableScriptEvent("jobs_creator:internalProgressBar")
        end)

        RegisterNetEvent("jobs_creator:internalProgressBar", function(time, text)
            Config.ProgressbarType(time, text)
        end)        
    end
end