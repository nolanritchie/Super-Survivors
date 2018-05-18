FirstAideTask = {}
FirstAideTask.__index = FirstAideTask

function FirstAideTask:new(superSurvivor)

	local o = {}
	setmetatable(o, self)
	self.__index = self
		
	o.parent = superSurvivor
	o.Name = "First Aide"
	o.OnGoing = false
	return o

end

function FirstAideTask:isComplete()
	if self.parent:HasInjury() then
		return false 
	else return true end 
end

function FirstAideTask:isValid()
	if (not self.parent) or (not self.parent:HasInjury()) then return false 
	else return true end
end

function FirstAideTask:update()
	
	if(not self:isValid()) then return false end
	if(not self.parent:isInAction() == false) then return false end
	
	local bodyparts = self.parent.player:getBodyDamage():getBodyParts()
	
	for i=0, bodyparts:size()-1 do
		local bp = bodyparts:get(i)
		if(bp:HasInjury()) and (bp:bandaged() == false) then
			self.parent:Speak("*" .. getText("ContextMenu_SD_BandageBP_Before") .. tostring(BodyPartType.getDisplayName(bp:getType())).. getText("ContextMenu_SD_BandageBP_After") .. "*" )
			local item = self.parent.player:getInventory():AddItem("Base.RippedSheets")
			ISTimedActionQueue.add(ISApplyBandage:new(self.parent.player, self.parent.player, item, bp, true))
			break
		end
		
	end
			
	
end

