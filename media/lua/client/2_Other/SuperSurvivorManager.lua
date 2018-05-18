SuperSurvivorManager = {}
SuperSurvivorManager.__index = SuperSurvivorManager

function SuperSurvivorManager:new()

	local o = {}
	setmetatable(o, self)
	self.__index = self
		
	o.SuperSurvivors = {}
	o.SurvivorCount = 0
	
	return o

end

function SuperSurvivorManager:init()
	self.SuperSurvivors[0] = SuperSurvivor:newSet(getSpecificPlayer(0))
end

function SuperSurvivorManager:LoadSurvivor(ID, square)

	if( not checkSaveFileExists("Survivor"..tostring(ID))) then return false end
	
	if(ID ~= nil) and (square ~= nil) then -- 
		
		if(self.SuperSurvivors[ID] ~= nil) and (self.SuperSurvivors[ID].player ~= nil) then		
			if(self.SuperSurvivors[ID]:isInCell()) then
				return false
			else		
				self.SuperSurvivors[ID]:delete()
			end
		end
		print("loading survivor ".. tostring(ID) .." on " .. tostring(square:getX()) .. "," .. tostring(square:getY()))
		
				
			self.SuperSurvivors[ID] = SuperSurvivor:newLoad(ID,square)
			if(self.SuperSurvivors[ID]:Get():getPrimaryHandItem() == nil) and (self.SuperSurvivors[ID]:getWeapon() ~= nil) then self.SuperSurvivors[ID]:Get():setPrimaryHandItem(self.SuperSurvivors[ID]:getWeapon()) end
			self.SuperSurvivors[ID]:refreshName()
		
		
		
		if(self.SuperSurvivors[ID]:Get():getModData().isHostile == true) then self.SuperSurvivors[ID]:setHostile(true) end
		
		if(self.SurvivorCount == nil) then self.SurvivorCount = 1 end
		if(ID > self.SurvivorCount) then self.SurvivorCount = ID end
		self.SuperSurvivors[ID].player:getModData().LastSquareSaveX = nil
		self.SuperSurvivors[ID]:SaveSurvivor()
		
		
		local melewep = self.SuperSurvivors[ID].player:getModData().meleWeapon
		local gunwep = self.SuperSurvivors[ID].player:getModData().gunWeapon
		if(melewep ~= nil) then 
			self.SuperSurvivors[ID].LastMeleUsed = self.SuperSurvivors[ID].player:getInventory():FindAndReturn(melewep)
			if not self.SuperSurvivors[ID].LastMeleUsed then self.SuperSurvivors[ID].LastMeleUsed = self.SuperSurvivors[ID]:getBag():FindAndReturn(melewep) end
		end		
		if(gunwep ~= nil) then 
			self.SuperSurvivors[ID].LastGunUsed = self.SuperSurvivors[ID].player:getInventory():FindAndReturn(gunwep)
			if not self.SuperSurvivors[ID].LastGunUsed then self.SuperSurvivors[ID].LastGunUsed = self.SuperSurvivors[ID]:getBag():FindAndReturn(gunwep) end
		end
		
		
		if(self.SuperSurvivors[ID]:getAIMode() == "FollowRoute") then
		
			self.SuperSurvivors[ID]:getTaskManager():AddToTop(FollowRouteTask:new(self.SuperSurvivors[ID],0))
			
		elseif(self.SuperSurvivors[ID]:getAIMode() == "Follow") then 
		
			self.SuperSurvivors[ID]:getTaskManager():AddToTop(FollowTask:new(self.SuperSurvivors[ID],nil))
		
		elseif(self.SuperSurvivors[ID]:getAIMode() == "Guard") then 
		
			self.SuperSurvivors[ID]:getTaskManager():AddToTop(GuardTask:new(self.SuperSurvivors[ID],self.SuperSurvivors[ID].player:getCurrentSquare())) 
			
		elseif(self.SuperSurvivors[ID]:getAIMode() == "Patrol") then 
		
			self.SuperSurvivors[ID]:getTaskManager():AddToTop(PatrolTask:new(self.SuperSurvivors[ID], nil, nil)) 
			
		elseif(self.SuperSurvivors[ID]:getAIMode() == "Wander") then 
		
			self.SuperSurvivors[ID]:getTaskManager():AddToTop(WanderTask:new(self.SuperSurvivors[ID])) 
			
		elseif(self.SuperSurvivors[ID]:getAIMode() == "Stand Ground") then 
		
			self.SuperSurvivors[ID]:getTaskManager():AddToTop(GuardTask:new(self.SuperSurvivors[ID],self.SuperSurvivors[ID].player:getCurrentSquare())) 			
			self.SuperSurvivors[ID]:setWalkingPermitted(false) 
		
		
		elseif(self.SuperSurvivors[ID]:getAIMode() == "Doctor") then 
		
			self.SuperSurvivors[ID]:getTaskManager():AddToTop(DoctorTask:new(self.SuperSurvivors[ID])) 
			
		end
		
		
		if(isModEnabled("ArmorMod")) then ArmorInitCheck(self.SuperSurvivors[ID].player) end
		
		local phi = self.SuperSurvivors[ID]:Get():getPrimaryHandItem() -- to trigger onEquipPrimary
		self.SuperSurvivors[ID]:Get():setPrimaryHandItem(nil)
		self.SuperSurvivors[ID]:Get():setPrimaryHandItem(phi)
		
	end
	
end

function SuperSurvivorManager:spawnSurvivor(isFemale,square)
	if(square ~= nil) then
		local newSurvivor = SuperSurvivor:new(isFemale,square)
		
		if(newSurvivor ~= nil) then 
			self.SuperSurvivors[self.SurvivorCount+1] = newSurvivor
			self.SurvivorCount = self.SurvivorCount + 1;
			self.SuperSurvivors[self.SurvivorCount]:setID(self.SurvivorCount)
			return self.SuperSurvivors[self.SurvivorCount]
		else
			return nil
		end
	end

end

function SuperSurvivorManager:Get(thisID)
	if(not self.SuperSurvivors[thisID]) then
		--print("super survivor #"..tostring(thisID).." was not found")
		return nil
	else
		return self.SuperSurvivors[thisID]
	end
end

function SuperSurvivorManager:update()
	--getSpecificPlayer(0):Say(tostring(self.SurvivorCount))
	--print("SSM updating..."..tostring(self.SurvivorCount))
	for i=1, self.SurvivorCount+1 do
	--local id = i
	--local theSuperSurvivor = self.SuperSurvivors[i]
	--if(self.SuperSurvivors[i] ~= nil) then getSpecificPlayer(0):Say(tostring(id)..") ".. tostring(theSuperSurvivor ~= nil) ..",".. tostring(theSuperSurvivor:updateTime()) ..","..  tostring(theSuperSurvivor:isInCell()) ) end
		
		if(self.SuperSurvivors[i] ~= nil) and (self.SuperSurvivors[i]:updateTime()) and (self.SuperSurvivors[i]:isInCell()) then self.SuperSurvivors[i]:update() end
	end

end

function SuperSurvivorManager:GetClosest()
	local closestSoFar = 20
	local closestID = 0
	for i=1, self.SurvivorCount+1 do
		if(self.SuperSurvivors[i] ~= nil) and (self.SuperSurvivors[i]:isInCell()) then 
			local distance = getDistanceBetween(self.SuperSurvivors[i]:Get(),getSpecificPlayer(0))
			if(distance < closestSoFar) then
				closestID = i
				closestSoFar = distance
			end
		end
	end
	
	if(closestID ~= 0) then return self.SuperSurvivors[closestID]
	else return nil end

end

function SuperSurvivorManager:GetClosestNonParty()
	local closestSoFar = 20
	local closestID = 0
	for i=1, self.SurvivorCount+1 do
		if(self.SuperSurvivors[i] ~= nil) and (self.SuperSurvivors[i]:isInCell()) then 
			local distance = getDistanceBetween(self.SuperSurvivors[i]:Get(),getSpecificPlayer(0))
			if(distance < closestSoFar) and (self.SuperSurvivors[i]:getGroupID() == nil) then
				closestID = i
				closestSoFar = distance
			end
		end
	end
	
	if(closestID ~= 0) then return self.SuperSurvivors[closestID]
	else return nil end

end

SSM = SuperSurvivorManager:new()





function loadSurvivorMap( )
	local tempTable = {}
	tempTable = table.load("SurvivorManagerInfo")
	if (tempTable) and (tempTable[1]) then 
		SSM.SurvivorCount = tonumber(tempTable[1])
		print("set SurvivorCount:"..tostring(tempTable[1]) .. " from SurvivorManagerInfo file");
	else 
		print("SurvivorManagerInfo was not found. this save file could be corrupt");
	end
	
	local fileTable = {}
	local readFile = getModFileReader("SuperSurvivors",getWorld():getWorld()..getFileSeparator().."SurvivorMap.lua", true)
	local scanLine = readFile:readLine()
	while scanLine do
	
		local values = {}
		for input in scanLine:gmatch("%S+") do table.insert(values,input) end
		--print("loading line: "..values[1] .. " " .. values[2])
		if(fileTable[values[1]] == nil) then fileTable[values[1]] = {} end
			table.insert(fileTable[values[1]], tonumber(values[2]))
		scanLine = readFile:readLine()
		if not scanLine then break end
	end
	readFile:close()
	return fileTable
end


function saveSurvivorMap(  )
	
	local tempTable = {}
	tempTable[1] = SSM.SurvivorCount
	table.save(tempTable,"SurvivorManagerInfo")
	
	local destFile = getWorld():getWorld()..getFileSeparator().."SurvivorMap.lua"
	local writeFile = getModFileWriter("SuperSurvivors", destFile, true, false)
	--print("saving SurvivorMap:".. tostring(SurvivorMap))
	for index,value in pairs(SurvivorMap) do
		
		for i = 1,#value do
			writeFile:write(tostring(index) .. " " .. tostring(value[i]) .. "\r\n");
			--print("saving: " .. tostring(index) .. " " .. tostring(value[i]))
		end
	end
	writeFile:close();
end





