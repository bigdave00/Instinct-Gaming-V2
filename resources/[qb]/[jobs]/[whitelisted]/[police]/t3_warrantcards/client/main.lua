RegisterNetEvent('t3_warrantcards:showCard')
AddEventHandler('t3_warrantcards:showCard', function(data,src)
    CreateThread(function()
        -- Get the ped headshot image.
		local playerIdx = GetPlayerFromServerId(src)
		local ped = GetPlayerPed(playerIdx)
        local handle = RegisterPedheadshotTransparent(ped)
        local try = 1
        while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do
            Wait(5)
            try = try + 1
            if try > 99 then
                break
            end
        end
        local txd = GetPedheadshotTxdString(handle)
        if txd then
            data.img = txd
        end
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "show",
            data = data,
        })
        
        UnregisterPedheadshot(handle)
    end)
end)
RegisterNUICallback("closeNUI", function()
    SetNuiFocus(false, false)
end)