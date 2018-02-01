# MTA:SA Scripts
This repository contains useful code snippets for MTA:SA maps.

* [Changing the sky color](#changing-the-sky-color)

* [Changing the water color](#changing-the-water-color)

* [Text moving & fading in (and out)](text/Move%20%26%20fade%20in%20(%26%20out))


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
