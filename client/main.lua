CreateThread(function()
    while true do
        sleep = 1000
        
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        local inRange = false

        for k, v in pairs(Config.Markers) do
            local coords = vector3(Config.Markers[k].Coords.x, Config.Markers[k].Coords.y, Config.Markers[k].Coords.z)
            local dist = #(PlayerPos - coords)
            if dist < Config.Markers[k].dist * 2 then
                inRange = true
                
                if dist < Config.Markers[k].dist then
                    DrawMarker(Config.Markers[k].Id, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Markers[k].scaleX, Config.Markers[k].scaleY, Config.Markers[k].scaleZ, Config.Markers[k].Red, Config.Markers[k].Green, Config.Markers[k].Blue, Config.Markers[k].Alpha, Config.Markers[k].bobUpAndDown, Config.Markers[k].faceCamera, false, Config.Markers[k].Rotate, false, false, false)
                end
            else
                inRange = false
            end
            if inRange then
                sleep = 3
            end
        end
        Wait(sleep)
    end
end)