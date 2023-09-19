local function GetAccount(account)
    if not jobGangAccounts[account] then
        return false
    end
    return jobGangAccounts[account]
end

local function AddMoney(account, amount)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    jobGangAccounts[account] = jobGangAccounts[account] + amount
    return true
end

local function RemoveMoney(account, amount)
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
end

local function GetGangAccount(account)
    if not jobGangAccounts[account] then
        return false
    end
    return jobGangAccounts[account]
end

local function AddGangMoney(account, amount)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    jobGangAccounts[account] = jobGangAccounts[account] + amount
    return true
end

local function RemoveGangMoney(account, amount)
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
end

exports("GetAccount", GetAccount)
exports("AddMoney", AddMoney)
exports("RemoveMoney", RemoveMoney)
exports("GetGangAccount", GetGangAccount)
exports("AddGangMoney", AddGangMoney)
exports("RemoveGangMoney", RemoveGangMoney)