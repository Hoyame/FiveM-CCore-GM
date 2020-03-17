--local charID = 1

--[[
function test()
    DoScreenFadeIn(800)
    RemoveLoadingPrompt()
end

RegisterCommand("testIn", function()
    test()
end)


function tests()
    DoScreenFadeOut(800)
    LoadingPrompt("Synchronisation en cours...", 3)
end

RegisterCommand("testOut", function()
    tests()
end)


function zboubi(charID)
    print("1"..charID.."1")
end
--]]