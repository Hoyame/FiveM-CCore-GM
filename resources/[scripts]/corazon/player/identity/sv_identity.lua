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

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET iNom = @nameIdentity WHERE license = @license', {
        ['@nameIdentity'] = nameIdentity,
        ['@license'] = license
	})

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET iLieu = @lieuIdentity WHERE license = @license', {
        ['@lieuIdentity'] = lieuIdentity,
        ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET iDate = @dateIdentity WHERE license = @license', {
        ['@dateIdentity'] = dateIdentity,
        ['@license'] = license
    })
    
    --------------------------------

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET ipArme = @armePermis WHERE license = @license', {
        ['@armePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET ipVoiture = @voiturePermis WHERE license = @license', {
        ['@voiturePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET ipMoto = @motoPermis WHERE license = @license', {
        ['@motoPermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET ipCamion = @camionPermis WHERE license = @license', {
        ['@camionPermis'] = non,
        ['@license'] = license
    })

    ---------------------------------------------

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET pBanque = @bank WHERE license = @license', {
        ['@bank'] = bank,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET pEspece = @cash WHERE license = @license', {
        ['@cash'] = cash,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET pSale = @dirty WHERE license = @license', {
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

    
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fNom = @nameIdentity WHERE license = @license', {
      ['@nameIdentity'] = nameIdentity,
      ['@license'] = license
	  })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fLieu = @lieuIdentity WHERE license = @license', {
      ['@lieuIdentity'] = lieuIdentity,
      ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET iDate = @dateIdentity WHERE license = @license', {
        ['@dateIdentity'] = dateIdentity,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fJob = @jobIdentity WHERE license = @license', {
        ['@jobIdentity'] = jobIdentity,
        ['@license'] = license
    })  

    --------------------------------

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fpArme = @armePermis WHERE license = @license', {
        ['@armePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fpCamion = @voiturePermis WHERE license = @license', {
        ['@voiturePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fpVoiture = @motoPermis WHERE license = @license', {
        ['@motoPermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fpMoto = @camionPermis WHERE license = @license', {
        ['@camionPermis'] = non,
        ['@license'] = license
    })

end)