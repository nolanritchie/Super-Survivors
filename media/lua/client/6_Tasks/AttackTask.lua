AttackTask = {}
AttackTask.__index = AttackTask

function AttackTask:new(superSurvivor)

	local o = {}
	setmetatable(o, self)
	self.__index = self
		
	o.parent = superSurvivor
	o.Name = "Attack"
	o.OnGoing = false
	
	return o

end

function AttackTask:isComplete()
	--self.parent.player:Say( tostring(self.parent:needToFollow()) ..",".. tostring(self.parent:getDangerSeenCount() > 0) ..",".. tostring(self.parent.LastEnemeySeen) ..",".. tostring(not self.parent.LastEnemeySeen:isDead()) ..",".. tostring(self.parent:HasInjury() == false) )
	if(not self.parent:needToFollow()) and (self.parent:getDangerSeenCount() > 0) and (self.parent.LastEnemeySeen) and not self.parent.LastEnemeySeen:isDead() and (self.parent:HasInjury() == false) then return false
	else return true end
end

function AttackTask:isValid()
	if (not self.parent) or (not self.parent.LastEnemeySeen) or (not self.parent:isInSameRoom(self.parent.LastEnemeySeen)) or (self.parent.LastEnemeySeen:isDead()) then return false 
	else return true end
end

function AttackTask:update()
	
	if(not self:isValid()) or (self:isComplete()) then return false end
	local theDistance = getDistanceBetween(self.parent.LastEnemeySeen, self.parent.player)
	
	if(self.parent:usingGun()) and (self.parent:isWalkingPermitted()) and (theDistance < 1.0) then
		local sq = getFleeSquare(self.parent.player,self.parent.LastEnemeySeen)
		self.parent:walkToDirect(sq)
		self.parent:DebugSay("backing away cuz i got gun")
	elseif(self.parent.player:IsAttackRange(self.parent.LastEnemeySeen:getX(),self.parent.LastEnemeySeen:getY(),self.parent.LastEnemeySeen:getZ())) or (theDistance < 0.65 )then
		self.parent:DebugSay("attacking!")
		self.parent:Attack(self.parent.LastEnemeySeen) ;		
	elseif(self.parent:isWalkingPermitted()) then
		local cs = self.parent.LastEnemeySeen:getCurrentSquare()
		if(instanceof(self.parent.LastEnemeySeen,"IsoPlayer")) then
		self.parent:walkToDirect(cs)
		else
			local fs = cs:getTileInDirection(self.parent.LastEnemeySeen:getDir())
			if(fs) and (fs:isFree(true)) then
				self.parent:walkToDirect(fs)
			else 
				self.parent:walkToDirect(cs)
			end
		end
			
		self.parent:DebugSay("walking close to attack:"..tostring(theDistance))
		
	end
	return true
	
end
