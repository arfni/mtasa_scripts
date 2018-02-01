# MTA:SA Scripts
This repository contains useful code snippets for MTA:SA maps.

* [Markers](#markers)
	* [Velocity](#velocity)
	* [Teleport](#teleport)
	* [Slowmotion](#slowmotion)
	* [Explosion](#explosion)

* [Changing the sky color](#changing-the-sky-color)

* [Changing the water color](#changing-the-water-color)

* [Text moving & fading in (and out)](text/Move%20and%20fade%20in%20and%20out.lua)

* [Destroy vehicle if it's not (or if it's) upside down at a certain location](text/isVehicleUpsideDown.lua)

---
## Markers
```lua
local playerid = getLocalPlayer()

local Marker = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)
-- Valid marker types:
-- checkpoint, ring, cylinder, corona, arrow

addEventHandler("onClientMarkerHit",getRootElement(),function(player)
	if player == getLocalPlayer() then
		if isPedInVehicle(playerid) then
			local vehicleid = getPedOccupiedVehicle(playerid)
			
			if source == Marker then
				
			end
		end
	end
end)
```

### Velocity
```lua
local playerid = getLocalPlayer()

local Velocity = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)

addEventHandler("onClientMarkerHit",getRootElement(),function(player)
	if player == getLocalPlayer() then
		if isPedInVehicle(playerid) then
			local vehicleid = getPedOccupiedVehicle(playerid)
			
			if source == Velocity then
				setElementVelocity(vehicleid, X, Y, Z)
				setVehicleTurnVelocity(vehicleid, X, Y, Z)
			end
		end
	end
end)
```

### Teleport
```lua
local playerid = getLocalPlayer()

local Teleport = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)

addEventHandler("onClientMarkerHit",getRootElement(),function(player)
	if player == getLocalPlayer() then
		if isPedInVehicle(playerid) then
			local vehicleid = getPedOccupiedVehicle(playerid)
			
			if source == Teleport then
				setElementPosition(vehicleid, X, Y, Z)
				setElementRotation(vehicleid, X, Y, Z)
				
				setElementVelocity(vehicleid, 0.0, 0.0, 0.0)
				setVehicleTurnVelocity(vehicleid, 0.0, 0.0, 0.0)
			end
		end
	end
end)
```

### Slowmotion
```lua
local playerid = getLocalPlayer()

local Slowmotion_Start = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)
local Slowmotion_End = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)

addEventHandler("onClientMarkerHit",getRootElement(),function(player)
	if player == getLocalPlayer() then
		if isPedInVehicle(playerid) then
			local vehicleid = getPedOccupiedVehicle(playerid)
			
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

### Explosion
```lua
local playerid = getLocalPlayer()

local Explosion = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)

addEventHandler("onClientMarkerHit",getRootElement(),function(player)
	if player == getLocalPlayer() then
		if isPedInVehicle(playerid) then
			local vehicleid = getPedOccupiedVehicle(playerid)
			
			if source == Explosion then
				createExplosion(X, Y, Z, TYPE)
			end
		end
	end
end)
```
#### Explosion types
| ID | Type          |
|--- |:-------------:|
| 0  | Grenade       |
| 1  | Molotov       |
| 2  | Rocket        |
| 3  | Rocket Weak   |
| 4  | Car           |
| 5  | Car Quick     |
| 6  | Boat          |
| 7  | Heli          |
| 8  | Mine          |
| 9  | Object        |
| 10 | Tank Grenade  |
| 11 | Small         |
| 12 | Tiny          |
---
## Changing the sky color
```lua
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
	setSkyGradient(topRED, topGREEN, topBLUE, bottomRED, bottomGREEN, bottomBLUE)
end)
```
---
## Changing the water color
```lua
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
	setWaterColor(RED, GREEN, BLUE)
end)
```
