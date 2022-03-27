-- Resource Metadata
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Solorak'
description 'advanced jail'
version '1.0.0'
lua54 'yes'

-- What to run
client_scripts {
    'client.lua'

   
}
server_script {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',

    
}

