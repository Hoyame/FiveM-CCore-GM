--- J'ai regarder comment faire des menus pour le slider, heritage, couleur sur flashland v5 car il y'a pas dans le wiki
--[[
-- variables hairListM hairListF & celles ci dessous prises de flashland v5

local rideList = { "-", "Rides yeux", "Rides 1", "Rides 2", "Rides 3", "Rides 4", "Rides 5", "Rides 6", "Rides 7", "Rides 8", "Rides 9", "Rides 10", "Rides EX 1", "Rides EX 2", "Cernes" }
local tachList = { "-", "Peu de tâches", "Tâches peu visibles", "Tâches baladées", "Tâches éparpillées", "Tâches sauvages", "Tâches centrées", "Tâches joues", "Tâches visage", "Infection visage", "Infection joues", "Rougeur", "Rougeur infectée", "Rougeurs front", "Acnée", "Acnée sévère", "Acnée baladée", "Acnée épaisse", "Acnée front", "Acnée totale" }
local eyesList = { "Vert", "Emmeraude", "Bleu", "Bleu ciel", "Marron clair", "Marron", "Noisette", "Gris sombre", "Gris propre", "Rose", "Jaune", "Violet", "Blackout", "Ombre grise", "Soleil tequila", "Atomic", "Faux", "Cola", "Ranger", "Ying-yang", "Bull", "Lezard", "Dragon", "Extra-terrestre", "Chèvre", "Smiley", "Possédé", "Démon", "Infecté", "Alien", "Mort", "Zombie" }
local spawnInProgress = false

local BarbeName = {}
for i = 1, 29, 1 do
    BarbeName[i] = GetLabelText("CC_BEARD_" .. i - 1)
end

local SKClist = { "-" }
for i = 0, 11, 1 do
    table.insert(SKClist, GetLabelText("CC_SKINCOM_" .. i))
end

local MoleList = { "-" }

for i = 0, 18, 1 do
    table.insert(MoleList, GetLabelText("CC_MOLEFRECK_" .. i))
end

local ComplexList = { "-" }
for i = 1, 11, 1 do
    table.insert(ComplexList, GetLabelText("CC_MOLEFRECK_" .. i))
end

local MaquillageList = { "-" }
for i = 1, 71, 1 do
    table.insert(MaquillageList, GetLabelText("CC_MKUP_" .. i))
end

local LipsList = { "-" }
for i = 1, 10, 1 do
    table.insert(LipsList, GetLabelText("CC_LIPSTICK_" .. i))
end

local colorsPanel = {
    haircut = {
        [1] = 1,
        [2] = 1,
    },
    barber = {
        [1] = 1,
        [2] = 1,
    },
    lipstick = {
        [1] = 1,
        [2] = 1,
    },
    makeup = {
        [1] = 1,
        [2] = 1,
    }
}



local Items = {
    mp_m_freemode_01 = {
        [1] = {
            List = { "Standard", "Protubérant", "Plat", "-" },
            Index = 1,
        },
        [2] = {
            List = { "Standard", "Ouverts", "Plissés", "-" },
            Index = 1,
        },
        [3] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        [4] = {
            List = { "Standard", "Saillante", "Incurvée", "-" },
            Index = 1,
        },
        [5] = {
            List = { "Standard", "Cassé", "Vers le haut", "-" },
            Index = 1,
        },
        [6] = {
            List = { "Standard", "Larges", "Fines", "-" },
            Index = 1,
        },
        [7] = {
            List = { "Standard", "Grosses", "Minces", "-" },
            Index = 1,
        },
        [8] = {
            List = { "Standard", "Épaisses", "Minces", "-" },
            Index = 1,
        },
        [9] = {
            List = { "Standard", "Carrée", "Ronde", "-" },
            Index = 1,
        },
        [10] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        [11] = {
            List = { "Standard", "Pointu", "Rond", "-" },
            Index = 1,
        },
    },

    mp_f_freemode_01 = {
        [1] = {
            List = { "Standard", "Protubérant", "Plat", "-" },
            Index = 1,
        },
        [2] = {
            List = { "Standard", "Ouverts", "Plissés", "-" },
            Index = 1,
        },
        [3] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        [4] = {
            List = { "Standard", "Saillante", "Incurvée", "-" },
            Index = 1,
        },
        [5] = {
            List = { "Standard", "Cassé", "Vers le haut", "-" },
            Index = 1,
        },
        [6] = {
            List = { "Standard", "Larges", "Fines", "-" },
            Index = 1,
        },
        [7] = {
            List = { "Standard", "Grosses", "Minces", "-" },
            Index = 1,
        },
        [8] = {
            List = { "Standard", "Épaisses", "Minces", "-" },
            Index = 1,
        },
        [9] = {
            List = { "Standard", "Carrée", "Ronde", "-" },
            Index = 1,
        },
        [10] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        [11] = {
            List = { "Standard", "Pointu", "Rond", "-" },
            Index = 1,
        },
    }
}
local self = {
    FACE_F_BROW = false,
    FACE_F_EYES = false,
    FACE_F_NOSE = false,
    FACE_F_NOSEP = false,
    FACE_F_NOSET = false,
    FACE_F_CHEEK = false,
    FACE_F_CHEEKS = false,
    FACE_F_LIPS = false,
    FACE_F_JAW = false,
    FACE_F_CHIN = false,
    FACE_F_CHINS = false,
    FACE_HAIR = false,
    FACE_BEARD = false,
    FACE_SKINISSUES = false,
    FACE_OLDNESS = false,
    FACE_TINT = false,
}

]]

local HeritageMom = { "Laila", "Jasmine", "Khadija", "Hannan", "Hasna", "Samira", "Ines", "Lina", "Amira", "Luna", "Aya", "Noûr", "Fatima", "Amina", "Aicha", "Myriam", "Leila", "Emira", "Selma", "Jana", "Manël", "Bouchra" }
local HeritageDad = { "Azize", "Mustapha", "Jibril", "Walid", "Mohammed", "Merwan", "Ali", "Hassan", "Nabil", "Momo", "Karim", "Rayan", "Mehdi", "Yussuf", "Akram", "Ismail", "Ilyess", "Naïm", "Youness", "Youssef", "Ayoub", "Wassim", "Aymen" }
local sexChoice = { "Homme", "Femme" }
local hairListM = {
    { ID = 0, name = "Chauve" },
    { ID = 2, name = "Longue queue", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 3, name = "Chignon", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 5, name = "Queue courte", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 6, name = "Biker", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 7, name = "Pecno", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 8, name = "Macbeat" },
    { ID = 9, name = "Trunks", collection = "multiplayer_overlays", overlay = "NG_M_Hair_012" },
    { ID = 10, name = "Coiffure 10", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 11, name = "Coiffure 11", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 12, name = "Coiffure 12", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 37, name = "Court" },
    { ID = 38, name = "Faux Hawk", collection = "multiplayer_overlays", overlay = "NG_M_Hair_002" },
    { ID = 39, name = "Hipster", collection = "multiplayer_overlays", overlay = "NG_M_Hair_003" },
    { ID = 40, name = "Side Parting", collection = "multiplayer_overlays", overlay = "NG_M_Hair_004" },
    { ID = 41, name = "Shorter Cut", collection = "multiplayer_overlays", overlay = "NG_M_Hair_005" },
    { ID = 42, name = "Biker", collection = "multiplayer_overlays", overlay = "NG_M_Hair_006" },
    { ID = 43, name = "Ponytail", collection = "multiplayer_overlays", overlay = "NG_M_Hair_007" },
    { ID = 44, name = "Cornrows", collection = "multiplayer_overlays", overlay = "NG_M_Hair_008" },
    { ID = 45, name = "Slicked", collection = "multiplayer_overlays", overlay = "NG_M_Hair_009" },
    { ID = 46, name = "Short Brushed", collection = "multiplayer_overlays", overlay = "NG_M_Hair_013" },
    { ID = 47, name = "Spikey", collection = "multiplayer_overlays", overlay = "NG_M_Hair_002" },
    { ID = 48, name = "Caesar", collection = "multiplayer_overlays", overlay = "NG_M_Hair_011" },
    { ID = 49, name = "Chopped", collection = "multiplayer_overlays", overlay = "NG_M_Hair_012" },
    { ID = 50, name = "Dreads", collection = "multiplayer_overlays", overlay = "NG_M_Hair_014" },
    { ID = 51, name = "Long Hair", collection = "multiplayer_overlays", overlay = "NG_M_Hair_015" },
    { ID = 52, name = "Shaggy Curls", collection = "multiplayer_overlays", overlay = "NGBea_M_Hair_000" },
    { ID = 53, name = "Surfer Dude", collection = "multiplayer_overlays", overlay = "NGBea_M_Hair_001" },
    { ID = 54, name = "Short Side Part", collection = "multiplayer_overlays", overlay = "NGBus_M_Hair_000" },
    { ID = 55, name = "High Slicked Sides", collection = "multiplayer_overlays", overlay = "NGBus_M_Hair_001" },
    { ID = 56, name = "Long Slicked", collection = "multiplayer_overlays", overlay = "NGHip_M_Hair_000" },
    { ID = 57, name = "Hipster Youth", collection = "multiplayer_overlays", overlay = "NGHip_M_Hair_001" },
    { ID = 58, name = "Mullet", collection = "multiplayer_overlays", overlay = "NGInd_M_Hair_000" },
    { ID = 59, name = "Classic Cornrows", collection = "mplowrider_overlays", overlay = "LR_M_Hair_000" },
    { ID = 60, name = "Palm Cornrows", collection = "mplowrider_overlays", overlay = "LR_M_Hair_001" },
    { ID = 61, name = "Lightning Cornrows", collection = "mplowrider_overlays", overlay = "LR_M_Hair_002" },
    { ID = 62, name = "Whipped Cornrows", collection = "mplowrider_overlays", overlay = "LR_M_Hair_003" },
    { ID = 63, name = "Zig Zag Cornrows", collection = "mplowrider2_overlays", overlay = "LR_M_Hair_004" },
    { ID = 64, name = "Snail Cornrows", collection = "mplowrider2_overlays", overlay = "LR_M_Hair_005" },
    { ID = 65, name = "Hightop", collection = "mplowrider2_overlays", overlay = "LR_M_Hair_006" },
    { ID = 66, name = "Loose Swept Back", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_000_M" },
    { ID = 67, name = "Undercut Swept Back", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_001_M" },
    { ID = 68, name = "Undercut Swept Side", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_002_M" },
    { ID = 69, name = "Spiked Mohawk", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_003_M" },
    { ID = 70, name = "Mod", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_004_M" },
    { ID = 71, name = "Layered Mod", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_005_M" },
    { ID = 72, name = "Flattop", collection = "mpgunrunning_overlays", overlay = "MP_Gunrunning_Hair_M_000_M" },
    { ID = 73, name = "Military Buzzcut", collection = "mpgunrunning_overlays", overlay = "MP_Gunrunning_Hair_M_001_M" },
}

local hairListF = {
    { ID = 0, name = "Crâne rasé", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 1, name = "Long", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 2, name = "Coiffure 03", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 3, name = "Court", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 4, name = "Coiffure 04", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 5, name = "Long épaule", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 6, name = "Coiffure 06", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 7, name = "Dread", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 8, name = "Coiffure 08" },
    { ID = 9, name = "Coiffure 09", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 10, name = "Coiffure 10", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 11, name = "Coiffure 11", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 12, name = "Coiffure 12", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 13, name = "Coiffure 13", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 14, name = "Coiffure 14", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 15, name = "Coiffure 15", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 16, name = "Coiffure 16", collection = "mpbeach_overlays", overlay = "FM_Hair_Fuzz" },
    { ID = 39, name = "Short", collection = "multiplayer_overlays", overlay = "NG_F_Hair_001" },
    { ID = 40, name = "Layered Bob", collection = "multiplayer_overlays", overlay = "NG_F_Hair_002" },
    { ID = 41, name = "Pigtails", collection = "multiplayer_overlays", overlay = "NG_F_Hair_003" },
    { ID = 42, name = "Ponytail", collection = "multiplayer_overlays", overlay = "NG_F_Hair_004" },
    { ID = 43, name = "Braided Mohawk", collection = "multiplayer_overlays", overlay = "NG_F_Hair_005" },
    { ID = 44, name = "Braids", collection = "multiplayer_overlays", overlay = "NG_F_Hair_006" },
    { ID = 45, name = "Bob", collection = "multiplayer_overlays", overlay = "NG_F_Hair_007" },
    { ID = 46, name = "Faux Hawk", collection = "multiplayer_overlays", overlay = "NG_F_Hair_008" },
    { ID = 47, name = "French Twist", collection = "multiplayer_overlays", overlay = "NG_F_Hair_009" },
    { ID = 48, name = "Long Bob", collection = "multiplayer_overlays", overlay = "NG_F_Hair_010" },
    { ID = 49, name = "Loose Tied", collection = "multiplayer_overlays", overlay = "NG_F_Hair_011" },
    { ID = 50, name = "Pixie", collection = "multiplayer_overlays", overlay = "NG_F_Hair_012" },
    { ID = 51, name = "Shaved Bangs", collection = "multiplayer_overlays", overlay = "NG_F_Hair_013" },
    { ID = 52, name = "Top Knot", collection = "multiplayer_overlays", overlay = "NG_M_Hair_014" },
    { ID = 53, name = "Wavy Bob", collection = "multiplayer_overlays", overlay = "NG_M_Hair_015" },
    { ID = 54, name = "Messy Bun", collection = "multiplayer_overlays", overlay = "NGBea_F_Hair_000" },
    { ID = 55, name = "Pin Up Girl", collection = "multiplayer_overlays", overlay = "NGBea_F_Hair_001" },
    { ID = 56, name = "Tight Bun", collection = "multiplayer_overlays", overlay = "NG_F_Hair_007" },
    { ID = 57, name = "Twisted Bob", collection = "multiplayer_overlays", overlay = "NGBus_F_Hair_000" },
    { ID = 58, name = "Flapper Bob", collection = "multiplayer_overlays", overlay = "NGBus_F_Hair_001" },
    { ID = 59, name = "Big Bangs", collection = "multiplayer_overlays", overlay = "NGBea_F_Hair_001" },
    { ID = 60, name = "Braided Top Knot", collection = "multiplayer_overlays", overlay = "NGHip_F_Hair_000" },
    { ID = 61, name = "Mullet", collection = "multiplayer_overlays", overlay = "NGInd_F_Hair_000" },
    { ID = 62, name = "Pinched Cornrows", collection = "mplowrider_overlays", overlay = "LR_F_Hair_000" },
    { ID = 63, name = "Leaf Cornrows", collection = "mplowrider_overlays", overlay = "LR_F_Hair_001" },
    { ID = 64, name = "Zig Zag Cornrows", collection = "mplowrider_overlays", overlay = "LR_F_Hair_002" },
    { ID = 65, name = "Pigtail Bangs", collection = "mplowrider2_overlays", overlay = "LR_F_Hair_003" },
    { ID = 66, name = "Wave Braids", collection = "mplowrider2_overlays", overlay = "LR_F_Hair_003" },
    { ID = 67, name = "Coil Braids", collection = "mplowrider2_overlays", overlay = "LR_F_Hair_004" },
    { ID = 68, name = "Rolled Quiff", collection = "mplowrider2_overlays", overlay = "LR_F_Hair_006" },
    { ID = 69, name = "Loose Swept Back", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_000_F" },
    { ID = 70, name = "Undercut Swept Back", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_001_F" },
    { ID = 71, name = "Undercut Swept Side", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_002_F" },
    { ID = 72, name = "Spiked Mohawk", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_003_F" },
    { ID = 73, name = "Bandana and Braid", collection = "multiplayer_overlays", overlay = "NG_F_Hair_003" },
    { ID = 74, name = "Layered Mod", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_006_F" },
    { ID = 75, name = "Skinbyrd", collection = "mpbiker_overlays", overlay = "MP_Biker_Hair_004_F" },
    { ID = 76, name = "Neat Bun", collection = "mpgunrunning_overlays", overlay = "MP_Gunrunning_Hair_F_000_F" },
    { ID = 77, name = "Short Bob", collection = "mpgunrunning_overlays", overlay = "MP_Gunrunning_Hair_F_001_F" }
}

local rideList = { "-", "Rides yeux", "Rides 1", "Rides 2", "Rides 3", "Rides 4", "Rides 5", "Rides 6", "Rides 7", "Rides 8", "Rides 9", "Rides 10", "Rides EX 1", "Rides EX 2", "Cernes" }
local tachList = { "-", "Peu de tâches", "Tâches peu visibles", "Tâches baladées", "Tâches éparpillées", "Tâches sauvages", "Tâches centrées", "Tâches joues", "Tâches visage", "Infection visage", "Infection joues", "Rougeur", "Rougeur infectée", "Rougeurs front", "Acnée", "Acnée sévère", "Acnée baladée", "Acnée épaisse", "Acnée front", "Acnée totale" }
local eyesList = { "Vert", "Emmeraude", "Bleu", "Bleu ciel", "Marron clair", "Marron", "Noisette", "Gris sombre", "Gris propre", "Rose", "Jaune", "Violet", "Blackout", "Ombre grise", "Soleil tequila", "Atomic", "Faux", "Cola", "Ranger", "Ying-yang", "Bull", "Lezard", "Dragon", "Extra-terrestre", "Chèvre", "Smiley", "Possédé", "Démon", "Infecté", "Alien", "Mort", "Zombie" }
local spawnInProgress = false

local BarbeName = {}
for i = 1, 29, 1 do
    BarbeName[i] = GetLabelText("CC_BEARD_" .. i - 1)
end

local SKClist = { "-" }
for i = 0, 11, 1 do
    table.insert(SKClist, GetLabelText("CC_SKINCOM_" .. i))
end

local MoleList = { "-" }

for i = 0, 18, 1 do
    table.insert(MoleList, GetLabelText("CC_MOLEFRECK_" .. i))
end

local ComplexList = { "-" }
for i = 1, 11, 1 do
    table.insert(ComplexList, GetLabelText("CC_MOLEFRECK_" .. i))
end

local MaquillageList = { "-" }
for i = 1, 71, 1 do
    table.insert(MaquillageList, GetLabelText("CC_MKUP_" .. i))
end

local LipsList = { "-" }
for i = 1, 10, 1 do
    table.insert(LipsList, GetLabelText("CC_LIPSTICK_" .. i))
end

local colorsPanel = {
    haircut = {
        [1] = 1,
        [2] = 1,
    },
    barber = {
        [1] = 1,
        [2] = 1,
    },
    lipstick = {
        [1] = 1,
        [2] = 1,
    },
    makeup = {
        [1] = 1,
        [2] = 1,
    }
}

Corazon.cIdentity = {}

Corazon.cCharacterCreatorData = {}
Corazon.cCharacterCreatorDataPED = ""
Corazon.cCharacterCreatorData.sex = 1
Corazon.cCharacterCreatorData.faceMum = 1
Corazon.cCharacterCreatorData.faceDad = 1
Corazon.cCharacterCreatorData.ressemblance = 1
Corazon.cCharacterCreatorData.skinMix = 1
Corazon.cCharacterCreatorData.eyebrowHeight = 1
Corazon.cCharacterCreatorData.eyebrowForward = 1
Corazon.cCharacterCreatorData.eyeOpening = 1
Corazon.cCharacterCreatorData.noseWidth = 1
Corazon.cCharacterCreatorData.nosePeaklowering = 1
Corazon.cCharacterCreatorData.noseBoneHeight = 1
Corazon.cCharacterCreatorData.noseBoneTwist = 1
Corazon.cCharacterCreatorData.nosePeakHeight = 1
Corazon.cCharacterCreatorData.nosePeakLength = 1
Corazon.cCharacterCreatorData.cheeksBoneHeight = 1
Corazon.cCharacterCreatorData.cheeksBoneWidth = 1
Corazon.cCharacterCreatorData.lipsThickness = 1
Corazon.cCharacterCreatorData.jawBoneWidth = 1
Corazon.cCharacterCreatorData.jawBoneBackLength = 1
Corazon.cCharacterCreatorData.chimpBoneLength = 1
Corazon.cCharacterCreatorData.chimpBoneWidth = 1
Corazon.cCharacterCreatorData.chimpHole = 1
Corazon.cCharacterCreatorData.chimpBoneLowering = 1
Corazon.cCharacterCreatorData.hairStyle = 1
Corazon.cCharacterCreatorData.hairColor = { [1] = 1, [2] = 1 }
Corazon.cCharacterCreatorData.blemishesStyle = 1
Corazon.cCharacterCreatorData.blemishesOpacity = 1
Corazon.cCharacterCreatorData.ageingStyle = 1
Corazon.cCharacterCreatorData.complexionStyle = 1
Corazon.cCharacterCreatorData.eyeStyle = 1
Corazon.cCharacterCreatorData.lipstickStyle = 1
Corazon.cCharacterCreatorData.lipstickOpacity = 1
Corazon.cCharacterCreatorData.lipstickColor = { [1] = 1, [2] = 1 }
Corazon.cCharacterCreatorData.makeupStyle = 1
Corazon.cCharacterCreatorData.makeupOpacity = 1
Corazon.cCharacterCreatorData.makeupColor = { [1] = 1, [2] = 1 }
Corazon.cCharacterCreatorData.beardStyle = 1
Corazon.cCharacterCreatorData.beardOpacity = 1
Corazon.cCharacterCreatorData.beardColor = { [1] = 1, [2] = 1 }
Corazon.cCharacterCreatorData.ageingOpacity = 1
Corazon.cCharacterCreatorData.skinAspectStyle = 1
Corazon.cCharacterCreatorData.skinAspectOpacity = 1
Corazon.cCharacterCreatorData.frecklesStyle = 1
Corazon.cCharacterCreatorData.frecklesOpacity = 1
Corazon.cCharacterCreatorData.complexionOpacity = 1

Corazon.iCharacterCreatorData = {}
Corazon.iCharacterCreatorData.faceMum = 1
Corazon.iCharacterCreatorData.faceDad = 1
Corazon.iCharacterCreatorData.ressemblance = 1
Corazon.iCharacterCreatorData.skinMix = 1
Corazon.iCharacterCreatorData.eyebrowHeight = 1
Corazon.iCharacterCreatorData.eyebrowForward = 1
Corazon.iCharacterCreatorData.eyeOpening = 1
Corazon.iCharacterCreatorData.noseWidth = 1
Corazon.iCharacterCreatorData.nosePeaklowering = 1
Corazon.iCharacterCreatorData.noseBoneHeight = 1
Corazon.iCharacterCreatorData.noseBoneTwist = 1
Corazon.iCharacterCreatorData.nosePeakHeight = 1
Corazon.iCharacterCreatorData.nosePeakLength = 1
Corazon.iCharacterCreatorData.cheeksBoneHeight = 1
Corazon.iCharacterCreatorData.cheeksBoneWidth = 1
Corazon.iCharacterCreatorData.lipsThickness = 1
Corazon.iCharacterCreatorData.jawBoneWidth = 1
Corazon.iCharacterCreatorData.jawBoneBackLength = 1
Corazon.iCharacterCreatorData.chimpBoneLength = 1
Corazon.iCharacterCreatorData.chimpBoneWidth = 1
Corazon.iCharacterCreatorData.chimpHole = 1
Corazon.iCharacterCreatorData.chimpBoneLowering = 1
Corazon.iCharacterCreatorData.jawBoneBackLength = 1
Corazon.iCharacterCreatorData.hairStyle = 1
Corazon.iCharacterCreatorData.hairColor = { [1] = 1, [2] = 1 }
Corazon.iCharacterCreatorData.beardStyle = 1
Corazon.iCharacterCreatorData.blemishesStyle = 1
Corazon.iCharacterCreatorData.ageingStyle = 1
Corazon.iCharacterCreatorData.skinAspectStyle = 1
Corazon.iCharacterCreatorData.frecklesStyle = 1
Corazon.iCharacterCreatorData.complexionStyle = 1
Corazon.iCharacterCreatorData.eyeStyle = 1
Corazon.iCharacterCreatorData.makeupStyle = 1
Corazon.iCharacterCreatorData.lipstickStyle = 1
Corazon.iCharacterCreatorData.lipstickOpacity = 1
Corazon.iCharacterCreatorData.lipstickColor = { [1] = 1, [2] = 1 }
Corazon.iCharacterCreatorData.makeupOpacity = 1
Corazon.iCharacterCreatorData.makeupColor = { [1] = 1, [2] = 1 }
Corazon.iCharacterCreatorData.beardOpacity = 1
Corazon.iCharacterCreatorData.beardColor = { [1] = 1, [2] = 1 }
Corazon.iCharacterCreatorData.blemishesOpacity = 1
Corazon.iCharacterCreatorData.ageingOpacity = 1
Corazon.iCharacterCreatorData.skinAspectOpacity = 1
Corazon.iCharacterCreatorData.frecklesOpacity = 1
Corazon.iCharacterCreatorData.complexionOpacity = 1


local Items = {
    mp_m_freemode_01 = {
        [1] = {
            List = { "Standard", "Protubérant", "Plat", "-" },
            Index = 1,
        },
        [2] = {
            List = { "Standard", "Ouverts", "Plissés", "-" },
            Index = 1,
        },
        [3] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        [4] = {
            List = { "Standard", "Saillante", "Incurvée", "-" },
            Index = 1,
        },
        [5] = {
            List = { "Standard", "Cassé", "Vers le haut", "-" },
            Index = 1,
        },
        [6] = {
            List = { "Standard", "Larges", "Fines", "-" },
            Index = 1,
        },
        [7] = {
            List = { "Standard", "Grosses", "Minces", "-" },
            Index = 1,
        },
        [8] = {
            List = { "Standard", "Épaisses", "Minces", "-" },
            Index = 1,
        },
        [9] = {
            List = { "Standard", "Carrée", "Ronde", "-" },
            Index = 1,
        },
        [10] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        [11] = {
            List = { "Standard", "Pointu", "Rond", "-" },
            Index = 1,
        },
    },

    mp_f_freemode_01 = {
        [1] = {
            List = { "Standard", "Protubérant", "Plat", "-" },
            Index = 1,
        },
        [2] = {
            List = { "Standard", "Ouverts", "Plissés", "-" },
            Index = 1,
        },
        [3] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        [4] = {
            List = { "Standard", "Saillante", "Incurvée", "-" },
            Index = 1,
        },
        [5] = {
            List = { "Standard", "Cassé", "Vers le haut", "-" },
            Index = 1,
        },
        [6] = {
            List = { "Standard", "Larges", "Fines", "-" },
            Index = 1,
        },
        [7] = {
            List = { "Standard", "Grosses", "Minces", "-" },
            Index = 1,
        },
        [8] = {
            List = { "Standard", "Épaisses", "Minces", "-" },
            Index = 1,
        },
        [9] = {
            List = { "Standard", "Carrée", "Ronde", "-" },
            Index = 1,
        },
        [10] = {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        [11] = {
            List = { "Standard", "Pointu", "Rond", "-" },
            Index = 1,
        },
    }
}
local self = {
    FACE_F_BROW = false,
    FACE_F_EYES = false,
    FACE_F_NOSE = false,
    FACE_F_NOSEP = false,
    FACE_F_NOSET = false,
    FACE_F_CHEEK = false,
    FACE_F_CHEEKS = false,
    FACE_F_LIPS = false,
    FACE_F_JAW = false,
    FACE_F_CHIN = false,
    FACE_F_CHINS = false,
    FACE_HAIR = false,
    FACE_BEARD = false,
    FACE_SKINISSUES = false,
    FACE_OLDNESS = false,
    FACE_TINT = false,
}

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

function saveIdentityCharacter()
    local charID = getCharID()
		
    local nameIdentity = Corazon.cIdentity.Name
    local lieuIdentity = Corazon.cIdentity.Lieu
    local dateIdentity = Corazon.cIdentity.Date

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
        RMenu:Delete('charCreator', 'main')
        TriggerEvent("corazon.character:openCreationMenu")
    end
end

function spawnCharacterPersonnalisation(zboubi, skin)
    local ped = GetPlayerPed(-1)

    setPlayerPed(Corazon.cCharacterCreatorDataPED)
    Wait(500)
    setPlayerFaceCreator(ped, Corazon.cCharacterCreatorData, skin)
end

function saveCharacterPersonnalisation()
    LoadingPrompt("Sauvegarde de votre personnalisation de personnage en cours", 3)

    local charID = getCharID()

--  local skin              = Corazon.cCharacterCreatorDataPED

    local faceMum           = Corazon.cCharacterCreatorData.faceMum
    local faceDad           = Corazon.cCharacterCreatorData.faceDad
    local ressemblance      = Corazon.cCharacterCreatorData.ressemblance
    local skinMix           = Corazon.cCharacterCreatorData.skinMix
    local eyebrowHeight     = Corazon.cCharacterCreatorData.eyebrowHeight
    local eyebrowForward    = Corazon.cCharacterCreatorData.eyebrowForward
    local eyeOpening        = Corazon.cCharacterCreatorData.eyeOpening
    local noseWidth         = Corazon.cCharacterCreatorData.noseWidth
    local nosePeaklowering  = Corazon.cCharacterCreatorData.nosePeaklowering
    local noseBoneHeight    = Corazon.cCharacterCreatorData.noseBoneHeight
    local noseBoneTwist     = Corazon.cCharacterCreatorData.noseBoneTwist
    local noseBoneHeight    = Corazon.cCharacterCreatorData.nosePeakHeight
    local nosePeakLength    = Corazon.cCharacterCreatorData.nosePeakLength
    local cheeksBoneHeight  = Corazon.cCharacterCreatorData.cheeksBoneHeight   
    local cheeksBoneWidth   = Corazon.cCharacterCreatorData.cheeksBoneWidth
    local lipsThickness     = Corazon.cCharacterCreatorData.lipsThickness
    local jawBoneBackLength = Corazon.cCharacterCreatorData.jawBoneBackLength
    local chimpBoneLength   = Corazon.cCharacterCreatorData.chimpBoneLength
    local chimpBoneWidth    = Corazon.cCharacterCreatorData.chimpBoneWidth
    local chimpHole         = Corazon.cCharacterCreatorData.chimpHole
    local chimpBoneLowering = Corazon.cCharacterCreatorData.chimpBoneLowering
    local hairStyle         = Corazon.cCharacterCreatorData.hairStyle
    local hairColorOne      = Corazon.cCharacterCreatorData.hairColor[1]
    local hairColorTwo      = Corazon.cCharacterCreatorData.hairColor[2]
    local blemishesStyle    = Corazon.cCharacterCreatorData.blemishesStyle
    local blemishesOpacity  = Corazon.cCharacterCreatorData.blemishesOpacity
    local ageingStyle       = Corazon.cCharacterCreatorData.ageingStyle
    local complexionStyle   = Corazon.cCharacterCreatorData.complexionStyle
    local eyeStyle          = Corazon.cCharacterCreatorData.eyeStyle
    local lipstickStyle     = Corazon.cCharacterCreatorData.lipstickStyle
    local lipstickOpacity   = Corazon.cCharacterCreatorData.lipstickOpacity
    local lipstickColorOne  = Corazon.cCharacterCreatorData.lipstickColor[1]
    local lipstickColorTwo  = Corazon.cCharacterCreatorData.lipstickColor[2]
    local makeupStyle       = Corazon.cCharacterCreatorData.makeupStyle
    local makeupOpacity     = Corazon.cCharacterCreatorData.makeupOpacity    
    local makeupColorOne    = Corazon.cCharacterCreatorData.makeupColor[1]
    local makeupColorOne    = Corazon.cCharacterCreatorData.makeupColor[2]
    local beardStyle        = Corazon.cCharacterCreatorData.beardStyle
    local beardOpacity      = Corazon.cCharacterCreatorData.beardOpacity
    local beardColorOne     = Corazon.cCharacterCreatorData.beardColor[1]
    local beardColorTwo     = Corazon.cCharacterCreatorData.beardColor[2]
    local ageingOpacity     = Corazon.cCharacterCreatorData.ageingOpacity
    local skinAspectStyle   = Corazon.cCharacterCreatorData.skinAspectStyle
    local skinAspectOpacity = Corazon.cCharacterCreatorData.skinAspectOpacity
    local frecklesStyle     = Corazon.cCharacterCreatorData.frecklesStyle
    local frecklesOpacity   = Corazon.cCharacterCreatorData.frecklesOpacity
    local complexionOpacity = Corazon.cCharacterCreatorData.complexionOpacity

    local cCharacterCreatorData = {
        ["skin"]              = skin,
        ["faceMum"]           = faceMum,          
        ["faceDad"]           = faceDad,         
        ["ressemblance"]      = ressemblance,     
        ["skinMix"]           = skinMix,          
        ["eyebrowHeight"]     = eyebrowHeight,    
        ["eyebrowForward"]    = eyebrowForward,   
        ["eyeOpening"]        = eyeOpening,       
        ["noseWidth"]         = noseWidth,        
        ["nosePeaklowering"]  = nosePeaklowering, 
        ["noseBoneHeight"]    = noseBoneHeight,   
        ["noseBoneTwist"]     = noseBoneTwist,    
        ["noseBoneHeight"]    = noseBoneHeight,   
        ["nosePeakLength"]    = nosePeakLength,   
        ["cheeksBoneHeight"]  = cheeksBoneHeight, 
        ["cheeksBoneWidth"]   = cheeksBoneWidth,  
        ["lipsThickness"]     = lipsThickness,    
        ["jawBoneBackLength"] = jawBoneBackLength,
        ["chimpBoneLength"]   = chimpBoneLength,  
        ["chimpBoneWidth"]    = chimpBoneWidth,   
        ["chimpHole"]         = chimpHole,  
        ["chimpBoneLowering"] = chimpBoneLowering,
        ["hairStyle"]         = hairStyle,        
        ["hairColorOne"]      = hairColorOne,        
        ["hairColorTwo"]      = hairColorTwo,        
        ["blemishesStyle"]    = blemishesStyle,  
        ["blemishesOpacity"]  = blemishesOpacity,
        ["ageingStyle"]       = ageingStyle,   
        ["complexionStyle"]   = complexionStyle,  
        ["eyeStyle"]          = eyeStyle,         
        ["lipstickStyle"]     = lipstickStyle,    
        ["lipstickOpacity"]   = lipstickOpacity,  
        ["lipstickColorOne"]  = lipstickColorOne,    
        ["lipstickColorTwo"]  = lipstickColorTwo,    
        ["makeupStyle"]       = makeupStyle,      
        ["makeupOpacity"]     = makeupOpacity,    
        ["makeupColorOne"]    = makeupColorOne,      
        ["makeupColorTwo"]    = makeupColorTwo,      
        ["beardStyle"]        = beardStyle,      
        ["beardOpacity"]      = beardOpacity,     
        ["beardColorOne"]     = beardColorOne,       
        ["beardColorTwo"]     = beardColorTwo,       
        ["ageingOpacity"]     = ageingOpacity,    
        ["skinAspectStyle"]   = skinAspectStyle,  
        ["skinAspectOpacity"] = skinAspectOpacity,
        ["frecklesStyle"]     = frecklesStyle,    
        ["frecklesOpacity"]   = frecklesOpacity,  
        ["complexionOpacity"] = complexionOpacity
    }

    local cCharacterCreatorDataPED = Corazon.cCharacterCreatorDataPED

    TriggerServerEvent('corazon_character:saveSkin', cCharacterCreatorData, charID)
    TriggerServerEvent('corazon_character:savePED', cCharacterCreatorDataPED, charID)
    
    Wait(5000)
    RemoveLoadingPrompt()
end

local Character = {}

function setPlayerFaceSpawn(skin)
    local ped = PlayerPedId()
    spawnInProgress = true

    for k,v in pairs(skin) do
		Character[k] = v
    end
    
    Corazon.cCharacterCreatorDataPED = Character['skin']
    Corazon.cCharacterCreatorData.noseWidth = Character['noseWidth']
    Corazon.cCharacterCreatorData.nosePeakHeight = Character['nosePeakHeight']
    Corazon.cCharacterCreatorData.nosePeakLength = Character['nosePeakLength']
    Corazon.cCharacterCreatorData.noseBoneHeight = Character['noseBoneHeight']
    Corazon.cCharacterCreatorData.nosePeaklowering = Character['nosePeaklowering']
    Corazon.cCharacterCreatorData.noseBoneTwist = Character['noseBoneTwist']
    Corazon.cCharacterCreatorData.eyebrowHeight = Character['eyebrowHeight']
    Corazon.cCharacterCreatorData.eyebrowForward = Character['eyebrowForward']
    Corazon.cCharacterCreatorData.cheeksBoneHeight = Character['cheeksBoneHeight']
    Corazon.cCharacterCreatorData.cheeksBoneWidth = Character['cheeksBoneWidth']
    Corazon.cCharacterCreatorData.eyeOpening = Character['eyeOpening']
    Corazon.cCharacterCreatorData.lipsThickness = Character['lipsThickness']
    Corazon.cCharacterCreatorData.jawBoneWidth = Character['jawBoneWidth']
    Corazon.cCharacterCreatorData.jawBoneBackLength = Character['jawBoneBackLength']
    Corazon.cCharacterCreatorData.chimpBoneLowering = Character['chimpBoneLowering']
    Corazon.cCharacterCreatorData.chimpBoneLength = Character['chimpBoneLength']
    Corazon.cCharacterCreatorData.chimpBoneWidth = Character['chimpBoneWidth']
    Corazon.cCharacterCreatorData.chimpHole = Character['chimpHole']
    Corazon.cCharacterCreatorData.beardStyle  = Character['beardStyle']
    Corazon.cCharacterCreatorData.beardOpacity = Character['beardOpacity']
    Corazon.cCharacterCreatorData.beardColor[1] = Character['beardColorOne']
    Corazon.cCharacterCreatorData.beardColor[2] = Character['beardColorTwo']
    Corazon.cCharacterCreatorData.ageingStyle  = Character['ageingStyle']
    Corazon.cCharacterCreatorData.ageingOpacity = Character['ageingOpacity']
    Corazon.cCharacterCreatorData.lipstickStyle  = Character['lipstickStyle']
    Corazon.cCharacterCreatorData.lipstickOpacity = Character['lipstickOpacity']
    Corazon.cCharacterCreatorData.makeupStyle = Character['makeupStyle']
    Corazon.cCharacterCreatorData.makeupOpacity = Character['makeupOpacity']
    Corazon.cCharacterCreatorData.makeupColor[1] = Character['makeupColorOne']
    Corazon.cCharacterCreatorData.makeupColor[2] = Character['makeupColorTwo']
    Corazon.cCharacterCreatorData.hairStyle = Character['hairStyle']
    Corazon.cCharacterCreatorData.hairColor[1]  = Character['hairColorOne']
    Corazon.cCharacterCreatorData.hairColor[2] = Character['hairColorTwo']
    Corazon.cCharacterCreatorData.lipstickColor[1] = Character['lipstickColorOne']
    Corazon.cCharacterCreatorData.lipstickColor[2] = Character['lipstickColorTwo']
    Corazon.cCharacterCreatorData.eyeStyle = Character['eyeStyle']
    Corazon.cCharacterCreatorData.blemishesStyle  = Character['blemishesStyle']
    Corazon.cCharacterCreatorData.blemishesOpacity = Character['blemishesOpacity']
    Corazon.cCharacterCreatorData.complexionStyle  = Character['complexionStyle']
    Corazon.cCharacterCreatorData.complexionStyle = Character['complexionStyle']
    Corazon.cCharacterCreatorData.skinAspectStyle = Character['skinAspectStyle']
    Corazon.cCharacterCreatorData.skinAspectOpacity = Character['skinAspectOpacity']
    Corazon.cCharacterCreatorData.frecklesStyle = Character['frecklesStyle']
    Corazon.cCharacterCreatorData.frecklesOpacity = Character['frecklesOpacity']
    
    Wait(100)

    loadedCharacter = setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
    --loadedCharacter = spawnCharacterPersonnalisation(Corazon.cCharacterCreatorData, skin)

    while not loadedCharacter do
        Citizen.Wait(0)
    end

end

function openCharCreatorMenu()
    Corazon.cCharacterCreatorDataPED = "mp_m_freemode_01"
    setPlayerPed("mp_m_freemode_01")

    RMenu.Add('charCreator', 'main', RageUI.CreateMenu("Mon Personnage", ""))
    RMenu.Add('charCreator', 'heritage', RageUI.CreateSubMenu(RMenu:Get('charCreator', 'main'), "Personnage", "~b~Heritage"))
    RMenu.Add('charCreator', 'customFace', RageUI.CreateSubMenu(RMenu:Get('charCreator', 'main'), "Personnage", "~b~Traits du visage"))
    RMenu.Add('charCreator', 'customAdvanced', RageUI.CreateSubMenu(RMenu:Get('charCreator', 'main'), "Personnage", "~b~Traits du visage"))
    RMenu.Add('charCreator', 'identity', RageUI.CreateSubMenu(RMenu:Get('charCreator', 'main'), "Personnage", "~b~Identité"))

    RMenu:Get('charCreator', 'main'):SetSubtitle("~b~Creation du Personnage")
    RMenu:Get('charCreator', 'main').Closable = false;
    --RMenu:Get('charCreator', 'main').EnableMouse = false
    RMenu:Get('charCreator', 'customFace').EnableMouse = true
    RMenu:Get('charCreator', 'customAdvanced').EnableMouse = true

    RMenu:Get('charCreator', 'heritage').Closed = function()
    end

    local pedNonChoisi = true
    local mpNonChoisi = true
    local heritageSet = false

    RageUI.CreateWhile(1.0, true, function()
        if RageUI.Visible(RMenu:Get('charCreator', 'main')) then
            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()

                if pedNonChoisi then
                    RageUI.List("Sexe", sexChoice, Corazon.cCharacterCreatorData.sex, "Choisissez votre sexe.", {}, true, function(Hovered, Active, Selected, Index)   -- Slidebar
                        if (Selected) then
                            if Index == 1 then
                                Corazon.cCharacterCreatorDataPED = "mp_m_freemode_01"
                                setPlayerPed("mp_m_freemode_01")
                                mpNonChoisi = false
                            elseif Index == 2 then
                                Corazon.cCharacterCreatorDataPED = "mp_f_freemode_01"
                                setPlayerPed("mp_f_freemode_01")
                                mpNonChoisi = false
                            end
                        end
                        Corazon.cCharacterCreatorData.sex = Index;
                    end)
                end

                if mpNonChoisi then
                    RageUI.Button("Choisir un PED", "Choisissez votre ped, voici un lien ou vous pouvez trouver celui que vous voulez : https://docs.fivem.net/docs/game-references/ped-models/", { }, true, function(Hovered, Active, Selected)  
                        if (Selected) then
                            Corazon.cCharacterCreatorDataPED = KeyboardInput("Votre PED : https://docs.fivem.net/docs/game-references/ped-models/", "a_f_m_beach_01", 25)
                            --setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            setPlayerPed(Corazon.cCharacterCreatorDataPED)
                            pedNonChoisi = false
                        end
                    end)
                end
                ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                if not mpNonChoisi then
                    RageUI.Button("Heritage", "Choisissiez votre mère & votre père", { RightLabel = "→" }, true, function(Hovered, Active, Selected)

                    end, RMenu:Get('charCreator', 'heritage'))
                    ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    if heritageSet then
                        RageUI.Button("Traits du visage", "Choisissiez votre mère & votre père", { RightLabel = "→" }, true, function(Hovered, Active, Selected)

                        end, RMenu:Get('charCreator', 'customFace'))

                        RageUI.Button("Apparence", "Apparence de votre personnage", { RightLabel = "→" }, true, function(Hovered, Active, Selected)

                        end, RMenu:Get('charCreator', 'customAdvanced'))
                    end
                end

                
                RageUI.Button("Identité", "L'identité de votre personnage", { RightLabel = "→"  }, true, function(Hovered, Active, Selected)

                end, RMenu:Get('charCreator', 'identity'))

                RageUI.Button("Sauvegarder & Continuer", "Sauvegarder & Continuer.", { RightBadge = RageUI.BadgeStyle.Tick, Color = { BackgroundColor = { 0, 120, 0, 25 } } }, true, function(Hovered, Active, Selected)  
                    if (Selected) then
                        if not ped then 
                            ShowAboveRadarMessage("Veuillez choisir votre sexe") return 
                        elseif not heritageSet then 
                            ShowAboveRadarMessage("Veuillez choisir votre heritage") return 
                        elseif not nameIdentity then 
                            ShowAboveRadarMessage(translate('error_identity_creator')) return 
                        elseif not lieuIdentity then
                            ShowAboveRadarMessage(translate('error_identity_creator')) return 
                        elseif not dateIdentity then
                            ShowAboveRadarMessage(translate('error_identity_creator')) return 
                        else
                            --TriggerServerEvent("corazon:saveIdentity", charID, nameIdentity, lieuIdentity, dateIdentity)
                            saveIdentityCharacter()
                            LoadingPrompt("Sauvegarde de votre identité en cours", 3)
                            Wait(2500)
                            RageUI.CloseAll()
                            RMenu:Delete('charCreator', 'main')
                        end

                    end
                end)

            end, function()
                ---Panels
            end)
        end


        
        if RageUI.Visible(RMenu:Get('charCreator', 'heritage')) then
            RageUI.DrawContent({ header = true, instructionalButton = true }, function()
                RageUI.HeritageWindow(Corazon.iCharacterCreatorData.faceMum, Corazon.iCharacterCreatorData.faceDad)
                RageUI.List(GetLabelText("FACE_MUMS"), HeritageMom, Corazon.iCharacterCreatorData.faceMum, GetLabelText("CHARC_H_30"), {}, true, function(Hovered, Active, Selected, Index)
                    if Corazon.cCharacterCreatorData.faceMum ~= Index then
                        Corazon.cCharacterCreatorData.faceMum = Index - 1
                        Corazon.iCharacterCreatorData.faceMum = Index
                    end
                end)
                
                RageUI.List(GetLabelText("FACE_DADS"), HeritageDad, Corazon.iCharacterCreatorData.faceDad, GetLabelText("CHARC_H_31"), {}, true, function(Hovered, Active, Selected, Index)
                    if Corazon.cCharacterCreatorData.faceDad ~= Index then
                        Corazon.cCharacterCreatorData.faceDad = Index - 1
                        Corazon.iCharacterCreatorData.faceDad = Index
                    end
                end)

                RageUI.UISliderHeritage(GetLabelText("FACE_H_DOM"), math.round(Corazon.iCharacterCreatorData.ressemblance, 2) * 10, GetLabelText("CHARC_H_9"), function(Hovered, Selected, Active, Heritage, Index)
                    if Corazon.cCharacterCreatorData.ressemblance ~= Heritage then
                        Corazon.cCharacterCreatorData.ressemblance = Heritage
                        Corazon.iCharacterCreatorData.ressemblance = Heritage
                    end
                end)

                RageUI.UISliderHeritage(GetLabelText("FACE_H_STON"), math.round(Corazon.iCharacterCreatorData.skinMix, 2) * 10, GetLabelText("FACE_HER_ST_H"), function(Hovered, Selected, Active, Heritage, Index)
                    if Corazon.cCharacterCreatorData.skinMix ~= Heritage then
                        Corazon.cCharacterCreatorData.skinMix = Heritage
                        Corazon.iCharacterCreatorData.skinMix = Heritage
                    end
                end)

                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                heritageSet = true

            end, function()

            end)
        end

        if RageUI.Visible(RMenu:Get('charCreator', 'customFace')) then
            RageUI.DrawContent({ header = true, instructionalButton = true }, function()
                RageUI.List(GetLabelText("FACE_F_BROW"), Items[Corazon.cCharacterCreatorDataPED][1].List, Items[Corazon.cCharacterCreatorDataPED][1].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][1].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.eyebrowHeight = 0.5
                            Corazon.iCharacterCreatorData.eyebrowForward = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.eyebrowHeight = 0.9
                            Corazon.iCharacterCreatorData.eyebrowForward = 0.6
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.eyebrowHeight = 0.30
                            Corazon.iCharacterCreatorData.eyebrowForward = 0.70
                        end
                        self.FACE_F_BROW = true
                        self.FACE_F_CHINS = false
                    else
                        self.FACE_F_BROW = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_EYES"), Items[Corazon.cCharacterCreatorDataPED][2].List, Items[Corazon.cCharacterCreatorDataPED][2].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][2].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.eyeOpening = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.eyeOpening = 0.9
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.eyeOpening = 0.30
                        end
                        self.FACE_F_EYES = true
                    else
                        self.FACE_F_EYES = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_NOSE"), Items[Corazon.cCharacterCreatorDataPED][3].List, Items[Corazon.cCharacterCreatorDataPED][3].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][3].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.noseWidth = 0.5
                            Corazon.iCharacterCreatorData.nosePeaklowering = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.noseWidth = 0.9
                            Corazon.iCharacterCreatorData.nosePeaklowering = 0.6
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.noseWidth = 0.30
                            Corazon.iCharacterCreatorData.nosePeaklowering = 0.70
                        end
                        self.FACE_F_NOSE = true
                    else
                        self.FACE_F_NOSE = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_NOSEP"), Items[Corazon.cCharacterCreatorDataPED][4].List, Items[Corazon.cCharacterCreatorDataPED][4].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][4].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.noseBoneHeight = 0.5
                            Corazon.iCharacterCreatorData.noseBoneTwist = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.noseBoneHeight = 0.9
                            Corazon.iCharacterCreatorData.noseBoneTwist = 0.6
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.noseBoneHeight = 0.30
                            Corazon.iCharacterCreatorData.noseBoneTwist = 0.70
                        end
                        self.FACE_F_NOSEP = true
                    else
                        self.FACE_F_NOSEP = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_NOSET"), Items[Corazon.cCharacterCreatorDataPED][5].List, Items[Corazon.cCharacterCreatorDataPED][5].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][5].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.nosePeakHeight = 0.5
                            Corazon.iCharacterCreatorData.nosePeakLength = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.nosePeakHeight = 0.9
                            Corazon.iCharacterCreatorData.nosePeakLength = 0.6
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.nosePeakHeight = 0.30
                            Corazon.iCharacterCreatorData.nosePeakLength = 0.70
                        end
                        self.FACE_F_NOSET = true
                    else
                        self.FACE_F_NOSET = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_CHEEK"), Items[Corazon.cCharacterCreatorDataPED][6].List, Items[Corazon.cCharacterCreatorDataPED][6].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][6].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.cheeksBoneHeight = 0.5
                            Corazon.iCharacterCreatorData.cheeksBoneWidth = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.cheeksBoneHeight = 0.9
                            Corazon.iCharacterCreatorData.cheeksBoneWidth = 0.6
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.cheeksBoneHeight = 0.30
                            Corazon.iCharacterCreatorData.cheeksBoneWidth = 0.70
                        end
                        self.FACE_F_CHEEK = true
                    else
                        self.FACE_F_CHEEK = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_CHEEKS"), Items[Corazon.cCharacterCreatorDataPED][7].List, Items[Corazon.cCharacterCreatorDataPED][7].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][7].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.cheeksBoneWidth = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.cheeksBoneWidth = 0.9
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.cheeksBoneWidth = 0.30
                        end
                        self.FACE_F_CHEEKS = true
                    else
                        self.FACE_F_CHEEKS = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_LIPS"), Items[Corazon.cCharacterCreatorDataPED][8].List, Items[Corazon.cCharacterCreatorDataPED][8].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][8].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.lipsThickness = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.lipsThickness = 0.9
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.lipsThickness = 0.30
                        end
                        self.FACE_F_LIPS = true
                    else
                        self.FACE_F_LIPS = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_JAW"), Items[Corazon.cCharacterCreatorDataPED][9].List, Items[Corazon.cCharacterCreatorDataPED][9].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][9].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.jawBoneWidth = 0.5
                            Corazon.iCharacterCreatorData.jawBoneBackLength = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.jawBoneWidth = 0.9
                            Corazon.iCharacterCreatorData.jawBoneBackLength = 0.6
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.jawBoneWidth = 0.30
                            Corazon.iCharacterCreatorData.jawBoneBackLength = 0.70
                        end
                        self.FACE_F_JAW = true
                    else
                        self.FACE_F_JAW = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_CHIN"), Items[Corazon.cCharacterCreatorDataPED][10].List, Items[Corazon.cCharacterCreatorDataPED][10].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][10].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.chimpBoneLength = 0.5
                            Corazon.iCharacterCreatorData.chimpBoneWidth = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.chimpBoneLength = 0.9
                            Corazon.iCharacterCreatorData.chimpBoneWidth = 0.6
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.chimpBoneLength = 0.30
                            Corazon.iCharacterCreatorData.chimpBoneWidth = 0.70
                        end
                        self.FACE_F_CHIN = true
                    else
                        self.FACE_F_CHIN = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_CHINS"), Items[Corazon.cCharacterCreatorDataPED][11].List, Items[Corazon.cCharacterCreatorDataPED][11].Index, GetLabelText("FACE_FEAT_H"), {}, true, function(Hovered, Active, Selected, Index)
                    Items[Corazon.cCharacterCreatorDataPED][11].Index = Index
                    if (Active) then
                        if (Index == 1 and Selected) then
                            Corazon.iCharacterCreatorData.chimpHole = 0.5
                            Corazon.iCharacterCreatorData.chimpBoneLowering = 0.5
                        elseif (Index == 2 and Selected) then
                            Corazon.iCharacterCreatorData.chimpHole = 0.9
                            Corazon.iCharacterCreatorData.chimpBoneLowering = 0.6
                        elseif (Index == 3 and Selected) then
                            Corazon.iCharacterCreatorData.chimpHole = 0.30
                            Corazon.iCharacterCreatorData.chimpBoneLowering = 0.70
                        end
                        self.FACE_F_CHINS = true
                        self.FACE_F_BROW = false
                    else
                        self.FACE_F_CHINS = false
                    end
                end)
            end, function()
                ---Panels
                if (self.FACE_F_BROW) then
                    RageUI.GridPanel(Corazon.iCharacterCreatorData.eyebrowForward, Corazon.iCharacterCreatorData.eyebrowHeight, "Haut", "Bas", "Intérieur", "Extérieur", function(Hovered, Active, X, Y)
                        Corazon.cCharacterCreatorData.eyebrowHeight = Y
                        Corazon.cCharacterCreatorData.eyebrowForward = X
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.eyebrowHeight = Y
                        Corazon.iCharacterCreatorData.eyebrowForward = X
                    end)
                end
                if (self.FACE_F_EYES) then
                    RageUI.GridPanelHorizontal(Corazon.iCharacterCreatorData.eyeOpening, "Ouverts", "Plissés", function(Hovered, Active, X)
                        Corazon.cCharacterCreatorData.eyeOpening = X
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.eyeOpening = X
                    end)
                end
                if (self.FACE_F_NOSE) then
                    --- Nez
                    RageUI.GridPanel(Corazon.iCharacterCreatorData.noseWidth, Corazon.iCharacterCreatorData.nosePeaklowering, "Relevé", "Bas", "Fin", "Épais", function(Hovered, Active, X, Y)
                        Corazon.cCharacterCreatorData.noseWidth = X
                        Corazon.cCharacterCreatorData.nosePeaklowering = Y
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.noseWidth = X
                        Corazon.iCharacterCreatorData.nosePeaklowering = Y
                    end)
                end
                if (self.FACE_F_NOSEP) then
                    --- Arête
                    RageUI.GridPanel(Corazon.iCharacterCreatorData.noseBoneHeight, Corazon.iCharacterCreatorData.noseBoneTwist, "Saillante", "Incurvée", "Courte", "Longue", function(Hovered, Active, X, Y)
                        Corazon.cCharacterCreatorData.noseBoneHeight = X
                        Corazon.cCharacterCreatorData.noseBoneTwist = Y
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.noseBoneHeight = X
                        Corazon.iCharacterCreatorData.noseBoneTwist = Y
                    end)
                end
                if (self.FACE_F_NOSET) then
                    --- Peak
                    RageUI.GridPanel(Corazon.iCharacterCreatorData.nosePeakHeight, Corazon.iCharacterCreatorData.nosePeakLength, "Bout vers le haut", "Bout vers me nas", "Cassé gauche", "Cassé droite", function(Hovered, Active, X, Y)
                        Corazon.cCharacterCreatorData.nosePeakHeight = X
                        Corazon.cCharacterCreatorData.nosePeakLength = Y
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.nosePeakHeight = X
                        Corazon.iCharacterCreatorData.nosePeakLength = Y
                    end)
                end
                if (self.FACE_F_CHEEK) then
                    RageUI.GridPanel(Corazon.iCharacterCreatorData.cheeksBoneHeight, Corazon.iCharacterCreatorData.cheeksBoneWidth, "Haut", "Bas", "Intérieur", "Extérieur", function(Hovered, Active, X, Y)
                        Corazon.cCharacterCreatorData.cheeksBoneHeight = X
                        Corazon.cCharacterCreatorData.cheeksBoneWidth = Y
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.cheeksBoneHeight = X
                        Corazon.iCharacterCreatorData.cheeksBoneWidth = Y
                    end)
                end
                if (self.FACE_F_CHEEKS) then
                    RageUI.GridPanelHorizontal(Corazon.iCharacterCreatorData.cheeksBoneWidth, "Émacié", "Bouffi", function(Hovered, Active, X)
                        Corazon.cCharacterCreatorData.cheeksBoneWidth = X
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.cheeksBoneWidth = X
                    end)
                end
                if (self.FACE_F_LIPS) then
                    RageUI.GridPanelHorizontal(Corazon.iCharacterCreatorData.lipsThickness, "Minces", "Épaisses", function(Hovered, Active, X)
                        Corazon.cCharacterCreatorData.lipsThickness = X
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.lipsThickness = X
                    end)
                end
                if (self.FACE_F_JAW) then
                    RageUI.GridPanel(Corazon.iCharacterCreatorData.jawBoneWidth, Corazon.iCharacterCreatorData.jawBoneBackLength, "Ronde", "Carrée", "Étroite", "Large", function(Hovered, Active, X, Y)
                        Corazon.cCharacterCreatorData.jawBoneWidth = X
                        Corazon.cCharacterCreatorData.jawBoneBackLength = Y
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.jawBoneWidth = X
                        Corazon.iCharacterCreatorData.jawBoneBackLength = Y
                    end)
                end
                if (self.FACE_F_CHIN) then
                    RageUI.GridPanel(Corazon.iCharacterCreatorData.chimpBoneLength, Corazon.iCharacterCreatorData.chimpBoneWidth, "Haut", "Bas", "Intérieur", "Extérieur", function(Hovered, Active, X, Y)
                        Corazon.cCharacterCreatorData.chimpBoneLength = X
                        Corazon.cCharacterCreatorData.chimpBoneWidth = Y
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.chimpBoneLength = X
                        Corazon.iCharacterCreatorData.chimpBoneWidth = Y
                    end)
                end
                if (self.FACE_F_CHINS) then
                    RageUI.GridPanel(Corazon.iCharacterCreatorData.chimpHole, Corazon.iCharacterCreatorData.chimpBoneLowering, "Arrondi", "Fossette", "Carré", "Pointu", function(Hovered, Active, X, Y)
                        Corazon.cCharacterCreatorData.chimpHole = X
                        Corazon.cCharacterCreatorData.chimpBoneLowering = Y
                        setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                        Corazon.iCharacterCreatorData.chimpHole = X
                        Corazon.iCharacterCreatorData.chimpBoneLowering = Y
                    end)
                end
            end)
        end

        if RageUI.Visible(RMenu:Get('charCreator', 'customAdvanced')) then
            local HairCutStyles = {}
            if (Corazon.cCharacterCreatorDataPED) == "mp_m_freemode_01" then
                for i = 1, #hairListM, 1 do
                    table.insert(HairCutStyles, hairListM[i].name)
                end
            elseif (Corazon.cCharacterCreatorDataPED) == "mp_f_freemode_01" then
                for i = 1, #hairListF, 1 do
                    table.insert(HairCutStyles, hairListF[i].name)
                end
            end
            
            RageUI.DrawContent({ header = true, instructionalButton = true }, function()
                RageUI.List(GetLabelText("FACE_HAIR"), HairCutStyles, Corazon.iCharacterCreatorData.hairStyle, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Corazon.cCharacterCreatorData.hairStyle ~= Index then
                            Corazon.cCharacterCreatorData.hairStyle = Index -1 
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.hairStyle = Index -1 
                        end
                        self.FACE_HAIR = true
                    else
                        self.FACE_HAIR = false
                    end
                end)
                if (GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01')) then
                    RageUI.List("Barbe", BarbeName, Corazon.iCharacterCreatorData.beardStyle, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                        if Active then
                            if Corazon.cCharacterCreatorData.beardStyle ~= Index then
                                Corazon.cCharacterCreatorData.beardStyle = Index - 1
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.iCharacterCreatorData.beardStyle = Index - 1
                            end
                            self.FACE_BEARD = true
                        else
                            self.FACE_BEARD = false
                        end
                    end)
                end
                RageUI.List(GetLabelText("FACE_F_SKINB"), tachList, Corazon.iCharacterCreatorData.blemishesStyle + 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Corazon.cCharacterCreatorData.blemishesStyle ~= Index - 1 then
                            Corazon.cCharacterCreatorData.blemishesStyle = Index - 1 
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.blemishesStyle = Index - 1
                        end
                        self.FACE_TACH = true
                    else
                        self.FACE_TACH = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_SKINA"), rideList, Corazon.iCharacterCreatorData.ageingStyle + 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Corazon.cCharacterCreatorData.ageingStyle ~= Index - 1 then
                            Corazon.cCharacterCreatorData.ageingStyle = Index - 1
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.ageingStyle = Index - 1
                        end
                        self.FACE_AGE = true
                    else
                        self.FACE_AGE = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_SKC"), SKClist, Corazon.iCharacterCreatorData.skinAspectStyle + 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Corazon.cCharacterCreatorData.skinAspectStyle ~= Index - 1 then
                            Corazon.cCharacterCreatorData.skinAspectStyle = Index - 1
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.skinAspectStyle = Index - 1
                        end
                        self.skin_Aspect = true
                    else
                        self.skin_Aspect = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_MOLE"), MoleList, Corazon.iCharacterCreatorData.frecklesStyle + 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Corazon.cCharacterCreatorData.frecklesStyle ~= Index - 1 then
                            Corazon.cCharacterCreatorData.frecklesStyle = Index - 1
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.frecklesStyle = Index - 1
                        end
                        self.freckles = true
                    else
                        self.freckles = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_SUND"), ComplexList, Corazon.iCharacterCreatorData.complexionStyle + 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Corazon.cCharacterCreatorData.complexionStyle ~= Index - 1 then
                            Corazon.cCharacterCreatorData.complexionStyle = Index - 1
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.complexionStyle = Index - 1
                        end
                        self.complexion = true
                    else
                        self.complexion = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_APP_EYE"), eyesList, Corazon.iCharacterCreatorData.eyeStyle + 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Corazon.cCharacterCreatorData.eyeStyle ~= Index - 1 then
                            Corazon.cCharacterCreatorData.eyeStyle = Index - 1
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.eyeStyle = Index - 1
                        end
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_EYEM"), MaquillageList, Corazon.iCharacterCreatorData.makeupStyle + 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Corazon.cCharacterCreatorData.makeupStyle ~= Index - 1 then
                            Corazon.cCharacterCreatorData.makeupStyle = Index - 1
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.makeupStyle = Index - 1
                        end
                        self.makeup = true
                    else
                        self.makeup = false
                    end
                end)
                RageUI.List(GetLabelText("FACE_F_LIPST"), LipsList, Corazon.iCharacterCreatorData.lipstickStyle + 1, GetLabelText("FACE_APP_H"), {}, true, function(Hovered, Active, Selected, Index)
                    if Active then
                        if Corazon.cCharacterCreatorData.lipstickStyle ~= Index - 1 then
                            Corazon.cCharacterCreatorData.lipstickStyle = Index - 1
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.lipstickStyle = Index - 1
                        end
                        self.lipstick = true
                    else
                        self.lipstick = false
                    end
                end)
            end, function()
                --- Panel
                if self.FACE_HAIR then
                    RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut, colorsPanel.haircut[1], Corazon.iCharacterCreatorData.hairColor[1] + 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.hairColor[1] ~= CurrentIndex - 1 then
                                Corazon.iCharacterCreatorData.hairColor[1] = CurrentIndex - 1
                                colorsPanel.haircut[1] = MinimumIndex
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.cCharacterCreatorData.hairColor[1] = CurrentIndex - 1
                            end
                        end
                    end)
                    RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorsPanel.haircut[2], Corazon.iCharacterCreatorData.hairColor[2] + 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.hairColor[2] ~= CurrentIndex - 1 then
                                Corazon.iCharacterCreatorData.hairColor[2] = CurrentIndex - 1
                                colorsPanel.haircut[2] = MinimumIndex
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.cCharacterCreatorData.hairColor[2] = CurrentIndex - 1
                            end
                        end
                    end)
                end
                if self.lipstick then
                    RageUI.PercentagePanel(Corazon.iCharacterCreatorData.lipstickOpacity, "Opacité", nil, nil, function(Hovered, Active, Percent)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.lipstickOpacity ~= Percent then
                                Corazon.cCharacterCreatorData.lipstickOpacity = Percent
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.iCharacterCreatorData.lipstickOpacity = Percent
                            end
                        end
                    end)
                    RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut, colorsPanel.lipstick[1], Corazon.iCharacterCreatorData.lipstickColor[1] + 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.lipstickColor[1] ~= CurrentIndex - 1 then
                                Corazon.iCharacterCreatorData.lipstickColor[1] = CurrentIndex - 1
                                colorsPanel.lipstick[1] = MinimumIndex
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.cCharacterCreatorData.lipstickColor[1] = CurrentIndex - 1
                            end
                        end
                    end)
                    RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorsPanel.lipstick[2], Corazon.iCharacterCreatorData.lipstickColor[2] + 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.lipstickColor[2] ~= CurrentIndex - 1 then
                                Corazon.iCharacterCreatorData.lipstickColor[2] = CurrentIndex - 1
                                colorsPanel.lipstick[2] = MinimumIndex
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.cCharacterCreatorData.lipstickColor[2] = CurrentIndex - 1
                            end
                        end
                    end)
                end
                if self.makeup then
                    RageUI.PercentagePanel(Corazon.iCharacterCreatorData.makeupOpacity, "Opacité", nil, nil, function(Hovered, Active, Percent)
                        if Corazon.cCharacterCreatorData.makeupOpacity ~= Percent then
                            Corazon.cCharacterCreatorData.makeupOpacity = Percent
                            setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                            Corazon.iCharacterCreatorData.makeupOpacity = Percent
                        end
                    end)
                    RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut, colorsPanel.makeup[1], Corazon.iCharacterCreatorData.makeupColor[1] + 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.makeupColor[1] ~= CurrentIndex - 1 then
                                Corazon.iCharacterCreatorData.makeupColor[1] = CurrentIndex - 1
                                colorsPanel.makeup[1] = MinimumIndex
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.cCharacterCreatorData.makeupColor[1] = CurrentIndex - 1
                            end
                        end
                    end)
                    RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorsPanel.makeup[2], Corazon.iCharacterCreatorData.makeupColor[2] + 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.makeupColor[2] ~= CurrentIndex - 1 then
                                Corazon.iCharacterCreatorData.makeupColor[2] = CurrentIndex - 1
                                colorsPanel.makeup[2] = MinimumIndex
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.cCharacterCreatorData.makeupColor[2] = CurrentIndex - 1
                            end
                        end
                    end)
                end
                if self.FACE_BEARD then
                    RageUI.PercentagePanel(Corazon.iCharacterCreatorData.beardOpacity, "Opacité", nil, nil, function(Hovered, Active, Percent)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.beardOpacity ~= Percent then
                                Corazon.cCharacterCreatorData.beardOpacity = Percent
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.iCharacterCreatorData.beardOpacity = Percent
                            end
                        end
                    end)
                    RageUI.ColourPanel("Couleur principale", RageUI.PanelColour.HairCut, colorsPanel.barber[1], Corazon.iCharacterCreatorData.beardColor[1] + 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.beardColor[1] ~= CurrentIndex - 1 then
                                Corazon.iCharacterCreatorData.beardColor[1] = CurrentIndex - 1
                                colorsPanel.barber[1] = MinimumIndex
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.cCharacterCreatorData.beardColor[1] = CurrentIndex - 1
                            end
                        end
                    end)
                    RageUI.ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, colorsPanel.barber[2], Corazon.iCharacterCreatorData.beardColor[2] + 1, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.beardColor[2] ~= CurrentIndex - 1 then
                                Corazon.iCharacterCreatorData.beardColor[2] = CurrentIndex - 1
                                colorsPanel.barber[2] = MinimumIndex
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.cCharacterCreatorData.beardColor[2] = CurrentIndex - 1
                            end
                        end
                    end)
                end
                if self.FACE_TACH then
                    RageUI.PercentagePanel(Corazon.iCharacterCreatorData.blemishesOpacity, "Opacité", nil, nil, function(Hovered, Active, Percent)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.blemishesOpacity ~= Percent then
                                Corazon.cCharacterCreatorData.blemishesOpacity = Percent
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.iCharacterCreatorData.blemishesOpacity = Percent
                            end
                        end
                    end)
                end
                if self.FACE_AGE then
                    RageUI.PercentagePanel(Corazon.iCharacterCreatorData.ageingOpacity, "Opacité", nil, nil, function(Hovered, Active, Percent)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.ageingOpacity ~= Percent then
                                Corazon.cCharacterCreatorData.ageingOpacity = Percent
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.iCharacterCreatorData.ageingOpacity = Percent
                            end
                        end
                    end)
                end
                if self.skin_Aspect then
                    RageUI.PercentagePanel(Corazon.iCharacterCreatorData.skinAspectOpacity, "Opacité", nil, nil, function(Hovered, Active, Percent)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.skinAspectOpacity ~= Percent then
                                Corazon.cCharacterCreatorData.skinAspectOpacity = Percent
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.iCharacterCreatorData.skinAspectOpacity = Percent
                            end
                        end
                    end)
                end
                if self.freckles then
                    RageUI.PercentagePanel(Corazon.iCharacterCreatorData.frecklesOpacity, "Opacité", nil, nil, function(Hovered, Active, Percent)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.frecklesOpacity ~= Percent then
                                Corazon.cCharacterCreatorData.frecklesOpacity = Percent
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.iCharacterCreatorData.frecklesOpacity = Percent
                            end
                        end
                    end)
                end
                if self.complexion then
                    RageUI.PercentagePanel(Corazon.iCharacterCreatorData.complexionOpacity, "Opacité", nil, nil, function(Hovered, Active, Percent)
                        if (Active) then
                            if Corazon.cCharacterCreatorData.complexionOpacity ~= Percent then
                                Corazon.cCharacterCreatorData.complexionOpacity = Percent
                                setPlayerFaceCreator(GetPlayerPed(-1), Corazon.cCharacterCreatorData, skin)
                                Corazon.iCharacterCreatorData.complexionOpacity = Percent
                            end
                        end
                    end)
                end
            end)
        end
        
        if RageUI.Visible(RMenu:Get('charCreator', 'identity')) then
            RageUI.DrawContent({ header = true, instructionalButton = true }, function()
                RageUI.Button(translate('identity_nomrp'), translate('identity_nomrp'), { RightLabel = Corazon.cIdentity.Name }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.cIdentity.Name = KeyboardInput("Nom Complet", "Name", 25)
					end
				end)
		
				RageUI.Button(translate('identity_lieudn'), translate('identity_lieudn'), { RightLabel = Corazon.cIdentity.Lieu }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.cIdentity.Lieu = KeyboardInput("Lieu de naissance", "Blaine County", 25)
					end
				end)
		
				RageUI.Button("Date de naissance", "Date de naissance", { RightLabel = Corazon.cIdentity.Date }, true, function(Hovered, Active, Selected)
					if Selected then
						Corazon.cIdentity.Date = KeyboardInput("Date de naissance", "03/06/1999", 25)
					end
				end)

            end, function()

            end)
        end
    end, 1)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            
RegisterNetEvent("corazon.character:openCreationMenu")
AddEventHandler("corazon.character:openCreationMenu", function()
    openCharCreatorMenu()
    Wait(25)
    RageUI.Visible(RMenu:Get('charCreator', 'main'), not RageUI.Visible(RMenu:Get('charcrea', 'main')))
end)

RegisterCommand("perso", function()
    openCharCreatorMenu()
    Wait(25)
	RageUI.Visible(RMenu:Get('charCreator', 'main'), not RageUI.Visible(RMenu:Get('charcrea', 'main')))
end)

--[[
local FirstSpawn = true

function callBackSpawnPlayer()

    local charID = getCharID()

    if charID == 1 then
        Citizen.CreateThread(function()
            if FirstSpawn then
                TriggerServerCallback('corazon_character:getPlayerSkinOne', function(skin, ped)
                
                    if ped ~= nil and skin ~= nil then
                        setPlayerPed(ped)
                        Wait(1000)
                        setPlayerFaceSpawn(skin)
                    elseif ped == nil and skin == nil then
                        RemoveLoadingPrompt()
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)
                        TriggerEvent("corazon.character:openCreationMenu")
                    elseif ped == nil then
                        RemoveLoadingPrompt()
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)
                        TriggerEvent("corazon.character:openCreationMenu")
                    elseif skin == nil then 
                        RemoveLoadingPrompt()
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)
                        TriggerEvent("corazon.character:openCreationMenu")
                    end
                    FirstSpawn = false
                end)
            end
        end)          
    elseif charID == 2 then
        Citizen.CreateThread(function()
            if FirstSpawn then
                TriggerServerCallback('corazon_character:getPlayerSkinTwo', function(skin, ped)
                    if ped ~= nil and skin ~= nil then
                        setPlayerPed(ped)
                        Wait(1000)
                        setPlayerFaceSpawn(skin)
                    elseif ped == nil and skin == nil then
                        RemoveLoadingPrompt()
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)
                        TriggerEvent("corazon.character:openCreationMenu")
                    elseif ped == nil then
                        RemoveLoadingPrompt()
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)
                        TriggerEvent("corazon.character:openCreationMenu")
                    elseif skin == nil then 
                        RemoveLoadingPrompt()
                        LoadingPrompt("Un problème est survenu, redirection en cours", 3)
                        Wait(2500)
                        RemoveLoadingPrompt()
                        LoadingPrompt("Veuillez patienter", 3)
                        TriggerEvent("corazon.character:openCreationMenu")
                    end
                    FirstSpawn = false
                end)
            end
        end)
	end
end

RegisterNetEvent("corazon.character:callbackSpawnPlayer")
AddEventHandler("corazon.character:callbackSpawnPlayer", function()
    callBackSpawnPlayer()
end)
--]]

--[[
RegisterCommand("spawnPerso", function()
    --print("fzefz")
    callBackSpawnPlayer()
end)

RegisterCommand("setCharID", function()
    setCharID("1")
end)
--]]

RegisterCommand("setMP", function()
    setPlayerPed("mp_m_freemode_01")
end)
