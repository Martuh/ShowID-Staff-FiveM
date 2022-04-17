--- PARTE CLIENT BY MARTU

PlayerName = function ()
    mostranomi = not mostranomi
    Citizen.CreateThread(function()
        while mostranomi do
            Citizen.Wait(0)
            for _, ServerPlayer in ipairs(GetActivePlayers()) do
                local player = tonumber(ServerPlayer)
                --if GetPlayerPed(player) ~= GetPlayerPed(-1) then
                ped = GetPlayerPed(player)
                local x2, y2, z2 = table.unpack(GetEntityCoords(ped, true))
                DrawText3D(x2, y2, z2+1.5, "Nome: "..GetPlayerName(player) .. "ID: ["..GetPlayerServerId(player).."] Vita: "..GetEntityHealth(ped), 255,255,255,255)
              --  end
            end
        end
    end)
end

function DrawText3D(x,y,z, text, r,g,b,a)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)2
    local fov = (1/GetGameplayCamFov())30
    local scale = scalefov
    if onScreen then
        SetTextScale(0.0scale, 1.0*scale)
        SetTextFont(0)
        SetTextOutline(1)
        SetTextProportional(1)
        SetTextColour(r, g, b, a)
        SetTextDropshadow(0, 0, 0, 0, 100)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

RegisterNetEvent("MartuSpacca:ID")
AddEventHandler("MartuSpacca:ID", PlayerName)

RegisterCommand('id', function()
    ESX.TriggerServerCallback("martu:prendigruppo", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" then
            PlayerName()
        end
    end)
end)