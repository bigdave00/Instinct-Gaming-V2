if not Framework.QBCore() then return end

local client = client

-- Backwards Compatible Events

RegisterNetEvent("illenium-appearance:client:openMenu", function()
    local config = GetDefaultConfig()
    config.ped = true
    config.headBlend = true
    config.faceFeatures = true
    config.headOverlays = true
    config.components = true
    config.props = true
    config.tattoos = true
    OpenShop(config, true, "all")
end)

RegisterNetEvent("illenium-appearance:client:openOutfitMenu", function()
    OpenMenu(nil, "outfit")
end)

RegisterNetEvent("illenium-appearance:client:loadOutfit", LoadJobOutfit)

RegisterNetEvent("qb-multicharacter:client:chooseChar", function()
    client.setPedTattoos(cache.ped, {})
    ClearPedDecorations(cache.ped)

    TriggerServerEvent("illenium-appearance:server:resetOutfitCache")
end)
