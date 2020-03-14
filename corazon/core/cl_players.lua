Corazon = {}
Cora = {}

CCore = {}
CPlayer = {}

--------------------------------------------------------------------------
-- Variables Etendues

CPlayer.playerName = ""
CPlayer.playerJob = ""

CPlayer.playerEspece = ""
CPlayer.playerBanque = ""
CPlayer.playerSale = ""

CPlayer.playerGroup = ""

--------------------------------------------------------------------------
-- Enregistrement des evenements

RegisterNetEvent("corazon_core:getNamePlayer")
RegisterNetEvent("corazon_core:getJobPlayer")
RegisterNetEvent("corazon_core:getMoneyPlayer")
RegisterNetEvent("corazon_core:getPlayerData")
RegisterNetEvent("corazon_core:getPlayerDataMoney")
RegisterNetEvent("corazon_core:removePlayerMoney")

--------------------------------------------------------------------------

function GetPlayers()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            players[#players + 1] = i
        end
    end 

    return players

end

function GetPlayersInformation()
    
end

--------------------------------------------------------------------------

function callEventPlayerName()
    TriggerServerEvent("corazon_core:goGetNamePlayer")
end

function callEventPlayerJob()
    TriggerServerEvent("corazon_core:goGetJobPlayer")
end

function callEventPlayerMoney()
    TriggerServerEvent("corazon_core:goGetMoneyPlayer")
end

function callEventPlayerisAdmin()
    TriggerServerEvent("corazon_core:goGetPlayerisAdmin")
end

-------------------------------------------------------------------------

AddEventHandler("corazon_core:getNamePlayer", function(result)
    CPlayer.playerName = tostring(result[1].nameIdentity)
end)

AddEventHandler("corazon_core:getJobPlayer", function(result)
    CPlayer.playerJob = tostring(result[1].job)
end)

AddEventHandler("corazon_core:getMoneyPlayer", function(result)
	CPlayer.playerMoney = tostring(result[1].money)
	CPlayer.playerBank = tostring(result[1].bank)
end)

------------------------------------------------------------------------

AddEventHandler("corazon_core:getPlayerData", function()
    callEventPlayerName()
    callEventPlayerJob()
    callEventPlayerisAdmin()
end)

AddEventHandler("corazon_core:getPlayerDataMoney", function()
    callEventPlayerMoney()
end)

-------------------------------------------------------------------------

RegisterCommand("removemoney", function()
	TriggerEvent("corazon_core:removePlayerMoney", 60000)
end)