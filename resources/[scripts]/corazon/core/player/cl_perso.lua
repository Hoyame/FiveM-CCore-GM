
function setPlayerPed(skin)
    local hash = skin
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(500)
    end
    SetPlayerModel(PlayerId(), hash)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetEntityAsMissionEntity(PlayerPedId(), true, true)
    SetModelAsNoLongerNeeded(PlayerPedId())
end

function setPlayerFaceCreator(ped, zboubi, skin)
    
    SetPedHeadBlendData(ped, zboubi.faceMum, zboubi.faceDad, 0, zboubi.faceMum, zboubi.faceDad, 0, zboubi.ressemblance, zboubi.skinMix, 0, false)
    SetPedFaceFeature(ped, 0, zboubi.noseWidth)
    SetPedFaceFeature(ped, 1, zboubi.nosePeakHeight)
    SetPedFaceFeature(ped, 2, zboubi.nosePeakLength)
    SetPedFaceFeature(ped, 3, zboubi.noseBoneHeight)
    SetPedFaceFeature(ped, 4, zboubi.nosePeaklowering)
    SetPedFaceFeature(ped, 5, zboubi.noseBoneTwist)
    SetPedFaceFeature(ped, 6, zboubi.eyebrowHeight)
    SetPedFaceFeature(ped, 7, zboubi.eyebrowForward)
    SetPedFaceFeature(ped, 8, zboubi.cheeksBoneHeight)
    SetPedFaceFeature(ped, 9, zboubi.cheeksBoneWidth)
    SetPedFaceFeature(ped, 11, zboubi.eyeOpening)
    SetPedFaceFeature(ped, 12, zboubi.lipsThickness)
    SetPedFaceFeature(ped, 13, zboubi.jawBoneWidth)
    SetPedFaceFeature(ped, 14, zboubi.jawBoneBackLength)
    SetPedFaceFeature(ped, 15, zboubi.chimpBoneLowering)
    SetPedFaceFeature(ped, 16, zboubi.chimpBoneLength)
    SetPedFaceFeature(ped, 17, zboubi.chimpBoneWidth)
    SetPedFaceFeature(ped, 18, zboubi.chimpHole)
    SetPedComponentVariation(ped, 2, zboubi.hairStyle, 0, 0)
    SetPedHairColor(ped, zboubi.hairColor[1], zboubi.hairColor[2])
    SetPedHeadOverlay(ped, 1, zboubi.beardStyle, zboubi.beardOpacity)
    SetPedHeadOverlayColor(ped, 1, 1, zboubi.beardColor[1], zboubi.beardColor[2])
    SetPedHeadOverlay(ped, 3, zboubi.ageingStyle, zboubi.ageingOpacity)
    SetPedHeadOverlay(ped, 8, zboubi.lipstickStyle, zboubi.lipstickOpacity)
    SetPedHeadOverlayColor(ped, 8, 1, zboubi.lipstickColor[1], zboubi.lipstickColor[2])
    SetPedHeadOverlay(ped, 4, zboubi.makeupStyle, zboubi.makeupOpacity)
    SetPedHeadOverlayColor(ped, 4, 1, zboubi.makeupColor[1], zboubi.makeupColor[2])
    SetPedEyeColor(ped, zboubi.eyeStyle)
    SetPedHeadOverlay(ped, 0, zboubi.blemishesStyle, zboubi.blemishesOpacity)
    SetPedHeadOverlay(ped, 6, zboubi.complexionStyle, zboubi.complexionStyle)
    SetPedHeadOverlay(ped, 7, zboubi.skinAspectStyle, zboubi.skinAspectOpacity)
    SetPedHeadOverlay(ped, 9, zboubi.frecklesStyle, zboubi.frecklesOpacity)

end

function setPlayerOutfits(ped, zboubi)

    SetPedComponentVariation(ped, 3, zboubi.torso.id, zboubi.torso.txt, 0)
    SetPedComponentVariation(ped, 4, zboubi.legs.id, zboubi.legs.txt, 0)
    SetPedComponentVariation(ped, 6, zboubi.feet.id, zboubi.feet.txt, 0)
    SetPedComponentVariation(ped, 7, zboubi.accessories.id, zboubi.accessories.txt, 0)
    SetPedComponentVariation(ped, 8, zboubi.undershirt.id, zboubi.undershirt.txt, 0)
    SetPedComponentVariation(ped, 10, zboubi.texture.id, zboubi.texture.txt, 0)
    SetPedComponentVariation(ped, 11, zboubi.tops.id, zboubi.tops.txt, 0)

    if zboubi.mask.toggle == true then
        SetPedComponentVariation(ped, 1, zboubi.mask.id, zboubi.mask.txt, 0)
    elseif zboubi.mask.toggle == false then
        SetPedComponentVariation(ped, 1, 0, 0, 0)
    elseif zboubi.body_armor.id ~= -1 then
        SetPedComponentVariation(ped, 5, zboubi.backpacks.id, zboubi.backpacks.txt, 0)
    elseif zboubi.body_armor.id ~= -1 then
        SetPedComponentVariation(ped, 9, zboubi.body_armor.id, zboubi.body_armor.txt, 0)
    elseif zboubi.hat.toggle == true then
        SetPedPropIndex(ped, 0, zboubi.hat.id, zboubi.hat.txt, 0)
    elseif zboubi.hat.toggle == false then
        ClearPedProp(ped, 0)
    elseif zboubi.glasses.toggle == true then
        SetPedPropIndex(ped, 1, zboubi.glasses.id, zboubi.glasses.txt, 0)
    elseif zboubi.glasses.toggle == falsr then
        ClearPedProp(ped, 1)
    elseif zboubi.ears.toggle == true then
        SetPedPropIndex(ped, 2, zboubi.ears.id, zboubi.ears.txt, 0)
    elseif zboubi.ears.toggle == false then
        ClearPedProp(ped, 2)
    elseif zboubi.watches.toggle == true then
        SetPedPropIndex(ped, 6, zboubi.watches.id, zboubi.watches.txt, 0)
    elseif zboubi.watches.toggle == false then
        ClearPedProp(ped, 6)
    elseif zboubi.bracelets.toggle == true then
        SetPedPropIndex(ped, 7, zboubi.bracelets.id, zboubi.bracelets.txt, 0)
    elseif zboubi.bracelets.toggle == false then
        ClearPedProp(ped, 7)
    end

end
