AllowedVehicles = {} -- Vehicles that we have ELS for
EnabledVehicles = {} -- Vehicles that have used ELS
CurrentStage = 0 -- Front, Rear, Off

function AddVehicleToTables(vehicle)
    if EnabledVehicles[vehicle] == nil then
        EnabledVehicles[vehicle] = {
            primary = false,
            secondary = false,
            warning = false,
            ally = false,
            onscene = false,
            frontPrimary = false,
            backPrimary = false,
            wigWags = false,

            spotlight = false,
            spotlightZ = 0,
            spotlightY = 0,
            spotlightX = 0,

            siren = 0,
            sound = nil,

            indicator = 0,
            stage = 0
        }

        for extra=1, 12 do
            SetVehicleExtra(vehicle, extra, true)
        end

        resetExtras(vehicle)

        Citizen.CreateThread(function()
            EnviromentalLights(vehicle)
        end)
    end
end

function LoadVehicleJsons()
    local scriptName = GetCurrentResourceName()
    local vehiclesList = json.decode(LoadResourceFile(scriptName, "els/vehicles.json"))

    for i, fileName in ipairs(vehiclesList) do
        DebugPrint(' Parsing file ' .. fileName)

        local dataFile = LoadResourceFile(scriptName, "els/" .. fileName .. ".json")

        if dataFile then
            jsonData = json.decode(dataFile)

            AllowedVehicles[fileName] = jsonData
        else
            DebugPrint("Unable to find file " .. fileName .. ".json")
            print('[ELS WARN] Unable to find ELS file for ' .. fileName)
        end
    end
end

function GetCarHash(vehicleId)
    local vehicle = GetEntityModel(vehicleId)

    if vehicle then
        for allowedVehicle, _ in pairs(AllowedVehicles) do
            if vehicle == GetHashKey(allowedVehicle) then
                return allowedVehicle
            end
        end
    end

    return false
end
