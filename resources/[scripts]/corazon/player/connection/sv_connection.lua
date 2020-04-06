RegisterNetEvent("corazon_connexion:goDataGripOne")
AddEventHandler("corazon_connexion:goDataGripOne", function(charID)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT pCash, pBank, pJob, iNom FROM players_d1_char WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_connexion:dataGripSelectPersoOne", source, result)
end)

RegisterNetEvent("corazon_connexion:goDataGripTwo")
AddEventHandler("corazon_connexion:goDataGripTwo", function(charID)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT pCash, pBank, pJob, iNom FROM players_d2_char WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_connexion:dataGripSelectPersoTwo", source, result)
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("corazon_connexion:setCharID")
AddEventHandler("corazon_connexion:setCharID", function(charID)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]
    local charID = charID
 
    MySQL.Async.execute('UPDATE players SET charID = @charID WHERE license = @license', {
        ['@charID'] = charID,
        ['@license'] = license
	})

end)

--[[
RegisterServerEvent('corazon.character:svCallbackSpawnPlayer')
AddEventHandler('corazon.game:sv:gripData', function()
	TriggerClientEvent('corazon.character:callbackSpawnPlayer', source)
end)
--]]

RegisterServerCallback('corazon_character:getPlayerSkinOne', function(source, cb)
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT * FROM players_d1_char WHERE license = @license', {
		['@license'] = license
	}, function(players_d1_char)
        local user = players_d1_char[1]
		local skin = nil
		local ped = nil

		if user.dataSkin ~= nil then
			skin = json.decode(user.dataSkin)
		end
		
		if user.dataPed ~= nil then
			ped = user.dataPed
		end

		cb(skin, ped)
	end)
end)

RegisterServerCallback('corazon_character:getPlayerSkinTwo', function(source, cb)
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT * FROM players_d2_char WHERE license = @license', {
		['@license'] = license
	}, function(players_d2_char)
		local skin = nil
		local ped = nil

		if user.dataSkin ~= nil then
			skin = json.decode(user.dataSkin)
		end
		
		if user.dataPed ~= nil then
			ped = user.dataPed
		end
		
		cb(skin, ped)
	end)
end)
