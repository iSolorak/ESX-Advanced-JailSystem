-- Resource Metadata
fx_version 'cerulean'
game 'gta5'

author 'Solorak'
description 'advanced jail'
version '1.0.0'
lua54 'yes'

-- What to run
client_script 'client.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
}
