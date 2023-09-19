local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateCallback('inside-shoprobbery:payout', function(source, cb, money)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	xPlayer.Functions.AddMoney('cash', money)
	TriggerEvent("qb-log:server:CreateLog", "robbery", "Shop Robbery", "green", "**"..GetPlayerName(source) .. "** has robbed $"..money.." from the shop.")
    cb(money)
end)

QBCore.Functions.CreateCallback('inside-shoprobbery:cassettepayout', function(source, cb)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	money = math.random(Config.CassetteMin, Config.CassetteMax)
	xPlayer.Functions.AddMoney('cash', money)
	TriggerEvent("qb-log:server:CreateLog", "robbery", "Shop Robbery", "green", "**"..GetPlayerName(source) .. "** has robbed $"..money.." from the shop.")
    cb(money)
end)

QBCore.Functions.CreateCallback('inside-shoprobbery:SecBetwNextRob', function(source, cb)
	if (os.time() - Config.Lastrobbed) < Config.SecBetwNextRob and Config.Lastrobbed ~= 0 then
		cb(false)
	else
		cb(true)
	end
end)

RegisterServerEvent('inside-shoprobbery:RobberyTimeStart')
AddEventHandler('inside-shoprobbery:RobberyTimeStart', function()
    Config.Lastrobbed = os.time()
end)

AddEventHandler('playerDropped', function()
    TriggerClientEvent('inside-shoprobbery:playerdropped', source)
end)

RegisterServerEvent('inside-shoprobbery:Ssomeonestart')
AddEventHandler('inside-shoprobbery:Ssomeonestart', function(type)
    TriggerClientEvent('inside-shoprobbery:Csomeonestart', -1, type)
end)

RegisterServerEvent('inside-shoprobbery:playerdroppedStop')
AddEventHandler('inside-shoprobbery:playerdroppedStop', function()
    TriggerClientEvent('inside-shoprobbery:playerdroppedStopC', -1)
end)

-- QBCore.Functions.CreateCallback('inside-shoprobbery:PoliceAmount', function(source, cb)
--     police = 0
-- 	for _, playerId in pairs(ESX.GetPlayers()) do
-- 		xPlayer = ESX.GetPlayerFromId(playerId)
-- 		if xPlayer.job.name == 'police' then
-- 			police = police + 1
-- 		end
-- 	end
--     cb(police)
-- end)

RegisterServerEvent('inside-shoprobbery:PoliceNotify')
AddEventHandler('inside-shoprobbery:PoliceNotify', function(coords)
    TriggerClientEvent('inside-shoprobbery:PoliceNotifyC', -1, coords)
end)