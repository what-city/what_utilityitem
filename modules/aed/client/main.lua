local onRevive = false
local function UseReviveItem(itemName)
    if LocalPlayer.state.isDead then return end
    if onRevive then return end
    if not CONFIG_AED[itemName] then return end

    local ped = lib.cache('ped')
    local pedCoords = GetEntityCoords(ped)

    local targetPlayer, targetPed = lib.getClosestPlayer(pedCoords, 2.0, false)

    if not targetPlayer then return false end

    if IsPedInAnyVehicle(ped, false) then
        return Notify('ไม่สามารถชุบบนยานพาหนะได้', 3000, 2)
    end

    local draggerSource = GetEntityAttachedTo(targetPed)
    if draggerSource ~= 0 then
        if IsPedInAnyVehicle(draggerSource, false) then return end
    end

    local targetServerId = GetPlayerServerId(targetPlayer);
    local targetIsDead = CheckPlayerDead(targetServerId)

    if not targetIsDead then
        return Notify('ผู้เล่นยังมีชีวิตอยู่', 5000, 2)
    end

    onRevive = true

    Notify('กำลังชุบผู้เล่น', 5000, 1)

    local animLib, animName = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
    lib.requestAnimDict(animLib)
    TaskPlayAnim(ped, animName, animName, 8.0, -8.0, -1, 0, 0, false, false, false)

    local lastPlayAnim = GetGameTimer()

    local itemConfig = CONFIG_AED[itemName]
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
    end,
    function (cancelled)
        onRevive = false

        if not IsPedRunningRagdollTask(ped) then
            ClearPedTasks(ped)
        end

        if not cancelled then
            if not CheckPlayerDead(targetServerId) then
                return Notify('ผู้เล่นยังมีชีวิตอยู่', 5000, 2)
            end

            TriggerServerEvent('utilityitem:revive:player', targetServerId, health)

            if itemConfig.remove == nil or itemConfig.remove == true then
                TriggerServerEvent('utilityitem:aed:remove', itemName)
            end
        end
    end)
end

RegisterNetEvent('utilityitem:use:aed',  UseReviveItem)