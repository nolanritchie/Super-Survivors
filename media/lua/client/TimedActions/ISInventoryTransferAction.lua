require "TimedActions/ISBaseTimedAction"

ISInventoryTransferAction = ISBaseTimedAction:derive("ISInventoryTransferAction");

function ISInventoryTransferAction:isValid()
	if (not self.destContainer:isExistYet()) or (not self.srcContainer:isExistYet()) then
		--self.character:Say("1")
		return false
	end
	-- Limit items per container in MP
	if isClient() then
		local limit = getServerOptions():getInteger("ItemNumbersLimitPerContainer")
		if limit > 0 and (not instanceof(self.destContainer:getParent(), "IsoGameCharacter")) and self.destContainer:getItems():size()+1 > limit then
			--self.character:Say("2")
			return false
		end
	end

    if ISTradingUI.instance and ISTradingUI.instance:isVisible() then
		--self.character:Say("3")
        return false;
    end
	if not self.srcContainer:contains(self.item) then
		--self.character:Say("4")
		return false;
    end
    if self.srcContainer == self.destContainer then 
		--self.character:Say("5")
		return false; 
	end

    if self.destContainer:getType()=="floor" then
        if instanceof(self.item, "Moveable") and self.item:getSpriteGrid()==nil then
            if not self.item:CanBeDroppedOnFloor() then
				self.character:Say("6")
                return false;
            end
        end
    end
	if not self.destContainer:hasRoomFor(self.character, self.item) and 
	   not ( (self.destContainer:getType()=="floor") and (self.character:getCurrentSquare():getWorldObjects():size() == 0) ) then  -- exception to allow 1 item to be dropped on floor even if it is overweight
		--self.character:Say("7")
		return false;
    end
    if self.destContainer:getOnlyAcceptCategory() and self.item:getCategory() ~= self.destContainer:getOnlyAcceptCategory() then
		--self.character:Say("8")
        return false;
    end
    if self.item:getContainer() == self.srcContainer and not self.destContainer:isInside(self.item) then
		--self.character:Say("9")
        return true;
    end
    if isClient() and self.srcContainer:getSourceGrid() and SafeHouse.isSafeHouse(self.srcContainer:getSourceGrid(), self.character:getUsername(), true) then
		--self.character:Say("10")
        return false;
    end
    return false;
end

function ISInventoryTransferAction:update()
--    if self.updateDestCont then
--        self.destContainer:setSourceGrid(self.character:getCurrentSquare());
--    end
--
--    if self.updateSrcCont then
--        self.srcContainer:setSourceGrid(self.character:getCurrentSquare());
--    end
	self.item:setJobDelta(self.action:getJobDelta());
end

function ISInventoryTransferAction:removeItemOnCharacter()
	if self.character:getPrimaryHandItem() == self.item then
		self.character:setPrimaryHandItem(nil);
	end
	if self.character:getSecondaryHandItem() == self.item then
		self.character:setSecondaryHandItem(nil);
	end
	if self.character:getClothingItem_Torso() == self.item then
		self.character:setClothingItem_Torso(nil);
	end
	if self.character:getClothingItem_Torso() == self.item then
		self.character:setClothingItem_Torso(nil);
	end
	if self.character:getClothingItem_Legs() == self.item then
		self.character:setClothingItem_Legs(nil);
	end
	if self.character:getClothingItem_Feet() == self.item then
		self.character:setClothingItem_Feet(nil);
	end
	if self.character:getClothingItem_Back() == self.item then
		self.character:setClothingItem_Back(nil);
	end
	if self.item and self.item:getCategory() == "Clothing" then
		triggerEvent("OnClothingUpdated", self.character)
	end
end

ISInventoryTransferAction.putSound = nil;

function ISInventoryTransferAction:start()

    -- stop microwave working when putting new stuff in it
    if self.destContainer and self.destContainer:getType() == "microwave" and self.destContainer:getParent() and self.destContainer:getParent():Activated() then
        self.destContainer:getParent():setActivated(false);
    end
    if self.srcContainer and self.srcContainer:getType() == "microwave" and self.srcContainer:getParent() and self.srcContainer:getParent():Activated() then
        self.srcContainer:getParent():setActivated(false);
    end
--    if self.destContainer:getPutSound() then
    if not ISInventoryTransferAction.putSound or not self.character:getEmitter():isPlaying(ISInventoryTransferAction.putSound) then
        ISInventoryTransferAction.putSound = self.character:getEmitter():playSound("PZ_PutInBag");
    elseif not self.character:getEmitter():isPlaying(ISInventoryTransferAction.putSound) then
        ISInventoryTransferAction.putSound = self.character:getEmitter():playSound("PZ_PutInBag");
    end
--    end

	if self.srcContainer == self.character:getInventory() then
		if self.destContainer:isInCharacterInventory(self.character) then
			self.item:setJobType(getText("IGUI_Packing"));
		else
			self.item:setJobType(getText("IGUI_PuttingInContainer"));
        end

        return;

	elseif self.srcContainer:isInCharacterInventory(self.character) then
		if self.destContainer == self.character:getInventory() then
			self.item:setJobType(getText("IGUI_Unpacking"));
		else
			self.item:setJobType(getText("IGUI_TakingFromContainer"));
        end
        return;
	elseif not self.srcContainer:isInCharacterInventory(self.character) then
		if self.destContainer:isInCharacterInventory(self.character) then
			self.item:setJobType(getText("IGUI_TakingFromContainer"));
       --     self.maxTime = 30;
            return;
        end
	end

    self.item:setJobType(getText("IGUI_MovingToContainer"));


end

function ISInventoryTransferAction:stop()
    ISBaseTimedAction.stop(self);

	self.item:setJobDelta(0.0);
end

function ISInventoryTransferAction:perform()
	self.item:setJobDelta(0.0);
    if self.item:isFavorite() and not self.destContainer:isInCharacterInventory(self.character) then
        ISBaseTimedAction.perform(self);
        return;
    end

    if self.destContainer:isInCharacterInventory(self.character) then

    end
    if self.srcContainer:isInCharacterInventory(self.character) then

    end
    if self.srcContainer:getType() ~= "TradeUI" and isClient() and not self.destContainer:isInCharacterInventory(self.character) and self.destContainer:getType()~="floor" then
        self.destContainer:addItemOnServer(self.item);
    end
    if self.srcContainer:getType() ~= "TradeUI" and isClient() and not self.srcContainer:isInCharacterInventory(self.character) and self.srcContainer:getType()~="floor" then
        self.srcContainer:removeItemOnServer(self.item);
    end

    if self.destContainer:getType() ~= "TradeUI" then
	    self.srcContainer:DoRemoveItem(self.item);
    end
	-- clear it from the queue.
    self.srcContainer:setDrawDirty(true);
    self.srcContainer:setHasBeenLooted(true);
    self.destContainer:setDrawDirty(true);

    -- deal with containers that are floor
    if self.destContainer:getType()=="floor" then
        self.destContainer:DoAddItemBlind(self.item);
        self.character:getCurrentSquare():AddWorldInventoryItem(self.item, self.character:getX() - math.floor(self.character:getX()), self.character:getY() - math.floor(self.character:getY()), self.character:getZ() - math.floor(self.character:getZ()));
		self:removeItemOnCharacter();
    elseif self.srcContainer:getType()=="floor" and self.item:getWorldItem() ~= nil then
        self.item:getWorldItem():getSquare():transmitRemoveItemFromSquare(self.item:getWorldItem());
        self.item:getWorldItem():getSquare():removeWorldObject(self.item:getWorldItem());
--        self.item:getWorldItem():getSquare():getObjects():remove(self.item:getWorldItem());
        self.item:setWorldItem(nil);
        self.destContainer:AddItem(self.item);
    else
        if self.srcContainer:getType() ~= "TradeUI" then
            self.destContainer:AddItem(self.item);
        end
		if self.character:getInventory() ~= self.destContainer then
			self:removeItemOnCharacter();
		end
	end
	
	if self.destContainer:getParent() and instanceof(self.destContainer:getParent(), "BaseVehicle") and self.destContainer:getParent():getPartById(self.destContainer:getType()) then
		local part = self.destContainer:getParent():getPartById(self.destContainer:getType());
		part:setContainerContentAmount(part:getItemContainer():getCapacityWeight());
	end
	
	if self.srcContainer:getParent() and instanceof(self.srcContainer:getParent(), "BaseVehicle") and self.srcContainer:getParent():getPartById(self.srcContainer:getType()) then
		local part = self.srcContainer:getParent():getPartById(self.srcContainer:getType());
		part:setContainerContentAmount(part:getItemContainer():getCapacityWeight());
	end

    -- Hack for giving cooking XP.
    if instanceof(self.item, "Food") then
        self.item:setChef(self.character:getFullName())
    end
    if self.destContainer:getType() == "stonefurnace" then
       self.item:setWorker(self.character:getFullName());
    end

    local pdata = getPlayerData(self.character:getPlayerNum());

    pdata.playerInventory:refreshBackpacks();
    pdata.lootInventory:refreshBackpacks();
    
    -- do the overlay sprite
	if not isClient() then
		if self.srcContainer:getParent() and self.srcContainer:getParent():getOverlaySprite() then
			ItemPicker.updateOverlaySprite(self.srcContainer:getParent())
		end
		if self.destContainer:getParent() then
			ItemPicker.updateOverlaySprite(self.destContainer:getParent())
		end
	end
    
--    needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);

	if self.onCompleteFunc then
		local args = self.onCompleteArgs
		self.onCompleteFunc(args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8])
	end
end

function ISInventoryTransferAction:setOnComplete(func, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
	self.onCompleteFunc = func
	self.onCompleteArgs = { arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8 }
end

function ISInventoryTransferAction:getTimeDelta()
	return 0;
end

function ISInventoryTransferAction:new (character, item, srcContainer, destContainer, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.srcContainer = srcContainer;
	o.destContainer = destContainer;
	o.stopOnWalk = ((not o.destContainer:isInCharacterInventory(o.character)) or (not o.srcContainer:isInCharacterInventory(o.character))) and (o.destContainer:getType() ~= "floor");
	o.stopOnRun = o.destContainer:getType() ~= "floor";
    if destContainer:getType() ~= "TradeUI" and srcContainer:getType() ~= "TradeUI" then
        o.maxTime = 120;
        -- increase time for bigger objects or when backpack is more full.
        local destCapacityDelta = 1.0;

        if o.srcContainer == o.character:getInventory() then
            if o.destContainer:isInCharacterInventory(o.character) then
           --     self.item:setJobType("Packing");
                destCapacityDelta = o.destContainer:getCapacityWeight() / o.destContainer:getMaxWeight();
            else
             --   self.item:setJobType("Putting in container");
                o.maxTime = 50;
            end

        elseif not o.srcContainer:isInCharacterInventory(o.character) then
            if o.destContainer:isInCharacterInventory(o.character) then
             --   self.item:setJobType("Taking from container");
                o.maxTime = 50;
            end
        end

        if destCapacityDelta < 0.4 then
            destCapacityDelta = 0.4;
        end


        local w = item:getActualWeight();
        if w > 3 then w = 3; end;
        o.maxTime = o.maxTime * (w) * destCapacityDelta;

        if getCore():getGameMode()=="LastStand" then
            o.maxTime = o.maxTime * 0.3;
        end

        if o.destContainer:getType()=="floor" then
            o.maxTime = o.maxTime * 0.1;
		end

		if character:HasTrait("Dextrous") then
			o.maxTime = o.maxTime * 0.5
		end
		if character:HasTrait("AllThumbs") then
			o.maxTime = o.maxTime * 4.0
		end
    else
        o.maxTime = 0;
    end
    if time then
        o.maxTime = time;
    end
    if character:getAccessLevel() ~= "None" or (instanceof(character, "IsoPlayer") and character:isGhostMode()) then
        o.maxTime = 1;
    end
    o.jobType = getText("IGUI_JobType_Grabbing", item:getName());

    if item:isFavorite() and not o.destContainer:isInCharacterInventory(o.character) then o.maxTime = 0; end

    return o
end

