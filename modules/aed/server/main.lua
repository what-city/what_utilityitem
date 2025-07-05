RegisterNetEvent('utilityitem:aed:remove',  function(itemName)
    if not CONFIG_AED[itemName] then return end
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(itemName, 1)
end)

for itemName, itemData in pairs(CONFIG_AED) do
    ESX.RegisterUsableItem(itemName, function(source)
        if not CheckUsable(source, itemData?.usableJobs, itemData?.usableWhenHasAnyItem) then return end
        
        if itemData.area then
            TriggerClientEvent('utilityitem:use:aed:area', source, itemName)
        else
            TriggerClientEvent('utilityitem:use:aed', source, itemName)
        end
    end)
end