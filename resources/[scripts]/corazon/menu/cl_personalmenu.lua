function openPersonalMenu()
    RMenu.Add('personal', 'main', RageUI.CreateMenu("Menu Personel", "Ccore"))
    RMenu.Add('personal', 'submenu', RageUI.CreateSubMenu(RMenu:Get('personal', 'main'), "Menu Personal", "Mes Cartes D'identité"))

    RMenu:Get('personal', 'main'):SetSubtitle("CCore")
    RMenu:Get('personal', 'main').Closed = function()
        -- TODO Perform action
    end;

    RageUI.CreateWhile(1.0, true, function()

        if RageUI.Visible(RMenu:Get('personal', 'main')) then
            
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
                RageUI.Button("Inventaire", "Mon Inventaire  !", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        print("1")
                        RageUI.CloseAll()
                    end
                end)

                RageUI.Button("Portefeuille", "Mon Portefeuille !", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("2")
                    end
                end)

                RageUI.Button("Factures", "Mes Factures !", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("3")
                    end
                end)

                RageUI.Button("Carte Identité", "Regarder votre carte d'identité !", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("3")
                    end
                end, RMenu:Get('personal', 'submenu'))

                RageUI.Button("Options", "Mes Options !", { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("4")
                    end
                end)
            
            end, function()
                ---Panels
            end)
        end

        if RageUI.Visible(RMenu:Get('personal', 'submenu')) then
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
                RageUI.Button("Portefeuille", "Mon Portefeuille !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("2")
                    end
                end)
                ---Items
            end, function()
                ---Panels
            end)
        end

    end, 1)
end


RegisterCommand("personal", function()
    openPersonalMenu()
    Wait(25)
    RageUI.Visible(RMenu:Get('personal', 'main'), not RageUI.Visible(RMenu:Get('personal', 'main')))
end)