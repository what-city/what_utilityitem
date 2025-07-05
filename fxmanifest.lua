fx_version 'cerulean'
game 'gta5'

name 'What Utlity Items'
description 'What Utility Items'
version '1.1.0'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua',
	'share.lua',
	'modules/**/config/*.lua',
}

client_scripts {
	'modules/**/client/*.lua',
}

server_scripts {
	'modules/**/server/*.lua',
}

dependencies {
	'es_extended',
	'ox_lib',
	'mythic_progbar'
}