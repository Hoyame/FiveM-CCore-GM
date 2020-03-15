RegisterServerEvent('corazon:ShowServerMeID')
AddEventHandler('corazon:ShowServerMeID', function()
	local license = GetPlayerIdentifiers(source)[1]
	local source = source	
    local result = MySQL.Sync.fetchAll("SELECT firstConnection FROM joueurs WHERE license = @license", {['@license'] = license})
    
	TriggerClientEvent('corazon.game:gripData', source, result)
end)