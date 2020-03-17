local identityMenu = {
	Base = { Title = "Mon Personnage", Blocked = true },
	Data = { currentMenu = "identité" },
	Events = {
		onSelected = function(self, _, btn)
			if btn.name == "~g~Continuer" then
				local buttons, identityData = self.Menu["identité"].b, {}
				local charID = getCharID()

				identityData = {
					n = buttons[1].askValue or buttons[1].ask,
					l = buttons[2].askValue or buttons[2].ask,
					d = { buttons[3].slidename, buttons[4].slidename, buttons[5].slidename },
				}

				local nameIdentity = buttons[1].askValue or buttons[1].ask
				local lieuIdentity = buttons[2].askValue or buttons[2].ask
				local jourIdentity = buttons[3].slidename
				local moisIdentity = buttons[4].slidename
				local yearIdentity = buttons[5].slidename
				

				if not identityData or not identityData.l or string.len(identityData.l) <= 0 or not identityData.d or not identityData.d[1] or identityData.d[1] == "0" then 
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété la catégorie identité.") return 
                else
					TriggerServerEvent("corazon:saveIdentity", charID, nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity)
					LoadingPrompt("Sauvegarde de votre identité en cours", 3)
					Wait(2500)
					self:CloseMenu(true)
					TriggerEvent("corazon.character:openCreationMenu")
				end
			end
		end,
	},

	Menu = {
		["identité"] = {
			slidertime = 75,
			b = {
				{ name = "Nom RP", ask = "Nom + Prénom" },
				{ name = "Lieu de naissance", Description = "Où votre personnage est-il né?", ask = "Los Santos" },
				{ name = "Jour de naissance", slidemax = 31 },
				{ name = "Mois de naissance", slidemax = {"Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Décembre"} },
				{ name = "Année de naissance", slidemax = 2010 },
				{ name = "~g~Continuer" }
			}
		}
	}
}

RegisterNetEvent("corazon:createIdentity")
AddEventHandler("corazon:createIdentity", function()
	local charID = getCharID()

	CreateMenu(identityMenu)
end)


RegisterCommand("identité", function()
    TriggerEvent("corazon:createIdentity")
end)


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local fakeIdentityMenu = {
	Base = { Title = "Fausse Identité" },
	Data = { currentMenu = "fausse identité" },
	Events = {
		onSelected = function(self, _, btn)	
			if btn.name == "~g~Confirmer" then
				local buttons, identityData = self.Menu["fausse identité"].b, {}
				local charID = getCharID()

				
				identityData = {
					n = buttons[1].askValue or buttons[1].ask,
					l = buttons[2].askValue or buttons[2].ask,
					d = { buttons[3].slidename, buttons[4].slidename, buttons[5].slidename },
				}

				local nameIdentity = buttons[1].askValue or buttons[1].ask
				local lieuIdentity = buttons[2].askValue or buttons[2].ask
				local jourIdentity = buttons[3].slidename
				local moisIdentity = buttons[4].slidename
				local yearIdentity = buttons[5].slidename
				local jobIdentity = buttons[6].slidename
				


				if not identityData or not identityData.l or string.len(identityData.l) <= 0 or not identityData.d or tableCount(identityData.d) ~= 3 or not identityData.d[1] or identityData.d[1] == "0" then 
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété la catégorie identité.") return 
				else
					TriggerServerEvent("corazon:saveFakeIdentity", charID, nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity, jobIdentity)
                    self:CloseMenu(true)
				end
			end
		end,
	},

	Menu = {
		["fausse identité"] = {
			slidertime = 75,
			b = {
				{ name = "Nom RP", ask = "Nom + Prénom" },
				{ name = "Lieu de naissance", Description = "Où votre personnage est-il né?", ask = "Los Santos" },
				{ name = "Jour de naissance", slidemax = 31 },
				{ name = "Mois de naissance", slidemax = {"Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Décembre"} },
				{ name = "Année de naissance", slidemax = 2010 },
				{ name = "Job", ask = "Metier" },
				{ name = "~g~Confirmer" }
			}
		}
	}
}

RegisterCommand("fausseidentité", function()
	CreateMenu(fakeIdentityMenu)
end)


