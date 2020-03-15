Corazon = Corazon or {}
Corazon.Game = {}

--------------------------------------------------------

RegisterNetEvent("corazon:loadPlayer")
RegisterNetEvent("corazon.game:gripData")

--------------------------------------------------------
local dataFirstConnection = ""

AddEventHandler("corazon.game:gripData", function(result)
    dataFirstConnection = tostring(result[1].firstConnection)

    Corazon.Game:loadPlayer()
end)


function Corazon.Game:loadPlayer()

    if dataFirstConnection == "" then
        TriggerServerEvent("corazon.game:gripData")
    elseif dataFirstConnection == 0 then
        ---- Evenement pour spawn player
    elseif dataFirstConnection == 1 then
        
    end

end

--------------------------------------------------------

AddEventHandler("corazon:loadPlayer", function()
    TriggerServerEvent("corazon.game:gripData")
end)

