-- This process will take multiple tests, 
-- Okay so first of all you want to use this:



antislow1 = createMarker(X, Y, Z,"corona", size, R, G, B, A)

function AntiSlow(player)
    if getElementType(player)=="player" then
        local vehicle=getPedOccupiedVehicle(player)
            if source == antislow1 then
                local x, y, z = getElementVelocity(vehicle)
                outputChatBox("setElementVelocity(vehicle, " .. x .. ", " .. y .. ", " .. z .. ")")
            end
    end
end
addEventHandler("onClientMarkerHit", getRootElement(), AntiSlow)

-- After you've done a test with this, you should have received a message into your chatbox in mta that should say:
-- setElementVelocity(vehicle, X, Y, Z)

-- You need to copy this line and replace: 

-- local x, y, z = getElementVelocity(vehicle)
-- outputChatBox("setElementVelocity(vehicle, " .. x .. ", " .. y .. ", " .. z .. ")")

-- With the message in the chatbox. After you've done this, test again and it should work
-- Please note that this will ONLY effect the VELOCITY the vehicle had, the VehicleTurnVelocity F.E. will be different from it.
-- If you need the rotation, position & turn velocity etc aswell, you can do the same process with this:

-- local x, y, z = getVehicleTurnVelocity(vehicle)
-- outputChatBox("setVehicleTurnVelocity(vehicle, " .. x .. ", " .. y .. ", " .. z .. ")")
-- local x2, y2, z2 = getElementRotation(vehicle)
-- outputChatBox("setElementRotation(vehicle, " .. x2 .. ", " .. y2 .. ", " .. z2 .. ")")
-- local x3, y3, z3 = getElementPosition(vehicle)
-- outputChatBox("setElementPosition(vehicle, " .. x3 .. ", " .. y3 .. ", " .. z3 .. ")")

-- (c) TomoyoSKGM 2018
