-- Resource Metadata
fx_version 'cerulean'
game 'gta5'

author 'Solorak'
description 'ESX Advanced jail'
version '1.0.0'
lua54 'yes'

-- What to run
client_scripts {
    'client/client.lua',
    'config.lua'
}


server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

dependency 'es_extended'
