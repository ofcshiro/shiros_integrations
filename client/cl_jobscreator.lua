if Config.Enable['jobscreator'] then 
    if Config.JobGarage then 
        if Config.GarageType == 'temp' then 
            AddEventHandler("jobs_creator:temporary_garage:vehicleSpawned", function(vehicle, vehicleName, vehiclePlate)
                if Config.useFuel then 
                    fillFuel(vehicle)
                end
            end)

        elseif Config.GarageType == 'perm' then 
            AddEventHandler("jobs_creator:permanent_garage:vehicleSpawned", function(vehicle, vehicleName, vehiclePlate)
                if Config.useFuel then 
                    fillFuel(vehicle)
                end
            end)
        elseif Config.GarageType == 'both' then 
            AddEventHandler("jobs_creator:permanent_garage:vehicleSpawned", function(vehicle, vehicleName, vehiclePlate)
                if Config.useFuel then 
                    fillFuel(vehicle)
                end
            end)
            AddEventHandler("jobs_creator:temporary_garage:vehicleSpawned", function(vehicle, vehicleName, vehiclePlate)
                if Config.useFuel then 
                    fillFuel(vehicle)
                end
            end)
        end
    end

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

    if Config.HelpNotify then
        RegisterNetEvent("jobs_creator:framework:ready", function() 
            exports["jobs_creator"]:replaceShowHelpNotification(Config.ClientHelpNotify)
        end)
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