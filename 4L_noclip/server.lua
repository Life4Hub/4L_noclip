RegisterCommand("4Lnoclip", function(source)
    if IsPlayerAceAllowed(source, "4L.noclip") then
        TriggerClientEvent('4L_noclip:toggle', source)
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = { '^1Du hast keine Berechtigung für diesen Befehl.' }
        })
    end
end)
