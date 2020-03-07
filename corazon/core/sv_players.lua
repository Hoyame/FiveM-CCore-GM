


local corazon = {}

----------------------------------------------------------------------------------------
-- Enregistrement des evenements

RegisterNetEvent("corazon_core:removePlayerMoney")
RegisterNetEvent("corazon_core:goGetPlayerisAdmin")
RegisterNetEvent("corazon_core:goGetMoneyPlayer")
RegisterNetEvent("corazon_core:goGetJobPlayer")
RegisterNetEvent("corazon_core:goGetNamePlayer")


----------------------------------------------------------------------------------------
-- Fonction pour avoir le nom du joueur

AddEventHandler("corazon_core:goGetNamePlayer", function()
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
    local result = MySQL.Sync.fetchAll("SELECT nameIdentity FROM user_characters WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getNamePlayer", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour avoir le nom du joueur

AddEventHandler("corazon_core:goGetJobPlayer", function()
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
    local result = MySQL.Sync.fetchAll("SELECT job FROM users WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getJobPlayer", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour avoir l'argent du joueur

AddEventHandler("corazon_core:goGetMoneyPlayer", function()
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
    local result = MySQL.Sync.fetchAll("SELECT money, bank FROM users WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getMoneyPlayer", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour savoir si le joueur est staff

AddEventHandler("corazon_core:goGetPlayerisAdmin", function()
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
    local result = MySQL.Sync.fetchAll("SELECT permission_level, permission_group FROM users WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getPlayerisAdmin", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour enlever l'argent

AddEventHandler("corazon_core:removePlayerMoney", function(newMoney, prevMoney)
	local prevMoney = prevMoney
	local newMoney = newMoney
	
	MySQL.Async.execute('UPDATE users SET money = @actuMoney WHERE license = @license', {
		['@actuMoney'] = math.abs(prevMoney - newMoney),
		['@license'] = license
	})
end)

