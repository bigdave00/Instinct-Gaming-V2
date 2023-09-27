Config.Webhooks = { -- Place your Discord webhooks here.
    ['createhouse'] = 'https://discord.com/api/webhooks/1144672406498181280/ME1SL5tpYMqM3ElQT0woYbJCC5TSsi_inzrxpzLBYk2ZToCzdz53c5M6myty1cq3Tl2G',
    ['deletehouse'] = 'https://discord.com/api/webhooks/1144672519077507083/DUG0gYYJKkrGjJlSpOx9ZmvbFjVCrn9SJ_p1cc68HSWvQoHWq3FR9BjW9HW7uVN2bipV',
    ['buyhouse'] = 'https://discord.com/api/webhooks/1144672331235590174/N5dAviGSuWPy1Olf5cyFyPKxEDX8sYkaWo1jrv43_ohJeBRA8U4XEy5puw5QkfccDG1m',
}

Config.WebhookMark = 'Broski Housing Logs'

Config.WebhookTranslates = { --Configure here all the translations of your webhook.
    ['createhouse'] = {
        ['title'] = 'A new property has been created',
        ['creator'] = '**Creator name:**',
        ['license'] = '\n**Creator license:**',
        ['price'] = '\n**Property value:**',
        ['street'] = '\n**Property street:**',
        ['coords'] = '\n**Coordinates:**',
    },

    ['deletehouse'] = {
        ['title'] = 'A player deleted a property',
        ['player'] = '**Player:**',
        ['license'] = '\n**Property buyer license:**',
        ['coords'] = '\n**Coordinates:**',
        ['house'] = '**\nHouse removed:**',
    },

    ['buyhouse'] = {
        ['title'] = 'A property was purchased',
        ['player'] = '**Property buyer name:**',
        ['license'] = '\n**Property buyer license:**',
        ['coords'] = '\n**Coordinates:**',
        ['price'] = '\n**Property price:**',
        ['realestateMoney'] = '\n**Realestate Earnings:**',
    },
}
