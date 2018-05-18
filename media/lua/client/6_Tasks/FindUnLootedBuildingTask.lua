FindUnlootedBuildingTask = {}
FindUnlootedBuildingTask.__index = FindUnlootedBuildingTask

function FindUnlootedBuildingTask:new(superSurvivor)

	local o = {}
	setmetatable(o, self)
	self.__index = self
		
	o.parent = superSurvivor
	o.Name = "Find New Building"
	o.OnGoing = false
	o.TargetBuilding = nil
	o.TryWindow = false
	o.TargetSquare = nil
	o.PreviousSquare = nil
	o.WanderDirection = nil
	o.TicksSinceReversedDir = 0
	o.parent.TargetBuilding = nil
	
	return o

end

function FindUnlootedBuildingTask:isComplete()
	if(self.parent:inUnLootedBuilding()) or self.parent.TargetBuilding ~= nil then 
		if (self.parent.TargetBuilding == nil) then self.parent.TargetBuilding = self.parent:getBuilding() end
		return true
	else return false end
end

function FindUnlootedBuildingTask:isValid()
	if not self.parent then return false 
	else return true end
end

function FindUnlootedBuildingTask:update()
	
	if(not self:isValid()) then return false end
	
	if(self.parent:isInAction() == false) then
		
		if(self.TargetSquare == nil) then
		
			local range = 25
			local Square, closestsoFarSquare
			local minx=math.floor(self.parent.player:getX() - range)
			local maxx=math.floor(self.parent.player:getX() + range)
			local miny=math.floor(self.parent.player:getY() - range)
			local maxy=math.floor(self.parent.player:getY() + range)
			local closestsoFar = range
			
			for x=minx, maxx do
				for y=miny, maxy do
					local Square = getCell():getGridSquare(x,y,0)
					if(Square) then
						local tempRoom = Square:getRoom()
						local SquaresBuilding
						if (tempRoom ~= nil) then SquaresBuilding = tempRoom:getBuilding() end
						if (Square:isOutside() == false) and (SquaresBuilding ~= nil) and not self.parent:getBuildingExplored(SquaresBuilding) and not self.parent:AttemptedLootBuilding(SquaresBuilding) and (self.parent:getWalkToAttempt(Square) < 6)  then
							local distance = getDistanceBetween(Square,self.parent.player)
							if(distance < closestsoFar) and (not self.parent.player:getCurrentSquare():isBlockedTo(Square)) and (Square:isFree(false)) then
								closestsoFar = distance
								
								--if(getDistanceBetween(Square,self.parent.player) > 10) then
								--	self.TargetSquare = self.parent:FindClosestOutsideSquare(Square)
								--else 
									self.TargetSquare = Square
									self.TryWindow = false
								--end
								
								
							end						
						end
					end
				end
			end
			
		end
		
		if not self.TargetSquare then -- wander
			
			self.TicksSinceReversedDir = self.TicksSinceReversedDir + 1
			if not self.WanderDirection then self.WanderDirection = ZombRand(1,4) end
			
			if (self.parent.player:getCurrentSquare()) and (self.parent.player:getCurrentSquare():getZoneType() ~= "TownZone") and (self.TicksSinceReversedDir > 10) then -- reverse direction
				self.TicksSinceReversedDir = 0
				if(self.WanderDirection == 1) then self.WanderDirection = 2 
				elseif(self.WanderDirection == 2) then self.WanderDirection = 1 
				elseif(self.WanderDirection == 3) then self.WanderDirection = 4 
				elseif(self.WanderDirection == 4) then self.WanderDirection = 3 end
			end
			
			local xoff = 0
			local yoff = 0
			
			if(self.WanderDirection == 1) then xoff = 20
			elseif(self.WanderDirection == 2) then xoff = -20
			elseif(self.WanderDirection == 3) then yoff = -20
			else yoff = 20 end
			
			local sq = getCell():getGridSquare(self.parent.player:getX() + xoff + ZombRand(-5,5) ,self.parent.player:getY() + yoff + ZombRand(-5,5),0)
			if(sq ~= nil) then self.parent:walkTo(sq) 
			else print("error getting walk sq") end
			
		else
		
			
			
				if(self.parent:getWalkToAttempt(self.TargetSquare) < 6) then
					self.parent:DebugSay("trying to get to square inside")
					--self.parent:WalkToAttempt(self.TargetSquare)
					self.parent:walkTo(self.parent:FindClosestOutsideSquare(Square))
					if(self.TargetSquare:getRoom() ~= nil) then self.parent.TargetBuilding = self.TargetSquare:getRoom():getBuilding() end
				else
					self.parent:DebugSay("giving up on building")
					self.parent:MarkAttemptedBuildingExplored(self.parent.TargetBuilding)
					self.parent.TargetBuilding = nil
					self.TargetSquare = nil
					self.TryWindow = false
				end
		
		end
		
	end
end
