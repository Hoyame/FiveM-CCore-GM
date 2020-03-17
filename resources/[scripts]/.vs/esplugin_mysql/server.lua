-- Make sure you set this convar: 
-- set es_enableCustomData 1

local mReady = false

AddEventHandler('onMySQLReady', function ()
	mReady = true
end)

AddEventHandler('es_db:firstRunCheck', function(ip, port)
	-- Not in use
end)

AddEventHandler('es_db:doesUserExist', function(license, callback)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE `license`=@license;', {license = license}, function(users)
		if users[1] then
			callback(true)
		else
			callback(false)
		end
	end)
end)

AddEventHandler('es_db:retrieveUser', function(license, callback)
	local Callback = callback
	MySQL.Async.fetchAll('SELECT * FROM users WHERE `license`=@license;', {license = license}, function(users)
		if users[1] then
			Callback(users[1])
		else
			Callback(false)
		end
	end)
end)

AddEventHandler('es_db:createUser', function(license, cash, bank, callback)
	local user = { license = license, money = cash or 0, bank = bank or 0, group = "user", permission_level = 0 }

	MySQL.Async.execute('INSERT INTO users (`license`, `money`, `bank`, `group`, `permission_level`) VALUES (@license, @money, @bank, @group, @permission_level);', {license = user.license, money = user.money, bank = user.bank, permission_level = user.permission_level, group = user.group}, function(e)
		callback()
	end)
end)



AddEventHandler('es_db:retrieveLicensedUser', function(license, callback)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE `license`=@license;', {license = license}, function(users)
		if users[1] then
			callback(users[1])
		else
			callback(false)
		end
	end)
end)

AddEventHandler('es_db:doesLicensedUserExist', function(license, callback)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE `license`=@license;', {license = license}, function(users)
		if users[1] then
			callback(true)
		else
			callback(false)
		end
	end)
end)

AddEventHandler('es_db:updateUser', function(license, new, callback)
	Citizen.CreateThread(function()
		local updateString = ""

		local length = tLength(new)
		local cLength = 1
		for k,v in pairs(new)do
			if cLength < length then
				if(type(v) == "number")then
					updateString = updateString .. "`" .. k .. "`=" .. v .. ","
				else
					updateString = updateString .. "`" .. k .. "`='" .. v .. "',"
				end
			else
				if(type(v) == "number")then
					updateString = updateString .. "`" .. k .. "`=" .. v .. ""
				else
					updateString = updateString .. "`" .. k .. "`='" .. v .. "'"
				end
			end
			cLength = cLength + 1
		end

		MySQL.Async.execute('UPDATE users SET ' .. updateString .. ' WHERE `license`=@license', {license = license}, function(done)
			if callback then
				callback(true)
			end
		end)
	end)
end)

function tLength(t)
	local l = 0
	for k,v in pairs(t)do
		l = l + 1
	end

	return l
end