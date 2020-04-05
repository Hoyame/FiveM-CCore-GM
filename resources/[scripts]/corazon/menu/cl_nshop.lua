function openMenuExample()
    RMenu.Add('nshop', 'main', RageUI.CreateMenu("~r~", "~r~VMLife", nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore"))
    RMenu.Add('nshop', 'shop', RageUI.CreateSubMenu(RMenu:Get('nshop', 'main'), "~r~", "~r~VMLife", nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore"))
    RMenu.Add('nshop', 'shop2', RageUI.CreateSubMenu(RMenu:Get('nshop', 'main'), "~r~", "~r~VMLife", nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore"))
    RMenu.Add('nshop', 'shop3', RageUI.CreateSubMenu(RMenu:Get('nshop', 'main'), "~r~", "~r~VMLife", nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore"))

    RMenu:Get('nshop', 'main'):SetSubtitle("~r~VMLife")
    RMenu:Get('nshop', 'main').Closed = function()
    end;

    RageUI.CreateWhile(1.0, true, function()

        if RageUI.Visible(RMenu:Get('nshop', 'main')) then
            
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
                RageUI.Button("Nourriture", "La graille !", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                --print("nourriture")
                    end
                end, RMenu:Get('nshop', 'shop'))
        
                RageUI.Button("Boissons", "à Boire", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                --print("nourriture")
                    end
                end, RMenu:Get('nshop', 'shop2'))

                RageUI.Button("Alcool", "à Boire avec Apu", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                --print("nourriture")
                    end
                end, RMenu:Get('nshop', 'shop3'))

                RageUI.Button("Gift D'Apu", "Un BonBon", { RightLabel = "🎁" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                --print("nourriture")
                    end
                end)

                
            end, function()
                ---Panels
            end)
        end

        if RageUI.Visible(RMenu:Get('nshop', 'shop')) then
            
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
            
                RageUI.Button("~r~-----------------------------~r~Fast Foods~r~-----------------------------", "", { RightLabel = "" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("2")
                    end
                end)

                RageUI.Button("Frite", "vive les Belges !", { RightLabel = "~g~3$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("2")
                    end
                end)

                RageUI.Button("burger", "BiG Burger", { RightLabel = "~g~5$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("3")
                    end
                end)

                RageUI.Button("pizza", "Une Napolitaine chef", { RightLabel = "~g~4$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("3")
                    end
                end)

                RageUI.Button("~r~-----------------------------~r~Boucherie~r~-----------------------------", "", { RightLabel = "" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("2")
                    end
                end)

                RageUI.Button("Boeuf", "Saignant...", { RightLabel = "~g~10$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("3")
                    end
                end)

                RageUI.Button("poulet", "un bon pilon...", { RightLabel = "~g~10$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("3")
                    end
                end)

                RageUI.Button("Dinde", "grosse Dinde", { RightLabel = "~g~10$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("3")
                    end
                end)

                RageUI.Button("~r~-----------------------------~r~En Cas~r~-----------------------------", "", { RightLabel = "" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                    --print("2")
                end
            end)

            RageUI.Button("Méteorite", "un gout explosife", { RightLabel = "~g~1.5$" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                    --print("3")
                end
            end)

            RageUI.Button("P'S & Q'S", "Chupa Chupps", { RightLabel = "~g~2$" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                    --print("3")
                end
            end)

            RageUI.Button("Redwood", "La Douce Fumer", { RightLabel = "~g~9.75$" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                    --print("3")
                end
            end)

            end, function()
                ---Panels
            end)
        end

        if RageUI.Visible(RMenu:Get('nshop', 'shop2')) then
            
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
            
                RageUI.Button("~r~-----------------------------~r~Boissons ~~-----------------------------", "", { RightLabel = "" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("2")
                    end
                end)

                RageUI.Button("Eau", "c'est mon eau", { RightLabel = "~g~1$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("2")
                    end
                end)

                RageUI.Button("eCola", "du bon Cola", { RightLabel = "~g~4.5$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("3")
                    end
                end)

                RageUI.Button("Sprunk", "Ca Gaz....", { RightLabel = "~g~4$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("3")
                    end
                end)

                RageUI.Button("Orange 0 Tang", "Secouez et Buvez", { RightLabel = "~g~4$" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        --print("3")
                    end
                end)

                RageUI.Button("~r~-----------------------------~r~Boissons Alcoolisés~r~------------------", "", { RightLabel = "" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                    --print("2")
                end
            end)

            RageUI.Button("The Tount", "Bourbon Whiskey", { RightLabel = "~g~8.5$" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                    --print("3")
                end
            end)

            RageUI.Button("Bourgeoix", "Champ", { RightLabel = "~g~7.5$" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
                    --print("3")
                end
            end)

            end, function()
                ---Panels
            end)
        end
    end, 1)
end

local positionApu = {
    {x = 25.65 , y = -1347.9, z = 29.5, }
}       


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(positionApu) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionApu[k].x, positionApu[k].y, positionApu[k].z)

            if dist <= 1.4 then
                ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler avec ~r~Apu")
				if IsControlJustPressed(1,51) then 
                    --mainMenu:Visible(not mainMenu:Visible())
                    --print("test")
                    openMenuExample()
                    Wait(25)
                    RageUI.Visible(RMenu:Get('nshop', 'main'), not RageUI.Visible(RMenu:Get('nshop', 'main')))
				end
            end
        end
    end
end)


Citizen.CreateThread(function()
    RequestModel(GetHashKey("mp_m_shopkeep_01"))

    while not HasModelLoaded(GetHashKey("mp_m_shopkeep_01")) do
        Wait(1)
    end


   

    ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", 24.51, -1347.91, 28.5, 270.95, true, true)
    ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", 24.32, -1345.7, 28.5, 263.28, true, true)

    --ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", 24.04, -1345.78, 29.5,true, true))

    SetBlockingOfNonTemporaryEvents(ped, false)
    SetEntityInvincible(ped, false)
    FreezeEntityPosition(ped, false)

    --set all true after dev

end)
