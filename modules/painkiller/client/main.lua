local isPainkillerInProgress = false

lib.callback.register('utilityitem:use:heal', function(itemName)
    if isPainkillerInProgress then return false end
    if LocalPlayer.state.isDead then return false end

    local ped = lib.cache('ped')

    if IsPedInAnyVehicle(ped, false) then return  false end

    ClearPedSecondaryTask(ped)

    local animLib, animName = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01'

    lib.requestAnimDict(animLib)
    TaskPlayAnim(ped, animLib, animName, 8.0, -8.0, 3000, 0, 0,  false, false, false)

    local itemConfig = CONFIG_PAINKILLER[itemName]
    local prop
    if itemConfig?.prop?.name then
        local objectName = itemConfig?.prop?.name or 'prop_ld_health_pack'
        lib.requestModel(objectName)
    
        local coords = GetEntityCoords(ped)
        prop = CreateObject(GetHashKey(objectName), coords.x, coords.y, coords.z, true, true, true)
        local boneIndex = GetPedBoneIndex(ped, 36029)
        AttachEntityToEntity(prop, ped, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 0.0, true, true, false, true, 1, true)
    end

    CreateThread(function()
        isPainkillerInProgress = true

        local duration = itemConfig?.duration or 3000
        local addHealth = itemConfig?.health or 20

        local startTime = GetGameTimer()
        while (GetGameTimer() - startTime) <= duration do Wait(0) end
        
        if prop ~= nil then
            DeleteEntity(prop)
        end

        local health = GetEntityHealth(ped)

        SetEntityHealth(ped, health + addHealth)
        ClearPedSecondaryTask(ped)
        RemoveAnimDict(animLib)

        isPainkillerInProgress = false
    end)

    return true
end)
