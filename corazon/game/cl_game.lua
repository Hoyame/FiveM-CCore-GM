Corazon = Corazon or {}
Corazon.Game = {}

--------------------------------------------------------

RegisterNetEvent("corazon:loadPlayer")
RegisterNetEvent("corazon.game:gripData")

--------------------------------------------------------

function Corazon.Game:loadPlayer()
    TriggerServerEvent("corazon:firstConnexionCreate")
end

AddEventHandler("corazon:loadPlayer", function()
    Corazon.Game:loadPlayer()
end)

--------------------------------------------------------

Citizen.CreateThread(function()
	while true do
	 	Citizen.Wait(10000)
        TriggerServerEvent("corazon_core:goGripCharID")
	end
end)