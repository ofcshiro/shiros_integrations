if Config.Enable['robberycreator'] then
    if Config.Notify then
        if Config.Colored then
            RegisterNetEvent("robberies_creator:framework:ready", function()
                exports["robberies_creator"]:disableScriptEvent("robberies_creator:notify")
            end)

            RegisterNetEvent("robberies_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("robberies_creator:framework:ready", function()
                exports["robberies_creator"]:disableScriptEvent("robberies_creator:notify")
            end)

            RegisterNetEvent("robberies_creator:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end
    end

    -- Might dont work properly
    
    -- if Config.HelpNotify then
    --     RegisterNetEvent("robberies_creator:framework:ready", function() 
    --         -- This will replace the base function with the one you want
    --         exports["robberies_creator"]:replaceShowHelpNotification(Config.ClientHelpNotify)
    --     end)
    -- end

    if Config.Progressbar then
        RegisterNetEvent("robberies_creator:framework:ready", function()
            exports["robberies_creator"]:disableScriptEvent("robberies_creator:internalProgressBar")
        end)

        RegisterNetEvent("robberies_creator:internalProgressBar", function(time, text)
            newtime = time - 750
            Config.ProgressbarType(newtime, text)
        end)
    end

    if Config.PoliceNotify then 
        if Config.PoliceColored then
            RegisterNetEvent("robberies_creator:framework:ready", function() 
                exports["robberies_creator"]:disableScriptEvent("robberies_creator:alertedPolice")
            end)
        
            RegisterNetEvent("robberies_creator:alertedPolice", function(coords, message)
            
                Config.ClientPoliceNotify(coords, message)
            end)
        else
            RegisterNetEvent("robberies_creator:framework:ready", function() 
                exports["robberies_creator"]:disableScriptEvent("robberies_creator:alertedPolice")
            end)
        
            RegisterNetEvent("robberies_creator:alertedPolice", function(coords, message)
                local uncoloredMessage = message:gsub("~.~", "")
            
                Config.ClientPoliceNotify(coords, uncoloredMessage)
            end)
        end
    end
end
