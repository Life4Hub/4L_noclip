local noclip = false
local baseSpeed = 2.5
local turboMultiplier = 15.0 -- Sehr viel schneller bei Shift
local frozenPos = nil

local function toggleNoclip()
    local ped = PlayerPedId()
    noclip = not noclip

    if noclip then
        frozenPos = GetEntityCoords(ped)
        SetEntityInvincible(ped, true)
        SetEntityVisible(ped, false, false)
        SetEntityCollision(ped, false, false)
        FreezeEntityPosition(ped, true)
        TriggerEvent('pma-voice:setMute', true)
        TriggerEvent('chat:addMessage', { args = { '^2Noclip AKTIV' } })
    else
        SetEntityInvincible(ped, false)
        SetEntityVisible(ped, true, false)
        SetEntityCollision(ped, true, true)
        FreezeEntityPosition(ped, false)
        TriggerEvent('pma-voice:setMute', false)
        TriggerEvent('chat:addMessage', { args = { '^1Noclip DEAKTIVIERT' } })
    end
end

RegisterNetEvent('4L_noclip:toggle')
AddEventHandler('4L_noclip:toggle', function()
    toggleNoclip()
end)

CreateThread(function()
    while true do
        Wait(0)
        if noclip and frozenPos then
            local ped = PlayerPedId()
            local camRot = GetGameplayCamRot(2)

            local forward = vector3(
                -math.sin(math.rad(camRot.z)) * math.cos(math.rad(camRot.x)),
                 math.cos(math.rad(camRot.z)) * math.cos(math.rad(camRot.x)),
                 math.sin(math.rad(camRot.x))
            )

            local right = vector3(
                math.sin(math.rad(camRot.z + 90)),
               -math.cos(math.rad(camRot.z + 90)),
                0
            )

            local move = vector3(0, 0, 0)

            -- Bewegungstasten
            if IsControlPressed(0, 32) then move = move + forward end -- W
            if IsControlPressed(0, 33) then move = move - forward end -- S
            if IsControlPressed(0, 34) then move = move - right end   -- A (jetzt korrekt)
            if IsControlPressed(0, 35) then move = move + right end   -- D (jetzt korrekt)
            if IsControlPressed(0, 44) then move = move + vector3(0, 0, 1.0) end -- Q
            if IsControlPressed(0, 38) then move = move - vector3(0, 0, 1.0) end -- E

            -- Geschwindigkeit: Shift = Turbo
            local speed = baseSpeed
            if IsControlPressed(0, 21) then -- LEFT SHIFT
                speed = speed * turboMultiplier
            end

            if #(move) > 0 then
                frozenPos = frozenPos + move * speed * 0.05
                SetEntityCoordsNoOffset(ped, frozenPos.x, frozenPos.y, frozenPos.z, true, true, true)
            end
        end
    end
end)


-- Tastenzuweisung für Noclip über F17 (Default) – kann vom Spieler umgelegt werden
RegisterCommand("noclip_toggle", function()
    toggleNoclip()
end, false)

-- Register die Taste – nur im Client-Kontext gültig
RegisterKeyMapping("noclip_toggle", "Noclip Modus ein-/ausschalten", "keyboard", "F17")
