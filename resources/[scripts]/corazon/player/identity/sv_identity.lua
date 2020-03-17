RegisterNetEvent("corazon:saveIdentity")
AddEventHandler("corazon:saveIdentity", function(charID, nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity)
    local source = source
    local charID = charID
    local license = GetPlayerIdentifiers(source)[1]

    local nameIdentity = nameIdentity
    local lieuIdentity = lieuIdentity
    local jourIdentity = jourIdentity
    local moisIdentity = moisIdentity
    local yearIdentity = yearIdentity
    local non = "0"
 
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET iNom = @nameIdentity WHERE license = @license', {
        ['@nameIdentity'] = nameIdentity,
        ['@license'] = license
	})

    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET iLieu = @lieuIdentity WHERE license = @license', {
        ['@lieuIdentity'] = lieuIdentity,
        ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET iJour = @jourIdentity WHERE license = @license', {
        ['@jourIdentity'] = jourIdentity,
        ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET iMois = @moisIdentity WHERE license = @license', {
        ['@moisIdentity'] = moisIdentity,
        ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET iAnnée = @yearIdentity WHERE license = @license', {
        ['@yearIdentity'] = yearIdentity,
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

end)

RegisterNetEvent("corazon:saveFakeIdentity")
AddEventHandler("corazon:saveFakeIdentity", function(charID, nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity, jobIdentity)
    local source = source
    local charID = charID
    local license = GetPlayerIdentifiers(source)[1]

    local nameIdentity = nameIdentity
    local lieuIdentity = lieuIdentity
    local jourIdentity = jourIdentity
    local moisIdentity = moisIdentity
    local yearIdentity = yearIdentity
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
    
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fJour = @jourIdentity WHERE license = @license', {
      ['@jourIdentity'] = jourIdentity,
      ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fMois = @moisIdentity WHERE license = @license', {
      ['@moisIdentity'] = moisIdentity,
      ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET fAnnée = @yearIdentity WHERE license = @license', {
      ['@yearIdentity'] = yearIdentity,
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