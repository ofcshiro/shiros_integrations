if Config.Enable['billingui'] then
    if Config.Notify then 
        if Config.Colored then 
            RegisterNetEvent("billing_ui:framework:ready", function() 
                exports["billing_ui"]:disableScriptEvent("billing_ui:notify")
            end)
            
            RegisterNetEvent("billing_ui:notify", function(message)
                Config.ClientNotification(Config.NotifyType, message)
            end)
        else
            RegisterNetEvent("billing_ui:framework:ready", function() 
                exports["billing_ui"]:disableScriptEvent("billing_ui:notify")
            end)
            
            RegisterNetEvent("billing_ui:notify", function(message, uncoloredMessage)
                Config.ClientNotification(Config.NotifyType, uncoloredMessage)
            end)
        end    
    end 
end