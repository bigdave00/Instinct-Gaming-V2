fx_version "bodacious"

game "gta5"

author "quasar-store.com"

version "1.4.4"

lua54 "yes"

shared_scripts {
    "config/*.lua",
    "shared/*.lua",
    "locales/*.lua",
    "@ox_lib/init.lua"
}

ui_page "web/build/index.html"

files {
    "web/build/index.html",
    "web/build/**/*"
}

client_scripts {
    "client/lib/*.lua",
    "client/custom/framework/*.lua",
    "client/custom/billing/*.lua",
    "client/custom/exports/*.lua",
    "client/*.lua",
    "client/modules/*.lua",
    "client/custom/misc/*.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/lib/*.lua",
    "server/exports/*.lua",
    "server/custom/framework/*.lua",
    "server/modules/webhooks.lua",
    "server/custom/events/onCallEvent.lua",
    "server/*.lua",
    "server/modules/*.lua",
    "server/custom/billing/*.lua",
    "server/custom/vehicles/*.lua"
}

exports {
    "GetPlayerInfo",
    "getSSURL",
    "SendWebhook",
    "ToggleDuty",
    "GetIsOnDuty",
    "TogleMdt"
}

escrow_ignore {
    "config/*.lua",
    "locales/*.lua",
    "client/custom/misc/*.lua",
    "client/custom/billing/*.lua",
    "client/custom/framework/*.lua",
    "server/custom/framework/*.lua",
    "server/custom/billing/*.lua",
    "server/custom/vehicles/*.lua",
    "server/modules/webhooks.lua",
    "server/custom/events/onCallEvent.lua"
}

dependencies {
    "ox_lib",
    "screenshot-basic"
}

dependency '/assetpacks'