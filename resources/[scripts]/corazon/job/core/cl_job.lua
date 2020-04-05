local Corazon.JobPlayerData = {
    jobName = "",
    jobGrade = "",
    jobGradeLevel = "",
    jobSalary = ""
}

--------------------------------------

local function getJobPlayer()
    Corazon.JobPlayerData.jobName = getPlayerJob()
    Corazon.JobPlayerData.jobGradeLevel = getPlayerJobGrade()

    if Corazon.JobPlayerData.jobName = "police" then 
        Corazon.JobPlayerData.jobName = "Policier"
        if Corazon.JobPlayerData.jobGradeLevel = "1" then 
            Corazon.JobPlayerData.jobGrade = Corazon.Job.Config.police.cadet.jobGradeName
            Corazon.JobPlayerData.jobSalary = Corazon.Job.Config.police.cadet.jobSalary
        elseif Corazon.JobPlayerData.jobGradeLevel = "2" then 
            Corazon.JobPlayerData.jobGrade = Corazon.Job.Config.police[1].officier.jobGradeName
            Corazon.JobPlayerData.jobSalary = Corazon.Job.Config.police.officier[1].jobSalary
        elseif Corazon.JobPlayerData.jobGradeLevel = "3" then 
            Corazon.JobPlayerData.jobGrade = Corazon.Job.Config.police[2].officier.jobGradeName
            Corazon.JobPlayerData.jobSalary = Corazon.Job.Config.police.officier[2].jobSalary
        elseif Corazon.JobPlayerData.jobGradeLevel = "4" then 
            Corazon.JobPlayerData.jobGrade = Corazon.Job.Config.police[3].officier.jobGradeName
            Corazon.JobPlayerData.jobSalary = Corazon.Job.Config.police.officier[3].jobSalary
        elseif Corazon.JobPlayerData.jobGradeLevel = "5" then 
            Corazon.JobPlayerData.jobGrade = Corazon.Job.Config.police.sergent.jobGradeName
            Corazon.JobPlayerData.jobSalary = Corazon.Job.Config.police.sergent.jobSalary
        elseif Corazon.JobPlayerData.jobGradeLevel = "6" then 
            Corazon.JobPlayerData.jobGrade = Corazon.Job.Config.police.lieutenant.jobGradeName
            Corazon.JobPlayerData.jobSalary = Corazon.Job.Config.police.lieutenant.jobSalary
        elseif Corazon.JobPlayerData.jobGradeLevel = "7" then 
            Corazon.JobPlayerData.jobGrade = Corazon.Job.Config.police.capitaine.jobGradeName
            Corazon.JobPlayerData.jobSalary = Corazon.Job.Config.police.capitaine.jobSalary
        elseif Corazon.JobPlayerData.jobGradeLevel = "8" then 
            Corazon.JobPlayerData.jobGrade = Corazon.Job.Config.police.chief.jobGradeName
            Corazon.JobPlayerData.jobSalary = Corazon.Job.Config.police.chief.jobSalary
        end 
    end 
end