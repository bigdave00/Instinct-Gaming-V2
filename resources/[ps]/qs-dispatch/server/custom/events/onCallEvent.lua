local PoliceWebhookURL = 'https://discord.com/api/webhooks/1139312215917334651/zeGNXKe3X1BPud42LTt9Ah6O1WhnbOwFQaxt7nZUmU-9OqmU1RmSOxIL0D9ElWqQbAWn' -- webhook URL HERE
local AmbulanceWebhookURL = 'https://discord.com/api/webhooks/1139312215917334651/zeGNXKe3X1BPud42LTt9Ah6O1WhnbOwFQaxt7nZUmU-9OqmU1RmSOxIL0D9ElWqQbAWn' -- webhook URL HERE

function OnCallEvent(job, callLocation, callCode, message, flashes, image, ThisCount)

    if Contains(job, "police") then

        if PoliceWebhookURL == '' then return WarningPrint('You dont have a configured webhook (police), please go to "server/custom/envents/onCallEvent.lua" an set it.') end
        exports['qs-dispatch']:SendWebhook(PoliceWebhookURL, 'Police Call', '#3246a8', message, image)

    elseif Contains(job, "ambulance") then

        if AmbulanceWebhookURL == '' then return WarningPrint('You dont have a configured webhook (ambulance), please go to "server/custom/envents/onCallEvent.lua" an set it.') end
        exports['qs-dispatch']:SendWebhook(AmbulanceWebhookURL, 'Ambulance Call', '#ff0040', message, image)

    end
end


function JailEvent(job, message, image)

    -- you can implement your things here

end