--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISBarricadeActionNEW = ISBaseTimedAction:derive("ISBarricadeActionNEW");

function ISBarricadeActionNEW:isValid()
	if not instanceof(self.item, "BarricadeAble") or self.item:getObjectIndex() == -1 then
		--print("11")
		return false
	end
	local barricade = self.item:getBarricadeForCharacter(self.character)
	if self.isMetal then
		if barricade then
			--print("22")
			return false
			
		end
		if not self.character:hasEquipped("BlowTorch") or not self.character:hasEquipped("SheetMetal") then
			--print("33")
			return false
			
        end
    elseif self.isMetalBar then
        if barricade then
		--print("44")
            return false
			
        end
        if not self.character:hasEquipped("BlowTorch") or not self.character:hasEquipped("MetalBar") then
		--print("55")
            return false
        end
	else
		if barricade and not barricade:canAddPlank() then
		--print("66")
			return false
		end
		if not self.character:hasEquipped("Hammer") and not self.character:hasEquipped("HammerStone") then
		--print("77")
			return false
		end
		if not self.character:hasEquipped("Plank") then
			--print("88")
			return false
		end
		if self.character:getInventory():getItemCount("Base.Nails", true) < 2 then
			self.character:getInventory():AddItem(instanceItem("Base.Nails"))
			self.character:getInventory():AddItem(instanceItem("Base.Nails"))
		end
	end
	if self.isStarted then
		if instanceof(self.item, "IsoDoor") or (instanceof(self.item, "IsoThumpable") and self.item:isDoor()) then
			if self.item:IsOpen() then
			--print("1010")
				return false
			end
		end
	end
	return true
end

function ISBarricadeActionNEW:update()
	self.character:faceThisObject(self.item)
end

function ISBarricadeActionNEW:start()
    if self.character:hasEquipped("BlowTorch") then
        self.sound = self.character:getEmitter():playSound("BlowTorch")
        local radius = 20 * self.character:getWeldingSoundMod()
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
    else
        self.sound = self.character:getEmitter():playSound("Hammering")
        local radius = 20 * self.character:getHammerSoundMod()
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
    end
    if instanceof(self.item, "IsoDoor") or (instanceof(self.item, "IsoThumpable") and self.item:isDoor()) then
        if self.item:IsOpen() then
            self.item:ToggleDoor(self.character)
        end
        self.isStarted = true
    end
end

function ISBarricadeActionNEW:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISBarricadeActionNEW:perform()
	
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	local material = self.character:getSecondaryHandItem()
	if not instanceof(material, "InventoryItem") then 
		return 
	end

	--local obj = self.item
	--local index = obj:getObjectIndex()
	--local args = { x=obj:getX(), y=obj:getY(), z=obj:getZ(), index=index, isMetal=self.isMetal, isMetalBar=self.isMetalBar, itemID=material:getID(), condition=material:getCondition() }
	--sendClientCommand(self.character, 'object', 'barricade', args)
	
	local barricade = IsoBarricade.AddBarricadeToObject(self.item, self.character)
		if barricade then
			barricade:addPlank(self.character, material)
			self.character:getInventory():RemoveOneOf("Nails")
			self.character:getInventory():RemoveOneOf("Nails")
			self.character:getXp():AddXPNoMultiplier(Perks.Woodwork, 3)
		else
			print("could not get barricade object")
		end
	
	if self.isMetalBar or self.isMetal then
		self.character:getPrimaryHandItem():Use();
		self.character:getPrimaryHandItem():Use();
		self.character:getPrimaryHandItem():Use();
	end
	if self.character:getSecondaryHandItem() == material then
		self.character:setSecondaryHandItem(nil)
	end

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISBarricadeActionNEW:new(character, item, isMetal, isMetalBar, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	o.isMetal = isMetal;
    o.isMetalBar = isMetalBar;
	if character:HasTrait("Handy") then
		o.maxTime = time - 20;
    end
    if character:getAccessLevel() ~= "None" then
        o.maxTime = 1;
    end
    o.caloriesModifier = 8;
	return o;
end
