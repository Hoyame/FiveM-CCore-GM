Corazon = {}
Cora = {}
CCore = {}

cPlayer = {}
cPlayer.player = {}
cPlayer.vIdentite = {}
cPlayer.fIdentite = {}

--------------------------------------------------------------------------
-- Variables Etendues

cPlayer.player.license = ""
cPlayer.player.job = ""
cPlayer.player.perm = ""
cPlayer.player.charID = ""

cPlayer.player.espece = ""
cPlayer.player.banque = ""
cPlayer.player.sale = ""

cPlayer.vIdentite.name = ""
cPlayer.vIdentite.lieu = ""
cPlayer.vIdentite.jour = ""
cPlayer.vIdentite.mois = ""
cPlayer.vIdentite.annee = ""

cPlayer.vIdentite.arme = false
cPlayer.vIdentite.camion = false
cPlayer.vIdentite.voiture = false
cPlayer.vIdentite.moto = false

-----------------------------------

cPlayer.fIdentite.name = ""
cPlayer.fIdentite.lieu = ""
cPlayer.fIdentite.jour = ""
cPlayer.fIdentite.mois = ""
cPlayer.fIdentite.annee = ""

cPlayer.fIdentite.job = ""

cPlayer.fIdentite.arme = false
cPlayer.fIdentite.camion = false
cPlayer.fIdentite.voiture = false
cPlayer.fIdentite.moto = false


--------------------------------------------------------------------------
-- Enregistrement des evenements

RegisterNetEvent("corazon_core:getPlayerData")
RegisterNetEvent("corazon_core:dataGrip")
RegisterNetEvent("corazon_core:gripCharID")

--------------------------------------------------------------------------

AddEventHandler("corazon_core:gripCharID", function(result)
    cPlayer.player.charID = tonumber(result[1].charID)
end)

function setCharID(data)
    local data = ""
    cPlayer.player.charID = data
end

function getCharID()
    return cPlayer.player.charID
end
--------------------------------------------------------------------------
AddEventHandler("corazon_core:getPlayerData", function()
    local charID = getCharID()

    TriggerServerEvent("corazon_core:goDataGrip", charID)
end)
--------------------------------------------------------------------------

AddEventHandler("corazon_core:dataGrip", function(result)
    cPlayer.player.license = tostring(result[1].license)
    cPlayer.player.job = tostring(result[1].pJob)
    cPlayer.player.perm = tostring(result[1].sPerm)
    cPlayer.player.espece = tonumber(result[1].pEspece)
    cPlayer.player.banque = tonumber(result[1].pBanque)
    cPlayer.player.sale = tonumber(result[1].pSale)
    
    cPlayer.vIdentite.name = tostring(result[1].iNom)
    cPlayer.vIdentite.lieu = tostring(result[1].iLieu)
    cPlayer.vIdentite.jour = tonumber(result[1].iJour)
    cPlayer.vIdentite.mois = tostring(result[1].iMois)
    cPlayer.vIdentite.annee = tonumber(result[1].iannee)

    cPlayer.fIdentite.name = tostring(result[1].fNom) 
    cPlayer.fIdentite.lieu = tostring(result[1].fLieu)
    cPlayer.fIdentite.jour = tonumber(result[1].fJour)
    cPlayer.fIdentite.mois = tostring(result[1].fMois)
    cPlayer.fIdentite.annee = tonumber(result[1].fannee)
    cPlayer.fIdentite.job = tostring(result[1].fJob)

    local idArme, idCamion, idMoto, idVoiture, fdArme, fdCamion, fdMoto, fdVoiture

    idArme = tonumber(result[1].ipArme)
    idCamion = tonumber(result[1].ipCamion)
    idMoto = tonumber(result[1].ipVoiture)
    idVoiture = tonumber(result[1].ipMoto)

    fdArme = tonumber(result[1].fpArme)
    fdCamion = tonumber(result[1].fpCamion)
    fdMoto = tonumber(result[1].fpVoiture)
    fdVoiture = tonumber(result[1].fpMoto)

    if idArme == "1" then 
        cPlayer.vIdentite.arme = true
    elseif idCamion == "1" then 
        cPlayer.vIdentite.camion = true
    elseif idMoto == "1" then 
        cPlayer.vIdentite.moto = true
    elseif idVoiture == "1" then 
        cPlayer.vIdentite.voiture = true 
    elseif fdArme == "1" then 
        cPlayer.fIdentite.arme = true
    elseif fdCamion == "1" then 
        cPlayer.fIdentite.camion = true 
    elseif fdMoto == "1" then 
        cPlayer.fIdentite.moto = true 
    elseif fdVoiture == "1" then 
        cPlayer.fIdentite.camion = true
    end

end)

--------------------------------------------------------------------------
-------------------------------------------------------------------------

RegisterCommand("getCharID", function()
    local zbi = getCharID()
    print(zbi)
end)
