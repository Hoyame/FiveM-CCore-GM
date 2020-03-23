RegisterServerEvent('corazon_character:saveSkin')
AddEventHandler('corazon_character:saveSkin', function(skin, charID)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]
    local charID = charID

	MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET `dataSkin` = @skin WHERE license = @license', {
		['@skin'] = json.encode(skin),
		['@license'] = license
	})
end)

RegisterServerEvent('corazon_character:savePED')
AddEventHandler('corazon_character:savePED', function(ped, charID)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]
    local charID = charID

	MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET `dataPed` = @ped WHERE license = @license', {
		['@ped'] = ped,
		['@license'] = license
	})
end)

--[[
RegisterServerCallback('corazon_character:getPlayerSkinOne', function(source, cb)
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT * FROM joueurs_d1_perso WHERE license = @license', {
		['@license'] = license
	}, function(joueurs_d1_perso)
        local user = joueurs_d1_perso[1]
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

	MySQL.Async.fetchAll('SELECT * FROM joueurs_d2_perso WHERE license = @license', {
		['@license'] = license
	}, function(joueurs_d2_perso)
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