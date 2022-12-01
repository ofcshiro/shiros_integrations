fx_version "adamant"
game "gta5"

author "Shiro"
title "Jaksam Integrations"
description "Premade Integrations for Jaksam Scripts" 
version "2.1"

shared_scripts { 
    --'@es_extended/imports.lua',
    '@es_extended/locale.lua',
    '/config/config.lua',
    '/locales/*.lua'
}

client_scripts {
    '/client/*.lua',
}

server_scripts {
    '/server/*.lua',
}