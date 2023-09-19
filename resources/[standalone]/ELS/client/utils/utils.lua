
Debug = false

function DebugPrint(input)
    if Debug then
        print("[ELS DEBUG] " .. tostring(input))
    end
end

function CanControlELS(vehicle, playerPed)
    local seats = AllowedVehicles[GetCarHash(vehicle)].misc.seatsCanControl

    for _,v in pairs(seats) do
        if GetPedInVehicleSeat(vehicle, tonumber(v)) == playerPed then
            return true
        end
    end

    return false
end

function resetExtras(vehicle)
    if EnabledVehicles[vehicle] ~= nil then
        local vehicleConfig = AllowedVehicles[GetCarHash(vehicle)]

        if vehicleConfig and vehicleConfig.extras ~= nil then
            for extra= 1, 12 do
                if vehicleConfig.extras['extra' .. extra] ~= nil then
                    if vehicleConfig.extras['extra' .. extra].enabled then
                        SetVehicleExtra(vehicle, extra, 1)
                    end
                end
            end
        end
    end
end