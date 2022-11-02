Config = {}

-- Language Settings
Config.Locale = "en" -- Currently not Used
Config.ServerName = 'SERVERNAME' -- In case your Notify uses a title, you can use Config.ServerName as title


-- General Settings
------------------------------------------------------------------------------------------


-- Client Sided Integrations
Config.Enable = {
    billingui = false,
    blipscreator = false,
    doorscreator = false, 
    drugscreator = false, 
    allowlist = false, 
    jobscreator = false, 
    luxuryclothes = false, 
    robberycreator = false,
    vehiclekeys = false
}


-- Notify Settings
------------------------------------------------------------------------------------------

Config.Notify = false -- If you dont want to use notify replacement set it to false
Config.Colored = false -- If you dont want colored messages (e.g ~y~something in yellow) set it to false
Config.NotifyType = 'info' -- The Notification Type ('info', 'success', 'check', 'error') applies for all Notifications
Config.NotifyTime = 3000    -- The time how long the notify is displayed

Config.ClientNotification = function(type, msg)
    ------------------------------------------------------------------------------------------
    -- Insert your Notification System here. (script uses type (Config.NotifyType)))
    ------------------------------------------------------------------------------------------

    -- As am example:
    
    TriggerEvent("ESX:Notify", type, Config.NotifyTime, msg)
    --exports['okokNotify']:Alert(Config.ServerName, msg, Config.NotifyTime, type)

end


-- Progressbar Settings
------------------------------------------------------------------------------------------

Config.Progressbar = false -- If you dont want the default progressbar

Config.ProgressbarType = function(time, text) 
    ------------------------------------------------------------------------------------------
    -- Insert your Progressbar here (Text and Time are passed through the integration)
    ------------------------------------------------------------------------------------------
    
    exports["esx_progressbar"]:Progressbar(text, time)
end
