Config = {}

-- Language Settings
Config.Locale = "de" -- Currently not Used
Config.ServerName = 'SERVERNAME' -- In case your Notify uses a title, you can use Config.ServerName as title
Config.Framework = 'esx' -- What Framework you use (esx or qbcore) QBCORE Doesnt work Currently
-- General Settings
------------------------------------------------------------------------------------------


-- Client Sided Integrations
Config.Enable = {
    billingui = true,
    blipscreator = true,
    doorscreator = true, 
    drugscreator = true, 
    allowlist = true, 
    jobscreator = true, 
    luxuryclothes = true, 
    robberycreator = true,
    vehiclekeys = true,
    farmingcreator = true, 
    trackerscreator = true, 
    racecreator = true
}

Config.EnableSV = {
    billingui = false,
    blipscreator = false,
    doorscreator = false, 
    drugscreator = true, 
    allowlist = false, 
    jobscreator = false, 
    luxuryclothes = false, 
    robberycreator = false,
    vehiclekeys = false,
    farmingcreator = false, 
    trackerscreator = false, 
    racecreator = false
}


-- Notify Settings
------------------------------------------------------------------------------------------

Config.Notify = true -- If you dont want to use notify replacement set it to false
Config.Colored = true -- If you dont want colored messages (e.g ~y~something in yellow) set it to false
Config.NotifyType = 'info' -- The Notification Type ('info', 'success', 'check', 'error') applies for all Notifications
Config.NotifyTime = 3000    -- The time how long the notify is displayed

Config.ClientNotification = function(type, msg)
    ------------------------------------------------------------------------------------------
    -- Insert your Notification System here. (script uses type (Config.NotifyType)))
    ------------------------------------------------------------------------------------------

    -- As am example:
    -- You can use Config.ServerName as the title variable (if your notify has a title)
    
    exports["Venice-Notification"]:Notify(msg, Config.NotifyTime, type)

end


-- Progressbar Settings
------------------------------------------------------------------------------------------

Config.Progressbar = true -- If you dont want the default progressbar

Config.ProgressbarType = function(time, text) 
    ------------------------------------------------------------------------------------------
    -- Insert your Progressbar here (Text and Time are passed through the integration)
    ------------------------------------------------------------------------------------------
    
    exports['progressBars']:startUI(time, text)
end

Config.PoliceNotify = true -- If you want to replace the Police Notifiy
Config.PoliceColored = false -- If your Police Notify should be colored or not

Config.ClientPoliceNotify = function(coords, message)
    ------------------------------------------------------------------------------------------
    -- Insert your Police Notify System here. (script uses type (Config.NotifyType)))
    ------------------------------------------------------------------------------------------
    local anonym = true
    local position = {x = coords.x, y = coords.y, z = coords.z - 1}
    local jobreceived = 'police'
    local message = message
    
    TriggerServerEvent('roadphone:sendDispatch', GetPlayerServerId(PlayerId()), message, jobreceived, position, anonym)

end

-- Jobs Creator Garage Features WORK IN PROGRESS
Config.JobGarage = false -- If you use Job Vehicles
Config.useFuel = true -- if you want to max fuel the Vehicle on Spawn
Config.GarageType = 'temp' -- which Garage Type you use ('temp', 'perm', 'both')
Config.FuelScript = 'ox' -- Which Fuel Script you use ('legacy', 'ox')

-- Extended Drugs

Config.ExtendedDrugs = true -- If you dont want to use them set it to false

Config.Drugs = {
    ['joint'] = {
        takingMethod = 'smoke',
        effectDuration = 120, -- In Seconds
        drugEffects = {
            "drunk_walk",
            "green_visual"
        },
        health = {
            enable = false,
            amount = 0,
            positive = true, -- If true it heals, if false it damages
            overtime = true -- if true it heals over time, if false its 1 time heal
        },
        hunger = { 
            enable = true,
            amount = 12500, -- The Amount the Hunger increase
            positive = false, -- if true it adds hunger, if false it removes hunger
            overtime = true -- if true it adds hunger over time, if false its 1 time 
        },
        thirst = { 
            enable = true,
            amount = 12500, -- The amount of thirst incrase
            positive = false, -- if true it adds thirst, if false it removes thirst
            overtime = true -- if true it adds thirst over time, if false its 1 time
        }
    },
    ['brownies'] = {
        takingMethod = 'pill',
        effectDuration = 120, -- In Seconds
        drugEffects = {
            "drunk_walk",
            "fall",
            "green_visual"
        },
        health = {
            enable = false,
            amount = 0,
            positive = true, -- If true it heals, if false it damages
            overtime = true -- if true it heals over time, if false its 1 time heal
        },
        hunger = {
            enable = true,
            amount = 150000, -- The Amount the Hunger increase
            positive = true, -- if true it adds hunger, if false it removes hunger
            overtime = true -- if true it adds hunger over time, if false its 1 time 
        },
        thirst = {
            enable = true,
            amount = 25000, -- The amount of thirst incrase
            positive = false, -- if true it adds thirst, if false it removes thirst
            overtime = false -- if true it adds thirst over time, if false its 1 time
        }
    },
    ['lean'] = {
        takingMethod = 'drink',
        effectDuration = 120, -- In Seconds
        drugEffects = {
            "drunk_walk",
            "pink_visual"
        },
        health = {
            enable = true,
            amount = 50,
            positive = true, -- If true it heals, if false it damages
            overtime = false -- if true it heals over time, if false its 1 time heal
        },
        hunger = {
            enable = false,
            amount = 0, -- The Amount the Hunger increase
            positive = true, -- if true it adds hunger, if false it removes hunger
            overtime = true -- if true it adds hunger over time, if false its 1 time 
        },
        thirst = {
            enable = true,
            amount = 50000, -- The amount of thirst incrase
            positive = true, -- if true it adds thirst, if false it removes thirst
            overtime = false -- if true it adds thirst over time, if false its 1 time
        }
    },
    ['meth'] = {
        takingMethod = 'smoke',
        effectDuration = 120, -- In Seconds
        drugEffects = {
            "confused_visual",
            "fall",
            "sprint_faster"
        },
        health = {
            enable = false,
            amount = 0,
            positive = true, -- If true it heals, if false it damages
            overtime = true -- if true it heals over time, if false its 1 time heal
        },
        hunger = {
            enable = true,
            amount = 1000000, -- The Amount the Hunger increase
            positive = true, -- if true it adds hunger, if false it removes hunger
            overtime = true -- if true it adds hunger over time, if false its 1 time 
        },
        thirst = {
            enable = false,
            amount = 0, -- The amount of thirst incrase
            positive = true, -- if true it adds thirst, if false it removes thirst
            overtime = true -- if true it adds thirst over time, if false its 1 time
        }
    },
    ['bmeth'] = {
        takingMethod = 'smoke',
        effectDuration = 120, -- In Seconds
        drugEffects = {
            "confused_visual",
            "infinite_stamina",
            "sprint_faster"
        },
        health = {
            enable = false,
            amount = 0,
            positive = true, -- If true it heals, if false it damages
            overtime = true -- if true it heals over time, if false its 1 time heal
        },
        hunger = {
            enable = true,
            amount = 1000000, -- The Amount the Hunger increase
            positive = true, -- if true it adds hunger, if false it removes hunger
            overtime = false -- if true it adds hunger over time, if false its 1 time 
        },
        thirst = {
            enable = false,
            amount = 0, -- The amount of thirst incrase
            positive = true, -- if true it adds thirst, if false it removes thirst
            overtime = true -- if true it adds thirst over time, if false its 1 time
        }
    },
    ['ecstasy'] = {
        takingMethod = 'pill',
        effectDuration = 120, -- In Seconds
        drugEffects = {
            "confused_visual",
            "visual_shaking"
        },
        health = {
            enable = false,
            amount = 0,
            positive = true, -- If true it heals, if false it damages
            overtime = true -- if true it heals over time, if false its 1 time heal
        },
        hunger = {
            enable = false,
            amount = 0, -- The Amount the Hunger increase
            positive = true, -- if true it adds hunger, if false it removes hunger
            overtime = true -- if true it adds hunger over time, if false its 1 time 
        },
        thirst = {
            enable = false,
            amount = 0, -- The amount of thirst incrase
            positive = true, -- if true it adds thirst, if false it removes thirst
            overtime = true -- if true it adds thirst over time, if false its 1 time
        }
    },
    ['codeine'] = {
        takingMethod = 'drink',
        effectDuration = 30, -- In Seconds
        drugEffects = {
            "confused_visual"
        },
        health = {
            enable = true,
            amount = 10,
            positive = true, -- If true it heals, if false it damages
            overtime = true -- if true it heals over time, if false its 1 time heal
        },
        hunger = {
            enable = false,
            amount = 0, -- The Amount the Hunger increase
            positive = true, -- if true it adds hunger, if false it removes hunger
            overtime = true -- if true it adds hunger over time, if false its 1 time 
        },
        thirst = {
            enable = false,
            amount = 0, -- The amount of thirst incrase
            positive = true, -- if true it adds thirst, if false it removes thirst
            overtime = true -- if true it adds thirst over time, if false its 1 time
        }
    },
}
