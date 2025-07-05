local onSelectProgress = false
local onReviveProgress = false

local function ShowPlayerInArea(area)
    local ped = lib.cache('ped')
    local coords = GetEntityCoords(ped) - vec3(0,0, 1)
    local players = lib.getNearbyPlayers(coords, area, false)

    local marker = lib.marker.new({ type = 1, width = area * 2, height = 2.0, coords = coords, color = { r = 138, g = 234, b = 244, a = 150 }, rotation = vec3(0,0.0, 0) })
    marker:draw()

    for _, player in ipairs(players) do
        local targetServerId =  GetPlayerServerId(player.id)
        local targetIsDead = Player(targetServerId).state.isDead or false

        if targetIsDead then
            local playerCoords = player.coords + vec3(0, 0, 1.0)

            local playerMarker = lib.marker.new({ type = 2, width = 0.5, height = 0.5, coords = playerCoords, color = { r = 138, g = 234, b = 244, a = 150 }, rotation = vec3(0, 180.0, 0.0) })
            playerMarker:draw()
        end
    end
end

local function ReviveProcess(itemName)
    onReviveProgress = true

    local itemConfig = CONFIG_AED[itemName]
    local ped = lib.cache('ped')
    local animLib, animName = 'amb@medic@standing@kneel@idle_a', 'idle_a'

    ESX.UI.Menu.CloseAll()
    lib.requestAnimDict(animLib)

    local lastPlayAnim = GetGameTimer()

    local duration = itemConfig?.duration or 10000
    local health = itemConfig?.health or 150
    local label = itemConfig?.progress?.label or 'Revive Player...'

    TriggerEvent('mythic_progbar:client:ProgressWithStartAndTick', {
        name = 'use_reviveitem',
        duration = duration,
        label = label,
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement    = false,
            disableCarMovement = false,
            disableMouse       = false,
            disableCombat      = false
        },
    }, function ()
        lastPlayAnim = GetGameTimer()
        TaskPlayAnim(ped, animLib, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
    end,
    function ()
        if IsControlJustPressed(0, 73) or IsDisabledControlJustPressed(0, 73) then
            TriggerEvent('mythic_progbar:client:cancel')
        end
        if (GetGameTimer() - lastPlayAnim) > 900 then
            lastPlayAnim = GetGameTimer()
            TaskPlayAnim(ped, animLib, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
        end

        ShowPlayerInArea(itemConfig.area)
    end,
    function (cancelled)
        onReviveProgress = false
        if not IsPedRunningRagdollTask(ped) then ClearPedTasks(ped) end

        if not cancelled then
            local coords = GetEntityCoords(ped) - vec3(0,0, 1)
            local players = lib.getNearbyPlayers(coords, itemConfig.area, false)

            for _, player in ipairs(players) do
                local targetServerId =  GetPlayerServerId(player.id)
                local targetIsDead = Player(targetServerId).state.isDead or false

                if targetIsDead then
                    TriggerServerEvent('utilityitem:revive:player', targetServerId, health)
                end
            end

            if itemConfig.remove == nil or itemConfig.remove == true then
                TriggerServerEvent('utilityitem:aed:remove', itemName)
            end
        end
    end)
end

local function ShowReviveArea(itemName)
    local itemConfig = CONFIG_AED[itemName]
    if not itemConfig then return end

    local ped = lib.cache('ped')
    local animLib, animName = 'amb@medic@standing@kneel@idle_a', 'idle_a'

    lib.requestAnimDict(animLib)
    TaskPlayAnim(ped, animLib, animName, 8.0, -8.0, -1, 1, 0, false, false, false)

    onSelectProgress = true
    while onSelectProgress do
        ShowPlayerInArea(itemConfig.area)

        ESX.ShowHelpNotification('~INPUT_CONTEXT~ To revive player in area', true, true)

        if IsControlJustPressed(0, 38) then
            onSelectProgress = false
            ReviveProcess(itemName)
        end

        if IsControlJustPressed(0, 73) or IsDisabledControlJustPressed(0, 73) then
            onSelectProgress = false
        end

        Wait(0)
    end

    ClearPedTasks(ped)
end

RegisterNetEvent('utilityitem:use:aed:area', function(itemName)
    if not CONFIG_AED[itemName] then return end
    if LocalPlayer.state.isDead then return end
    if onSelectProgress then return end
    if onReviveProgress then return end

    ShowReviveArea(itemName)
end)