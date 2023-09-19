if Config.Billing ~= "esx_billing" then
    return
end

function getBills(source, cb, data)
    MySQL.Async.fetchAll(
        'SELECT * FROM billing WHERE identifier = @identifier AND sender = @sender ORDER BY id DESC LIMIT 100;', {
            ['@identifier'] = data.identifier,
            ['@sender'] = ('' .. GetJobName(source)) or ''
        }, function(results)
            local bills = {}
            for key, value in ipairs(results) do
                table.insert(
                    bills,
                    {
                        ["author_name"] = value["sender"] or 'Not defined',
                        ["timestamp"] = value["id"] or os.time(os.date("!*t")),
                        ["status"] = value["paid"] == 1 and 'paid' or 'unpaid',
                        ["item"] = value["label"] or 'Not defined',
                    }
                )
            end
            DebugPrint(bills)
            cb(bills)
        end)
end

RegisterServerCallback("qs-dispatch:server:getBills", getBills)


function CreateBill(source, cb, data)
    local xPlayer = GetPlayerFromId(source)

    local updateResult =
        MySQL.Sync.execute(
            'INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (?, ?, ?, ?, ?, ?)',
            { xPlayer.identifier, 'police', 'player', 'police', data.text, data.amount })

    if (updateResult > 0) then
        cb(true)
        DebugPrint('Bill created')
    else
        cb(false)
        DebugPrint('Bill not created')
    end
end

RegisterServerCallback("qs-dispatch:server:esx_billing:CreateBill", CreateBill)
