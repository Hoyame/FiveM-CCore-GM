fx_version 'adamant'
game 'gta5'

server_script '@mysql-async/lib/MySQL.lua'

client_scripts {
	'core/sh_cmenu.lua',
	'core/sh_functions.lua',
	'core/cl_players.lua',
	----------------------------------------------
	'game/cl_connection.lua'
}

server_scripts {
    'core/sv_players.lua'
}