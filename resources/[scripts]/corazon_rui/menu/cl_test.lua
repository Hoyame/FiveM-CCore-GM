function openMenuExample()
    RMenu.Add('showcase', 'main', RageUI.CreateMenu("CCore", "CConnexion"))

    RMenu:Get('showcase', 'main'):SetSubtitle("CCore")
    RMenu:Get('showcase', 'main').Closed = function()
        -- TODO Perform action
    end;

    RageUI.CreateWhile(1.0, true, function()

        if RageUI.Visible(RMenu:Get('showcase', 'main')) then
            
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
                RageUI.Button("Char 1", "Zboubi !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        print("zboubiooiii")
                        RageUI.CloseAll()
                    end
                end)

                RageUI.Button("Char 1", "Zboubi !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        RageUI.CloseAll()
                        print("zboubivlose")
                    end
                end)
            end, function()
                ---Panels
            end)
        end

    end, 1)
end

RegisterCommand("openMenu", function()
    openMenuExample()
    Wait(2500)
    RageUI.Visible(RMenu:Get('showcase', 'main'), not RageUI.Visible(RMenu:Get('showcase', 'main')))
end)