TakeGiftTask = {}
TakeGiftTask.__index = TakeGiftTask

function TakeGiftTask:new(superSurvivor, gift)

	local o = {}
	setmetatable(o, self)
	self.__index = self
		
	o.parent = superSurvivor
	o.Name = "Take Gift"
	o.TheGift = gift
	o.DestContainer = superSurvivor:getBag()
	if(isItemWater(gift)) then o.DestContainer = superSurvivor:Get():getInventory() end
	o.SrcContainer = nil
	o.OnGoing = false
	o.Ticks = 0
	o.Complete = false
	
	return o

end

function TakeGiftTask:isComplete()
	if(self.Complete) then
		if(self.DestContainer:FindAndReturnCategory("Weapon") ~= nil) and (self.parent:Get():getPrimaryHandItem() == nil) then
			self.parent:Get():setPrimaryHandItem(self.DestContainer:FindAndReturnCategory("Weapon"))
		end
	end
	return self.Complete
end

function TakeGiftTask:isValid()
	if not self.parent or self.TheGift == nil then return false 
	else return true end
end

function TakeGiftTask:update()
	
	if(not self:isValid()) then 
		self.Complete = true
		return false 
	end
	
	if(self.parent:isInAction() == false) then
	
		local x,y,z
		if(self.TheGift:getWorldItem() ~= nil) then
			x = self.TheGift:getWorldItem():getX()
			y = self.TheGift:getWorldItem():getY()
			z = self.TheGift:getWorldItem():getZ()
			self.SrcContainer = "Ground"
		elseif (self.TheGift:getContainer() ~= nil) and (self.TheGift:getContainer():getSourceGrid() ~= nil) then
			x = self.TheGift:getContainer():getSourceGrid():getX()
			y = self.TheGift:getContainer():getSourceGrid():getY()
			z = self.TheGift:getContainer():getSourceGrid():getZ()
			self.SrcContainer = self.TheGift:getContainer()
		end
		local sq
		if(x ~= nil) then 
			sq = self.parent:Get():getCell():getOrCreateGridSquare(math.floor(x),math.floor(y),math.floor(z)) 
		else 
			self.Complete = true 
			return false 
		end
		local distance = getDistanceBetween(self.parent:Get(), sq)
			
		if(not self.DestContainer:contains(self.TheGift)) and (distance < 2.0) then
			self.parent:Speak("*" .. getText("ContextMenu_SD_Takes_Before") .. self.TheGift:getDisplayName() .. getText("ContextMenu_SD_Takes_After") .. "*")
			
			if(self.SrcContainer == "Ground") then
				self.DestContainer:AddItem(self.TheGift)
				self.TheGift:getWorldItem():getSquare():removeWorldObject(self.TheGift:getWorldItem())
				if(self.TheGift:getWorldItem() ~= nil) then self.TheGift:getWorldItem():removeFromSquare() end
				self.TheGift:setWorldItem(nil)
					
				self.parent:Speak(getSpeech("Thanks"))
				self.Complete = true
				
				local itemType = self.TheGift:getType()
				if (EquipAnyArmor ~= nil) and (GlobalArmor ~= nil) and (GlobalArmor[itemType] ~= nil)  then
					self.parent:getBag():Remove(self.TheGift)
					self.parent:Get():getInventory():AddItem(self.TheGift)
					self.parent:Speak("*"..getText("ContextMenu_SD_EquipsArmor").."*")
					EquipAnyArmor(self.TheGift,self.parent.player)
				end
			else
				ISTimedActionQueue.add(ISInventoryTransferAction:new (self.parent.player, self.TheGift, self.TheGift:getContainer(), self.parent:getBag(), 20))
			end
		elseif(self.DestContainer:contains(self.TheGift)) then
						
			self.parent:Speak(getSpeech("Thanks"))
			self.Complete = true
			
			local itemType = self.TheGift:getType()
			if (isModEnabled("ArmorMod")) and (GlobalArmor ~= nil) and (GlobalArmor[itemType] ~= nil) then
				self.parent:getBag():Remove(self.TheGift)
				self.parent:Get():getInventory():AddItem(self.TheGift)
				self.parent:Speak("*"..getText("ContextMenu_SD_EquipsArmor").."*")
				EquipAnyArmor(self.TheGift,self.parent.player)
			end
		else
			
			
			if(x ~= nil) then
				local sq = self.parent:Get():getCell():getOrCreateGridSquare(math.floor(x),math.floor(y),math.floor(z))
				if(sq ~= nil) then self.parent:walkTo(sq) end
			end
		end
	
		self.Ticks = self.Ticks + 1
		if(self.Ticks > 15) then self.Complete = true end
	end

end
