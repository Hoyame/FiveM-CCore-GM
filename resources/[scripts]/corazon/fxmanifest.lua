fx_version 'adamant'
game 'gta5'

server_script '@mysql-async/lib/MySQL.lua'

client_scripts {
	'callback/cl_callback.lua',
	----------------------------------------------
	'core/sh_cmenu.lua',
	'core/cl_skinchanger.lua',
	'core/sh_functions.lua',
	'core/cl_players.lua',
	----------------------------------------------
	'game/cl_connection.lua',
	'game/cl_game.lua',
	----------------------------------------------
	'player/character/cl_character.lua',
	'player/identity/cl_identity.lua'
}

server_scripts {
	'callback/sv_callback.lua',
	----------------------------------------------
	'core/sv_players.lua',
	----------------------------------------------
	'game/sv_connection.lua',
	'game/sv_game.lua',
	----------------------------------------------
	'player/character/sv_character.lua',
	'player/identity/sv_identity.lua'
}