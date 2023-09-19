if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('qs-dispatch') == 'starting' or GetResourceState('qs-dispatch') == 'started' then
        Config.Dispatch = 0
    end
end

if Config.Dispatch and Config.Dispatch == 2 then
    RegisterNetEvent('rcore_gangs:client:dispatch')
    AddEventHandler('rcore_gangs:client:dispatch', function(drug)
        exports['qs-dispatch']:DrugSale()
    end)
end