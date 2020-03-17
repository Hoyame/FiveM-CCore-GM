RegisterNetEvent("corazon_connexion:goDataGripOne")
AddEventHandler("corazon_connexion:goDataGripOne", function(charID)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT pEspece, pBanque, pJob, iNom FROM joueurs_d1_perso WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_connexion:dataGripSelectPersoOne", source, result)
end)

RegisterNetEvent("corazon_connexion:goDataGripTwo")
AddEventHandler("corazon_connexion:goDataGripTwo", function(charID)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT pEspece, pBanque, pJob, iNom FROM joueurs_d2_perso WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_connexion:dataGripSelectPersoTwo", source, result)
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("corazon_connexion:setCharID")
AddEventHandler("corazon_connexion:setCharID", function(charID)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]
    local charID = charID
 
    MySQL.Async.execute('UPDATE joueurs SET charID = @charID WHERE license = @license', {
        ['@charID'] = charID,
        ['@license'] = license
	})

end)