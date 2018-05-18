EatFoodTask = {}
EatFoodTask.__index = EatFoodTask

function EatFoodTask:new(superSurvivor, food)

	local o = {}
	setmetatable(o, self)
	self.__index = self
		
	o.parent = superSurvivor
	o.Name = "Eat Food"
	o.Complete = false
	
	if(food ~= nil) then o.TheFood = food
	elseif(superSurvivor:getFood() ~= nil) then o.TheFood = superSurvivor:getFood() 
	else o.Complete=true end

	o.EatingStarted = false
	o.OnGoing = false
	
	
	return o

end

function EatFoodTask:isComplete()
	return self.Complete
end

function EatFoodTask:isValid()
	if not self.parent or self.TheFood == nil then return false 
	else return true end
end

function EatFoodTask:isCanned(thisFood)
	if not thisFood then return false end
	local dtype = thisFood:getType() .. thisFood:getDisplayName() 
	
	if string.match(dtype, "Canned") then return true
	else return false end
end

function EatFoodTask:openCanned(thisFood)
	local exceptions = {TinnedBeans = "OpenBeans"}

	if not self:isCanned(thisFood) then return nil end
	local dtype = thisFood:getFullType() .. "Open"
	local openCan = self.parent:Get():getInventory():AddItem(dtype)
	if (openCan ~= nil) then return openCan
	else 
		print("food type\"".. dtype .. "\" Not found")
		return self.parent:Get():getInventory():AddItem("Base.OpenBeans") 
	end
end

function EatFoodTask:update()
	
	if(not self:isValid()) then 
		self.Complete = true
		return false 
	end
	
	if(self.parent:isInAction() == false) then
				
		if(self.EatingStarted == false) and (not self.parent.player:getInventory():contains(self.TheFood)) then
			self.parent:Speak(getText("ContextMenu_SD_Takes_Before") .. self.TheFood:getDisplayName() .. getText("ContextMenu_SD_Takes_After"))
			--self.TheFood:getContainer():Remove(self.TheFood);
			--self.parent.player:getInventory():AddItem(self.TheFood);
			if(self.TheFood:getContainer() ~= nil) then ISTimedActionQueue.add(ISInventoryTransferAction:new (self.parent.player, self.TheFood, self.TheFood:getContainer(), self.parent.player:getInventory(), 20))
			elseif(self.TheFood:getWorldItem() ~= nil) then
				self.PlayerBag:AddItem(self.TheFood)
				self.TheFood:getWorldItem():removeFromSquare()
				self.TheFood:setWorldItem(nil)
			else
				self.TheFood = nil
			end
		elseif(self.EatingStarted == false) and (self.parent.player:getInventory():contains(self.TheFood)) then
			
			local HungerChange = self.TheFood:getHungChange()
			
			if(HungerChange == 0) and (self:isCanned(self.TheFood)) then
				local openCan = self:openCanned(self.TheFood)
				if(openCan ~= nil) then
					self.parent:Speak(getText("ContextMenu_SD_Opens_Before")..tostring(self.TheFood:getDisplayName())..getText("ContextMenu_SD_Opens_After"))
					self.parent.player:getInventory():Remove(self.TheFood)
					self.parent.player:getInventory():DoRemoveItem(self.TheFood)
					self.TheFood = openCan
				end
			end
			
			local eatthisMuch = 0.25
			if ((HungerChange / 100) * 0.25) > self.parent.player:getStats():getHunger() then eatthisMuch = 0.25
			elseif ((HungerChange / 100) * 0.50) > self.parent.player:getStats():getHunger() then eatthisMuch  = 0.50
			elseif ((HungerChange / 100) * 0.75) > self.parent.player:getStats():getHunger() then eatthisMuch = 0.75
			else eatthisMuch = 1.00 end			
		
			self.parent:Speak(getText("ContextMenu_SD_EatFood_Before") .. self.TheFood:getDisplayName() .. getText("ContextMenu_SD_EatFood_After"));
			ISTimedActionQueue.add(ISEatFoodAction:new(self.parent.player,self.TheFood,eatthisMuch))
			self.parent.player:getStats():setHunger(self.parent.player:getStats():getHunger() + self.TheFood:getHungChange());
			--self.parent.player:getInventory():Remove(self.TheFood)	
			self.EatingStarted = true
		else
			self.Complete = true
		end
	
	end

end
