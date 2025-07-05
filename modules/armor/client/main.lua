local isArmorInProgress = false

lib.callback.register('utilityitem:use:armor', function(itemName)
    if isArmorInProgress then return false end

    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then return false end

    ClearPedSecondaryTask(ped)

    local animLib, animName = 'clothingshirt', 'try_shirt_positive_d'

    lib.requestAnimDict(animLib)
    TaskPlayAnim(ped, animLib, animName, 1.0, -1, -1, 50, 0, false, false, false)
    
    CreateThread(function()
        isArmorInProgress = true

        local itemConfig = CONFIG_ARMOR[itemName]
        local duration = itemConfig?.duration or 3000
        local addArmor = itemConfig?.armor or 20

        local startTime = GetGameTimer()
        while (GetGameTimer() - startTime) <= duration do Wait(0) end

        local armor = GetPedArmour(ped)

        SetPedArmour(ped, armor + addArmor)
        ClearPedSecondaryTask(ped)
        RemoveAnimDict(animLib)
        
        isArmorInProgress = false
    end)

    return true
end)