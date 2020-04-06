Corazon = Corazon or {}
CCore = {}

cPlayer = {}
cPlayer.player = {}


--------------------------------------------------------------------------
-- Tables

cPlayer.player.isConnected = false
cPlayer.player.isBusy = false

cPlayer.player.license = ""
cPlayer.player.job = ""
cPlayer.player.jobGrade = ""
cPlayer.player.perm = ""
cPlayer.player.charID = ""

cPlayer.player.cash = ""
cPlayer.player.bank = ""
cPlayer.player.dirty = ""

cPlayer.player.vIDname = ""
cPlayer.player.vIDlieu = ""
cPlayer.player.vIDday = ""
cPlayer.player.vIDmonth = ""
cPlayer.player.vIDannee = ""

cPlayer.player.vIDarme = false
cPlayer.player.vIDcamion = false
cPlayer.player.vIDvoiture = false
cPlayer.player.vIDmoto = false

-----------------------------------

cPlayer.player.fIDname = ""
cPlayer.player.fIDlieu = ""
cPlayer.player.fIDday = ""
cPlayer.player.fIDmonth = ""
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
RegisterNetEvent("corazon_core:getPlayerMoneyBanque")
RegisterNetEvent("corazon_core:getPlayerMoneySale")
RegisterNetEvent("corazon_core:getPlayerMoneyEspece")
RegisterNetEvent("corazon_core:getPlayerPermissions")
RegisterNetEvent("corazon_core:getPlayerIdentityName")
RegisterNetEvent("corazon_core:getPlayerJob")

--------------------------------------------------------------------------

AddEventHandler("corazon_core:gripCharID", function(result)
    --cPlayer.player.charID = tonumber(result[1].charID)
    setCharID(tonumber(result[1].charID))
end)

function setCharID(data)
    cPlayer.player.charID = data
end

function getCharID()
    if cPlayer.player.charID == "" then 
        
    elseif cPlayer.player.charID == nil then
        
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
    cPlayer.player.jobGrade = tostring(result[1].pJobGrade)
    
    cPlayer.player.perm = tostring(result[1].sPerm)
    cPlayer.player.cash = tonumber(result[1].pCash)
    cPlayer.player.bank = tonumber(result[1].pBank)
    cPlayer.player.dirty = tonumber(result[1].pDirty)
    
    cPlayer.player.vIDname = tostring(result[1].iNom)
    cPlayer.player.vIDlieu = tostring(result[1].iLocation)
    cPlayer.player.vIDday = tonumber(result[1].iJour)
    cPlayer.player.vIDmonth = tostring(result[1].iMois)
    cPlayer.player.vIDannee = tonumber(result[1].iannee)

    cPlayer.player.fIDname = tostring(result[1].fNom) 
    cPlayer.player.fIDlieu = tostring(result[1].fLocation)
    cPlayer.player.fIDday = tonumber(result[1].fJour)
    cPlayer.player.fIDmonth = tostring(result[1].fMois)
    cPlayer.player.fIDannee = tonumber(result[1].fannee)
    cPlayer.player.fIDjob = tostring(result[1].fJob)

    local idArme, idCamion, idMoto, idVoiture, fdArme, fdCamion, fdMoto, fdVoiture

    idArme = tonumber(result[1].ipArme)
    idCamion = tonumber(result[1].ipTruck)
    idMoto = tonumber(result[1].ipCar)
    idVoiture = tonumber(result[1].ipMotorbike)

    fdArme = tonumber(result[1].fpArme)
    fdCamion = tonumber(result[1].fpTruck)
    fdMoto = tonumber(result[1].fpCar)
    fdVoiture = tonumber(result[1].fpMotorbike)

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
    return cPlayer.player.bank
end

function getPlayerMoneySale()
    return cPlayer.player.dirty
end

function getPlayerMoneyEspece()
    return cPlayer.player.cash
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

function getPlayerJobGrade()
    return cPlayer.player.jobGrade
end

function getPlayerIsBusy()
    return cPlayer.player.isBusy 
end 

function getPlayerIsConnected()
    return cPlayer.player.isConnected 
end

AddEventHandler("corazon_core:getPlayerMoneyBanque", getPlayerMoneyBanque)
AddEventHandler("corazon_core:getPlayerMoneySale", getPlayerMoneySale)
AddEventHandler("corazon_core:getPlayerMoneyEspece", getPlayerMoneyEspece)
AddEventHandler("corazon_core:getPlayerPermissions", getPlayerPermissions)
AddEventHandler("corazon_core:getPlayerIdentityName", getPlayerIdentityName)
AddEventHandler("corazon_core:getPlayerJob", getPlayerJob)

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
