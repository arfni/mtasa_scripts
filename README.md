# MTA:SA Scripts
This repository contains useful code snippets for MTA:SA maps.

* [Changing the sky color](#changing-the-sky-color)

* [Changing the water color](#changing-the-water-color)

* [Text moving & fading in (and out)](text/Move-&-fade-in-(&-out).lua)


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
