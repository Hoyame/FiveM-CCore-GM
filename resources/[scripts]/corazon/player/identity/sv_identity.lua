RegisterNetEvent("corazon:saveIdentity")
AddEventHandler("corazon:saveIdentity", function(charID, nameIdentity, lieuIdentity, dateIdentity)
    local source = source
    local charID = charID
    local license = GetPlayerIdentifiers(source)[1]

    local nameIdentity = nameIdentity
    local lieuIdentity = lieuIdentity
    local dateIdentity = dateIdentity

    local non = "0"
    local bank, cash, dirty
 
    bank = getBankStartPlayer()
    cash = getCashStartPlayer()
    dirty = getDirtyStartPlayer()

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET iNom = @nameIdentity WHERE license = @license', {
        ['@nameIdentity'] = nameIdentity,
        ['@license'] = license
	})

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET iLieu = @lieuIdentity WHERE license = @license', {
        ['@lieuIdentity'] = lieuIdentity,
        ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET iDate = @dateIdentity WHERE license = @license', {
        ['@dateIdentity'] = dateIdentity,
        ['@license'] = license
    })
    
    --------------------------------

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET ipArme = @armePermis WHERE license = @license', {
        ['@armePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET ipVoiture = @voiturePermis WHERE license = @license', {
        ['@voiturePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET ipMoto = @motoPermis WHERE license = @license', {
        ['@motoPermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET ipCamion = @camionPermis WHERE license = @license', {
        ['@camionPermis'] = non,
        ['@license'] = license
    })

    ---------------------------------------------

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET pBanque = @bank WHERE license = @license', {
        ['@bank'] = bank,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET pEspece = @cash WHERE license = @license', {
        ['@cash'] = cash,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET pSale = @dirty WHERE license = @license', {
        ['@dirty'] = dirty,
        ['@license'] = license
    })

end)

RegisterNetEvent("corazon:saveFakeIdentity")
AddEventHandler("corazon:saveFakeIdentity", function(charID, nameIdentity, lieuIdentity, dateIdentity)
    local source = source
    local charID = charID
    local license = GetPlayerIdentifiers(source)[1]

    local nameIdentity = nameIdentity
    local lieuIdentity = lieuIdentity
    local dateIdentity = dateIdentity
    local jobIdentity = jobIdentity
    local non = "0"

    
    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET fNom = @nameIdentity WHERE license = @license', {
      ['@nameIdentity'] = nameIdentity,
      ['@license'] = license
	  })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET fLieu = @lieuIdentity WHERE license = @license', {
      ['@lieuIdentity'] = lieuIdentity,
      ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET iDate = @dateIdentity WHERE license = @license', {
        ['@dateIdentity'] = dateIdentity,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET fJob = @jobIdentity WHERE license = @license', {
        ['@jobIdentity'] = jobIdentity,
        ['@license'] = license
    })  

    --------------------------------

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET fpArme = @armePermis WHERE license = @license', {
        ['@armePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET fpCamion = @voiturePermis WHERE license = @license', {
        ['@voiturePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET fpVoiture = @motoPermis WHERE license = @license', {
        ['@motoPermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE players_d'..charID..'_char SET fpMoto = @camionPermis WHERE license = @license', {
        ['@camionPermis'] = non,
        ['@license'] = license
    })

end)