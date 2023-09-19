local QBCore = exports['qb-core']:GetCoreObject()


AddEventHandler('playerDropped', function()
    TriggerClientEvent('inside-illegaltransportation:playerdropped', source)
end)

RegisterServerEvent('inside-illegaltransportation:PoliceNotfiy')
AddEventHandler('inside-illegaltransportation:PoliceNotfiy', function(coords)
    TriggerClientEvent('inside-illegaltransportation:PoliceNotifyC', -1, coords)
end)

QBCore.Functions.CreateCallback('inside-illegaltransportation:payout', function(source, cb)
	local xPlayer = QBCore.Functions.GetPlayer(source)
    local money = Config.Payout
	xPlayer.Functions.AddMoney("cash", money)
    TriggerEvent("qb-log:server:CreateLog", "robbery", "Drug Transportation", "green", "**"..GetPlayerName(source) .. "** got $"..money.." from the drug transportaion mission.")
    cb(money)
end)