local activeBars = {}

function showLoadingPrompt(showText, showTime, showType)

	Citizen.CreateThread(function()

		Citizen.Wait(0)
		N_0xaba17d7ce615adbf("STRING")
		AddTextComponentString(showText)
		N_0xbd12f8228410d9b4(showType)
		Citizen.Wait(showTime)
		N_0x10d373323e5b9c0d()
	end)
end

function drawTxt(x,y,scale, text, f,c,n, a)

	a = a or 255

	if not r then r = 255 g = 255 b = 255 end
	if not f then f = 4 end

	SetTextFont(f)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextCentre(c)

	if not n then
		SetTextDropShadow()
		SetTextOutline()
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(2, 0, 0, 0, 255)
	end

	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)

end

function ShowAboveRadarMessage(message, back)

	if back then Citizen.InvokeNative(0x92F0DA1E27DB96DC, back) end
	SetNotificationTextEntry("jamyfafi")
	AddTextComponentString(message)
	if string.len(message) > 99 and AddLongString then AddLongString(message) end
	return DrawNotification(0, 1)

end

function ShowHelpNotification(msg)
	--if not IsHelpMessageBeingDisplayed() then
		AddTextEntry('esxHelpNotification', msg)
		BeginTextCommandDisplayHelp('esxHelpNotification')
		EndTextCommandDisplayHelp(0, false, true, -1)
	--end
end

function drawScrTxt(x, y, w, h, f, s, text, outline, center, wr)

	SetTextFont(f)
	SetTextScale(s, s)
	SetTextColour(255, 255, 255, 255)

	if center then
		SetTextCentre(true)
	end

	SetTextDropShadow()

	if outline then
		SetTextOutline()
	end

	if wr then
		SetTextWrap(0.0, xSMS + 0.125)
	end

	SetTextEntry("jamyfafi")
	AddTextComponentString(text)
	if string.len(text) > 99 and AddLongString then AddLongString(text) end
	DrawText(x - w / 2, y - h / 2 + 0.005)

end

function drawTopNotification(txt, beep)

	SetTextComponentFormat("jamyfafi")
	AddTextComponentString(txt)
	if string.len(txt) > 99 and AddLongString then AddLongString(txt) end
	DisplayHelpTextFromStringLabel(0, 0, beep, -1)

end

function drawCustomNotif(txt)

	SetNotificationTextEntry("jamyfafi")
	AddTextComponentString(txt)
	if string.len(txt) > 99 and AddLongString then AddLongString(txt) end
	Citizen.InvokeNative(0x1E6611149DB3DB6B, "CHAR_SOCIAL_CLUB", "CHAR_SOCIAL_CLUB", 0, 0, "mee", "qsdqsdsdqqsd", 1.0)
	DrawNotification(0, 1)

end

function ShowAboveRadarMessageIcon(icon, intType, sender, title, text, back)

	if type(icon) == "number" then

		local ped = GetPlayerPed(GetPlayerFromServerId(icon))
		icon = ped and GetPedHeadshot(ped) or GetPedHeadshot(PlayerPedId())

	elseif not HasStreamedTextureDictLoaded(icon) then

		RequestStreamedTextureDict(icon, false)
		while not HasStreamedTextureDictLoaded(icon) do Wait(0) end

	end

	if back then
		SetNotificationBackgroundColor(back)
	end

	SetNotificationTextEntry("jamyfafi")
	AddTextComponentString(text)
	if string.len(text) > 99 and AddLongString then AddLongString(text) end

	SetNotificationMessage(icon, icon, true, intType, sender, title)
	SetStreamedTextureDictAsNoLongerNeeded(icon)
	return DrawNotification(0, 1)

end

function drawCenterText(msg, time)

	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(msg)
	DrawSubtitleTimed(time and math.ceil(time) or 0, true)

end

local done

function moveRightPos(p, ent, interiorLoad)

	done = true
	DoScreenFadeOut(100)
	Citizen.Wait(100)
	done = setEntCoords(p, ent, interiorLoad)

	while not done do
		Citizen.Wait(0)
	end

	DoScreenFadeIn(100)

end

function setEntCoords(pos, ent, interiorLoad)

	if not pos or not pos.x or not pos.y or not pos.z or (ent and not DoesEntityExist(ent)) then return true end
	local x, y, z = pos.x, pos.y, pos.z
	ent = ent or GetPlayerPed(-1)
	RequestCollisionAtCoord(x, y, z)
	local tempTimer = GetGameTimer()
	SetEntityCoordsNoOffset(ent, x, y, z + 1.0)
	tempTimer = GetGameTimer()

	while not HasCollisionLoadedAroundEntity(ent) do

		if GetGameTimer() - tempTimer > 2000 then
			break
		end
		Citizen.Wait(0)

	end

	if interiorLoad then
		LoadInterior(interiorLoad)

		while not IsInteriorReady(interiorLoad)  do
			Citizen.Wait(100)
		end
	end

	local foundNewZ, newZ = GetGroundZCoordWithOffsets(x, y, z)
	tempTimer = GetGameTimer()

	while not foundNewZ do
		z = z + 10.0
		foundNewZ, newZ = GetGroundZCoordWithOffsets(x, y, z)
		Wait(0)

		if GetGameTimer() - tempTimer > 2000 then
			break
		end
	end

	SetEntityCoordsNoOffset(ent, x, y, foundNewZ and newZ or z)
	if type(pos) ~= "vector3" and pos.a then SetEntityHeading(ent, pos.a) end
	return true

end

function AddLongString(txt)

	for i = 100, string.len(txt), 99 do
		local sub = string.sub(txt, i, i + 99)
		AddTextComponentString(sub)
	end

end

function createBlip(vectorPosX, vectorPosY, vectorPosZ, intSprite, intColor, stringText, boolRoad, floatScale, intDisplay, intAlpha)

	local blip = AddBlipForCoord(vectorPosX, vectorPosY, vectorPosZ)

	SetBlipSprite(blip, intSprite)
	SetBlipAsShortRange(blip, true)

	if intColor then SetBlipColour(blip, intColor) end
	if floatScale then SetBlipScale(blip, floatScale) end
	if boolRoad then SetBlipRoute(blip, boolRoad) end
	if intDisplay then SetBlipDisplay(blip, intDisplay) end
	if intAlpha then SetBlipAlpha(blip, intAlpha) end
	if stringText and (not intDisplay or intDisplay ~= 8) then

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(stringText)
		EndTextCommandSetBlipName(blip)

	end

	return blip

end

function RequestAndWaitModel(modelName)

	if modelName and IsModelInCdimage(modelName) and not HasModelLoaded(modelName) then
		RequestModel(modelName)
		while not HasModelLoaded(modelName) do Citizen.Wait(100) end
	end

end

function RequestAndWaitDict(dictName)

	if dictName and DoesAnimDictExist(dictName) and not HasAnimDictLoaded(dictName) then
		RequestAnimDict(dictName)
		while not HasAnimDictLoaded(dictName) do Citizen.Wait(100) end
	end

end

function getVehicleHealth(entityVeh)

	return math.floor( math.max(0, math.min(100, GetVehicleEngineHealth(entityVeh) / 10 ) ) )

end


-- Get entity's ID and coords from where player sis targeting
function Target(Distance, Ped)
	local Entity = nil
	local camCoords = GetGameplayCamCoord()
	local farCoordsX, farCoordsY, farCoordsZ = GetCoordsFromCam(Distance)
	local RayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, farCoordsX, farCoordsY, farCoordsZ, -1, Ped, 0)
    local A,B,C,D,Entity = GetRaycastResult(RayHandle)
    
	return Entity, farCoordsX, farCoordsY, farCoordsZ
end