Bolo = Bolo or {}

Bolo.Cars = {}

local function findCarIndex(car, reason)
	local i = 1
	for _car, _reason in pairs(Bolo.Cars) do
		if _car == car and _reason == reason then
			return i
		end
	end
	return nil
end

function Bolo:isAdded(car, reason)
	for _car, _reason in ipairs(Bolo.Cars) do
		if _car == car and _reason == reason then 
			return true
		end
	end
	return false
end

function Bolo:addCar(ply, car, reason)
	Bolo.Cars[car] = reason
	local printMessage = L.bolo_ordered:format(ply:Nick(), car, reason)
	for _,v in ipairs(player.GetAll()) do
		if v:isCP() then v:Notify(printMessage) end
	end
end

function Bolo:RemoveCar(ply, car, reason)
	local index = findCarIndex(car, reason)
	table.remove(Bolo.Cars, index)
	local printMessage = L.bolo_removed:format(ply:Nick(), car, reason)
	for _,v in ipairs(player.GetAll()) do
		if v:isCP() then v:Notify(printMessage) end
	end
end