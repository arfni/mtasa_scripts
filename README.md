# MTA:SA Scripts
This repository contains useful code snippets for MTA:SA maps.

* [Markers](#markers)
	* [Velocity](#velocity)
	* [Teleport](#teleport)
	* [Slowmotion](#slowmotion)
		* [easeGameSpeed](functions/easeGameSpeed.lua)
	* [Explosion](#explosion)
	
* [Play music](#music)

* [Draw distance](#draw-distance)

* [Changing the sky color](#changing-the-sky-color)

* [Changing the water color](#changing-the-water-color)

* [Text transition in/out](text/Move%20and%20fade%20in%20and%20out.lua) | <a href="https://i.dnlk.de/31583e270a03cc778219d884a644e93b.gif">> GIF preview</a>

* [Shortcut prevention](shortcut%20prevention)
	* [isVehicleUpsideDown](shortcut%20prevention/isVehicleUpsideDown.lua)
	* [isVehicleReversing](shortcut%20prevention/isVehicleReversing.lua)

* [Slowdown prevention](slowdown%20prevention/slowdown%20prevention.lua)
---
## Markers
```lua
local Marker = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)
-- Valid marker types:
-- checkpoint, ring, cylinder, corona, arrow

addEventHandler("onClientMarkerHit", getRootElement(), function(playerid)
	if playerid == getLocalPlayer() then
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
local Velocity = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)

addEventHandler("onClientMarkerHit", getRootElement(), function(playerid)
	if playerid == getLocalPlayer() then
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
---
### Teleport
```lua
local Teleport = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)

addEventHandler("onClientMarkerHit", getRootElement(), function(playerid)
	if playerid == getLocalPlayer() then
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
---
### Slowmotion

*I recommend using [easeGameSpeed](functions/easeGameSpeed.lua) instead of setGameSpeed
```lua
local Slowmotion_Start = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)
local Slowmotion_End = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)

addEventHandler("onClientMarkerHit", getRootElement(), function(playerid)
	if playerid == getLocalPlayer() then
		if isPedInVehicle(playerid) then
			local vehicleid = getPedOccupiedVehicle(playerid)
			
			if source == Slowmotion_Start then
				setGameSpeed(0.5)
				-- You can either use a second marker or just set a timer:
				setTimer(function() setGameSpeed(1.0) end, timeInMS, 1)
			end
			
			if source == Slowmotion_End then
				setGameSpeed(1.0)
			end
		end
	end
end)
```

---
### Explosion
```lua
local Explosion = createMarker(X, Y, Z, "type", SIZE, RED, GREEN, BLUE, ALPHA)

addEventHandler("onClientMarkerHit", getRootElement(), function(playerid)
	if playerid == getLocalPlayer() then
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
## Music
```lua
local Music = false

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
    	Music = playSound("PATH/TO/MUSICFILE.MP3", true)
	setRadioChannel(0)
end)

addEventHandler("onClientPlayerRadioSwitch", getRootElement(), function()
	if getRadioChannel() > 0 then
		setRadioChannel(0)
	end
	cancelEvent()
end)

addEventHandler("onClientPlayerVehicleEnter", getRootElement(), function()
	setRadioChannel(0)
	cancelEvent()
end)

addCommandHandler("music", function()
	if Music then
		if getSoundVolume(Music) == 0 then
			setSoundVolume(Music, 1)

		elseif getSoundVolume(Music) == 1 then
			setSoundVolume(Music, 0)
		end
	end
end)

bindKey("m", "down", "music")
```
---
## Draw distance
```lua
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
	for i, object in pairs(getElementsByType("object")) do
		if isElement(object) then
			local elementID = getElementModel(object)
			engineSetModelLODDistance(elementID, 300)
		end
	end
end)
```
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
