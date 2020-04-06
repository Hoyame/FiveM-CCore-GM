CCore = {}


function CCore.MilsWait(timer)
	Citizen.Wait(timer)
end

function CCore.SecWait(sec)
    local timer = sec * 1000
	Citizen.Wait(timer)
end

function CCore.CreateWhile(enabled, sec)
    local wait = sec * 1000

    Citizen.CreateThread(function()
        while enabled do

        end
    end)
end 

--------------------------------------------------------------------

--- ESX Functions

function getPedMugshot(ped, transparent)
	if DoesEntityExist(ped) then
		local mugshot

		if transparent then
			mugshot = RegisterPedheadshotTransparent(ped)
		else
			mugshot = RegisterPedheadshot(ped)
		end

		while not IsPedheadshotReady(mugshot) do
			Citizen.Wait(0)
		end

		return mugshot, GetPedheadshotTxdString(mugshot)
	else
		return
	end
end

function teleportEntity(entity, coords, cb)
	if DoesEntityExist(entity) then
		RequestCollisionAtCoord(coords.x, coords.y, coords.z)

		while not HasCollisionLoadedAroundEntity(entity) do
			RequestCollisionAtCoord(coords.x, coords.y, coords.z)
			Citizen.Wait(0)
		end

		SetEntityCoords(entity, coords.x, coords.y, coords.z, false, false, false, false)

		if type(coords) == 'table' and coords.heading then
			SetEntityHeading(entity, coords.heading)
		end
	end

	if cb then
		cb()
	end
end

function spawnObject(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))

	Citizen.CreateThread(function()
		ESX.Streaming.RequestModel(model)

		local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)

		if cb then
			cb(obj)
		end
	end)
end

function spawnVehicle(modelName, coords, heading, cb)
	local model = (type(modelName) == 'number' and modelName or GetHashKey(modelName))

	Citizen.CreateThread(function()
		ESX.Streaming.RequestModel(model)

		local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
		local id      = NetworkGetNetworkIdFromEntity(vehicle)

		SetNetworkIdCanMigrate(id, true)
		SetEntityAsMissionEntity(vehicle, true, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetModelAsNoLongerNeeded(model)

		RequestCollisionAtCoord(coords.x, coords.y, coords.z)

		while not HasCollisionLoadedAroundEntity(vehicle) do
			RequestCollisionAtCoord(coords.x, coords.y, coords.z)
			Citizen.Wait(0)
		end

		SetVehRadioStation(vehicle, 'OFF')

		if cb then
			cb(vehicle)
		end
	end)
end


function DeleteVehicle(vehicle)
	SetEntityAsMissionEntity(vehicle, false, true)
	DeleteVehicle(vehicle)
end

function DrawText3D(coords, text, size, font)
	coords = vector3(coords.x, coords.y, coords.z)

	local camCoords = GetGameplayCamCoords()
	local distance = #(coords - camCoords)

	if not size then size = 1 end
	if not font then font = 0 end

	local scale = (size / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	scale = scale * fov

	SetTextScale(0.0 * scale, 0.55 * scale)
	SetTextFont(font)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	SetDrawOrigin(coords, 0)
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end


function mathRound(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end

---------------------------------

function teleport(pos)
    pos.x = pos.x + 0.0
    pos.y = pos.y + 0.0
    pos.z = pos.z + 0.0

    RequestCollisionAtCoord(pos.x, pos.y, pos.z)

    while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
        RequestCollisionAtCoord(pos.x, pos.y, pos.z)
        Citizen.Wait(1)
    end

    SetEntityCoords(PlayerPedId(), pos.x, pos.y, pos.z)
end

function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end
	
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)
	
		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next
	
		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function LoadScaleform(scaleform)
    local text = RequestScaleformMovie(scaleform)

    if text ~= 0 then
        while not HasScaleformMovieLoaded(text) do
            Citizen.Wait(0)
        end
    end

    return text
end

function CreateNamedRenderTargetForModel(name, model)
    local text = 0
    if not IsNamedRendertargetRegistered(name) then
        RegisterNamedRendertarget(name, 0)
    end
    if not IsNamedRendertargetLinked(model) then
        LinkNamedRendertarget(model)
    end
    if IsNamedRendertargetRegistered(name) then
        text = GetNamedRendertargetRenderId(name)
    end

    return text
end

function CCore.RequestScaleform(args)
    if args ~= nil then
		local customScale = RequestScaleformMovie(args)
		
        while not HasScaleformMovieLoaded(customScale) do
            Citizen.Wait(1)
        end
        return customScale;
    end
end

function CCore.RequestScaleformModel(args)
    if args ~= nil then
        RequestModel(args)
        while not HasModelLoaded(args) do
            Citizen.Wait(100)
        end
        return args;
    end
end

function CCore.RequestAnimationDictionary(args)
    if args ~= nil then
		local animDict = RequestAnimDict(args)

        while not HasAnimDictLoaded(args) do
            Citizen.Wait(1)
        end
        return animDict;
    end
end

function CCore.RequestParticleDictionary(args)
    if args ~= nil then
		local dictionary = RequestNamedPtfxAsset(args)

        while not HasNamedPtfxAssetLoaded(args) do
            Citizen.Wait(1)
        end
        return dictionary;
    end
end

function CallScaleformMethod(scaleform, method, ...)
    local t
	local args = { ... }
	
    BeginScaleformMovieMethod(scaleform, method)
    for k, v in ipairs(args) do
        t = type(v)
        if t == 'string' then
            PushScaleformMovieMethodParameterString(v)
        elseif t == 'number' then
            if string.match(tostring(v), "%.") then
                PushScaleformMovieFunctionParameterFloat(v)
            else
                PushScaleformMovieFunctionParameterInt(v)
            end
        elseif t == 'boolean' then
            PushScaleformMovieMethodParameterBool(v)
        end
    end
    EndScaleformMovieMethod()
end

function SetScaleformParams(scaleform, data)
    data = data or {}
    for k, v in pairs(data) do
        PushScaleformMovieFunction(scaleform, v.name)
        if v.param then
            for _, par in pairs(v.param) do
                if math.type(par) == "integer" then
                    PushScaleformMovieFunctionParameterInt(par)
                elseif type(par) == "boolean" then
                    PushScaleformMovieFunctionParameterBool(par)
                elseif math.type(par) == "float" then
                    PushScaleformMovieFunctionParameterFloat(par)
                elseif type(par) == "string" then
                    PushScaleformMovieFunctionParameterString(par)
                end
            end
        end
        if v.func then
            v.func()
        end
        PopScaleformMovieFunctionVoid()
    end
end

function StreamingScaleform(Movie)
    if (Movie ~= nil) then
        ---@type table
        local customScale = RequestScaleformMovie(Movie)
        while not HasScaleformMovieLoaded(customScale) do
            Citizen.Wait(1)
        end
        --    Console:Logs(true, string.format("%s%s : %s", "^4", "Request scaleform", Movie))
        return customScale;
    else
        error("Missing argument : Movie")
    end
end

function createScaleform(name, data)
    if not name or string.len(name) <= 0 then
        return
    end
    local scaleform = StreamingScaleform(name)
    SetScaleformParams(scaleform, data)
    return scaleform
end

--------------------------------------------------------------------------------------------------------------------

RegisterCommand("clearPED", function()
    thePeds = EnumeratePeds()
    PedStatus = 0
    for ped in thePeds do
        PedStatus = PedStatus + 1
        if PedStatus >= 1 then
            if not (IsPedAPlayer(ped))then
                DeleteEntity(ped)
                RemoveAllPedWeapons(ped, true)
            end
        end
    end
end)
