function ShowAboveRadarMessage(msg, flash, saveToBrief, hudColorIndex)
	if saveToBrief == nil then saveToBrief = true end
	AddTextEntry('notif', msg)
	BeginTextCommandThefeedPost('notif')
	if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
	EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

function ShowHelpNotification(msg)
	AddTextEntry('zbiHelpNotification', msg)
	BeginTextCommandDisplayHelp('zbiHelpNotification')
	EndTextCommandDisplayHelp(0, false, true, -1)
end

function ShowAdvancedNotification(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
	if saveToBrief == nil then saveToBrief = true end
	AddTextEntry('esxAdvancedNotification', msg)
	BeginTextCommandThefeedPost('esxAdvancedNotification')
	if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
	EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
	EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

function LoadingPrompt(loadingText, spinnerType)

	if IsLoadingPromptBeingDisplayed() then
		RemoveLoadingPrompt()
	end

	if (loadingText == nil) then
		BeginTextCommandBusyString(nil)
	else
		BeginTextCommandBusyString("STRING");
		AddTextComponentSubstringPlayerName(loadingText);
	end

	EndTextCommandBusyString(spinnerType)
end

function DrawAdvancedText2(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

function createBlip(vectorPosX, vectorPosY, vectorPosZ, blipSprite, blipColor, blipText, blipText, blipScale, blipDisplay, blipAlpha)

	local blip = AddBlipForCoord(vectorPosX, vectorPosY, vectorPosZ)

	SetBlipSprite(blip, blipSprite)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, blipColor)
	SetBlipScale(blip, blipScale)
	SetBlipRoute(blip, blipText)
	SetBlipDisplay(blip, blipDisplay)
	SetBlipAlpha(blip, blipAlpha)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(blipText)
	EndTextCommandSetBlipName(blip)

	return blip

end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry("FMMC_KEY_TIP1", TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end


RegisterNetEvent("corazon:ShowAboveRadarMessage")
AddEventHandler("corazon:ShowAboveRadarMessage", ShowAboveRadarMessage)

RegisterNetEvent("corazon:ShowAdvancedNotification")
AddEventHandler("corazon:ShowAdvancedNotification", ShowAdvancedNotification)

RegisterNetEvent("corazon:ShowHelpNotification")
AddEventHandler("corazon:ShowHelpNotification", ShowHelpNotification)