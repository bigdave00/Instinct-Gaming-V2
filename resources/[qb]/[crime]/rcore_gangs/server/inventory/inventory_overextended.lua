Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('qb-inventory') == 'starting' or GetResourceState('qb-inventory') == 'started' then
        Config.Inventory = 2
    end
end

if Config.Inventory and Config.Inventory == 2 then
    Inventory.GetPlayerItem = function(source, item)
        return exports['qb-inventory']:GetItem(source, item, nil, false)
    end

    Inventory.AddPlayerItem = function(source, item, amount, slot, info)
        return exports['qb-inventory']:AddItem(source, item, amount, info, slot)
    end

    Inventory.RemovePlayerItem = function(source, item, amount, slot)
        return exports['qb-inventory']:RemoveItem(source, item, amount, nil, slot)
    end

    Inventory.IsStorageEmpty = function(storage)
        local result = exports['qb-inventory']:GetInventory(storage, false)

        local items = result.items

        if type(items) == 'table' then
            return next(items) == nil
        else
            return false
        end
    end

    RegisterNetEvent('rcore_gangs:server:qb-inventory')
    AddEventHandler('rcore_gangs:server:qb-inventory', function(storage)
        local result = exports['qb-inventory']:GetInventory(storage, false)

        if not result then
            exports['qb-inventory']:RegisterStash(storage, storage, 50, 100000, false)
        end
    end)
end