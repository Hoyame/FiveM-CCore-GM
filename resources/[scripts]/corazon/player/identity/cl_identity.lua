Corazon.Identity = {}
Corazon.FakeIdentity = {}

function createMenuIdentity()
	RMenu.Add('identity', 'main', RageUI.CreateMenu(translate('my_personnage'), translate('my_personnage')))

	RMenu:Get('identity', 'main'):SetSubtitle(translate('my_personnage'))
	RMenu:Get('identity', 'main').Closed = function()
		-- TODO Perform action
	end;

	RageUI.CreateWhile(1.0, true, function()
		if RageUI.Visible(RMenu:Get('identity', 'main')) then
			
			RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
				
				RageUI.Button(translate('identity_nomrp'), translate('identity_nomrp'), { RightLabel = Corazon.Identity.Name }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.Identity.Name = KeyboardInput("Nom Complet", "Name", 25)
					end
				end)
		
				RageUI.Button(translate('identity_lieudn'), translate('identity_lieudn'), { RightLabel = Corazon.Identity.Lieu }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.Identity.Lieu = KeyboardInput("Lieu de naissance", "Blaine County", 25)
					end
				end)
		
				RageUI.Button("Date de naissance", "Date de naissance", { RightLabel = Corazon.Identity.Date }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.Identity.Date = KeyboardInput("Date de naissance", "03/06/1999", 25)
					end
				end)
		
				RageUI.Button("Sauvegarder & Continuer", "Sauvegarder & Continuer.", { RightBadge = RageUI.BadgeStyle.Tick, Color = {BackgroundColor = { 0, 120, 0, 25 }} }, true, function(Hovered, Active, Selected)  
					if (Selected) then
						local charID = getCharID()
		
						local nameIdentity = Corazon.Identity.Name
						local lieuIdentity = Corazon.Identity.Lieu
						local dateIdentity = Corazon.Identity.Date
		
						if not nameIdentity then 
							ShowAboveRadarMessage(translate('error_identity_creator')) return 
						elseif not lieuIdentity then
							ShowAboveRadarMessage(translate('error_identity_creator')) return 
						elseif not dateIdentity then
							ShowAboveRadarMessage(translate('error_identity_creator')) return 
						else
							TriggerServerEvent("corazon:saveIdentity", charID, nameIdentity, lieuIdentity, dateIdentity)
							LoadingPrompt("Sauvegarde de votre identité en cours", 3)
							Wait(2500)
							RageUI.CloseAll()
							RMenu:Delete('identity', 'main')
							TriggerEvent("corazon.character:openCreationMenu")
						end
					end
				end)
			end, function()
				---Panels
			end)
		end
	end, 1)
end

RegisterNetEvent("corazon:createIdentity")
AddEventHandler("corazon:createIdentity", function()
	local charID = getCharID()

	createMenuIdentity()

	Wait(2500)
	RageUI.Visible(RMenu:Get('identity', 'main'), not RageUI.Visible(RMenu:Get('identity', 'main')))
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function createMenuFakeIdentity()
	RMenu.Add('fakeidentity', 'main', RageUI.CreateMenu(translate('fake_identity'), translate('fake_identity')))

	RMenu:Get('fakeidentity', 'main'):SetSubtitle(translate('fake_identity'))
	RMenu:Get('fakeidentity', 'main').Closed = function()
		-- TODO Perform action
	end;

	RageUI.CreateWhile(1.0, true, function()
		if RageUI.Visible(RMenu:Get('fakeidentity', 'main')) then
			
			RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
				
				RageUI.Button(translate('identity_nomrp'), translate('identity_nomrp'), { RightLabel = Corazon.FakeIdentity.Name }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.FakeIdentity.Name = KeyboardInput("Nom Complet", "Name", 25)
					end
				end)
		
				RageUI.Button(translate('identity_lieudn'), translate('identity_lieudn'), { RightLabel = Corazon.FakeIdentity.Lieu }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.FakeIdentity.Lieu = KeyboardInput("Lieu de naissance", "Blaine County", 25)
					end
				end)
		
				RageUI.Button("Date de naissance", "Date de naissance", { RightLabel = Corazon.FakeIdentity.Date }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.FakeIdentity.Date = KeyboardInput("Date de naissance", "03/06/1999", 25)
					end
				end)
		
				RageUI.Button("Job", "Metier", { RightLabel = Corazon.FakeIdentity.Job }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.FakeIdentity.Job = KeyboardInput("Metier", "Zboubeur", 25)
					end
				end)

				RageUI.Button("Sauvegarder & Continuer", "Sauvegarder & Continuer.", { RightBadge = RageUI.BadgeStyle.Tick, Color = {BackgroundColor = { 0, 120, 0, 25 }} }, true, function(Hovered, Active, Selected)  
					if (Selected) then
						local charID = getCharID()
		
						local nameIdentity = Corazon.FakeIdentity.Name
						local lieuIdentity = Corazon.FakeIdentity.Lieu
						local jourIdentity = Corazon.FakeIdentity.Jour
						local jobIdentity  = Corazon.FakeIdentity.Job

		
						if not nameIdentity then 
							ShowAboveRadarMessage(translate('error_identity_creator')) return 
						elseif not lieuIdentity then
							ShowAboveRadarMessage(translate('error_identity_creator')) return 
						elseif not yearIdentity then
							ShowAboveRadarMessage(translate('error_identity_creator')) return 
						else
							TriggerServerEvent("corazon:saveFakeIdentity", charID, nameIdentity, lieuIdentity, dateIdentity, jobIdentity)
							RageUI.CloseAll()
							RMenu:Delete('fakeidentity', 'main')
						end
					end
				end)
			end, function()
				---Panels
			end)
		end
	end, 1)
end

RegisterNetEvent("corazon:createFakeIdentity")
AddEventHandler("corazon:createFakeIdentity", function()
	local charID = getCharID()

	createMenuFakeIdentity()

	Wait(250)
	RageUI.Visible(RMenu:Get('fakeidentity', 'main'), not RageUI.Visible(RMenu:Get('fakeidentity', 'main')))
end)

RegisterCommand("identity", function()
	createMenuIdentity()

	Wait(250)
	RageUI.Visible(RMenu:Get('identity', 'main'), not RageUI.Visible(RMenu:Get('identity', 'main')))
end)