QBCore = exports['qb-core']:GetCoreObject()
Config = {}

QBCore.Functions.CreateCallback("l2s-storagelockers:server:FetchConfig", function(source, cb)
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    cb(Config.Lockers)
end)

QBCore.Functions.CreateCallback("l2s-storagelockers:server:purchaselocker", function(source, cb, v, k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CitizenID = Player.PlayerData.citizenid
    local price = v.price
    local bankMoney = Player.PlayerData.money["bank"]
    if bankMoney >= price then
        Player.Functions.RemoveMoney('bank', price, "Locker Purchased")
        exports['qb-management']:AddMoney("realestate", price)
        Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
        Config.Lockers[k]['isOwned'] = true
        Config.Lockers[k]['owner'] = CitizenID 
        SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
        TriggerClientEvent('l2s-storagelockers:client:FetchConfig', -1)
        TriggerClientEvent('l2s-storagelockers:client:setupBlips', src)
        cb(bankMoney)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money..', 'error')
        cb(bankMoney)
    end
end)

QBCore.Functions.CreateCallback("l2s-storagelockers:server:getData", function(source, cb, locker, data)  
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    cb(Config.Lockers[locker][data])
end)

QBCore.Functions.CreateCallback('l2s-storagelockers:server:getOwnedLockers', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ownedLockers = {}
    if Player then
        Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
        for k, v in pairs(Config.Lockers) do 
            if Player.PlayerData.citizenid == v["owner"] then
                table.insert(ownedLockers, k)
            end
        end
        if ownedLockers then
            cb(ownedLockers)
        else
            cb(false)
        end
    end
end)

RegisterNetEvent('l2s-storagelockers:server:changePasscode')
AddEventHandler('l2s-storagelockers:server:changePasscode', function(newPasscode, lockername, lockertable)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local realestatename =  Player.PlayerData.charinfo.firstname .." " ..Player.PlayerData.charinfo.lastname.. " | CSN ["..Player.PlayerData.citizenid.."]"

    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    Config.Lockers[lockername]['password'] = newPasscode
    TriggerEvent('l2s-storagelockers:server:log' , "**تغيير رمز الخزنة** :\n\n** تغيير الرمز **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..lockername.."`\n`New Passcode : "..newPasscode.."`")

    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('l2s-storagelockers:client:FetchConfig', -1)
    TriggerClientEvent('QBCore:Notify', src, 'Passcode Changed', 'success')
end)

RegisterNetEvent('l2s-storagelockers:server:sellLocker')
AddEventHandler('l2s-storagelockers:server:sellLocker', function(lockername, lockertable)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = lockertable.price
    local saleprice = price/2
    local realestatename =  Player.PlayerData.charinfo.firstname .." " ..Player.PlayerData.charinfo.lastname.. " | CSN ["..Player.PlayerData.citizenid.."]"

    Config.Lockers[lockername] =nil
    Player.Functions.AddMoney('bank', saleprice, "Locker Sold")
    TriggerEvent('l2s-storagelockers:server:log' , "**بيع الخزنة** :\n\n** تم بيع الخزنة بواسطة: **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..lockername.."`\n`Sell Price: "..saleprice.."$`")
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('QBCore:Notify', src, 'Locker sold for ' .. saleprice.."$", 'success')
    TriggerClientEvent('l2s-storagelockers:client:setupBlips', src)
    TriggerClientEvent('l2s-storagelockers:client:FetchConfig', -1)
end)

RegisterNetEvent('l2s-storagelockers:server:removeLocker')
AddEventHandler('l2s-storagelockers:server:removeLocker', function(lockername, lockertable)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local realestatename =  Player.PlayerData.charinfo.firstname .." " ..Player.PlayerData.charinfo.lastname.. " | CSN ["..Player.PlayerData.citizenid.."]"
    Config.Lockers[lockername] =nil
    -- Config.Lockers[lockername]['owner'] = '' 
    -- Config.Lockers[lockername]['coords'] = {x = 0, y = 0, z = 0} 
    TriggerEvent('l2s-storagelockers:server:log' , "**حذف الخزنة ** :\n\n** تم حذف الخزنة بواسطة: **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..lockername.."`")
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('QBCore:Notify', src, 'Locker has been removed', 'success')
    TriggerClientEvent('l2s-storagelockers:client:setupBlips', src)
    TriggerClientEvent('l2s-storagelockers:client:FetchConfig', -1)
end)


RegisterNetEvent('l2s-storagelockers:server:addslots')
AddEventHandler('l2s-storagelockers:server:addslots', function(lockername)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local realestatename =  Player.PlayerData.charinfo.firstname .." " ..Player.PlayerData.charinfo.lastname.. " | CSN ["..Player.PlayerData.citizenid.."]"

    Config.Lockers[lockername]['slots'] = Config.Lockers[lockername]['slots'] + 10
    TriggerClientEvent('QBCore:Notify', src, 'You Added 10 Slots In : '..lockername, 'success')
    TriggerEvent('l2s-storagelockers:server:log' , "**اضافة جيوب ** :\n\n** تمت اضافة 10 جيوب بواسطة: **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..lockername.."`")

    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('l2s-storagelockers:client:FetchConfig', -1)
end)

RegisterNetEvent('l2s-storagelockers:server:addcapacity')
AddEventHandler('l2s-storagelockers:server:addcapacity', function(lockername)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local realestatename =  Player.PlayerData.charinfo.firstname .." " ..Player.PlayerData.charinfo.lastname.. " | CSN ["..Player.PlayerData.citizenid.."]"
    Config.Lockers[lockername]['capacity'] = Config.Lockers[lockername]['capacity'] + 100000
    TriggerClientEvent('QBCore:Notify', src, 'You Added 100 KG In : '..lockername, 'success')
    TriggerEvent('l2s-storagelockers:server:log' , "**اضافة حجم ** :\n\n** تمت اضافة 100 كيلو بواسطة: **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..lockername.."`")
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('l2s-storagelockers:client:FetchConfig', -1)
end)

RegisterNetEvent('l2s-storagelockers:server:createPassword')
AddEventHandler('l2s-storagelockers:server:createPassword', function(password, locker)
    Config.Lockers = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    Config.Lockers[locker]['password'] = password
    SaveResourceFile(GetCurrentResourceName(), "./lockers.json", json.encode(Config.Lockers), -1)
    TriggerClientEvent('l2s-storagelockers:client:FetchConfig', -1)
end)


RegisterServerEvent('l2s-storagelockers:server:log')
AddEventHandler('l2s-storagelockers:server:log', function(message)
    local Webhok = Config.Webhok
    local Webhok = exports['qb-smallresources']:GetWebHook('lockers') 
    
    local embed = {}

    embed = {
        {
            ["color"] = 0x04ff00,
            ["title"] = "l2s-Locker - Log",
            ["description"] = message.."\n\n **الوقت:**\n"..os.date("%c"),

            ["footer"] = {
                ["text"] = "Made By : @l2s.dev",
                ["icon_url"] = "https://cdn.discordapp.com/attachments/877840198061408307/973167229568942110/1f36d2706698fea27440fe376a6a1d77.png"
            },
        }
    }
    PerformHttpRequest(Webhok, 
    function(err, text, headers) end, 'POST', json.encode({username = "TM Logs", avatar_url = "https://cdn.discordapp.com/attachments/877840198061408307/973167229568942110/1f36d2706698fea27440fe376a6a1d77.png" ,embeds = embed}), { ['Content-Type'] = 'application/json' })
end)

-- QBCore.Commands.Add("createlocker", "Add New Locker (Realestate Only)", {{name = "name", help = "Stash Name"}, {name = "price", help = "Price"}, {name = "slots", help = "Slots"}, {name = "capactiy", help = "Stash Space (KGM)"} }, true, function(source, args)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local realestatename =  Player.PlayerData.charinfo.firstname .." " ..Player.PlayerData.charinfo.lastname.. " | CSN ["..Player.PlayerData.citizenid.."]"
--     if Player.PlayerData.job.name == Config.RealestateJob then 
--         local coords = GetEntityCoords(GetPlayerPed(source))
--         name = args[1]
--         price = args[2]
--         slots = args[3]
--         capacity = args[4]
--         newlocker = {
--             ["capacity"] = {},
--             ["price"] = {},
--             ["slots"] = {},
--             ["coords"] = {}
--         }
--         newlocker["price"] = tonumber(price)
--         newlocker["capacity"] = tonumber(capacity)*1000
--         newlocker["slots"] = tonumber(slots)
--         newlocker["coords"] = {x = coords.x, y = coords.y, z = coords.z}
--         local currentConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
--         currentConfig[name] = newlocker
--         SaveResourceFile(GetCurrentResourceName(), "lockers.json", json.encode(currentConfig), -1)
--         TriggerClientEvent('l2s-storagelockers:client:FetchConfig', -1)
--         local coordslog = "X: "..coords.x.." Y: "..coords.y.." Z: "..coords.z
--         TriggerEvent('l2s-storagelockers:server:log' , "**اضافة  خزنة** :\n\n** تمت اضافة خزنة بواسطة: **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..name.."` \n `Locker Size: "..capacity.." KG`\n `Locker Slots: "..slots.."`\n `Locker Price: "..price.."$`\n`Location: "..coordslog.."`")
--     else
--         TriggerClientEvent('QBCore:Notify', src, 'You Are Not Lockers Manager' , 'error')
--     end
-- end)


RegisterServerEvent('l2s-storagelockers:server:addlocker')
AddEventHandler('l2s-storagelockers:server:addlocker', function(lockername, lockerprice, lockerslots, lockerspace)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local realestatename =  Player.PlayerData.charinfo.firstname .." " ..Player.PlayerData.charinfo.lastname.. " | CSN ["..Player.PlayerData.citizenid.."]"
    local coords = GetEntityCoords(GetPlayerPed(source))
    name = lockername
    price = lockerprice
    slots = lockerslots
    capacity = lockerspace
    newlocker = {
        ["capacity"] = {},
        ["price"] = {},
        ["slots"] = {},
        ["coords"] = {}
    }
    newlocker["price"] = tonumber(price)
    newlocker["capacity"] = tonumber(capacity)*1000
    newlocker["slots"] = tonumber(slots)
    newlocker["coords"] = {x = coords.x, y = coords.y, z = coords.z}
    local currentConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), "lockers.json"))
    currentConfig[name] = newlocker
    SaveResourceFile(GetCurrentResourceName(), "lockers.json", json.encode(currentConfig), -1)
    TriggerClientEvent('l2s-storagelockers:client:FetchConfig', -1)
    local coordslog = "X: "..coords.x.." Y: "..coords.y.." Z: "..coords.z
    TriggerEvent('l2s-storagelockers:server:log' , "**اضافة  خزنة** :\n\n** تمت اضافة خزنة بواسطة: **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..name.."` \n `Locker Size: "..capacity.." KG`\n `Locker Slots: "..slots.."`\n `Locker Price: "..price.."$`\n`Location: "..coordslog.."`")
end)
