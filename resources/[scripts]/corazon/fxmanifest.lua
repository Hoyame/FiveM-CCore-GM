fx_version 'adamant'
game 'gta5'

server_script '@mysql-async/lib/MySQL.lua'


client_scripts {
    "core/src/RMenu.lua",
    "core/src/menu/RageUI.lua",
    "core/src/menu/Menu.lua",
    "core/src/menu/MenuController.lua",
    "core/src/components/*.lua",
    "core/src/menu/elements/*.lua",
    "core/src/menu/items/*.lua",
    "core/src/menu/panels/*.lua",
    "core/src/menu/panels/*.lua",
    "core/src/menu/windows/*.lua",
}

client_scripts {
	'sh_locale.lua',
	'sh_translate.lua',
	'config/cfg_config.lua'
}

client_scripts {
	'core/callback/cl_callback.lua',
	----------------------------------------------
	'core/utils/sh_functions.lua',
	'core/player/cl_players.lua',
	'core/utils/cl_utils.lua',
	'core/player/cl_perso.lua',
	'core/game/cl_game.lua',
	'core/utils/cl_cam.lua',
	----------------------------------------------
	'player/connection/cl_connection.lua',
	'player/selector/cl_cam.lua',
	'player/selector/cl_selector.lua',
	'player/character/cl_character.lua',
	'player/identity/cl_identity.lua',
	----------------------------------------------
	'menu/cl_charnalmenu.lua',
	'menu/cl_settings.lua', --By Ademo
	'menu/cl_informations.lua'

}

server_scripts {
	'sh_locale.lua',
	'sh_translate.lua',
	'config/cfg_config.lua'
}

server_scripts {
	'core/callback/sv_callback.lua',
	----------------------------------------------
	'core/sv_players.lua',
	----------------------------------------------
	'core/game/sv_game.lua',
	----------------------------------------------
	'player/connection/sv_connection.lua',
	'player/selector/sv_selector.lua',
	'player/character/sv_character.lua',
	'player/identity/sv_identity.lua',
		
}

--[[
exports {
	'ShowHelpNotification',
	'ShowAdvancedNotification',
	'ShowAboveRadarMessage',
	'LoadingPrompt',
	'DrawAdvancedText2',
	'createBlip',
	'KeyboardInput',
	-----------------------
	'getPlayerMoneyBanque',
	'getPlayerMoneySale',
	'getPlayerMoneyEspece',
	'getPlayerPermissions',
	'getPlayerIdentityName',
	'getPlayerJob',
	'getPlayerJobGrade',
	'getPlayerIsBusy',
	'getPlayerIsConnected'

}
--]]
