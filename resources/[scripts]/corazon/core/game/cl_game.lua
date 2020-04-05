Corazon = {}
Corazon.Game = {}

--------------------------------------------------------

RegisterNetEvent("corazon:loadPlayer")
RegisterNetEvent("corazon.game:gripData")
RegisterNetEvent("corazon.game:setIsConnected")

--------------------------------------------------------

function CzonGMLoadPlayer()
    TriggerServerEvent("corazon:firstConnexionCreate")
end

AddEventHandler("corazon:loadPlayer", function()
    CzonGMLoadPlayer()
end)

--------------------------------------------------------
local isConnected = false

AddEventHandler("corazon.game:setIsConnected", function()
    isConnected = true
end)

Citizen.CreateThread(function()
	while true do      
        if isConnected then 
            local charID = getCharID()

            Citizen.Wait(10000)
            TriggerServerEvent("corazon_core:goGripCharID")
            RequestToSave()
        else 
            Citizen.Wait(1000)
        end
	end
end)

if Config.enablePvP then 
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            for i = 0,256 do
                if NetworkIsPlayerActive(i) then
                    SetCanAttackFriendly(GetPlayerPed(i), true, true)
                    NetworkSetFriendlyFireOption(true)
                    SetPlayerWantedLevel(GetPlayerPed(i), 0, false)
                    SetPlayerWantedLevelNow(GetPlayerPed(i), false)
                end
            end
        end
    end)
end

if Config.copsWanted then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(100)
			local playerId = PlayerId()

			if GetPlayerWantedLevel(playerId) ~= 0 then
				SetPlayerWantedLevel(playerId, 0, false)
				SetPlayerWantedLevelNow(playerId, false)
			end
		end
	end)
end