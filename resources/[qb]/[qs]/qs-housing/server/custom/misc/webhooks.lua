Config.Webhooks = { -- Place your Discord webhooks here.
    ['createhouse'] = 'https://discord.com/api/webhooks/1137895721106935829/szwSRgnnHeK-aD2hXvNVD_Psp4AyvoWqrf7zrXNepv_cSZVg_35Ii54areL8wSLA-Yp7',
    ['deletehouse'] = 'https://discord.com/api/webhooks/1137895721106935829/szwSRgnnHeK-aD2hXvNVD_Psp4AyvoWqrf7zrXNepv_cSZVg_35Ii54areL8wSLA-Yp7',
    ['buyhouse'] = 'https://discord.com/api/webhooks/1137895721106935829/szwSRgnnHeK-aD2hXvNVD_Psp4AyvoWqrf7zrXNepv_cSZVg_35Ii54areL8wSLA-Yp7',
}

Config.WebhookMark = 'Quasar Housing Logs'

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
