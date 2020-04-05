Users = {}

function LoadUser(license, source, new, licenseNotRequired)
	local Source = source
	db.retrieveUser(license, function(user)
		if user.license or licenseNotRequired then
			-- Creates the player class for OOP imitation and then sets a var to say which idType was used (This isn't relevant anymore)
			Users[source] = CreatePlayer(source, user.permission_level, user.money, user.bank, user.license, user.group)
			Users[Source].setSessionVar('idType', 'license')

			
			TriggerClientEvent('nArgent:DisplayCashValue', Source, user.money)
			TriggerClientEvent('nArgent:DisplayBankValue', Source, user.bank)
            
			-- Tells other resources that a player has loaded
			TriggerEvent('es:playerLoaded', Source, Users[Source])

			-- Sets a decorator on the client if enabled, allows some cool stuff on the client see: https://runtime.fivem.net/doc/natives/#_0xA06C969B02A97298
			if(settings.defaultSettings.enabl8/eRankDecorators ~= "false")then
				TriggerClientEvent('es:setPlayerDecorator', Source, 'rank', Users[Source]:getPermissions())
			end

			-- Sets the money "icon" on the client. This is UTF8
			TriggerClientEvent('es:setMoneyIcon', Source,settings.defaultSettings.moneyIcon)

			-- Sends the command suggestions to the client, this creates a neat autocomplete
			for k,v in pairs(commandSuggestions) do
				TriggerClientEvent('chat:addSuggestion', Source, settings.defaultSettings.commandDelimeter .. k, v.help, v.params)
			end
            
			-- If a player connected that was never on the server before then this will be triggered for other resources
			if new then
				TriggerEvent('es:newPlayerLoaded', Source, Users[Source])
			end
		else
			-- Irrelevant
			local license

			for k,v in ipairs(GetPlayerIdentifiers(Source))do
				if string.sub(v, 1, string.len("license:")) == "license:" then
					license = v
					break
				end
			end
            
			if license then
				db.updateUser({license = license}, function()
					LoadUser(user.license, Source, false)
				end)
			else
				LoadUser(user.license, Source, false, true)
			end
		end
	end)
end


-- Exported function, same as es:getPlayerFromId
function getPlayerFromId(id)
	return Users[id]
end

-- Returns all EssentialMode user objects
AddEventHandler('es:getPlayers', function(cb)
	cb(Users)
end)

function registerUser(license, source)
	local Source = source
	db.doesUserExist(license, function(exists)
		if exists then
			LoadUser(license, Source, false)
		else
			db.createUser(license, function(r, user)
				LoadUser(license, Source, true)
			end)
		end
	end)
end

---------------------------------------------------------------------------------------------------------------

