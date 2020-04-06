Corazon.PlayerData = {}

Corazon.PlayerData.license = nil
Corazon.PlayerData.job = nil
Corazon.PlayerData.jobGrade = nil
Corazon.PlayerData.perm = nil
--Corazon.PlayerData.charID = nil
Corazon.PlayerData.cash = nil
Corazon.PlayerData.bank = nil
Corazon.PlayerData.dirty = nil
Corazon.PlayerData.vIDname = nil
Corazon.PlayerData.vIDlieu = nil
Corazon.PlayerData.vIDday = nil
Corazon.PlayerData.vIDmonth = nil
Corazon.PlayerData.vIDannee = nil
Corazon.PlayerData.vIDarme = false
Corazon.PlayerData.vIDcamion = false
Corazon.PlayerData.vIDvoiture = false
Corazon.PlayerData.vIDmoto = false
Corazon.PlayerData.fIDname = nil
Corazon.PlayerData.fIDlieu = nil
Corazon.PlayerData.fIDday = nil
Corazon.PlayerData.fIDmonth = nil
Corazon.PlayerData.fIDannee = nil
Corazon.PlayerData.fIDjob = nil
Corazon.PlayerData.fIDarme = false
Corazon.PlayerData.fIDcamion = false
Corazon.PlayerData.fIDvoiture = false
Corazon.PlayerData.fIDmoto = false


function loadPlayerDataCharacter(charID, source)
    local source = source 
    local charID = charID
	local license = GetPlayerIdentifiers(source)[1]
    Corazon.PlayerData.license = license 
    
    if charID == 1 or "1" then 
        MySQL.Async.fetchAll('SELECT * FROM players_d1_char WHERE license = @license', {['@license'] = license}, function(players_d1_char)

            local player = players_d1_char[1]

            local tblPlayer = {
                job = nil,
                jobGrade = nil, 
                perm = nil,
                cash = nil,
                bank = nil,
                dirty = nil,
                vIDname = nil,
                vIDlieu = nil,
                vIDday = nil,
                vIDmonth = nil,
                vIDannee = nil,
                vIDjob  = false,
                vIDarme = false,
                vIDcamion = false,
                vIDvoiture = false,
                vIDmoto = false,
                fIDname = nil,
                fIDlieu = nil,
                fIDday = nil,
                fIDmonth = nil,
                fIDannee = nil,
                fIDjob  = false,
                fIDarme = false,
                fIDcamion = false,
                fIDvoiture = false,
                fIDmoto = false
            }


            if player.pJob ~= nil then 
                tblPlayer.job = player.pJob 
            elseif player.jobGrade ~= nil then 
                tblPlayer.jobGrade = player.jobGrade 
            elseif player.perm ~= nil then 
                tblPlayer.perm = player.perm 
            end

            --- Money 

            if player.cash ~= nil then 
                tblPlayer.cash = player.cash 
            elseif player.bank ~= nil then 
                tblPlayer.bank = player.bank 
            elseif player.dirty ~= nil then 
                tblPlayer.dirty = player.dirty 
            end

            --- Identité

            if player.vIDname ~= nil then 
                tblPlayer.vIDname = player.vIDname 
            elseif player.vIDlieu ~= nil then 
                tblPlayer.vIDlieu = player.vIDlieu 
            elseif player.vIDday ~= nil then 
                tblPlayer.vIDday = player.vIDday 
            elseif player.vIDmonth ~= nil then 
                tblPlayer.vIDmonth = player.vIDmonth 
            elseif player.vIDannee ~= nil then 
                tblPlayer.vIDannee = player.vIDannee 
            elseif player.vIDjob ~= nil then 
                tblPlayer.vIDjob = player.vIDjob 
            elseif player.vIDarme == 1 then 
                tblPlayer.vIDarme = true
            elseif player.vIDcamion == 1 then 
                tblPlayer.vIDcamion = true
            elseif player.vIDvoiture == 1 then 
                tblPlayer.vIDvoiture = true
            elseif player.vIDannee == 1 then 
                tblPlayer.vIDmoto = true
            end

            --- Fausse identité

            if player.fIDname ~= nil then 
                tblPlayer.fIDname = player.fIDname 
            elseif player.fIDlieu ~= nil then 
                tblPlayer.fIDlieu = player.fIDlieu        
            elseif player.fIDday ~= nil then 
                tblPlayer.fIDday = player.fIDday        
            elseif player.fIDmonth ~= nil then 
                tblPlayer.fIDmonth = player.fIDmonth        
            elseif player.fIDannee ~= nil then 
                tblPlayer.fIDannee = player.fIDannee 
            elseif player.fIDjob ~= nil then 
                tblPlayer.fIDjob = player.fIDjob       
            elseif player.fIDarme == 1 then 
                tblPlayer.fIDarme = true      
            elseif player.fIDcamion == 1 then 
                tblPlayer.fIDcamion = true      
            elseif player.fIDvoiture == 1 then 
                tblPlayer.fIDvoiture = true     
            elseif player.fIDannee == 1 then 
                tblPlayer.fIDmoto = true
            end


            Corazon.PlayerData.job = tblPlayer.job
            Corazon.PlayerData.jobGrade = tblPlayer.jobGrade
            Corazon.PlayerData.perm = tblPlayer.perm
            Corazon.PlayerData.cash = tblPlayer.cash
            Corazon.PlayerData.bank = tblPlayer.bank
            Corazon.PlayerData.dirty = tblPlayer.dirty
            Corazon.PlayerData.vIDname = tblPlayer.vIDname
            Corazon.PlayerData.vIDlieu = tblPlayer.vIDlieu
            Corazon.PlayerData.vIDday = tblPlayer.vIDday
            Corazon.PlayerData.vIDmonth = tblPlayer.vIDmonth
            Corazon.PlayerData.vIDannee = tblPlayer.vIDannee
            Corazon.PlayerData.vIDarme = tblPlayer.vIDarme
            Corazon.PlayerData.vIDcamion = tblPlayer.vIDcamion
            Corazon.PlayerData.vIDvoiture = tblPlayer.vIDvoiture
            Corazon.PlayerData.vIDmoto = tblPlayer.vIDmoto
            Corazon.PlayerData.fIDname = tblPlayer.fIDname
            Corazon.PlayerData.fIDlieu = tblPlayer.fIDlieu
            Corazon.PlayerData.fIDday = tblPlayer.fIDday
            Corazon.PlayerData.fIDmonth = tblPlayer.fIDmonth
            Corazon.PlayerData.fIDannee = tblPlayer.fIDannee
            Corazon.PlayerData.fIDjob = tblPlayer.fIDjob 
            Corazon.PlayerData.fIDarme = tblPlayer.fIDarme
            Corazon.PlayerData.fIDcamion = tblPlayer.fIDcamion
            Corazon.PlayerData.fIDvoiture = tblPlayer.fIDvoiture
            Corazon.PlayerData.fIDmoto = tblPlayer.fIDmoto

        end)

    elseif charID == 2 or "2" then 
        MySQL.Async.fetchAll('SELECT * FROM players_d2_char WHERE license = @license', {['@license'] = license}, function(players_d2_char)

            local player = players_d2_char[1]

            local tblPlayer = {
                job = nil,
                jobGrade = nil, 
                perm = nil,
                cash = nil,
                bank = nil,
                dirty = nil,
                vIDname = nil,
                vIDlieu = nil,
                vIDday = nil,
                vIDmonth = nil,
                vIDannee = nil,
                vIDjob  = false,
                vIDarme = false,
                vIDcamion = false,
                vIDvoiture = false,
                vIDmoto = false,
                fIDname = nil,
                fIDlieu = nil,
                fIDday = nil,
                fIDmonth = nil,
                fIDannee = nil,
                fIDjob  = false,
                fIDarme = false,
                fIDcamion = false,
                fIDvoiture = false,
                fIDmoto = false
            }


            if player.pJob ~= nil then 
                tblPlayer.job = player.pJob 
            elseif player.jobGrade ~= nil then 
                tblPlayer.jobGrade = player.jobGrade 
            elseif player.perm ~= nil then 
                tblPlayer.perm = player.perm 
            end

            --- Money 

            if player.cash ~= nil then 
                tblPlayer.cash = player.cash 
            elseif player.bank ~= nil then 
                tblPlayer.bank = player.bank 
            elseif player.dirty ~= nil then 
                tblPlayer.dirty = player.dirty 
            end

            --- Identité

            if player.vIDname ~= nil then 
                tblPlayer.vIDname = player.vIDname 
            elseif player.vIDlieu ~= nil then 
                tblPlayer.vIDlieu = player.vIDlieu 
            elseif player.vIDday ~= nil then 
                tblPlayer.vIDday = player.vIDday 
            elseif player.vIDmonth ~= nil then 
                tblPlayer.vIDmonth = player.vIDmonth 
            elseif player.vIDannee ~= nil then 
                tblPlayer.vIDannee = player.vIDannee 
            elseif player.vIDjob ~= nil then 
                tblPlayer.vIDjob = player.vIDjob 
            elseif player.vIDarme == 1 then 
                tblPlayer.vIDarme = true
            elseif player.vIDcamion == 1 then 
                tblPlayer.vIDcamion = true
            elseif player.vIDvoiture == 1 then 
                tblPlayer.vIDvoiture = true
            elseif player.vIDannee == 1 then 
                tblPlayer.vIDmoto = true
            end

            --- Fausse identité

            if player.fIDname ~= nil then 
                tblPlayer.fIDname = player.fIDname 
            elseif player.fIDlieu ~= nil then 
                tblPlayer.fIDlieu = player.fIDlieu        
            elseif player.fIDday ~= nil then 
                tblPlayer.fIDday = player.fIDday        
            elseif player.fIDmonth ~= nil then 
                tblPlayer.fIDmonth = player.fIDmonth        
            elseif player.fIDannee ~= nil then 
                tblPlayer.fIDannee = player.fIDannee 
            elseif player.fIDjob ~= nil then 
                tblPlayer.fIDjob = player.fIDjob       
            elseif player.fIDarme == 1 then 
                tblPlayer.fIDarme = true      
            elseif player.fIDcamion == 1 then 
                tblPlayer.fIDcamion = true      
            elseif player.fIDvoiture == 1 then 
                tblPlayer.fIDvoiture = true     
            elseif player.fIDannee == 1 then 
                tblPlayer.fIDmoto = true
            end


            Corazon.PlayerData.job = tblPlayer.job
            Corazon.PlayerData.jobGrade = tblPlayer.jobGrade
            Corazon.PlayerData.perm = tblPlayer.perm
            Corazon.PlayerData.cash = tblPlayer.cash
            Corazon.PlayerData.bank = tblPlayer.bank
            Corazon.PlayerData.dirty = tblPlayer.dirty
            Corazon.PlayerData.vIDname = tblPlayer.vIDname
            Corazon.PlayerData.vIDlieu = tblPlayer.vIDlieu
            Corazon.PlayerData.vIDday = tblPlayer.vIDday
            Corazon.PlayerData.vIDmonth = tblPlayer.vIDmonth
            Corazon.PlayerData.vIDannee = tblPlayer.vIDannee
            Corazon.PlayerData.vIDarme = tblPlayer.vIDarme
            Corazon.PlayerData.vIDcamion = tblPlayer.vIDcamion
            Corazon.PlayerData.vIDvoiture = tblPlayer.vIDvoiture
            Corazon.PlayerData.vIDmoto = tblPlayer.vIDmoto
            Corazon.PlayerData.fIDname = tblPlayer.fIDname
            Corazon.PlayerData.fIDlieu = tblPlayer.fIDlieu
            Corazon.PlayerData.fIDday = tblPlayer.fIDday
            Corazon.PlayerData.fIDmonth = tblPlayer.fIDmonth
            Corazon.PlayerData.fIDannee = tblPlayer.fIDannee
            Corazon.PlayerData.fIDjob = tblPlayer.fIDjob 
            Corazon.PlayerData.fIDarme = tblPlayer.fIDarme
            Corazon.PlayerData.fIDcamion = tblPlayer.fIDcamion
            Corazon.PlayerData.fIDvoiture = tblPlayer.fIDvoiture
            Corazon.PlayerData.fIDmoto = tblPlayer.fIDmoto

        end)
    end
end

function getPlayerDataCharacter(charID, source)
    return Corazon.PlayerData 
end

AddEventHandler('corazon:getPlayerDataCharacter', function(cb)
	cb(Corazon.PlayerData )
end)
