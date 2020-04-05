RegisterServerEvent('corazon_character:saveSkin')
AddEventHandler('corazon_character:saveSkin', function(skin, charID)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]
    local charID = charID

	MySQL.Async.execute('UPDATE players_d'..charID..'_char SET `dataSkin` = @skin WHERE license = @license', {
		['@skin'] = json.encode(skin),
		['@license'] = license
	})
end)

RegisterServerEvent('corazon_character:savePED')
AddEventHandler('corazon_character:savePED', function(ped, charID)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]
    local charID = charID

	MySQL.Async.execute('UPDATE players_d'..charID..'_char SET `dataPed` = @ped WHERE license = @license', {
		['@ped'] = ped,
		['@license'] = license
	})
end)

RegisterServerEvent('corazon_character:saveUnicPED')
AddEventHandler('corazon_character:saveUnicPED', function(ped, charID)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]
    local charID = charID

	MySQL.Async.execute('UPDATE players_d'..charID..'_char SET `dataPed` = @ped WHERE license = @license', {
		['@ped'] = ped,
		['@license'] = license
	})

	MySQL.Async.execute('UPDATE players_d'..charID..'_char SET `dataSkin` = @skin WHERE license = @license', {
		['@skin'] = "NULL",
		['@license'] = license
	})
end)

--[[
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
end)--]]