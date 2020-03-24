function openMenuExample()
    RMenu.Add('showcase', 'main', RageUI.CreateMenu("Menu Personel", "Ccore"))
    RMenu.Add('showcase', 'submenu', RageUI.CreateSubMenu(RMenu:Get('showcase', 'main'), "RageUI", "~b~RAGEUI SHOWCASE", nil, nil, "casinoui_roulette_high", "casinoui_roulette_high"))
    RMenu.Add('showcase', 'heritage', RageUI.CreateSubMenu(RMenu:Get('showcase', 'main'), "Personnage", "~b~Heritage"))

    RMenu:Get('showcase', 'main'):SetSubtitle("CCore")
    RMenu:Get('showcase', 'main').Closed = function()
        -- TODO Perform action
    end;

    RageUI.CreateWhile(1.0, true, function()

        if RageUI.Visible(RMenu:Get('showcase', 'main')) then
            
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
                RageUI.Button("Inventaire", "Mon Inventaire  !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        print("1")
                        RageUI.CloseAll()
                    end
                end)

                RageUI.Button("Portefeuille", "Mon Portefeuille !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("2")
                    end
                end)

                RageUI.Button("Factures", "Mes Factures !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("3")
                    end
                end)

                RageUI.Button("Carte Identité", "Regarder votre carte d'identité !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("3")
                    end
                end)

                RageUI.Button("Options", "Mes Options !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("4")
                    end
                end)
                

            end, function()
                ---Panels
            end)
        end

    end, 1)
end

RageUI.Button("Another Menu", "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
    if (Hovered) then

    end
    if (Active) then

    end
    if (Selected) then

    end
end, RMenu:Get('showcase', 'submenu'))

RegisterCommand("personal", function()
    openMenuExample()
    Wait(2500)
    RageUI.Visible(RMenu:Get('showcase', 'main'), not RageUI.Visible(RMenu:Get('showcase', 'main')))
end)