if IsDuplicityVersion() then

else
    --- Notify Player 
    --- @param text string
    --- @param duration integer in millisecond
    --- @param type What.Notify.TypeInt
    function Notify(text, duration, type)
        --- @type What.Notify.TypeText
        local sendingType = 'info'
        if type == 1 then sendingType = 'success'
        elseif type == 2 then sendingType = 'error'
        elseif type == 3 then sendingType = 'info' end

        --- Send payload to your notification resource
    end
end

--- @param playerId integer
function CheckPlayerDead(playerId)
    local isDead = Player(playerId).state.isDead or false

    return isDead
end