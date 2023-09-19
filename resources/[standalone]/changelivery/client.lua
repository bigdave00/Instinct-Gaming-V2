local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("livery", function(source, args, rawCommand)
    local livery = tonumber(args[1])
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsUsing(ped)
        local liveryCount = GetVehicleLiveryCount(vehicle)
        
        if liveryCount > 0 then
            if livery <= liveryCount - 1 then 
                SetVehicleLivery(vehicle, livery)
                QBCore.Functions.Notify("Vehicle Livery Changed", "success", 5000)
            else
                QBCore.Functions.Notify("Invalid Livery Number", "error", 5000)
            end
        else
            QBCore.Functions.Notify("This Vehicle Has No Liveries", "error", 5000)
        end
    else
        QBCore.Functions.Notify("You Must Be In A Vehicle To Change Liveries", "error", 5000)
    end
end)

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/livery', 'Change Vehicle Livery', {{ name="Livery Number", help="Livery ID"}})
end)