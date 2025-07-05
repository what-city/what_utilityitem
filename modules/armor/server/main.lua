for itemName, itemData in pairs(CONFIG_ARMOR) do
    ESX.RegisterUsableItem(itemName, function(source)
        if not CheckUsableJob(source, itemData?.usableJobs) then return end
        
        local removeItem = lib.callback.await('utilityitem:use:armor', source, itemName)
        if removeItem then
            if itemData.remove == nil or itemData.remove == true then
                local xPlayer = ESX.GetPlayerFromId(source)
                xPlayer.removeInventoryItem(itemName, 1)
            end
        end
    end)
end