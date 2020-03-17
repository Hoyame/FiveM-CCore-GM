local corazon = {}
local license, liveid, xbox, discord, playerip

----------------------------------------------------------------------------------------
-- Enregistrement des evenements

RegisterNetEvent("corazon_core:removePlayerMoney")
RegisterNetEvent("corazon_core:goDataGrip")
RegisterNetEvent("corazon_core:goGripCharID")

function GetPlayerInformations()
	for k,v in inairs(GetPlayerIdentifiers(target)) do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
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
		local license,liveid,xbox,discord,playerip

		for k,v in ipairs(GetPlayerIdentifiers(source))do
			if string.sub(v, 1, string.len("license:")) == "license:" then
				license = v
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
-- Fonction pour avoir les données du joueur

RegisterNetEvent("corazon_core:goDataGrip")
AddEventHandler("corazon_core:goDataGrip", function(charID)
	local charID = charID

	local source = source	
	local license = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT license, pEspece, pBanque, pSale, pJob, sPerm, iNom, iLieu, iJour, iMois, iAnnée, ipArme, ipCamion, ipVoiture, ipMoto, fNom, fLieu, fJour, fMois, fAnnée, fJob, fpArme, fpCamion, fpVoiture, fpMoto FROM joueurs_d"..charID.."_perso WHERE license = @license", {['@license'] = license})
    
	TriggerClientEvent("corazon_core:dataGrip", source, result)
end)

RegisterNetEvent("corazon_core:goGripCharID")
AddEventHandler("corazon_core:goGripCharID", function()
	local source = source	
	local license = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT charID FROM joueurs WHERE license = @license", {['@license'] = license})
    
	TriggerClientEvent("corazon_core:gripCharID", source, result)
end)


----------------------------------------------------------------------------------------
-- Fonction pour ajouter l'argent en cash

function functionsAddMoney(charID, amount)
	local charID = charID
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pEspece FROM joueurs_d'..charID..'_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET pEspece = @money WHERE license = @license', {
		['@license'] = license, 
		['@money'] = math.abs(result[1].money + amount)
	})

end

RegisterNetEvent("corazon_core:functionAddMoney")
AddEventHandler("corazon_core:functionAddMoney", function(charID, amount)
	functionsAddMoney(charID, amount)
end)

----------------------------------------------------------------------------------------
-- Fonction pour retirer de l'argent en cash

function functionsRemoveMoney(charID, amount)
	local charID = charID
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pEspece FROM joueurs_d'..charID..'_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET pEspece = @money WHERE license = @license', {
		['@license'] = license, 
		['@money'] = math.abs(result[1].money - amount)
	})

end

RegisterNetEvent("corazon_core:functionRemoveMoney")
AddEventHandler("corazon_core:functionRemoveMoney", function(charID, amount)
	functionsRemoveMoney(charID, amount)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Fonction pour ajouter l'argent en banque

function functionsAddBank(charID, amount)
	local charID = charID
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pBanque FROM joueurs_d'..charID..'_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET pBanque = @bank WHERE license = @license', {
		['@license'] = license, 
		['@bank'] = math.abs(result[1].bank + amount)
	})

end

RegisterNetEvent("corazon_core:functionAddBank")
AddEventHandler("corazon_core:functionAddBank", function(charID, amount)
	functionsAddBank(charID, amount)
end)

----------------------------------------------------------------------------------------
-- Fonction pour retirer de l'argent en banque

function functionsRemoveBank(charID, amount)
	local charID = charID
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pBanque FROM joueurs_d'..charID..'_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET pBanque = @bank WHERE license = @license', {
		['@license'] = license, 
		['@bank'] = math.abs(result[1].bank - amount)
	})

end

RegisterNetEvent("corazon_core:functionRemoveBank")
AddEventHandler("corazon_core:functionRemoveBank", function(charID, amount)
	functionsRemoveBank(charID, amount)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Fonction pour ajouter l'argent en sale

function functionsAddSale(charID, amount)
	local charID = charID
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pSale FROM joueurs_d'..charID..'_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET pSale = @sale WHERE license = @license', {
		['@license'] = license, 
		['@sale'] = math.abs(result[1].sale + amount)
	})

end

RegisterNetEvent("corazon_core:functionAddSale")
AddEventHandler("corazon_core:functionAddSale", function(charID, amount)
	functionsAddSale(charID, amount)
end)

----------------------------------------------------------------------------------------
-- Fonction pour retirer de l'argent en sale

function functionsRemoveSale(charID, amount)
	local charID = charID
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT pSale FROM joueurs_d'..charID..'_perso WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET pSale = @sale WHERE license = @license', {
		['@license'] = license, 
		['@sale'] = math.abs(result[1].sale - amount)
	})

end

RegisterNetEvent("corazon_core:functionRemoveSale")
AddEventHandler("corazon_core:functionRemoveSale", function(charID, amount)
	functionsRemoveSale(charID, amount)
end)