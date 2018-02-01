# MTA:SA Scripts
This repository contains useful code snippets for MTA:SA maps.

* [Markers](#markers)

* [Changing the sky color](#changing-the-sky-color)

* [Changing the water color](#changing-the-water-color)

* [Text moving & fading in (and out)](text/Move%20and%20fade%20in%20and%20out.lua)


### Markers
```lua
local playerid = getLocalPlayer()

local Velocity = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)
local Teleport = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)
local Slowmotion_Start = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)
local Slowmotion_End = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)

-- Valid marker types:
-- checkpoint, ring, cylinder, corona, arrow

addEventHandler("onClientMarkerHit",getRootElement(),function(player)
	if player == getLocalPlayer() then
		if isPedInVehicle(playerid) then
			local vehicleid = getPedOccupiedVehicle(playerid)
			
			if source == Velocity then
				setElementVelocity(vehicleid, X, Y, Z)
				setVehicleTurnVelocity(vehicleid, X, Y, Z)
			end
			
			if source == Teleport then
				setElementPosition(vehicleid, X, Y, Z)
				setElementRotation(vehicleid, X, Y, Z)
				
				setElementVelocity(vehicleid, 0.0, 0.0, 0.0)
				setVehicleTurnVelocity(vehicleid, 0.0, 0.0, 0.0)
			end
			
			if source == Slowmotion_Start then
				setGameSpeed(0.5)
			end
			
			if source == Slowmotion_End then
				setGameSpeed(1.0)
			end
		end
	end
end)
```

### Changing the sky color
```lua
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
	setSkyGradient(topRED, topGREEN, topBLUE, bottomRED, bottomGREEN, bottomBLUE)
end)
```

### Changing the water color
```lua
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
	setWaterColor(RED, GREEN, BLUE)
end)
```
