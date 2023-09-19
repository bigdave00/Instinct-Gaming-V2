local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1125803241100296202/5ZD8jfLV3vfv_mr8FtZe4kaOFkSXk2iUmJd0wa8MzP1l-u7Q2TQ00teVlxCkYcqxHJis',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1125803301032693760/DG4wMCOly6UuXejXOBTcLU2u9KqHmUWN9PlrL9pj6dHR_xJsjieSxA7hOqMGXP6G_iXi',
    ['playermoney'] = 'https://discord.com/api/webhooks/1125803387754139710/juiaJeydybWjyjkRND3ij5hhj2vMeHQHwKPyfBDeR0cxulChXsPH0eQK6wol4ZZZOWqc',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1125803447686537216/mn91EHADAGwmzV3r3KxXt86XBp2l5KZDE0u5n5hImFMTwwCGNCZ00FAdRzpZJ0j5uj-S',
    ['robbing'] = 'https://discord.com/api/webhooks/1125803558391005184/LdeugE7eqjWWtn0FT52Dqqjfaa6BTrv9c15ZKYvixNaev1VFGl6jWyxXF_HFd2k0_UmK',
    ['cuffing'] = 'https://discord.com/api/webhooks/1125803611646066810/_iBb4ogkcrQp4Oq4iPLIi_hb4-sDcI_hM0XOwIFhEMioWj_o8ID5xHoV3Su24QBHQcSQ',
    ['drop'] = 'https://discord.com/api/webhooks/1125803668285952000/2-Z7uJYphTDOv4C2VybgXwtFEn2hO236cqo0VzizBR8LexCmGZdrg2AHJetTezR1DHxu',
    ['trunk'] = 'https://discord.com/api/webhooks/1125803724477042848/SM_70ctKdr1zQBOiosP_IXJE1sHNti-rn7AdWAZ_knXzCq75OiIy6N4UJ8PHuAKaaBmu',
    ['stash'] = 'https://discord.com/api/webhooks/1125803796107366401/Ex8kWBzTv_X1Ge4U5h4bHHrrxACe0Gh_8WOck9mDC9KpAsWtKMAqIpSSVit267bmO9T2',
    ['glovebox'] = 'https://discord.com/api/webhooks/1125803840936095764/dvYXvEivbfZHVKEj-K9EEgwFNgWzDtoPI2yYivaX19DVEN-cywih0loyJO0Ygu6UOyQL',
    ['banking'] = 'https://discord.com/api/webhooks/1125803889199943690/-aqB-G3T9QT54eXM34ccCMRULVsU08s8FcWNrZMyd_UaAQZlLhK0d2f1TfT6JUHFIJi4',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1125803934607487036/8UQCM5txvFE-6tQGc3R8m2QR8GgHEW_7TGYXsivC6XFAalH0rHhUnWN-qDAdlizFFmT5',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1125804225214033931/EQ0fVrIhtHsDpQ0d9hOk2yonF-LEawN8bxm5XNjEzErs5o8Yb7aMP6PNY7J-O344wUh0',
    ['shops'] = 'https://discord.com/api/webhooks/1125804033370751036/54RMOg2DLhndsvGEQvEV8plA91sZUSDrqn2GxDfyXwZ9nounRUxUfWokMScJBLsSrd_R',
    ['dealers'] = 'https://discord.com/api/webhooks/1125804098252443718/-P96-aHzCklPEQwZi03TkoSaEcO-AmQrVjjfUpa-xBxyCbaBgsCKPhYMlzZXpumDFkWG',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1125804186043424799/D-ZDZ7ke3DVAs_eFjJeYSTL7ZhWUhITNxKvFfgQuR5M4phGNkNIcGr3eYo9jQGRLw7JA',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1125804186043424799/D-ZDZ7ke3DVAs_eFjJeYSTL7ZhWUhITNxKvFfgQuR5M4phGNkNIcGr3eYo9jQGRLw7JA',
    ['powerplants'] = 'https://discord.com/api/webhooks/1125804186043424799/D-ZDZ7ke3DVAs_eFjJeYSTL7ZhWUhITNxKvFfgQuR5M4phGNkNIcGr3eYo9jQGRLw7JA',
    ['death'] = 'https://discord.com/api/webhooks/1125804304532525126/d3Tfy5-Np5z2sN0MT3NsDK8uq73oflmCvlQPHiWZBjjY_nb57S-s1TecJYIWCoXR8FFj',
    ['joinleave'] = 'https://discord.com/api/webhooks/1125804386078162945/5WCgdsSmWcIMjRpIkzvJHsCiNlE1RtvpYSorJDzkJ2Gz5QwffsQsGcXmYrkCQ-7SvgcJ',
    ['ooc'] = 'https://discord.com/api/webhooks/1125804443384959098/Pp6gSpB_KbgxJyzv-Bh2cdqXYIu7KKKJWw6rqb0qapk0M8hvSlT9R7-7HmKbpyYUyVEA',
    ['report'] = 'https://discord.com/api/webhooks/1137857206335840326/uzN6estDniZz-ATE2G3RXLp7qqMay39ySd0jixOYA94pcAdXSkc3YOQeoAUsaVdwVlJT',
    ['me'] = 'https://discord.com/api/webhooks/1125804488247218296/cwZwj54U4NEggxGuwqK3RT7HTtp1X-yiz3_tNDJLOjn9zY9VfeN-kvD0Fk6yAxDwifWQ',
    ['pmelding'] = 'https://discord.com/api/webhooks/1125804695923998770/zejaBBIGRvznlKznKrrtew7NvXQNEYwYM7rOkvyuRfDVzXzcZ1oIF2jUoQtrhOYsz3pY',
    ['112'] = 'https://discord.com/api/webhooks/1125804695923998770/zejaBBIGRvznlKznKrrtew7NvXQNEYwYM7rOkvyuRfDVzXzcZ1oIF2jUoQtrhOYsz3pY',
    ['bans'] = 'https://discord.com/api/webhooks/1125804695923998770/zejaBBIGRvznlKznKrrtew7NvXQNEYwYM7rOkvyuRfDVzXzcZ1oIF2jUoQtrhOYsz3pY',
    ['anticheat'] = 'https://discord.com/api/webhooks/1125804695923998770/zejaBBIGRvznlKznKrrtew7NvXQNEYwYM7rOkvyuRfDVzXzcZ1oIF2jUoQtrhOYsz3pY',
    ['weather'] = 'https://discord.com/api/webhooks/1125804761443221514/BUdRl_d6LRC59pvCk5jiSagPd8K00ag_ym2J3J6ZxbUJhD_xJE82uyVW0-RSgilossWF',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1125804806867537982/BEpUkt-cIZGd9IfOz47ilXwD9Mn72OFrAbg6E8hkYaZ4BqzO4KmyJuti-DGmD3aE8M-S',
    ['bennys'] = 'https://discord.com/api/webhooks/1125804925008498729/DaDcIsaQdPEi8zWuvfZU9qD0lklOHH-I8RAnnpa3XSgGxcO2rPJTOaeDykAEMA9C7Do-',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1125804925008498729/DaDcIsaQdPEi8zWuvfZU9qD0lklOHH-I8RAnnpa3XSgGxcO2rPJTOaeDykAEMA9C7Do-',
    ['robbery'] = 'https://discord.com/api/webhooks/1125804996433289236/_ovqQX18h9pInz2kRHJ1IarbH7U6ZHhlYNpJw5W87n6ZRK41re6SFg8JwvO3AVyXg9La',
    ['casino'] = 'https://discord.com/api/webhooks/1125804806867537982/BEpUkt-cIZGd9IfOz47ilXwD9Mn72OFrAbg6E8hkYaZ4BqzO4KmyJuti-DGmD3aE8M-S',
    ['traphouse'] = 'https://discord.com/api/webhooks/1125804806867537982/BEpUkt-cIZGd9IfOz47ilXwD9Mn72OFrAbg6E8hkYaZ4BqzO4KmyJuti-DGmD3aE8M-S',
    ['911'] = 'https://discord.com/api/webhooks/1125804806867537982/BEpUkt-cIZGd9IfOz47ilXwD9Mn72OFrAbg6E8hkYaZ4BqzO4KmyJuti-DGmD3aE8M-S',
    ['palert'] = 'https://discord.com/api/webhooks/1125804806867537982/BEpUkt-cIZGd9IfOz47ilXwD9Mn72OFrAbg6E8hkYaZ4BqzO4KmyJuti-DGmD3aE8M-S',
    ['house'] = 'https://discord.com/api/webhooks/1125804806867537982/BEpUkt-cIZGd9IfOz47ilXwD9Mn72OFrAbg6E8hkYaZ4BqzO4KmyJuti-DGmD3aE8M-S',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1125804806867537982/BEpUkt-cIZGd9IfOz47ilXwD9Mn72OFrAbg6E8hkYaZ4BqzO4KmyJuti-DGmD3aE8M-S',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }

    if not logQueue[name] then logQueue[name] = {} end
    logQueue[name][#logQueue[name]+1] = {webhook = webHook, data = embedData}

    if #logQueue[name] >= 10 then
        local postData = { username = 'QB Logs', embeds = {} }

        for i = 1, #logQueue[name] do
            postData.embeds[#postData.embeds+1] = logQueue[name][i].data[1]
        end

        PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })

        logQueue[name] = {}
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds+1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
