local character = {
    faim = 50,
    soif = 75,
    job = "",
    argent = ""
}

function openInformationsMenu()
    RMenu.Add('informations', 'main', RageUI.CreateMenu("Informations", "Ccore"))
    RMenu.Add('informations', 'submenu', RageUI.CreateSubMenu(RMenu:Get('informations', 'main'), "Menu Personal", "Mes Cartes D'identité"))

    RMenu:Get('informations', 'main'):SetSubtitle("CCore")
    RMenu:Get('informations', 'main').Closed = function()
        -- TODO Perform action
    end;

    RageUI.CreateWhile(1.0, true, function()

        if RageUI.Visible(RMenu:Get('informations', 'main')) then
            
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()

                RageUI.Button("Metier", "", { RightLabel = "Sans Emploi" }, true, function(Hovered, Active, Selected)
                end)

                RageUI.Button("Argent", "", { RightLabel = "~b~".."4550" }, true, function(Hovered, Active, Selected)
                end)

                RageUI.Button("------------------------------------------------------------------------------------------", "", {}, true, function(Hovered, Active, Selected)
                end)

                RageUI.SliderProgress("Faim", character.faim, 100," Description", {ProgressColor = {R = 0, G = 102, B = 255, A = 200},ProgressBackgroundColor ={R = 0, G = 102, B = 255, A = 150}}, true, function(Hovered, Active, Selected, Index)
                end)

                RageUI.SliderProgress("Soif", character.soif, 100," Description", {ProgressColor = {R = 102, G = 204, B = 255, A = 75},ProgressBackgroundColor = {R = 51, G = 153, B = 255, A = 75} }, true, function(Hovered, Active, Selected, Index)
                end)

            end, function()
                ---Panels
            end)
        end

    end, 1)
end


RegisterCommand("info", function()
    openInformationsMenu()
    Wait(25)
    RageUI.Visible(RMenu:Get('informations', 'main'), not RageUI.Visible(RMenu:Get('informations', 'main')))
end)