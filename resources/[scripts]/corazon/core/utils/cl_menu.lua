CCore.Menu = {}


function CCore.Menu:CreateMenu(nomMenu, header, subTitle, , enableMouse, notClosable)

    if not header then 
        RMenu.Add(nomMenu, 'main', RageUI.CreateMenu(subTitle, ""))
    else 
        RMenu.Add(nomMenu, 'main', RageUI.CreateMenu(subTitle, "", nil, nil, header, header))
    end

    if enableMouse == true then 
        RMenu:Get(nomMenu, 'main').EnableMouse = true
    end 

    if notClosable == true then 
        RMenu:Get(nomMenu, 'main').Closable = false;
    end

end 

function CCore.Menu:AddSubMenu(nomMenu, nomSubMenu, nomHeader, nomDescription)
    RMenu.Add(nomMenu, nomSubMenu, RageUI.CreateSubMenu(RMenu:Get(nomMenu, nomSubMenu), nomHeader, nomDescription))
end

function CCore.Menu.DeleteMenu(nomMenu, nomSubMenu)
    RageUI.CloseAll()
    RMenu:Delete(nomMenu, nomSubMenu)
end

function CCore.Menu.OpenMenu(nomMenu, nomSubMenu)
    RageUI.Visible(RMenu:Get(nomMenu, nomSubMenu), not RageUI.Visible(RMenu:Get(nomMenu, nomSubMenu)))
end

