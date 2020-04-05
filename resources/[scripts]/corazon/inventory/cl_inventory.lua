

function sellItem(itemId, price)
    local item = ITEMS[itemId]

    item.quantity = item.quantity - 1

    TriggerServerEvent("item:sell", itemId, item.quantity, price)
    LoadInventaire()
end

function deleteItem(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local item = ITEMS[itemId]

    item.quantity = item.quantity - qty

    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
    TriggerEvent("farm:updateQuantity", item.quantity, itemId)
    LoadInventaire()
end

function addItem(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local item = ITEMS[itemId]

    item.quantity = item.quantity + qty

    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
    TriggerEvent("farm:updateQuantity", item.quantity, itemId)
    LoadInventaire()
end

function useItem(itemId, quantity)
 
	TriggerEvent('player:looseItem', itemId, quantity)

	if ITEMS[tonumber(itemId)].type == 2 then
       -- SOON
    elseif ITEMS[tonumber(itemId)].type == 1 then
        --SOON
    end

end

function getQuantity(itemId)
    return ITEMS[tonumber(itemId)].quantity
end

function notFull()
    local pods = 0
    
    for _, v in pairs(ITEMS) do
        pods = pods + v.quantity
    end
    
    if (pods < (maxCapacity-1)) then return true end
end
