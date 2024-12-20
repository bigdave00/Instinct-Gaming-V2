QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()
local acik = false


RegisterNetEvent("booleanuodate")
AddEventHandler("booleanuodate", function (bool)
    acik = bool
end)

QBCore.Functions.CreateUseableItem("bodycam" , function(source, item)
    local _src = source
    TriggerClientEvent("marsh-bodycam:openBoy", _src, item, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
end)

if Config.Debug then
    QBCore.Commands.Add('debugbodycam', 'debugging bodycam', {}, false, function(source, args)
        local _src = source
        TriggerClientEvent("marsh-bodycam:openBoy", _src, item, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
    end)
end

CreateThread(function ()
    while acik do
        Citizen.Wait(1000)
        local src = source
        TriggerClientEvent("bodycam:time", src, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
    end
end)
