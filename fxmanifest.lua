fx_version 'cerulean'
game 'gta5'
author 'M4rrk'
description'Hobbywork'
lua54 'yes'

client_script {
    'client/*.lua'
}

server_script {
    'server/*.lua'
}

shared_script {
    'shared/*.lua',
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

files {
    'locales/*.json'
}

escrow_ignore 'locales/*.json'
escrow_ignore 'shared/*.lua'
escrow_ignore 'server/logs.lua'