local function RespawnPed()
    local ped = lib.cache('ped')
    local coords = GetEntityCoords(ped)

    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, 0.0, true, false)

    ClearPedBloodDamage(ped)
    ClearPedTasksImmediately(ped)
    ClearPlayerWantedLevel(lib.cache('playerId'))
    FreezeEntityPosition(ped, false)

    TriggerEvent('esx:onPlayerSpawn', coords.x, coords.y, coords.z)
    TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
end

RegisterNetEvent('utilityitem:cl:revive', function(health)
    if not LocalPlayer.state.isDead then return end

    DoScreenFadeOut(800)
    while not IsScreenFadedOut() do Wait(50) end

    RespawnPed()

    lib.timer(300, function()
        local ped = lib.cache('ped')
        local coords = GetEntityCoords(ped)
        health = health or 150
        SetEntityHealth(ped, health)
        ClearArea(coords.x, coords.y, coords.z, 500.0, true, true, true, false)
        DoScreenFadeIn(800)
    end)
end)