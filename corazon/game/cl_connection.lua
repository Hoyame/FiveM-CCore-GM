local zbi = false

local function CinematiqueStuffDelete()

	--updateVar("cinemaMode", 0)
	ClearFocus()
	RenderScriptCams(0, 0, 3000, 1, 1, 0)

	if GetEntityModel(GetPlayerPed(-1)) ~= GetHashKey("player_zero") then DoScreenFadeIn(500) --[[print("re-init")--]] end

	TriggerMusicEvent("GLOBAL_KILL_MUSIC")
	PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	if ONESYNC_ENABLED then NetworkSetTalkerProximity(10.0) end
	ShowAboveRadarMessage("~g~Connectée au serveur")
	TriggerEvent("corazon_core:getPlayerData")

end

local function firstFunction()

	TriggerEvent('chat:clear')  --- Clear current chat
	TriggerEvent('chat:toggleChat') --- Toggle chat chat
	SetEntityVisible(playerPed, false, 0) --- Make Player Invisible
	SetEntityCoordsNoOffset(playerPed, -103.8, -921.06, 287.29, false, false, false, true) --- Teleport Infront of Maze Bank IN Air
	FreezeEntityPosition(playerPed, true) --- Freeze The Player There
	SetFocusEntity(playerPed) ---- Focus on the player (To Render the building)
	PrepareMusicEvent("FM_INTRO_START")
	Wait(1)
	SetOverrideWeather("EXTRASUNNY")
	NetworkOverrideClockTime(19, 0, 0)
	BeginSrl()
	introstep = 1
	isinintroduction = true
	Wait(1)
	DoScreenFadeIn(500)

	local introcam
	introstep = 1

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			ShowHelpNotification("Appuyez sur ~INPUT_FRONTEND_ACCEPT~ pour vous connecter au serveur.")

			if IsControlJustPressed(1, 18) then
				DoScreenFadeOut(500)
				Citizen.Wait(500)
				DestroyCam(cam)
				CinematiqueStuffDelete()
				TriggerEvent('corazon:playerSpawned')
				CancelMusicEvent("MIC3_INTRO")
				return
			end
		end
	end)

	while true do
		Wait(0)
		if introstep == 1 then

			introcam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
			SetCamActive(introcam, true)
			SetFocusArea(754.2219, 1226.831, 356.5081, 0.0, 0.0, 0.0)
			SetCamParams(introcam, 754.2219, 1226.831, 356.5081, -14.367, 0.0, 157.3524, 42.2442, 0, 1, 1, 2)
			SetCamParams(introcam, 740.7797, 1193.923, 351.1997, -9.6114, 0.0, 157.8659, 44.8314, 7200, 0, 0, 2)
			ShakeCam(introcam, "HAND_SHAKE", 0.15)
			RenderScriptCams(true, false, 3000, 1, 1)
			introstep = 2

		elseif introstep == 2 then

			DoScreenFadeOut(800)
			Wait(800)
			SetFocusArea(-259.36859130859375, -553.8571166992188, 142.60479736328125, 0.0, 0.0, 0.0)
			NetworkOverrideClockTime(19, 0, 0)
			Wait(320)
			DoScreenFadeIn(800)
			SetCamParams(introcam, -259.36859130859375, -553.8571166992188, 142.60479736328125, 13.275199890136719, 0.5186, -143.33779907226562, 44.9958992, 0, 1, 1, 2)
			SetCamParams(introcam, -259.36859130859375, -553.8571166992188, 142.60479736328125, 13.275199890136719, 0.5186, -143.33779907226562, 44.9958992, 6000, 0, 0, 2)
			introstep = 3

		elseif introstep == 3 then

			DoScreenFadeOut(800)
			Wait(800)
			SetFocusArea(-1071.044, -2979.413, 42.35216, 0.0, 0.0, 0.0)
			NetworkOverrideClockTime(19, 0, 0)
			Wait(320)
			DoScreenFadeIn(800)
			SetCamParams(introcam, -4.6668, -900.9735717773438, 184.88699340820312, 1.6106, 0.5186, 78.37860107421875, 45.0069, 0, 1, 1, 2)
			SetCamParams(introcam, -23.008699417114258, -896.4287719726562, 184.1938934326172, -2.8529, 0.5186, 81.82620239257812, 45.0069, 8000, 0, 0, 2)
			introstep = 4

		elseif introstep == 4 then

			DoScreenFadeOut(800)
			Wait(800)
			SetFocusArea(228.18919372558594, -1006.7584228515625, -96.8311, 0.0, 0.0, 0.0)
			NetworkOverrideClockTime(19, 0, 0)
			Wait(320)
			DoScreenFadeIn(800)
			SetCamParams(introcam, 228.18919372558594, -1006.7584228515625, -96.8311, -13.0682, 0.0572, 0.7306, 40.033, 0, 1, 1, 2)
			SetCamParams(introcam, 228.24929809570312, -1006.1546020507812, -98.19760131835938, -2.3097, 0.0572, 0.7306, 40.033, 6000, 0, 0, 2)
	
		end
	end
end

AddEventHandler("playerSpawned", firstFunction)


AddEventHandler("onResourceStart", function(r)

	if r ~= GetCurrentResourceName() then return end
	Citizen.Wait(4000)
	TriggerServerEvent("corazon:firstJoinEvent")

end)


RegisterCommand("zboubette", function()
	firstFunction()
end)