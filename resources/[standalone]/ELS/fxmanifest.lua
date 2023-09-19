fx_version "bodacious"
games { "gta5" }

lua54 'yes'

client_scripts {
    "config.lua",
    "client/init.lua",
    "client/keyPress.lua",
    "client/updateLights.lua",
    "client/lights/enviromentLights.lua",
    "client/lights/primaryLights.lua",
    "client/lights/secondaryLights.lua",
    "client/lights/warningLights.lua",
    "client/lights/rearPrimaryLights.lua",
    "client/lights/frontPrimaryLights.lua",
    "client/lights/wigWagLights.lua",
    "client/utils/utils.lua",
    "client/updateSiren.lua",
    "client/toggleBullHorn.lua",
    "client/lights/spotlight.lua",
    "client/onesync.lua"
}

server_scripts {
    "server/server.lua",
    "server/onesync.lua"
}

ui_page "html/index.html"

files {
    "els/*.json",
    "html/index.html",
    "html/sounds/SirenSwitch.ogg"
}

escrow_ignore {
    "els/*.json",
    "config.lua"
}server_scripts { '@mysql-async/lib/MySQL.lua' }