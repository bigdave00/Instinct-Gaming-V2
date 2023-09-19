local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_qb-management_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

exportHandler("GetAccount", function(account)
    if not jobGangAccounts[account] then
        return false
    end
    return jobGangAccounts[account]
end)

exportHandler("AddMoney", function(account, amount)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    jobGangAccounts[account] = jobGangAccounts[account] + amount
    return true
end)

exportHandler("RemoveMoney", function(account, amount)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    if jobGangAccounts[account] >= amount then
        jobGangAccounts[account] = jobGangAccounts[account] - amount
        return true
    else
        return false
    end
end)

exportHandler("GetGangAccount", function(account)
    if not jobGangAccounts[account] then
        return false
    end
    return jobGangAccounts[account]
end)

exportHandler("AddGangMoney", function(account, amount)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    jobGangAccounts[account] = jobGangAccounts[account] + amount
    return true
end)

exportHandler("RemoveGangMoney", function(account, amount)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    if jobGangAccounts[account] >= amount then
        jobGangAccounts[account] = jobGangAccounts[account] - amount
        return true
    else
        return false
    end
end)

------------------ DO NOT TOUCH BELOW THIS-----------------


RegisterCommand("convertqbmanagement", function()
    local manageData = MySQL.Sync.fetchAll("SELECT * FROM `management_funds`")
    local totalAmount = {}
    local jobMoney = {}
    for k, v in pairs(manageData) do
        if not jobMoney[v.job_name] then
            jobMoney[v.job_name] = v.amount
        else
            jobMoney[v.job_name] = jobMoney[v.job_name] + v.amount
        end
        
    end
    for k, v in pairs(jobMoney) do
        MySQL.query.await("UPDATE banking_accounts SET amount = ? WHERE account = ?", {v, k})
    end
end, true)