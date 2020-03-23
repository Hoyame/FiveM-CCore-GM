fx_version 'adamant'
game 'gta5'

server_script '@mysql-async/lib/MySQL.lua'


client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}

client_scripts {
	'sh_locale.lua',
	'sh_translate.lua',
	'sh_config.lua'
}

client_scripts {
	'callback/cl_callback.lua',
	----------------------------------------------
	'core/sh_menu.lua',
	'core/cl_skinchanger.lua',
	'core/sh_functions.lua',
	'core/cl_players.lua',
	----------------------------------------------
	'game/cl_game.lua',
	--'game/cl_connection.lua',
	----------------------------------------------
	'player/identity/cl_identity.lua',
	'player/character/cl_character.lua'
}

server_scripts {
	'sh_locale.lua',
	'sh_translate.lua',
	'sh_config.lua'
}

server_scripts {
	'callback/sv_callback.lua',
	----------------------------------------------
	'core/sv_players.lua',
	----------------------------------------------
	'game/sv_game.lua',
	--'game/sv_connection.lua',
	----------------------------------------------
	'player/identity/sv_identity.lua',
	'player/character/sv_character.lua'
}