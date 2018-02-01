local infoT = { }
infoT.Drawn = false
infoT.Text = EOS
infoT.Width = 0
infoT.Alpha = 0
infoT.Top = 0
infoT.LastUpdateA = getTickCount()
infoT.LastUpdateT = getTickCount()
infoT.Time = 0
screenWidth,screenHeight = guiGetScreenSize()

function showText(text, durationInMS)
	infoT.Drawn = true
	infoT.Text = text
	infoT.Width = dxGetTextWidth(infoT.Text, 2.0, "arial", true)
	infoT.Alpha = 0
	infoT.Top = 0
	infoT.Time = durationInMS
end

addEventHandler("onClientRender",getRootElement(),function()
	if infoT.Drawn then
		dxDrawText(infoT.Text, screenWidth / 2 - infoT.Width / 2, infoT.Top, 0, 0, tocolor(255, 255, 255, infoT.Alpha), 2.0, "arial", "left", "top", false, false, false)
		if infoT.Alpha < 255 and getTickCount() - infoT.LastUpdateA >= 30 then
			infoT.Alpha = infoT.Alpha + 5
			infoT.LastUpdateA = getTickCount()
			
			if infoT.Alpha >= 255 and infoT.Top >= screenHeight / 8 then
				setTimer(function()
					infoT.Drawn = false
				end, infoT.Time, 1)
			end
			
		end
		
		if infoT.Top < screenHeight / 8 and getTickCount() - infoT.LastUpdateT >= 10 then
			infoT.Top = infoT.Top + 2
			infoT.LastUpdateT = getTickCount()
			
			if infoT.Alpha >= 255 and infoT.Top >= screenHeight/8 then
				setTimer(function()
					infoT.Drawn = false
				end,infoT.Time,1)
			end
			
		end
	end
	
	if not infoT.Drawn and infoT.Alpha > 0 then
		dxDrawText(infoT.Text, screenWidth / 2 - infoT.Width / 2, infoT.Top, 0,0, tocolor(255, 255, 255, infoT.Alpha), 2.0, "arial", "left", "top", false, false, false)
		if infoT.Alpha > 0 and getTickCount() - infoT.LastUpdateA >= 30 then
			infoT.Alpha = infoT.Alpha - 5
			infoT.LastUpdateA = getTickCount()
		end
		
		if infoT.Top > -dxGetFontHeight(2.0, "arial") and getTickCount() - infoT.LastUpdateT >= 10 then
			infoT.Top = infoT.Top - 2
			infoT.LastUpdateT = getTickCount()
		end
	end
end)
