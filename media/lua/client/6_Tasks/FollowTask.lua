FollowTask = {}
FollowTask.__index = FollowTask

function FollowTask:new(superSurvivor, FollowMeplayer)

	local o = {}
	setmetatable(o, self)
	self.__index = self
	
	
	if(FollowMeplayer == nil) then
		if(superSurvivor.player:getModData().FollowCharID ~= nil) then
			local SS = SSM:Get(superSurvivor.player:getModData().FollowCharID)
			if(SS ~= nil) then o.FollowChar = SS:Get()
			else return false end
		end
	else
		o.FollowChar = FollowMeplayer
		superSurvivor.player:getModData().FollowCharID = FollowMeplayer:getModData().ID -- save last follow obj id to mod data so can be reused on load
	end
	
	o.InBaseAtStart = superSurvivor:isInBase()
	o.parent = superSurvivor
	o.Name = "Follow"
	o.OnGoing = true
	o.LastDistance = 0
	o.Complete = false
	o.MySeat = -1
	
	return o

end

function FollowTask:isComplete()
	
	return self.Complete
end

function FollowTask:isValid()
	if not self.parent or not self.FollowChar then return false 
	else return true end
end

function FollowTask:needToFollow()
	local distance = getDistanceBetween(self.parent.player,self.FollowChar)
		if (distance > GFollowDistance) or self.parent:Get():getVehicle() or (self.FollowChar:getVehicle() ~= self.parent:Get():getVehicle() ) then return true
		else return false end
end


function FollowTask:update()
	
	if(not self:isValid()) then return false end
	
	local distance = getDistanceBetween(self.parent.player,self.FollowChar)
	if(distance > self.LastDistance) then StopWalk(self.parent:Get()) end
	
	if(self.parent:isInAction() == false) then
		
		if(self.InBaseAtStart == true) and ( not self.parent:isInBase()) then 
			if(ZombRand(2)==0) then self.parent:Speak(getText("ContextMenu_SD_WeLooting")) end
			self.InBaseAtStart = false 
		end
		if(not self.InBaseAtStart) and (self.parent:isInBase()) then 
			self.Complete = true 
			self.parent:Speak(getText("ContextMenu_SD_WeBackToBase"))
		end
		
		
		if (distance > (GFollowDistance+5)) or (self.FollowChar:getVehicle() ~= self.parent:Get():getVehicle()) then self.parent:setRunning(true)
		else self.parent:setRunning(false) end
	
	
	
			local ropeSquare = nil
		if (self.FollowChar:getZ() > self.parent.player:getZ()) and (self.parent:isInSameBuilding(self.FollowChar) == false) then
			ropeSquare = self.parent:findNearestSheetRopeSquare(false)
			if(ropeSquare) then
				--luautils.walkAdj(self.parent.player, ropeSquare)
				ISTimedActionQueue.add(ISWalkToTimedAction:new(self.parent.player, ropeSquare))
				ISTimedActionQueue.add(ISClimbSheetRopeAction:new(self.parent.player, false))
				self.parent:Wait(4)
								
			else
				--self.parent:Speak("no rope square")
			end
		elseif (self.FollowChar:getZ() < self.parent.player:getZ()) and (self.parent:isInSameBuilding(self.FollowChar) == false) then
			ropeSquare = self.parent:findNearestSheetRopeSquare(true)
			if(ropeSquare) then
				--self.parent:Speak("here i am")
				local window = getSquaresNearWindow(ropeSquare)
				if(window) then
				
					local indoorSquare = window:getIndoorSquare()
					ISTimedActionQueue.add(ISWalkToTimedAction:new(self.parent.player, indoorSquare))
					ISTimedActionQueue.add(ISClimbThroughWindow:new(self.parent.player, window, 20))
					--ISTimedActionQueue.add(ISClimbSheetRopeAction:new(self.parent.player, true))
					self.parent:Wait(4)
				end
				
			else
				--self.parent:Speak("no rope square")
			end		
		end
		
		if not ropeSquare then
		
			if (distance > GFollowDistance) and (self.parent:Get():getVehicle() == nil) then
				
				local gotosquare = self.FollowChar:getCurrentSquare()
				if(gotosquare ~= nil) then
					if(gotosquare:getRoom() ~= nil) and (gotosquare:getRoom():getBuilding() ~= nil) then self.parent.TargetBuilding = gotosquare:getRoom():getBuilding()
					else self.parent.TargetBuilding = nil end
					self.parent:walkTo(gotosquare) 	
					--self.parent.player:getPathFindBehavior2():pathToCharacter(self.FollowChar)
					--self.parent.player:Say("walkTo")
				end
			elseif (self.FollowChar:getVehicle() ~= nil) and (self.parent:Get():getVehicle() == nil) then
				--self.parent:Speak("get in car")
				local car = self.FollowChar:getVehicle()
				self.MySeat = -1
				local doorseat = -1
				local lastgoodDoor = nil
				local tempDoor = nil
				local numOfSeats = car:getScript():getPassengerCount()
				 for seat = numOfSeats-1, 1, -1  do
					tempDoor = car:getPassengerDoor(seat)
					if(tempDoor ~= nil) then
						lastgoodDoor = tempDoor 
						if (car:isSeatOccupied(seat) == false) then doorseat = seat end
					end
					if(self.MySeat == -1) and (car:isSeatOccupied(seat) == false) then
						self.MySeat = seat 
						--self.parent:Speak("my seat is " .. tostring(seat))						
					end
					if(doorseat ~= -1) and (self.MySeat ~= -1) then break end
				end
				--self.parent:Speak("door seat is " .. tostring(doorseat))
				--self.parent:Speak(tostring(self.MySeat)..","..tostring(lastgoodDoor))
				if(self.MySeat ~= -1) then 
				
					local doorsquare
					
					doorsquare = lastgoodDoor
					
					if(doorsquare ~= nil) then
					
						ISTimedActionQueue.add(ISWalkToTimedAction:new(self.parent:Get(),doorsquare))
						
						ISTimedActionQueue.add(ISEnterVehicle:new(self.parent:Get(), self.FollowChar:getVehicle(), doorseat))
						ISTimedActionQueue.add(ISSwitchVehicleSeat:new(self.parent:Get(), self.MySeat))
					end
					
				end
			elseif (self.FollowChar:getVehicle() ~= nil) and (self.parent:Get():getVehicle() ~= nil) then
					ISTimedActionQueue.add(ISSwitchVehicleSeat:new(self.parent:Get(), self.MySeat))
			elseif (self.FollowChar:getVehicle() == nil) and (self.parent:Get():getVehicle() ~= nil) then
				self.MySeat = -1
				ISTimedActionQueue.add(ISExitVehicle:new(self.parent:Get()))
			else
				--self.parent:Speak("ELSE")
			end
		
		end
		
		
		
	else
		--self.parent.player:Say("waiting for non-action "..tostring(self.parent.player:getCharacterActions())..","..tostring(self.parent.player:getModData().bWalking))
	end
	
	self.LastDistance = distance

end
