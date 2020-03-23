RegisterServerEvent("corazon:zebiTest")
AddEventHandler("corazon:zebiTest", function(charID)
	local source = source
	local charID = charID
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Sync.execute("INSERT INTO joueurs_d"..charID.."_perso(license) VALUES (@license)",{['@license']=license})
	
end)

