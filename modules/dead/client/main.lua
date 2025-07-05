AddEventHandler('esx:onPlayerDeath', function()
    LocalPlayer.state:set('isDead', true, true)
end)

AddEventHandler('esx:onPlayerSpawn', function()
    LocalPlayer.state:set('isDead', false, true)
end)