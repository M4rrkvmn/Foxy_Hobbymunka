fx_version 'cerulean'
game 'gta5'
author 'M4rrk'
lua54 'yes'

client_script {
    'client/main.lua'
}

server_script {
    'server/main.lua'
}

shared_script {
    'shared/config.lua',
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

files = {
    'locales/*.json'
}

escrow_ignore 'locales/*.json'
escrow_ignore 'shared/*.lua'
escrow_ignore 'server/logs.lua'