function openAdemoSettings()
    RMenu.Add('ademo', 'main', RageUI.CreateMenu("Settings", "Ccore-Ademo"))

    RMenu:Get('ademo', 'main'):SetSubtitle("CCore-Ademo")
    RMenu:Get('ademo', 'main').Closed = function()
        -- TODO Perform action
    end;

    RageUI.CreateWhile(1.0, true, function()

        if RageUI.Visible(RMenu:Get('ademo', 'main')) then
            
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
                RageUI.Button("Normal", "Changer la Vue en Normal !", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        SetTimecycleModifier('')
                    end
                end)

                RageUI.Button("Vue & lumières améliorées", "Changer la Vue en Amélioré !", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        SetTimecycleModifier('tunnel')
                        print('ademo-ccore')
                    end
                end)

                RageUI.Button("Couleurs amplifiées", "Changer la Vue en Couleurs Amplifiées ! !", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        SetTimecycleModifier('rply_saturation')
                        print('ademo-ccore2')
                    end
                end)

                RageUI.Button("Noir & blancs", "Changer la Vue en Noir et Blancs !", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        SetTimecycleModifier('rply_saturation_neg')
                        print('ademo-ccore3')
                    end
                end)

                
                RageUI.Button("Activer la mini-map", "Pour activer la mini-map !", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        DisplayRadar(true)
                        print('ademo-ccore4')
                    end
                end)

                RageUI.Button("Desactiver la mini-map", "Pour Desactiver la mini-map !", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        DisplayRadar(false)
                        print('ademo-ccore5')
                    end
                end)

                RageUI.Button("Optimisation", "Optimiser vos fps.", { RightBadge = RageUI.BadgeStyle.Star, Color = {BackgroundColor = { 0, 120, 0, 25 }} }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        DoScreenFadeIn(2000) -- Ecran Noir
                        LoadingPrompt("Optimisation en cours...", 3)
                        DoScreenFadeOut(2000)  -- Ecran Noir
                        Citizen.Wait(2000)
                        DoScreenFadeIn(1500) -- Ecran Noir
                        ClearAllBrokenGlass()
                        ClearAllHelpMessages()
                        LeaderboardsReadClearAll()
                        ClearBrief()
                        ClearGpsFlags()
                        ClearPrints()
                        ClearSmallPrints()
                        ClearReplayStats()
                        LeaderboardsClearCacheData()
                        ClearFocus()
                        ClearHdArea()
                        ClearHelp()
                        ClearNotificationsPos()
                        ClearPedInPauseMenu()
                        ClearFloatingHelp()
                        ClearGpsPlayerWaypoint()
                        ClearGpsRaceTrack()
                        ClearReminderMessage()
                        ClearThisPrint()
            
                        Citizen.Wait(2090)
                        RemoveLoadingPrompt()
                        Citizen.Wait(100)
                        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                        print('ademo-ccore6')
                       -- print("4")
                    end
                end)

            end, function()
                ---Panels
            end)
        end

    end, 1)

    

RegisterCommand("settings", function()
    openAdemoSettings()
    Wait(2500)
    RageUI.Visible(RMenu:Get('ademo', 'main'), not RageUI.Visible(RMenu:Get('ademo', 'main')))
end)