QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("warrant_card", function(source, item)
	local PlayerPed = GetPlayerPed(source)
	local PlayerCoords = GetEntityCoords(PlayerPed)
    local closest = 3.0
    local cPlayer = nil
	for _, v in pairs(QBCore.Functions.GetPlayers()) do
        if v ~= source then
            local TargetPed = GetPlayerPed(v)
            local dist = #(PlayerCoords - GetEntityCoords(TargetPed))
            if dist < closest then
                closest = dist
                cPlayer = v
            end
        end
	end
    local data = {}
    data.number = item.info.number..formatNum(source)
    data.firstName = item.info.firstname
    data.lastName = item.info.lastname
    data.job = item.info.jobgrade
    if cPlayer then
        TriggerClientEvent("t3_warrantcards:showCard",cPlayer,data,source)
	else
        TriggerClientEvent("t3_warrantcards:showCard",source,data,source)
    end
end)
function formatNum(num)
    num = string.format("%03d", num)
    return num
end