local sexeSelect = 0
local teteSelect = 0
local colorPeauSelect = 0
local cheveuxSelect = 0
local bebarSelect = -1
local poilsCouleurSelect = 0
local ImperfectionsPeau = 0
local face, acne, skin, eyecolor, skinproblem, freckle, wrinkle, hair, haircolor, eyebrow, beard, beardcolor

CMenu = {}
CMenu.Data = {}

local creationPerso = {
	Base = { Title = "Mon Personnage", Blocked = true },
	Data = { currentMenu = "creation personnage" },
	Events = {
		onSelected = function(self, _, btn)
			if btn.name == "~g~Continuer & Sauvegarder" then
                saveSkin()
                self:CloseMenu(true)
            end
            
        end,
                
        onSlide = function(menuData, currentButton, currentSlt, CMenu)

            local currentMenu, ped = menuData.currentMenu, GetPlayerPed(-1)
        
            if currentMenu == "votre sexe" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1

                if currentButton == 1 then
                    gender = 0
                    TriggerEvent('skinchanger:change', 'sex', 0)
                elseif currentButton == 2 then
                    gender = 1
                    TriggerEvent('skinchanger:change', 'sex', 1)
                end
        
                --print("sexe "..currentButton)
            end
        
            if currentMenu == "votre tête" then
                if currentSlt ~= 1 then return end
                currentButton = currentButton.slidenum - 1

                face = currentButton
                SetPedHeadBlendData(GetPlayerPed(-1), face, face, face, skin, skin, skin, 1.0, 1.0, 1.0, true)

                --print("visage "..currentButton)
            end

            if currentMenu == "votre peau" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                skin = currentButton
                SetPedHeadBlendData(GetPlayerPed(-1), face, face, face, skin, skin, skin, 1.0, 1.0, 1.0, true)
            
                --print("peau "..currentButton)
            end

            if currentMenu == "votre barbe" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                beard = currentButton
                SetPedHeadOverlay(GetPlayerPed(-1), 1, beard, 1.0)

                --print("barbe "..currentButton)
            end

            if currentMenu == "vos yeux" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                eyecolor = currentButton
                SetPedEyeColor(GetPlayerPed(-1), eyecolor)

                --print("yeux "..currentButton)
            end

            if currentMenu == "vos cheveux" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                hair = currentButton
                SetPedComponentVariation(GetPlayerPed(-1), 2, hair, 0, 0)

                --print("cheveux "..currentButton)
            end

            if currentMenu == "vos sourcils" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                eyebrow = currentButton
                SetPedHeadOverlay(GetPlayerPed(-1), 2, eyebrow, 1.0)

                --print("sourcils "..currentButton)
            end

            if currentMenu == "votre couleur pilositaire" then
                if currentSlt ~= 1 then return end
                local currentButton = currentButton.slidenum - 1
        
                beardcolor = currentButton
                SetPedHairColor(GetPlayerPed(-1), beardcolor, 0)
                SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, beardcolor, 0)
                SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, beardcolor, 0)

                --print("sourcils "..currentButton)
            end

            if currentMenu == "vos imperfections" then
                if currentSlt ~= 1 then return end
                local skinproblem = currentButton.slidenum - 1
        
                SetPedHeadOverlay(GetPlayerPed(-1), 6, skinproblem, 1.0)
            end

            if currentMenu == "vos taches de rousseur" then
                if currentSlt ~= 1 then return end
                local freckle = currentButton.slidenum - 1
        
                SetPedHeadOverlay(GetPlayerPed(-1), 9, freckle, 1.0)
            end

            if currentMenu == "vos rides" then
                if currentSlt ~= 1 then return end
                local wrinkle = currentButton.slidenum - 1
        
                SetPedHeadOverlay(GetPlayerPed(-1), 3, wrinkle, 1.0)
            end

            if currentMenu == "votre acné" then
                if currentSlt ~= 1 then return end
                local acne = currentButton.slidenum - 1
        
                SetPedHeadOverlay(GetPlayerPed(-1), 0, acne, 1.0)
            end
            
        end,
	},

	Menu = {
        ["creation personnage"] = {
			--slidertime = 75,
			b = {
                { name = "Votre Sexe" },
                { name = "---------------------------------------------------------------------" },
                { name = "Votre Visage" },
                { name = "Votre Corps" },
                { name = "Votre Tenue" },
                { name = "---------------------------------------------------------------------" },
				{ name = "~g~Continuer & Sauvegarder" }
			}
        },

        ["votre visage"] = {           
			b = {
                { name = "Votre Tête" },
                { name = "Votre Barbe" },
                { name = "Vos Yeux" },
                { name = "Vos Sourcils" },
				{ name = "Vos Cheveux" },
            }
        },

        ["votre corps"] = {          
			b = {
                { name = "Votre Peau" },
                { name = "Votre couleur pilositaire" },
                { name = "Votre acné" },
                { name = "Vos imperfections" },
                { name = "Vos rides" },
                { name = "Vos taches de rousseur" },
            }
        },

        ["votre acné"] = {            
			b = {
                { name = "Acné", slidemax = 15, Description = "Le sexe de votre personnage"},
            }
        },

        ["vos rides"] = {            
			b = {
                { name = "Rides", slidemax = 15, Description = "Le sexe de votre personnage"},
            }
        },

        ["vos taches de rousseur"] = {            
			b = {
                { name = "Taches de rousseurs", slidemax = 15, Description = "Le sexe de votre personnage"},
            }
        },

        ["vos imperfections"] = {            
			b = {
                { name = "Imperfections", slidemax = 15, Description = "Le sexe de votre personnage"},
            }
        },

        ["votre tenue"] = {            
			b = {
                { name = "Tenue 1" },
				{ name = "Tenue 2" },
            }
        },

        ["votre sexe"] = {            
			b = {
                { name = "Sexe", slidemax = 2, Description = "Le sexe de votre personnage"},
			}
        },
        
        ["votre tête"] = {
			b = {
                { name = "Visage", slidemax = 14 },
			}
        },
        
        ["votre peau"] = {
			b = {
				{ name = "Peau", slidemax = 15, Description = "La peau de votre personnage"},
			}
        },

        ["vos yeux"] = {
			b = {
				{ name = "Yeux", slidemax = 20, Description = "Les yeux de votre personnage"},
			}
        },
        
        ["vos cheveux"] = {
			b = {
				{ name = "Cheveux", slidemax = 50, Description = "Les cheveux de votre personnage"},
			}
        },
        
        ["vos sourcils"] = {
			b = {
				{ name = "Sourcils", slidemax = 20, Description = "Les sourcils de votre personnage"},
			}
        },
        
        ["votre barbe"] = {
			b = {
				{ name = "Barbe", slidemax = 20, Description = "La barbe de votre personnage"},
			}
        },
        
        ["votre couleur pilositaire"] = {
			b = {
				{ name = "Couleur", slidemax = 15, Description = "La couleurs de votre pilosité de votre personnage"},
			}
		},
	}
}

function saveSkin()
    LoadingPrompt("Sauvegarde de votre personnalisation de personnage en cours", 3)

    local ped = GetPlayerPed(-1)
    local torso = GetPedDrawableVariation(ped, 3)
    local torsotext = GetPedTextureVariation(ped, 3)
    local leg = GetPedDrawableVariation(ped, 4)
    local legtext = GetPedTextureVariation(ped, 4)
    local shoes = GetPedDrawableVariation(ped, 6)
    local shoestext = GetPedTextureVariation(ped, 6)
    local accessory = GetPedDrawableVariation(ped, 7)
    local accessorytext = GetPedTextureVariation(ped, 7)
    local undershirt = GetPedDrawableVariation(ped, 8)
    local undershirttext = GetPedTextureVariation(ped, 8)
    local torso2 = GetPedDrawableVariation(ped, 11)
    local torso2text = GetPedTextureVariation(ped, 11)
    local prop_hat = GetPedPropIndex(ped, 0)
    local prop_hat_text = GetPedPropTextureIndex(ped, 0)
    local prop_glasses = GetPedPropIndex(ped, 1)
    local prop_glasses_text = GetPedPropTextureIndex(ped, 1)
    local prop_earrings = GetPedPropIndex(ped, 2)
    local prop_earrings_text = GetPedPropTextureIndex(ped, 2)
    local prop_watches = GetPedPropIndex(ped, 6)
    local prop_watches_text = GetPedPropTextureIndex(ped, 6)
    
    local skin_data = {["sex"]=gender,["face"]=face,["skin"]=skin,["eye_color"]=eyecolor,["complexion_1"]=skinproblem,["complexion_2"]=10,["moles_1"]=freckle,["moles_2"]=10,["age_1"]=wrinkle,["age_2"]=10,["eyebrows_1"]=eyebrow,["eyebrows_2"]=10,["beard_1"]=beard,["beard_2"]=10,["beard_3"]=beardcolor,["beard_4"]=beardcolor,["hair_1"]=hair,["hair_2"]=10,["hair_color_1"]=beardcolor,["hair_color_2"]=beardcolor,["arms"]=torso,["arms_2"]=torsotext,["pants_1"]=leg,["pants_2"]=legtext,["shoes_1"]=shoes,["shoes_2"]=shoestext,["chain_1"]=accessory,["chain_2"]=accessorytext,["tshirt_1"]=undershirt,["tshirt_2"]=undershirttext,["torso_1"]=torso2,["torso_2"]=torso2text,["helmet_1"]=prop_hat,["helmet_2"]=prop_hat_text,["glasses_1"]=prop_glasses,["glasses_2"]=prop_glasses_text,["ears_1"]=prop_earrings,["ears_2"]=prop_earrings_text,["watches_1"]=prop_watches,["watches_2"]=prop_watches_text}
    
    local charID = getCharID()

    TriggerServerEvent('corazon_character:saveSkin', skin_data, charID)

    Wait(5000)
    RemoveLoadingPrompt()
end
------------------------------------------------------------------------------
-- Grip Ped & Skin
local FirstSpawn     = true

RegisterNetEvent('corazon:spawnCharacterData')
AddEventHandler('corazon:spawnCharacterData', function()
    Citizen.CreateThread(function()
        if FirstSpawn then
            local charID = getCharID()

            if charID == 1 then

                TriggerServerCallback('corazon_character:getPlayerSkinOne', function(skin, ped)
                    if skin ~= nil then
                        TriggerEvent('skinchanger:loadSkin', skin)	
                    elseif skin == nil then
                        RemoveLoadingPrompt()
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)

                        TriggerEvent("corazon:createIdentity")
                    end
                end)

            elseif charID == 2 then

                TriggerServerCallback('corazon_character:getPlayerSkinTwo', function(skin, ped)
                    if skin ~= nil then
                        TriggerEvent('skinchanger:loadSkin', skin)	
                    elseif skin == nil then
                        RemoveLoadingPrompt()
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)

                        TriggerEvent("corazon:createIdentity")
                    end
                end)

            end
		end
	end)
end)


------------------------------------------------------------------------------
-- Spawn Ped



------------------------------------------------------------------------------
-- Spawn Skin


RegisterNetEvent("corazon.character:openCreationMenu")
AddEventHandler("corazon.character:openCreationMenu", function()
    RemoveLoadingPrompt()
    CreateMenu(creationPerso)
end)


RegisterCommand("character", function()
    CreateMenu(creationPerso)
end)