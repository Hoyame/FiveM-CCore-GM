Corazon.Connexion = {}
Corazon.Connexion.Anim = {}

------------------------------------------------

function Corazon.Connexion.Anim:upAnim()
	SwitchOutPlayer(PlayerPedId(), 0, 1)
	LoadingPrompt("Chargement en cours", 1)

	PrepareMusicEvent("MIC3_INTRO")
	TriggerMusicEvent("MIC3_INTRO")

	Wait(12500)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			ShowHelpNotification("Appuyez sur ~INPUT_FRONTEND_ACCEPT~ pour vous connecter au serveur.")

			if IsControlJustPressed(1, 18) then
				TriggerEvent('corazon:playerSpawned')
				CancelMusicEvent("MIC3_INTRO")
				Corazon.Connexion.Anim:Connected()
				return
			end
		end
	end)
end

function Corazon.Connexion.Anim:downAnim()
	SwitchInPlayer(PlayerPedId())
	RemoveLoadingPrompt()
end

function Corazon.Connexion.Anim:Connected()

	TriggerEvent("corazon:loadPlayer")
	TriggerMusicEvent("GLOBAL_KILL_MUSIC")
	
	Wait(10)

	Corazon.Connexion.Anim:downAnim()

	Wait(7500)

	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	ShowAboveRadarMessage("~g~Connectée au serveur")
end

------------------------------------------------

local function firstFunction()
	Corazon.Connexion.Anim:upAnim()
end

AddEventHandler("playerSpawned", firstFunction)



