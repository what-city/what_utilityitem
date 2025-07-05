RegisterNetEvent('utilityitem:revive:player',  function(target, health)
    if DoesPlayerExist(target) then
        TriggerClientEvent('utilityitem:cl:revive', target, health)
    end
end)