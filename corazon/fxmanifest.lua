fx_version 'adamant'
game 'gta5'

server_script '@mysql-async/lib/MySQL.lua'

client_scripts {
	'core/sh_cmenu.lua',
	'core/sh_functions.lua',
	'core/cl_players.lua',
	----------------------------------------------
	'game/sh_connection.lua',
	'game/cl_game.lua',
	----------------------------------------------
	'player/character/cl_character.lua',
	'player/identity/cl_identity.lua'

}

server_scripts {
	'core/sv_players.lua',
	----------------------------------------------
	'game/sv_game.lua',
	----------------------------------------------
	'player/character/sv_character.lua',
	'player/identity/sv_identity.lua'
}