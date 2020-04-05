Corazon.PlayerData = {}

Corazon.PlayerData.license = nil
Corazon.PlayerData.job = nil
Corazon.PlayerData.jobGrade = nil
Corazon.PlayerData.perm = nil
--Corazon.PlayerData.charID = nil
Corazon.PlayerData.espece = nil
Corazon.PlayerData.banque = nil
Corazon.PlayerData.sale = nil
Corazon.PlayerData.vIDname = nil
Corazon.PlayerData.vIDlieu = nil
Corazon.PlayerData.vIDjour = nil
Corazon.PlayerData.vIDmois = nil
Corazon.PlayerData.vIDannee = nil
Corazon.PlayerData.vIDarme = false
Corazon.PlayerData.vIDcamion = false
Corazon.PlayerData.vIDvoiture = false
Corazon.PlayerData.vIDmoto = false
Corazon.PlayerData.fIDname = nil
Corazon.PlayerData.fIDlieu = nil
Corazon.PlayerData.fIDjour = nil
Corazon.PlayerData.fIDmois = nil
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
                espece = nil,
                banque = nil,
                sale = nil,
                vIDname = nil,
                vIDlieu = nil,
                vIDjour = nil,
                vIDmois = nil,
                vIDannee = nil,
                vIDjob  = false,
                vIDarme = false,
                vIDcamion = false,
                vIDvoiture = false,
                vIDmoto = false,
                fIDname = nil,
                fIDlieu = nil,
                fIDjour = nil,
                fIDmois = nil,
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

            if player.espece ~= nil then 
                tblPlayer.espece = player.espece 
            elseif player.banque ~= nil then 
                tblPlayer.banque = player.banque 
            elseif player.sale ~= nil then 
                tblPlayer.sale = player.sale 
            end

            --- Identité

            if player.vIDname ~= nil then 
                tblPlayer.vIDname = player.vIDname 
            elseif player.vIDlieu ~= nil then 
                tblPlayer.vIDlieu = player.vIDlieu 
            elseif player.vIDjour ~= nil then 
                tblPlayer.vIDjour = player.vIDjour 
            elseif player.vIDmois ~= nil then 
                tblPlayer.vIDmois = player.vIDmois 
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
            elseif player.fIDjour ~= nil then 
                tblPlayer.fIDjour = player.fIDjour        
            elseif player.fIDmois ~= nil then 
                tblPlayer.fIDmois = player.fIDmois        
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
            Corazon.PlayerData.espece = tblPlayer.espece
            Corazon.PlayerData.banque = tblPlayer.banque
            Corazon.PlayerData.sale = tblPlayer.sale
            Corazon.PlayerData.vIDname = tblPlayer.vIDname
            Corazon.PlayerData.vIDlieu = tblPlayer.vIDlieu
            Corazon.PlayerData.vIDjour = tblPlayer.vIDjour
            Corazon.PlayerData.vIDmois = tblPlayer.vIDmois
            Corazon.PlayerData.vIDannee = tblPlayer.vIDannee
            Corazon.PlayerData.vIDarme = tblPlayer.vIDarme
            Corazon.PlayerData.vIDcamion = tblPlayer.vIDcamion
            Corazon.PlayerData.vIDvoiture = tblPlayer.vIDvoiture
            Corazon.PlayerData.vIDmoto = tblPlayer.vIDmoto
            Corazon.PlayerData.fIDname = tblPlayer.fIDname
            Corazon.PlayerData.fIDlieu = tblPlayer.fIDlieu
            Corazon.PlayerData.fIDjour = tblPlayer.fIDjour
            Corazon.PlayerData.fIDmois = tblPlayer.fIDmois
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
                espece = nil,
                banque = nil,
                sale = nil,
                vIDname = nil,
                vIDlieu = nil,
                vIDjour = nil,
                vIDmois = nil,
                vIDannee = nil,
                vIDjob  = false,
                vIDarme = false,
                vIDcamion = false,
                vIDvoiture = false,
                vIDmoto = false,
                fIDname = nil,
                fIDlieu = nil,
                fIDjour = nil,
                fIDmois = nil,
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

            if player.espece ~= nil then 
                tblPlayer.espece = player.espece 
            elseif player.banque ~= nil then 
                tblPlayer.banque = player.banque 
            elseif player.sale ~= nil then 
                tblPlayer.sale = player.sale 
            end

            --- Identité

            if player.vIDname ~= nil then 
                tblPlayer.vIDname = player.vIDname 
            elseif player.vIDlieu ~= nil then 
                tblPlayer.vIDlieu = player.vIDlieu 
            elseif player.vIDjour ~= nil then 
                tblPlayer.vIDjour = player.vIDjour 
            elseif player.vIDmois ~= nil then 
                tblPlayer.vIDmois = player.vIDmois 
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
            elseif player.fIDjour ~= nil then 
                tblPlayer.fIDjour = player.fIDjour        
            elseif player.fIDmois ~= nil then 
                tblPlayer.fIDmois = player.fIDmois        
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
            Corazon.PlayerData.espece = tblPlayer.espece
            Corazon.PlayerData.banque = tblPlayer.banque
            Corazon.PlayerData.sale = tblPlayer.sale
            Corazon.PlayerData.vIDname = tblPlayer.vIDname
            Corazon.PlayerData.vIDlieu = tblPlayer.vIDlieu
            Corazon.PlayerData.vIDjour = tblPlayer.vIDjour
            Corazon.PlayerData.vIDmois = tblPlayer.vIDmois
            Corazon.PlayerData.vIDannee = tblPlayer.vIDannee
            Corazon.PlayerData.vIDarme = tblPlayer.vIDarme
            Corazon.PlayerData.vIDcamion = tblPlayer.vIDcamion
            Corazon.PlayerData.vIDvoiture = tblPlayer.vIDvoiture
            Corazon.PlayerData.vIDmoto = tblPlayer.vIDmoto
            Corazon.PlayerData.fIDname = tblPlayer.fIDname
            Corazon.PlayerData.fIDlieu = tblPlayer.fIDlieu
            Corazon.PlayerData.fIDjour = tblPlayer.fIDjour
            Corazon.PlayerData.fIDmois = tblPlayer.fIDmois
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
	cb(Corazon.PlayerData)
end)
