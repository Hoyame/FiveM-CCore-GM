Config = {}

Config.Language = 'french'

--Config.multiCharacter = true 
Config.copsWanted = true
Config.enablePvP = true 

Config.cashStartPlayer = 1000
Config.bankStartPlayer = 500
Config.dirtyStartPlayer = 0

--Config.showHUD = false 


function getCashStartPlayer()
    return Config.cashStartPlayer
end

function getBankStartPlayer()
    return Config.bankStartPlayer
end

function getDirtyStartPlayer()
    return Config.dirtyStartPlayer
end