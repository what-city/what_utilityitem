if IsDuplicityVersion() then

else
    --- Notify Player 
    --- @param text string
    --- @param duration integer in millisecond
    --- @param type integer 1 = success 2 = error 3 = info
    function Notify(text, duration, type)

    end
end

--- @param playerId integer
function CheckPlayerDead(playerId)
    local isDead = Player(playerId).state.isDead or false

    return isDead
end