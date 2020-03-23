Corazon = Corazon or {}
CCore = {}

cPlayer = {}
cPlayer.player = {}


--------------------------------------------------------------------------
-- Variables Etendues

cPlayer.player.license = ""
cPlayer.player.job = ""
cPlayer.player.perm = ""
cPlayer.player.charID = ""

cPlayer.player.espece = ""
cPlayer.player.banque = ""
cPlayer.player.sale = ""

cPlayer.player.vIDname = ""
cPlayer.player.vIDlieu = ""
cPlayer.player.vIDjour = ""
cPlayer.player.vIDmois = ""
cPlayer.player.vIDannee = ""

cPlayer.player.vIDarme = false
cPlayer.player.vIDcamion = false
cPlayer.player.vIDvoiture = false
cPlayer.player.vIDmoto = false

-----------------------------------

cPlayer.player.fIDname = ""
cPlayer.player.fIDlieu = ""
cPlayer.player.fIDjour = ""
cPlayer.player.fIDmois = ""
cPlayer.player.fIDannee = ""

cPlayer.player.fIDjob = ""

cPlayer.player.fIDarme = false
cPlayer.player.fIDcamion = false
cPlayer.player.fIDvoiture = false
cPlayer.player.fIDmoto = false


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
    cPlayer.player.charID = data
end

function getCharID()
    if cPlayer.player.charID == "" then 
        print("guillmets")
    elseif cPlayer.player.charID == nil then
        print("nil") 
    else 
        return cPlayer.player.charID
    end
end
--------------------------------------------------------------------------
AddEventHandler("corazon_core:getPlayerData", function()
    local charID = getCharID()

    TriggerServerEvent("corazon_core:goDataGrip", charID)
end)
--------------------------------------------------------------------------

AddEventHandler("corazon_core:dataGrip", function(result)
    --cPlayer.player.license = tostring(result[1].license)
    cPlayer.player.job = tostring(result[1].pJob)
    cPlayer.player.perm = tostring(result[1].sPerm)
    cPlayer.player.espece = tonumber(result[1].pEspece)
    cPlayer.player.banque = tonumber(result[1].pBanque)
    cPlayer.player.sale = tonumber(result[1].pSale)
    
    cPlayer.player.vIDname = tostring(result[1].iNom)
    cPlayer.player.vIDlieu = tostring(result[1].iLieu)
    cPlayer.player.vIDjour = tonumber(result[1].iJour)
    cPlayer.player.vIDmois = tostring(result[1].iMois)
    cPlayer.player.vIDannee = tonumber(result[1].iannee)

    cPlayer.player.fIDname = tostring(result[1].fNom) 
    cPlayer.player.fIDlieu = tostring(result[1].fLieu)
    cPlayer.player.fIDjour = tonumber(result[1].fJour)
    cPlayer.player.fIDmois = tostring(result[1].fMois)
    cPlayer.player.fIDannee = tonumber(result[1].fannee)
    cPlayer.player.fIDjob = tostring(result[1].fJob)

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
        cPlayer.player.vIDarme = true
    elseif idCamion == "1" then 
        cPlayer.player.vIDcamion = true
    elseif idMoto == "1" then 
        cPlayer.player.vIDmoto = true
    elseif idVoiture == "1" then 
        cPlayer.player.vIDvoiture = true 
    elseif fdArme == "1" then 
        cPlayer.player.fIDarme = true
    elseif fdCamion == "1" then 
        cPlayer.player.fIDcamion = true 
    elseif fdMoto == "1" then 
        cPlayer.player.fIDmoto = true 
    elseif fdVoiture == "1" then 
        cPlayer.player.fIDcamion = true
    end

end)

function getPlayerMoneyBanque()
    return cPlayer.player.banque
end

function getPlayerMoneySale()
    return cPlayer.player.sale
end

function getPlayerMoneyEspece()
    return cPlayer.player.espece
end

function getPlayerPermissions()
    return cPlayer.player.perm
end

function getPlayerIdentityName()
    return cPlayer.player.vIDname
end

function getPlayerJob()
    return cPlayer.player.job
end

--------------------------------------------------------------------------
-------------------------------------------------------------------------

function RequestToSave()
    local charID = getCharID()

	LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	TriggerServerEvent("corazon:savePlayerPosition", LastPosX , LastPosY , LastPosZ, charID)
end

--Event pour le spawn du joueur vers la dernière position connue
RegisterNetEvent("corazon:LastPostClient")
AddEventHandler("corazon:LastPostClient", function(PosX, PosY, PosZ)
	SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
end)

local function RequestToSave()
    local charID = getCharID()

	LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	TriggerServerEvent("corazon:savePlayerPosition", LastPosX , LastPosY , LastPosZ, charID)
end