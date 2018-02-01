local Marker = createMarker(X, Y, Z, "TYPE", SIZE, 0, 0, 0)
 
addEventHandler("onClientMarkerHit", getRootElement(), function(playerid)
    if playerid == getLocalPlayer() then
        if isPedInVehicle(playerid) then
            local vehicleid = getPedOccupiedVehicle(playerid)
            if source == Marker then
                -- Destroy the vehicle if it's going backwards
                if isVehicleReversing(vehicleid) then
                    blowVehicle(vehicleid)
                end
                -- Or destroy the vehicle if it's not going backwards
                if not isVehicleReversing(vehicleid) then
                    blowVehicle(vehicleid)
                end
            end
        end
    end
end)
 
function isVehicleReversing(theVehicle)
	local getMatrix = getElementMatrix (theVehicle)
	local getVelocity = Vector3 (getElementVelocity(theVehicle))
	local getVectorDirection = (getVelocity.x * getMatrix[2][1]) + (getVelocity.y * getMatrix[2][2]) + (getVelocity.z * getMatrix[2][3]) 
	if (getVectorDirection >= 0) then
		return false
	end
	return true
end
