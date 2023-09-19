local Webhooks = {
    ["manage"] = "https://discord.com/api/webhooks/1153319496036130846/_jL0e57mc2CN1WNZs71Az3F7BZPW8tLS76RcRKKAsxQ6g74JwokibJfgjZDYjs5m2i55", --frozen/flagged
    ["loans"] = "https://discord.com/api/webhooks/1153319303999918161/75D4PndKs74KQg6Sub6Shq49c9et3TtqsOzkKhl4YDdVIlg7TZv3j8KEY_FrSQRCXSRG", -- loans
    ["jobgang"] = "https://discord.com/api/webhooks/1153319253647294524/zigU_r13Ln3eXYhZk4I2INGf4pwAxWkEX9K25rMtfF7MuHSdvmx9NRpLKmuh-TJgWnTL", -- all transactions for job/gang
    ["personal"] = "https://discord.com/api/webhooks/1153319193068961843/nMt7BUm0sxSM9dccj2l6zpf7VnuRI7Qy37qEBdxe9zRv_rqIbUKGqBPPByMdGiUB-pey", -- all transactions done for personal
}

local colorCodes = {
    ["manage"] = 1752220,
    ["loans"] = 2123412,
    ["jobgang"] = 15105570,
    ["personal"] = 11342935,
}

function SendLoanLogs(source, type, playerName, otherPlayerName, amount, interest, duration)
    local embedData = {}
    local colorcode = colorCodes["loans"]
    local webhooks = Webhooks["loans"]
    if type == "loans" then
        
        embedData = {
            {
                ["title"] = "Banking Logs Loan Created" ,
                ["color"] = colorcode,
                ["footer"] = {
                    ["text"] = os.date("%c"),
                },
                -- ["description"] = description,
                ["fields"] = {
                    {
                        ["name"] = "Loan Given By",
                        ["value"] = "```"..playerName.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Loan Given To",
                        ["value"] = "```"..otherPlayerName.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Amount",
                        ["value"] = "```"..amount.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Interest",
                        ["value"] = "```"..interest.."%```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Duration",
                        ["value"] = "```"..duration.."```",
                        ["inline"] = true,
                    },
                },
                ["author"] = {
                    ["name"] = 'Instinct Gaming Banking Logs',
                },
            }
        }
    elseif type == "loans_payment" then
        embedData = {
            {
                ["title"] = "Banking Logs Loan Payment" ,
                ["color"] = colorcode,
                ["footer"] = {
                    ["text"] = os.date("%c"),
                },
                -- ["description"] = description,
                ["fields"] = {
                    {
                        ["name"] = "Payment Made by",
                        ["value"] = "```"..playerName.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Loan Given by",
                        ["value"] = "```"..otherPlayerName.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Amount Paid",
                        ["value"] = "```"..amount.."```",
                        ["inline"] = true,
                    },
                },
                ["author"] = {
                    ["name"] = 'Instinct Gaming Banking Logs',
                },
            }
        }
    elseif type == "loans_accepted" then
        embedData = {
            {
                ["title"] = "Banking Logs Loan Accepted" ,
                ["color"] = colorcode,
                ["footer"] = {
                    ["text"] = os.date("%c"),
                },
                -- ["description"] = description,
                ["fields"] = {
                    {
                        ["name"] = "Loan Accepted By",
                        ["value"] = "```"..playerName.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Loan Given By",
                        ["value"] = "```"..otherPlayerName.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Amount",
                        ["value"] = "```"..amount.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Interest",
                        ["value"] = "```"..interest.."%```",
                        ["inline"] = true,
                    },
                },
                ["author"] = {
                    ["name"] = 'Instinct Gaming Banking Logs',
                },
            }
        }
    end
    PerformHttpRequest(webhooks, function(err, text, headers) end, 'POST', json.encode({ username = "Instinct Gaming Banking Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end

function SendManageLogs(source, type, actionTaker, actionTakenOn, reason, manage_type)
    local embedData = {}
    local colorcode = colorCodes["manage"]
    local webhooks = Webhooks["manage"]

    if type == "manage_account" then
        embedData = {
            {
                ["title"] = "Banking Logs Account Management" ,
                ["color"] = colorcode,
                ["footer"] = {
                    ["text"] = os.date("%c"),
                },
                -- ["description"] = description,
                ["fields"] = {
                    {
                        ["name"] = "Action Taken By",
                        ["value"] = "```"..actionTaker.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Action Taken On",
                        ["value"] = "```"..actionTakenOn.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Reason",
                        ["value"] = "```"..reason.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Action",
                        ["value"] = "```"..manage_type.."```",
                        ["inline"] = true,
                    },
                },
                ["author"] = {
                    ["name"] = 'Instinct Gaming Banking Logs',
                },
            }
        }
    end
    PerformHttpRequest(webhooks, function(err, text, headers) end, 'POST', json.encode({ username = "Instinct Gaming Banking Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end

function SendPersonalTransaction(source, name,  amount, memo, type, sentToName, isJobGang)
    local embedData = {}
    local colorcode = colorCodes["personal"]
    local webhooks = Webhooks["personal"]
    if type ~= "transfer" then
        embedData = {
            {
                ["title"] = "Banking Logs Transaction Management" ,
                ["color"] = colorcode,
                ["footer"] = {
                    ["text"] = os.date("%c"),
                },
                -- ["description"] = description,
                ["fields"] = {
                    {
                        ["name"] = "Transaction By",
                        ["value"] = "```"..name.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Amount",
                        ["value"] = "```"..amount.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Reason",
                        ["value"] = "```"..memo.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Action",
                        ["value"] = "```"..type.."```",
                        ["inline"] = true,
                    },
                },
                ["author"] = {
                    ["name"] = 'Instinct Gaming Banking Logs',
                },
            }
        }
    else
        embedData = {
            {
                ["title"] = "Banking Logs Transaction Management" ,
                ["color"] = colorcode,
                ["footer"] = {
                    ["text"] = os.date("%c"),
                },
                -- ["description"] = description,
                ["fields"] = {
                    {
                        ["name"] = "Transaction By",
                        ["value"] = "```"..name.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = not isJobGang and "Sent To Player" or "Sent To Job",
                        ["value"] = "```"..sentToName.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Amount",
                        ["value"] = "```"..amount.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Reason",
                        ["value"] = "```"..memo.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Action",
                        ["value"] = "```"..type.."```",
                        ["inline"] = true,
                    },
                },
                ["author"] = {
                    ["name"] = 'Instinct Gaming Banking Logs',
                },
            }
        }
    end
    PerformHttpRequest(webhooks, function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end

function SendJobTransaction(source, jobGangLabel, transaction_by, amount, memo, type, sentTo, isJobGang)

    local embedData = {}
    local colorcode = colorCodes["jobgang"]
    local webhooks = Webhooks["jobgang"]
    if type ~= "transfer" then
        embedData = {
            {
                ["title"] = "Banking Job Logs Transaction Management" ,
                ["color"] = colorcode,
                ["footer"] = {
                    ["text"] = os.date("%c"),
                },
                -- ["description"] = description,
                ["fields"] = {
                    {
                        ["name"] = "Job/Gang",
                        ["value"] = "```"..jobGangLabel.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Transaction By",
                        ["value"] = "```"..transaction_by.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Amount",
                        ["value"] = "```"..amount.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Reason",
                        ["value"] = "```"..memo.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Action",
                        ["value"] = "```"..type.."```",
                        ["inline"] = true,
                    },
                },
                ["author"] = {
                    ["name"] = 'Instinct Gaming Banking Logs',
                },
            }
        }
    else
        embedData = {
            {
                ["title"] = "Banking Logs Transaction Management" ,
                ["color"] = colorcode,
                ["footer"] = {
                    ["text"] = os.date("%c"),
                },
                -- ["description"] = description,
                ["fields"] = {
                    {
                        ["name"] = "Job/Gang",
                        ["value"] = "```"..jobGangLabel.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Transaction By",
                        ["value"] = "```"..transaction_by.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = not isJobGang and "Sent To Player" or "Sent To Job",
                        ["value"] = "```"..sentTo.."```",
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Amount",
                        ["value"] = "```"..amount.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Reason",
                        ["value"] = "```"..memo.."```",
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Action",
                        ["value"] = "```"..type.."```",
                        ["inline"] = true,
                    },
                },
                ["author"] = {
                    ["name"] = 'Instinct Gaming Banking Logs',
                },
            }
        }
    end

    PerformHttpRequest(webhooks, function(err, text, headers) end, 'POST', json.encode({ username = "Instinct Gaming Banking Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })

end