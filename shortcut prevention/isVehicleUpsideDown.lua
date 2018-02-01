local Marker = createMarker(X, Y, Z, "TYPE", SIZE, 0, 0, 0)
 
addEventHandler("onClientMarkerHit", getRootElement(), function(playerid)
    if playerid == getLocalPlayer() then
        if isPedInVehicle(playerid) then
            local vehicleid = getPedOccupiedVehicle(playerid)
            if source == Marker then
                -- Destroy the vehicle if it's upside down
                if isVehicleUpsideDown(vehicleid) then
                    blowVehicle(vehicleid)
                end
                -- Or destroy the vehicle if it's not upside down
                if not isVehicleUpsideDown(vehicleid) then
                    blowVehicle(vehicleid)
                end
            end
        end
    end
end)
 
function isVehicleUpsideDown (vehicle)
     local matrix = getElementMatrix(vehicle)
     local vehicleUp = {matrix_rotate(matrix, 0, 0, 1)}
     local dotP = math.dotP(vehicleUp, {0, 0, -1})
     return (dotP >= math.cos(math.rad(45))
end
 
function matrix_rotate(matrix, x, y, z)
     local tx = x * matrix[1][1] + y * matrix[2][1] + z * matrix[3][1]  
     local ty = x * matrix[1][2] + y * matrix[2][2] + z * matrix[3][2]  
     local tz = x * matrix[1][3] + y * matrix[2][3] + z * matrix[3][3]  
     return tx, ty, tz
end
 
function math.dotP(v1, v2)
     return v1[1]*v2[1] + v1[2]*v2[2] + v1[3]*v2[3]
end
