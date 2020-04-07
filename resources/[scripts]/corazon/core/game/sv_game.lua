--[[
RegisterServerEvent('corazon.game:sv:gripData')
AddEventHandler('corazon.game:sv:gripData', function()
	local license = GetPlayerIdentifiers(source)[1]
	local source = source	
    local result = MySQL.Sync.fetchAll("SELECT firstConnection FROM players WHERE license = @license", {['@license'] = license})
    
	TriggerClientEvent('corazon.game:gripData', source, result)
end)
--]]

RegisterServerEvent("corazon:firstConnexionCreate")
AddEventHandler("corazon:firstConnexionCreate", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT firstConnection FROM players WHERE license = @license", {['@license'] = license})
	--local result = MySQL.Sync.fetchAll("SELECT isFirstConnection FROM users WHERE license = @license", {['@license'] = license})
	local zboubi = 0

	MySQL.Async.fetchAll('SELECT * FROM players WHERE `license`=@license;', {license = license}, function(players)
		if players[1] then
			if result[1].firstConnection == 1 then
				MySQL.Sync.execute("INSERT INTO players_d1_char(license) VALUES (@license)",{['@license']=license})
				MySQL.Sync.execute("INSERT INTO players_d2_char(license) VALUES (@license)",{['@license']=license})
		
				MySQL.Async.execute('UPDATE players SET firstConnection = @firstConnection WHERE license = @license', {
					['@firstConnection'] = zboubi,
					['@license'] = license
				})
				
				TriggerClientEvent("corazon.connexion:goUpAnim", source)
			elseif result[1].firstConnection == 0 then
				TriggerClientEvent("corazon.connexion:goUpAnim", source)
			end
		else
			MySQL.Sync.execute("INSERT INTO players(license) VALUES (@license)",{['@license']=license})
			MySQL.Sync.execute("INSERT INTO players_d1_char(license) VALUES (@license)",{['@license']=license})
			MySQL.Sync.execute("INSERT INTO players_d2_char(license) VALUES (@license)",{['@license']=license})
	
			MySQL.Async.execute('UPDATE players SET firstConnection = @firstConnection WHERE license = @license', {
				['@firstConnection'] = zboubi,
				['@license'] = license
			})
			
			TriggerClientEvent("corazon.connexion:goUpAnim", source)
		end
	end)

	MySQL.Async.fetchAll('SELECT * FROM players_d1_char WHERE `license`=@license;', {license = license}, function(players_d1_char)
		if players_d1_char[1] then

		else
			MySQL.Sync.execute("INSERT INTO players_d1_char(license) VALUES (@license)",{['@license']=license})
		end
	end)

	MySQL.Async.fetchAll('SELECT * FROM players_d2_char WHERE `license`=@license;', {license = license}, function(players_d2_char)
		if players_d2_char[1] then

		else
			MySQL.Sync.execute("INSERT INTO players_d2_char(license) VALUES (@license)",{['@license']=license})
		end
	end)

end)

