


local corazon = {}
local license, steam, liveid, xbox, discord, playerip

----------------------------------------------------------------------------------------
-- Enregistrement des evenements

RegisterNetEvent("corazon_core:removePlayerMoney")
RegisterNetEvent("corazon_core:goGetPlayerisAdmin")
RegisterNetEvent("corazon_core:goGetMoneyPlayer")
RegisterNetEvent("corazon_core:goGetJobPlayer")
RegisterNetEvent("corazon_core:goGetNamePlayer")


function GetPlayerInformations()
	for k,v in inairs(GetPlayerIdentifiers(target)) do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
			steam = v
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xbox  = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
			playerip = v
		end
	end
end


AddEventHandler('corazon:setPlayerDataBdd',function(source)
	CreateThread(function()
	Wait(5000)
		local license,steamID,liveid,xbox,discord,playerip

		for k,v in ipairs(GetPlayerIdentifiers(source))do
			if string.sub(v, 1, string.len("license:")) == "license:" then
				license = v
			elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
				steamID = v
			elseif string.sub(v, 1, string.len("live:")) == "live:" then
				liveid = v
			elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
				xbox  = v
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
				discord = v
			elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
				playerip = v
			end
		end

		MySQL.Async.fetchAll('SELECT * FROM `joueurs` WHERE `license` = @license', {
			['@license'] = license
		}, function(data)
		local found = false
			for i=1, #data, 1 do
				if data[i].license == license then
					found = true
				end
			end
			if not found then
				MySQL.Async.execute('INSERT INTO joueurs (license,steam,liveid,xbox,discord) VALUES (@license,@steam,@liveid,@xbox,@discord)', { 
					['@license']    = license,
					['@steam'] 	  	= steamID,
					['@liveid']     = liveid,
					['@xbox']       = xbox,
					['@discord']    = discord
				},
					function ()
				end)
			else
				MySQL.Async.execute('UPDATE `joueurs` SET `steam` = @steam, `liveid` = @liveid, `xbox` = @xbox, `discord` = @discord WHERE `license` = @license', { 
					['@license']    = license,
					['@steam'] 		= steamID,
					['@liveid']     = liveid,
					['@xbox']      	= xbox,
					['@discord']    = discord
				},
					function ()
				end)
			end
		end)
	end)
end)

----------------------------------------------------------------------------------------
-- Fonction pour avoir le nom du joueur

RegisterNetEvent("corazon_core:goGetNamePlayer")
AddEventHandler("corazon_core:goGetNamePlayer", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT iPrenom FROM joueurs_d_perso WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getNamePlayer", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour avoir le job du joueur

RegisterNetEvent("corazon_core:goGetJobPlayer")
AddEventHandler("corazon_core:goGetJobPlayer", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT pJob FROM joueurs_d_perso WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getJobPlayer", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour avoir l'argent du joueur

RegisterNetEvent("corazon_core:goGetMoneyPlayer")
AddEventHandler("corazon_core:goGetMoneyPlayer", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT pEspece, pBanque, pSale FROM joueurs_d_perso WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getMoneyPlayer", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour savoir si le joueur est staff

RegisterNetEvent("corazon_core:goGetPlayerisAdmin")
AddEventHandler("corazon_core:goGetPlayerisAdmin", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT sPerm FROM joueurs_d_perso WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getPlayerisAdmin", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour ajouter l'argent en cash

function functionsAddMoney(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pEspece FROM joueurs_d_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d_perso SET pEspece = @money WHERE license = @license', {
		['@license'] = license, 
		['@money'] = math.abs(result[1].money + amount)
	})

end

RegisterNetEvent("corazon_core:functionAddMoney")
AddEventHandler("corazon_core:functionAddMoney", function(amount)
	functionsAddMoney(amount)
end)

----------------------------------------------------------------------------------------
-- Fonction pour retirer de l'argent en cash

function functionsRemoveMoney(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pEspece FROM joueurs_d_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d_perso SET pEspece = @money WHERE license = @license', {
		['@license'] = license, 
		['@money'] = math.abs(result[1].money - amount)
	})

end

RegisterNetEvent("corazon_core:functionRemoveMoney")
AddEventHandler("corazon_core:functionRemoveMoney", function(amount)
	functionsRemoveMoney(amount)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Fonction pour ajouter l'argent en banque

function functionsAddBank(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pBanque FROM joueurs_d_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d_perso SET pBanque = @bank WHERE license = @license', {
		['@license'] = license, 
		['@bank'] = math.abs(result[1].bank + amount)
	})

end

RegisterNetEvent("corazon_core:functionAddBank")
AddEventHandler("corazon_core:functionAddBank", function(amount)
	functionsAddBank(amount)
end)

----------------------------------------------------------------------------------------
-- Fonction pour retirer de l'argent en banque

function functionsRemoveBank(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pBanque FROM joueurs_d_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d_perso SET pBanque = @bank WHERE license = @license', {
		['@license'] = license, 
		['@bank'] = math.abs(result[1].bank - amount)
	})

end

RegisterNetEvent("corazon_core:functionRemoveBank")
AddEventHandler("corazon_core:functionRemoveBank", function(amount)
	functionsRemoveBank(amount)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Fonction pour ajouter l'argent en sale

function functionsAddSale(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pSale FROM joueurs_d_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d_perso SET pSale = @sale WHERE license = @license', {
		['@license'] = license, 
		['@sale'] = math.abs(result[1].sale + amount)
	})

end

RegisterNetEvent("corazon_core:functionAddSale")
AddEventHandler("corazon_core:functionAddSale", function(amount)
	functionsAddSale(amount)
end)

----------------------------------------------------------------------------------------
-- Fonction pour retirer de l'argent en sale

function functionsRemoveSale(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pSale FROM joueurs_d_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d_perso SET pSale = @sale WHERE license = @license', {
		['@license'] = license, 
		['@sale'] = math.abs(result[1].sale - amount)
	})

end

RegisterNetEvent("corazon_core:functionRemoveSale")
AddEventHandler("corazon_core:functionRemoveSale", function(amount)
	functionsRemoveSale(amount)
end)