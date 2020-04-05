fx_version 'adamant'
game 'gta5'

server_script '@mysql-async/lib/MySQL.lua'
client_scripts '@corazon/core/sh_functions.lua'

client_scripts {
	'cl_test.lua',
}

server_scripts {
    'sv_test.lua'
}