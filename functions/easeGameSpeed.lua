local ease = {}

function easeGameSpeed(targetSpeed, overTime, callback)
	ease.startedAt 		= 	getTickCount()
	ease.startSpeed		= 	getGameSpeed()
	ease.targetSpeed 	= 	math.round(targetSpeed, 4, "floor")
	ease.overTime 		= 	overTime
	ease.callback		=	(type(callback) == "function" or type(callback) == "nil") and (type(callback) == "function" and callback or nil) or nil
	ease.isActive 		= 	true
end

addEventHandler("onClientRender", root, function()
	if ease.isActive then
	    local progress = (getTickCount() - ease.startedAt) / ((ease.startedAt + ease.overTime) - ease.startedAt)
	    local currentSpeed = math.round(getGameSpeed(), 1, (ease.startSpeed > ease.targetSpeed and "ceil" or "floor"))

		local X, Y, Z = interpolateBetween(currentSpeed, 0.0, 0.0, ease.targetSpeed, 0.0, 0.0, progress, "InOutQuad")
		X = math.round(X, 4, (ease.startSpeed > ease.targetSpeed and "floor" or "ceil"))
		if ease.startSpeed > ease.targetSpeed and X <= ease.targetSpeed then
			X = math.round(X, 1, "ceil")
		elseif ease.startSpeed < ease.targetSpeed and X >= ease.targetSpeed then
			X = math.round(X, 1, "floor")
		end
		
		setGameSpeed(X)
		if X == ease.targetSpeed then
			ease.isActive = false
			if type(ease.callback) == "function" then
				ease.callback();
			end
		end
	end
end)

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end
