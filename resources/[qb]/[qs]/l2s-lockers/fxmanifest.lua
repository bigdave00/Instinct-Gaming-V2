
fx_version 'cerulean'
game 'gta5'

description 'Instinct Gaming'
author 'Instinct Gaming '
version '1.0.0'


ui_page 'html/index.html'

client_scripts {
	'client/main.lua',
    "config.lua",
}


server_script 'server/main.lua'
server_script 'config.lua'

files {
	'*.json',
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/reset.css'
}