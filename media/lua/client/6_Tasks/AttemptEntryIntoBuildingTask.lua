AttemptEntryIntoBuildingTask = {}
AttemptEntryIntoBuildingTask.__index = AttemptEntryIntoBuildingTask

function AttemptEntryIntoBuildingTask:new(superSurvivor,building)

	local o = {}
	setmetatable(o, self)
	self.__index = self
		
	o.parent = superSurvivor
	o.Name = "Enter New Building"
	o.OnGoing = false
	o.Window = nil
	o.TryWindow = false
	o.Door = nil
	o.TargetSquare = nil
	o.PreviousSquare = nil
	o.ClimbThroughWindowAttempts = 0
	o.WanderDirection = nil
	o.TicksSinceReversedDir = 0
	o.ReEquipGunOnFinish = false
	o.BreakInAttempts = 0
	o.Toggle = false
	
	if(building) then o.parent.TargetBuilding = building end
	
	return o

end

function AttemptEntryIntoBuildingTask:OnComplete()
	
	if(self.ReEquipGunOnFinish) then self.parent:reEquipGun() end
	
end

function AttemptEntryIntoBuildingTask:isComplete()
	if(self.parent:inUnLootedBuilding()) or (self.parent.TargetBuilding == nil) or (self.parent:isInBuilding(self.parent.TargetBuilding)) then 
		--self.parent:MarkBuildingExplored(self.parent:getBuilding())
		return true
	else return false end
end

function AttemptEntryIntoBuildingTask:isValid()
	if not self.parent or not self.parent.TargetBuilding then return false 
	else return true end
end

function AttemptEntryIntoBuildingTask:giveUpOnBuilding()

	--self.parent.player:Say("giving up on building")
	self.parent:MarkAttemptedBuildingExplored(self.parent.TargetBuilding)
	self.parent.TargetBuilding = nil
	self.TargetSquare = nil
	self.TryWindow = false

end

function AttemptEntryIntoBuildingTask:update()
	local debugOutput = false
	if(not self:isValid()) then return false end
	
	if(self.parent:getDangerSeenCount() > 1) or (self.ClimbThroughWindowAttempts > 12) then 
		print("gave up on building because: (self.ClimbThroughWindowAttempts > 12) or seen zombie close:"..tostring(self.ClimbThroughWindowAttempts))
		self:giveUpOnBuilding() 
	end
	
	if(self.parent:isInAction() == false) then
		
		if(self.TargetSquare == nil) then self.TargetSquare = getRandomFreeBuildingSquare(self.parent.TargetBuilding) end
		
		if(self.TargetSquare ~= nil) then
		
			local door = self.parent:inFrontOfDoor()
			
			if self.TryWindow == false and (door ~= nil) and (door:isLocked() or door:isLockedByKey())  then
				self.TryWindow = true
				self.Door = door
			end
			
			if(self.parent:inFrontOfWindow()) then
				self.TryWindow = true
			end
		
			
			if not self.TryWindow and not self.TryBreakDoor then
				if(debugOutput) then self.parent:Speak("not try window") end
				if(self.parent:getWalkToAttempt(self.TargetSquare) < 10) then
					if(debugOutput) then self.parent:Speak("trying to get to square inside") end
				if(debugOutput) then 	self.parent:Speak(tostring(self.parent:getWalkToAttempt(self.TargetSquare))) end
					self.parent:walkTo(self.TargetSquare)
				else
					self.TryWindow = true
				end
				
			elseif self.TryWindow then
				if(debugOutput) then self.parent:Speak("try window true") end
				if(self.Window == nil) then
					self.Window = getCloseWindow(self.parent.TargetBuilding,self.parent.player)
				end
				
				if(not self.Window) then
					
					if(self.parent.LastMeleUsed ~= nil) then
						self.TryWindow = nil
						self.TryBreakDoor = true
						if(self.parent.LastMeleUsed ~= self.parent.player:getPrimaryHandItem()) then self.ReEquipGunOnFinish = true end
						self.parent:reEquipMele()
						return false
					else
						self:giveUpOnBuilding()
						print("gave up on building because: no window found to try in enter through")
					end
					
				else
						
					local distanceToWindow = getDistanceBetween(self.Window,self.parent.player)
					
					if distanceToWindow > 1.0 then
						local outsidesquare = getOutsideSquare(self.Window, self.parent.TargetBuilding)
						if(outsidesquare == nil) or (self.parent:getWalkToAttempt(outsidesquare) > 10) then 
							
							self.TryWindow = nil
							self.TryBreakDoor = true
							if(self.parent.LastMeleUsed ~= self.parent.player:getPrimaryHandItem()) then self.ReEquipGunOnFinish = true end
							self.parent:reEquipMele()
							return false
							
						end
						self.parent:walkToDirect(outsidesquare)
					else
						self.parent.player:faceThisObject(self.Window)
						if(self.Window:isSmashed() == false) and (self.Window:IsOpen() == false) then	
							if(self.parent:isInBase()) then 
								self.Window:ToggleWindow(self.parent.player)
							else
								ISTimedActionQueue.add(ISSmashWindow:new(self.parent.player, self.Window, 20))
							end
							self.parent:Wait(3)
						else
							if (self.Window:isSmashed()) and (self.Window:isGlassRemoved() == false) and self.parent:hasWeapon() then
								
								ISTimedActionQueue.add(ISRemoveBrokenGlass:new(self.parent.player, self.Window, 20))
								
								self.parent:Wait(1)
							else 
								if(self.Window:getZ() < 2) and ((self.Window:IsOpen() == true) or (self.Window:isGlassRemoved() or (not self.parent:hasWeapon())) ) then
									self.parent:Wait(3)
									self.parent.player:setBlockMovement(false)
									self.parent.player:climbThroughWindow(self.Window)
									self.parent.player:setBlockMovement(true)
									--ISTimedActionQueue.add(ISClimbThroughWindow:new(self.parent.player, self.Window, 0))
									--self.parent.player:hopFence(self.parent.player:getLastdir() , false)
									--self.parent.player:Say("climbing through")
									self.ClimbThroughWindowAttempts = self.ClimbThroughWindowAttempts + 1
								end
							end
						end
					end
					
				end
				
			elseif self.TryBreakDoor then
				if(debugOutput) then self.parent:Speak("on try break down door") end
				local doorSquare = getDoorsOutsideSquare(self.Door,self.parent.player)
				local distanceToDoor = getDistanceBetween(self.parent.player,doorSquare)
				
				if (distanceToDoor > 1.0) then 
					self.parent:walkToDirect(self.Door)
					if(debugOutput) then self.parent:Speak("walking to door") end
				else
					
					if(self.BreakInAttempts > 80) then
						if(debugOutput) then self.parent:Speak("here i am23") end
						self:giveUpOnBuilding()
						print("gave up on building because: could not seem to break down door")
					
					else
						if(debugOutput) then self.parent:Speak("here i am4") end
						if(self.Door) then self.parent.player:faceThisObject(self.Door) end
						local isInBuilding = (self.parent:getBuilding() == self.TargetBuilding)
						if (self.Door) then --(not isInBuilding) then
							if(debugOutput) then self.parent:Speak("here i am") end
							if(not self.Toggle) or (self.Door == nil) then self.parent:walkTo(self.TargetSquare)
							else self.parent.player:AttemptAttack() end
							
							self.Toggle = not self.Toggle
							self.BreakInAttempts = self.BreakInAttempts + 1
							
						elseif(self.Door == nil) then
							if(debugOutput) then self.parent:Speak("in building, complete") end
							return true
						end
					end
					
					
				end
			
			end
	
		else
			self:giveUpOnBuilding()
		end
		
	end
end
