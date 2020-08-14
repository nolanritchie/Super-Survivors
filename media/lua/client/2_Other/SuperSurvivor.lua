
SuperSurvivor = {}
SuperSurvivor.__index = SuperSurvivor

function SuperSurvivor:new(isFemale,square)
	
	local o = {}	
	setmetatable(o, self)
	self.__index = self
		
	o.NumberOfBuildingsLooted = 0
	o.AttackRange = 0.5
	o.UsingFullAuto = false
	o.GroupBraveryBonus = 0
	o.GroupBraveryUpdatedTicks = 0
	o.WaitTicks = 0
	o.TriggerHeldDown = false
	o.player = o:spawnPlayer(square)
	o.userName = TextDrawObject.new()
	o.userName:setAllowAnyImage(true);
	o.userName:setDefaultFont(UIFont.Small);
	o.userName:setDefaultColors(255, 255, 255, 255);
	o.userName:ReadString(o.player:getForname())
	
	o.AmmoTypes = {}
	o.AmmoBoxTypes = {}
	o.LastGunUsed = nil
	o.LastMeleUsed = nil
	o.roundChambered = nil
	o.TicksSinceSpoke = 0
	o.JustSpoke = false
	o.SayLine1 = ""
	
	o.LastSurvivorSeen = nil
	o.LastMemberSeen = nil
	o.TicksAtLastDetectNoFood = 0
	o.NoFoodNear = false
	o.GroupRole = ""
	o.seenCount = 0
	o.dangerSeenCount = 0
	o.MyTaskManager = TaskManager:new(o)
	o.LastEnemeySeen = false
	o.Reducer = ZombRand(1,100)
	o.Container = false
	o.Room = false
	o.Building = false
	o.WalkingPermitted = true
	o.TargetBuilding = nil
	o.TargetSquare = nil
	o.Tree = false
	o.LastSquare = nil
	o.TicksSinceSquareChanged = 0
	o.EnemiesOnMe = 0
	o.BaseBuilding = nil
	o.BravePoints = 0
	o.Shirt = nil
	o.Pants = nil
	o.WasOnScreen = false
	
	o.SpokeToRecently = {}
	o.SquareWalkToAttempts = {}
	o.SquaresExplored = {}
	o.SquareContainerSquareLooteds = {}
	for i=1, #LootTypes do o.SquareContainerSquareLooteds[LootTypes[i]] = {} end
	
	o:setBravePoints(SuperSurvivorBravery)
	
	
	
	return o
end

function SuperSurvivor:newLoad(ID,square)
	
	local o = {}	
	setmetatable(o, self)
	self.__index = self
		
	o.AttackRange = 0.5
	o.UsingFullAuto = false
	o.GroupBraveryBonus = 0
	o.GroupBraveryUpdatedTicks = 0
	o.NumberOfBuildingsLooted = 0
	o.WaitTicks = 0
	o.TriggerHeldDown = false
	o.player = o:loadPlayer(square,ID)
	o.userName = TextDrawObject.new()
	o.userName:setAllowAnyImage(true);
	o.userName:setDefaultFont(UIFont.Small);
	o.userName:setDefaultColors(255, 255, 255, 255);
	o.userName:ReadString(o.player:getForname())
	
	o.AmmoTypes = {}
	o.AmmoBoxTypes = {}
	o.LastGunUsed = nil
	o.LastMeleUsed = nil
	o.roundChambered = nil
	o.TicksSinceSpoke = 0
	o.JustSpoke = false
	o.SayLine1 = ""
		
	o.LastSurvivorSeen = nil
	o.LastMemberSeen = nil
	o.TicksAtLastDetectNoFood = 0
	o.NoFoodNear = false
	o.GroupRole = ""
	o.seenCount = 0
	o.dangerSeenCount = 0
	o.MyTaskManager = TaskManager:new(o)
	o.LastEnemeySeen = false
	o.Reducer = ZombRand(1,100)
	o.Container = false
	o.Room = false
	o.Building = false
	o.WalkingPermitted = true
	o.TargetBuilding = nil
	o.TargetSquare = nil
	o.Tree = false
	o.LastSquare = nil
	o.TicksSinceSquareChanged = 0
	o.EnemiesOnMe = 0
	o.BaseBuilding = nil
	o.BravePoints = 0
	o.Shirt = nil
	o.Pants = nil
	o.WasOnScreen = false
	
	o.SpokeToRecently = {}
	o.SquareWalkToAttempts = {}
	o.SquaresExplored = {}
	o.SquareContainerSquareLooteds = {}
	for i=1, #LootTypes do o.SquareContainerSquareLooteds[LootTypes[i]] = {} end
	o:setBravePoints(SuperSurvivorBravery)
	
	
	
	return o
end

function SuperSurvivor:newSet(player)
	
	local o = {}	
	setmetatable(o, self)
	self.__index = self
		
	o.AttackRange = 0.5
	o.UsingFullAuto = false
	o.NumberOfBuildingsLooted = 0
	o.GroupBraveryBonus = 0
	o.GroupBraveryUpdatedTicks = 0
	o.AmmoTypes = {}
	o.AmmoBoxTypes = {}
	o.LastGunUsed = nil
	o.LastMeleUsed = nil
	o.roundChambered = nil
	o.TriggerHeldDown = false
	o.TicksSinceSpoke = 0
	o.JustSpoke = false
	o.SayLine1 = ""
	
	o.player = player
	o.WaitTicks = 0
	o.LastSurvivorSeen = nil
	o.LastMemberSeen = nil
	o.TicksAtLastDetectNoFood = 0
	o.NoFoodNear = false
	o.GroupRole = ""
	o.seenCount = 0
	o.dangerSeenCount = 0
	o.MyTaskManager = TaskManager:new(o)
	o.LastEnemeySeen = false
	o.Reducer = ZombRand(1,100)
	o.Container = false
	o.Room = false
	o.Building = false
	o.WalkingPermitted = true
	o.TargetBuilding = nil
	o.TargetSquare = nil
	o.Tree = false
	o.LastSquare = nil
	o.TicksSinceSquareChanged = 0
	o.EnemiesOnMe = 0
	o.BaseBuilding = nil
	o.SquareWalkToAttempts = {}
	o.SquaresExplored = {}
	o.SquareContainerSquareLooteds = {}
	for i=1, #LootTypes do o.SquareContainerSquareLooteds[LootTypes[i]] = {} end
	
	o:setBravePoints(SuperSurvivorBravery)
	
	return o
end
function SuperSurvivor:Wait(ticks)
 self.WaitTicks = ticks
end

function SuperSurvivor:isInBase()

	if(self:getGroupID() == nil) then return false
	else
		local group = SSGM:Get(self:getGroupID())
		if(group) then
			return group:IsInBounds(self:Get())
		end
	end
	return false
end

function SuperSurvivor:getBaseCenter()

	if(self:getGroupID() == nil) then return false
	else
		local group = SSGM:Get(self:getGroupID())
		if(group) then
			return group:getBaseCenter()
		end
	end
	return nil
end


function SuperSurvivor:getGroupBraveryBonus()

	if(self.GroupBraveryUpdatedTicks % 5 == 0) then

		if(self:getGroupID() == nil) then return 0 end
		local group = SSGM:Get(self:getGroupID())
		if(group) then self.GroupBraveryBonus = group:getMembersThisCloseCount(12, self:Get()) 
		else self.GroupBraveryBonus = 0 end
	else
		self.GroupBraveryUpdatedTicks = self.GroupBraveryUpdatedTicks + 1
	end
	return self.GroupBraveryBonus
end

function SuperSurvivor:isInGroup(thisGuy)

	if(self:getGroupID() == nil) then return false
	elseif(thisGuy:getModData().Group == nil) then return false
	elseif (thisGuy:getModData().Group ~= self:getGroupID()) then return false
	else return true end

end
function SuperSurvivor:isGroupless(thisGuy)

	if(thisGuy:getModData().Group == nil) then return false
	else return true end

end

function SuperSurvivor:getName()
	return self.player:getForname()
end

function SuperSurvivor:refreshName()
	if(self.player:getModData().Name ~= nil) then self:setName(self.player:getModData().Name) end
end

function SuperSurvivor:setName(nameToSet)
	
	local desc = self.player:getDescriptor()
	desc:setForename(nameToSet)
	desc:setSurname("")	
	self.player:setForname(nameToSet);
	self.player:setDisplayName(nameToSet);
	if(self.userName) then self.userName:ReadString(nameToSet) end
	
	self.player:getModData().Name = nameToSet
	self.player:getModData().NamRaw = nameToSet
end

function SuperSurvivor:renderName()

	if (not self.userName) or ((not self.JustSpoke) and ((not self:isInCell()) or (self:Get():getAlpha() ~= 1.0) or (not getSpecificPlayer(0):CanSee(self.player)))) then return false end
	
	if(self.JustSpoke == true) and (self.TicksSinceSpoke == 0) then
		self.TicksSinceSpoke = 250		
		self.userName:ReadString(self.player:getForname() .. "\n" .. self.SayLine1)
	elseif(self.TicksSinceSpoke > 0) then
		self.TicksSinceSpoke = self.TicksSinceSpoke - 1
		if(self.TicksSinceSpoke == 0) then
			self.userName:ReadString(self.player:getForname());
			self.JustSpoke = false
			self.SayLine1 = ""
		end	
	end
		
	local sx = IsoUtils.XToScreen(self:Get():getX(), self:Get():getY(), self:Get():getZ(), 0);
	local sy = IsoUtils.YToScreen(self:Get():getX(), self:Get():getY(), self:Get():getZ(), 0);
	sx = sx - IsoCamera.getOffX() - self:Get():getOffsetX();
	sy = sy - IsoCamera.getOffY() - self:Get():getOffsetY();

	sy = sy - 128

	sx = sx / getCore():getZoom(0)
	sy = sy / getCore():getZoom(0)

	sy = sy - self.userName:getHeight()

	self.userName:AddBatchedDraw(sx, sy, true)

end

function SuperSurvivor:SpokeTo(playerID)

	self.SpokeToRecently[playerID] = true

end
function SuperSurvivor:getSpokeTo(playerID)

	if(self.SpokeToRecently[playerID] ~= nil) then return true
	else return false end

end

function SuperSurvivor:reload()
	local cs = self.player:getCurrentSquare()
	local id = self:getID()
	self:delete()
	self.player = self:spawnPlayer(cs)
	self:loadPlayer(cs,id)
end

function SuperSurvivor:loadPlayer(square, ID)
	-- load from file if save file exists
	
	if (ID ~= nil) and (checkSaveFileExists("Survivor"..tostring(ID))) then
		
		local BuddyDesc = SurvivorFactory.CreateSurvivor();
		local realplayer = getSpecificPlayer(0);
		local Buddy = IsoPlayer.new(getWorld():getCell(),BuddyDesc,square:getX(),square:getY(),square:getZ());
		IsoPlayer.setInstance(realplayer);
		Buddy:getInventory():emptyIt();
		local filename = getSaveDir() .. "Survivor"..tostring(ID);
		Buddy:load( filename );
		
		Buddy:setX(square:getX())
		Buddy:setY(square:getY())
		Buddy:setZ(square:getZ())
		Buddy:getModData().ID = ID
		
		Buddy:setBlockMovement(true)
		
		if(true) then
			if(Buddy:isFemale()) then Buddy:setModel("kate.txt");
			else Buddy:setModel("male.txt"); end
		end
		
		print("loading survivor " .. tostring(ID) .. " from file")
		return Buddy
	else
		print("save file for survivor " .. tostring(ID) .. " does not exist")
	end
	

end

function SuperSurvivor:spawnPlayer(square)

	
	local BuddyDesc
	if(isFemale == nil ) then
		BuddyDesc = SurvivorFactory.CreateSurvivor();
	else 		
		BuddyDesc = SurvivorFactory.CreateSurvivor(nil, isFemale);
		isFemale = nil;
	end
	
	SurvivorFactory.randomName(BuddyDesc);
	
	local Z = 0;
	if(square:isSolidFloor()) then Z = square:getZ() end;
		
	local Buddy = IsoPlayer.new(getWorld():getCell(),BuddyDesc,square:getX(),square:getY(),Z);
	if(true) then
		if(Buddy:isFemale()) then Buddy:setModel("kate.txt");
		else Buddy:setModel("male.txt"); end
	end
	
	Buddy:setBlockMovement(true)

	-- required perks ------------
	for i=0, 4 do
		Buddy:LevelPerk(Perks.FromString("Strength"));
	end
	for i=0, 2 do
		Buddy:LevelPerk(Perks.FromString("Sneak"));
	end
	for i=0, 3 do
		Buddy:LevelPerk(Perks.FromString("Lightfoot"));
	end
	-- end
	
	-- random perks -------------------
	local level = ZombRand(9,14);
	local count = 0;
	while(count < level) do
		Buddy:LevelPerk(Perks.FromString(getAPerk()));
		count = count + 1;
	end
	--
	
	local traits = Buddy:getTraits()
	
	traits:add("Inconspicuous")
	traits:add("Outdoorsman")
	traits:add("LightEater")
	traits:add("LowThirst")
	traits:add("FastHealer")
	traits:add("Graceful")
	traits:add("IronGut")
	traits:add("Lucky")
	
	Buddy:setTraits(traits) 
	
	Buddy:setClothingItem_Back(Buddy:getInventory():AddItem("Base.BigHikingBag"))
	
	-- achievements mod compatibility to stop errors--------
	if(Buddy:getModData().ThingsIDropped == nil) then 
		Buddy:getModData().ThingsIDropped = {} 
	end
	if(Buddy:getModData().CheckPointCounts == nil) then 
		Buddy:getModData().CheckPointCounts = {} 
	end
	if(Buddy:getModData().KilledWithCounts == nil) then 
		Buddy:getModData().KilledWithCounts = {} 
	end	
	if(Buddy:getModData().ThingsIDid == nil) then
		Buddy:getModData().ThingsIDid = {}
	end
	if(Buddy:getModData().ThingsIAte == nil) then
		Buddy:getModData().ThingsIAte = {}
	end
	if(Buddy:getModData().ThingsICrafted == nil) then
		Buddy:getModData().ThingsICrafted = {}
	end
	-- achievements mod compatibility to stop errors--------END
	Buddy:getModData().bWalking = false
	Buddy:getModData().isHostile = false	
	Buddy:getModData().RWP = SuperSurvivorGetOptionValue("SurvivorFriendliness")
	print("SuperSurvivorGetOptionValue(SurvivorFriendliness):"..tostring(Buddy:getModData().RWP))
	Buddy:getModData().AIMode = "Random Solo"
	
	ISTimedActionQueue.clear(Buddy)
	
	local namePrefix = ""
	local namePrefixAfter = ""
	if(Buddy:getPerkLevel(Perks.FromString("Doctor")) >= 3) then 
		namePrefix = getText("ContextMenu_SD_DoctorPrefix_Before") 
		namePrefixAfter = getText("ContextMenu_SD_DoctorPrefix_After") 
	end
	if(Buddy:getPerkLevel(Perks.FromString("Aiming")) >= 3) then 
		namePrefix = getText("ContextMenu_SD_VeteranPrefix_Before") 
		namePrefixAfter = getText("ContextMenu_SD_VeteranPrefix_After") 
	end
	if(Buddy:getPerkLevel(Perks.FromString("Farming")) >= 3) then 
		namePrefix = getText("ContextMenu_SD_FarmerPrefix_Before") 
		namePrefixAfter = getText("ContextMenu_SD_FarmerPrefix_After") 
	end
	
	local nameToSet
	if(Buddy:getModData().Name == nil) then
		if Buddy:isFemale() then
			nameToSet = getSpeech("GirlNames")	
		else
			nameToSet = getSpeech("BoyNames")			
		end		
	else
		nameToSet = Buddy:getModData().Name
	end
	nameToSet = namePrefix .. nameToSet .. namePrefixAfter
	
	Buddy:setForname(nameToSet);
	Buddy:setDisplayName(nameToSet);
	
	Buddy:getStats():setHunger((ZombRand(10)/100))
	Buddy:getStats():setThirst((ZombRand(10)/100))
	
	Buddy:getModData().Name = nameToSet
	Buddy:getModData().NameRaw = nameToSet
	
	local desc = Buddy:getDescriptor()
	desc:setForename(nameToSet)
	desc:setSurname("")	
	
	return Buddy

end



function SuperSurvivor:setBravePoints(toValue)
	self.player:getModData().BravePoints = toValue
end
function SuperSurvivor:getBravePoints()
	if(self.player:getModData().BravePoints ~= nil) then return self.player:getModData().BravePoints
	else return 0 end
end
function SuperSurvivor:setGroupRole(toValue)
	self.player:getModData().GroupRole = toValue
end
function SuperSurvivor:getGroupRole()
	return self.player:getModData().GroupRole
end
function SuperSurvivor:setNeedAmmo(toValue)
	self.player:getModData().NeedAmmo = toValue
end
function SuperSurvivor:getNeedAmmo()
	if(self.player:getModData().NeedAmmo ~= nil) then
		return self.player:getModData().NeedAmmo
	else
		return false
	end
end
function SuperSurvivor:setAIMode(toValue)
	self.player:getModData().AIMode = toValue
end
function SuperSurvivor:getAIMode()
	return self.player:getModData().AIMode
end
function SuperSurvivor:setGroupID(toValue)
	self.player:getModData().Group = toValue
end
function SuperSurvivor:getGroupID()
	return self.player:getModData().Group
end


function SuperSurvivor:setRunning(toValue)
	if(self.player.setForceOverrideAnim ~= nil) then self.player:setForceOverrideAnim(toValue) end
	local phi = self.player:getPrimaryHandItem()
	if(phi ~= nil) and (instanceof(phi,"HandWeapon") and (phi.getRunAnim ~= nil) ) then self.player:getModData().RunAnim = phi:getRunAnim() 
	else self.player:getModData().RunAnim = nil end
	
	self.player:getModData().Running = toValue
end
function SuperSurvivor:getRunning()
	return self.player:getModData().Running
end

function SuperSurvivor:setSneaking(toValue)
	if(self.player.setForceOverrideAnim ~= nil) then self.player:setForceOverrideAnim(toValue)  end
	self.player:getModData().Sneaking = toValue
end
function SuperSurvivor:getSneaking()
	return self.player:getModData().Sneaking
end

function SuperSurvivor:getGroup()
	local gid = self:getGroupID()
	if(gid ~= nil) then 		
		return SSGM:Get(gid) 
	end
	return nil
end
function SuperSurvivor:Get()
	return self.player
end
function SuperSurvivor:getCurrentTask()
	return self:getTaskManager():getCurrentTask()
end
function SuperSurvivor:isTooScaredToFight()
	
	if(self.EnemiesOnMe >= 2) or (self:HasInjury()) then 
		return true
	else
		local base = 1
		if(self:hasWeapon()) then base = base + 1 end
		if(self:usingGun()) then base = base + 2 end
		base = base + self:getBravePoints() + self:getGroupBraveryBonus()
		--self:Speak(tostring(self.dangerSeenCount)..":"..tostring(base))
		return (self.dangerSeenCount > (base)) 
		
	end
end
function SuperSurvivor:usingGun()
	local handItem = self.player:getPrimaryHandItem()
	if(handItem ~= nil) and (instanceof(handItem,"HandWeapon")) then
		return self.player:getPrimaryHandItem():isAimedFirearm()
	end
	return false
end
function SuperSurvivor:isWalkingPermitted()
	return self.WalkingPermitted
end
function SuperSurvivor:setWalkingPermitted(toValue)
	self.WalkingPermitted = toValue
end

function SuperSurvivor:resetAllTables()

	self.SpokeToRecently = {}
	self.SquareWalkToAttempts = {}
	self.SquaresExplored = {}
	self.SquareContainerSquareLooteds = {}
	for i=1, #LootTypes do self.SquareContainerSquareLooteds[LootTypes[i]] = {} end

end

function SuperSurvivor:resetContainerSquaresLooted()

	for i=1, #LootTypes do self.SquareContainerSquareLooteds[LootTypes[i]] = {} end

end

function SuperSurvivor:resetWalkToAttempts()

	self.SquareWalkToAttempts = {}

end

function SuperSurvivor:BuildingLooted()	
	self.NumberOfBuildingsLooted = self.NumberOfBuildingsLooted + 1
end
function SuperSurvivor:getBuildingsLooted()	
	return self.NumberOfBuildingsLooted
end

function SuperSurvivor:setBaseBuilding(building)	
	self.BaseBuilding = building
end
function SuperSurvivor:getBaseBuilding()	
	return self.BaseBuilding
end

function SuperSurvivor:needToFollow()

	local Task = self:getTaskManager():getTask()
	if(Task ~= nil) then 
		
		if(Task.Name == "Follow" and Task:needToFollow() ) then 
			
			return true 
		
		end
	end
	Task = self:getTaskManager():getThisTask(1)
	if(Task ~= nil) then 
		
		if(Task.Name == "Follow" and Task:needToFollow() ) then 
			
			return true 
		
		end
	end
	
	return false
end

function SuperSurvivor:getNoFoodNearBy()
	if (self.NoFoodNear == true) then
		if (self.TicksAtLastDetectNoFood ~= nil) and ((self.Reducer < self.TicksAtLastDetectNoFood) or ((self.Reducer - self.TicksAtLastDetectNoFood) > 1200)) then self.NoFoodNear = false end
	end
	return self.NoFoodNear
end


function SuperSurvivor:setNoFoodNearBy(toThis)
	if(toThis == true) then
		self.TicksAtLastDetectNoFood = self.Reducer
	end
	self.NoFoodNear = toThis
end

function SuperSurvivor:isHungry()
	return (self.player:getStats():getHunger() > 0.15) 	
end
function SuperSurvivor:isVHungry()
	return (self.player:getStats():getHunger() > 0.40) 	
end
function SuperSurvivor:isStarving()
	return (self.player:getStats():getHunger() > 0.75) 	
end
function SuperSurvivor:isThirsty()
	return (self.player:getStats():getThirst() > 0.15) 	
end
function SuperSurvivor:isVThirsty()
	return (self.player:getStats():getThirst() > 0.40) 	
end
function SuperSurvivor:isDyingOfThirst()
	return (self.player:getStats():getThirst() > 0.75) 	
end
function SuperSurvivor:isDead()
	return (self.player:isDead()) 	
end
function SuperSurvivor:saveFileExists()
	return (checkSaveFileExists("Survivor"..tostring(self:getID())))	
end

function SuperSurvivor:getRelationshipWP()
	if(self.player:getModData().RWP == nil) then return 0
	else return self.player:getModData().RWP end	
end
function SuperSurvivor:PlusRelationshipWP(thisAmount)
	if(self.player:getModData().RWP == nil) then self.player:getModData().RWP = 0 end
	
	self.player:getModData().RWP = self.player:getModData().RWP + thisAmount
	return self.player:getModData().RWP
end

function SuperSurvivor:hasFood()	
	local inv = self.player:getInventory()
	local bag = self:getBag()
	if FindAndReturnFood(inv) ~= nil then return true
	elseif (inv ~= bag) and (FindAndReturnFood(bag) ~= nil) then return true
	else return false end
end

function SuperSurvivor:getFood()	
	local inv = self.player:getInventory()
	local bag = self:getBag()
	if FindAndReturnFood(inv) ~= nil then return FindAndReturnFood(inv)
	elseif (inv ~= bag) and (FindAndReturnFood(bag) ~= nil) then return FindAndReturnFood(bag)
	else return nil end
end

function SuperSurvivor:getWeapon()	
	local inv = self.player:getInventory()
	local bag = self:getBag()
	if inv:FindAndReturnCategory("Weapon") ~= nil then return inv:FindAndReturnCategory("Weapon")
	elseif (inv ~= bag) and (bag:FindAndReturnCategory("Weapon") ~= nil) then return bag:FindAndReturnCategory("Weapon")
	else return nil end
end

function SuperSurvivor:hasWater()	
	local inv = self.player:getInventory()
	local bag = self:getBag()
	if FindAndReturnWater(inv) ~= nil then return true
	elseif (inv ~= bag) and (FindAndReturnWater(bag) ~= nil) then return true
	else return false end
end

function SuperSurvivor:getWater()	
	local inv = self.player:getInventory()
	local bag = self:getBag()
	if FindAndReturnWater(inv) ~= nil then return FindAndReturnWater(inv)
	elseif (inv ~= bag) and (FindAndReturnWater(bag) ~= nil) then return FindAndReturnWater(bag)
	else return nil end
end

function SuperSurvivor:getFacingSquare()	
	local square = self.player:getCurrentSquare()
	local fsquare = square:getTileInDirection(self.player:getDir())
	if(fsquare) then return fsquare 
	else return square end
end

function SuperSurvivor:isTargetBuildingDangerous()

	local result = NumberOfZombiesInOrAroundBuilding(self.TargetBuilding)
	
	if(result >= 10) and (self:isTooScaredToFight()) then return true
	else return false end
end

function SuperSurvivor:MarkBuildingExplored(building)
	if(not building) then return false end
	self:resetBuildingWalkToAttempts(building)
	local bdef = building:getDef()	
	for x=bdef:getX()-1,(bdef:getX() + bdef:getW()+1) do	
		for y=bdef:getY()-1,(bdef:getY() + bdef:getH()+1) do
			
			local sq = getCell():getGridSquare(x,y,self.player:getZ())			
			if(sq) then 
				self:Explore(sq)
			end			
		end							
	end
end

function SuperSurvivor:getBuildingExplored(building)

	local sq = getRandomBuildingSquare(building)		
	if(sq) then 
		if(self:getExplore(sq) > 0) then
			return true
		else 
			return false 
		end
	end			
	
	return false
end

function SuperSurvivor:DebugSay(text)

	if(DebugSayEnabled) then
		self:Speak(text)
	end
end

function SuperSurvivor:isSpeaking()
	if(self.JustSpoke) or (self.player:isSpeaking()) then return true
	else return false end
end

function SuperSurvivor:Speak(text)

	if(SpeakEnabled) then
		
		if(self.player.setVehicle4TestCollision ~= nil) then
			self.SayLine1 = text
			self.JustSpoke = true
			self.TicksSinceSpoke = 0
		else
			self.player:Say(tostring(self:getName())..": "..tostring(text))
		end
	end
end

function SuperSurvivor:MarkAttemptedBuildingExplored(building)
	if(building == nil) then return false end
	local bdef = building:getDef()	
	for x=bdef:getX(),(bdef:getX() + bdef:getW()) do	
		for y=bdef:getY(),(bdef:getY() + bdef:getH()) do
			
			local sq = getCell():getGridSquare(x,y,self.player:getZ())			
			if(sq) then 
				self:setWalkToAttempt(sq,8)
			end			
		end							
	end
end
function SuperSurvivor:resetBuildingWalkToAttempts(building)
	if(building == nil) then return false end
	local bdef = building:getDef()	
	for x=bdef:getX(),(bdef:getX() + bdef:getW()) do	
		for y=bdef:getY(),(bdef:getY() + bdef:getH()) do
			
			local sq = getCell():getGridSquare(x,y,self.player:getZ())			
			if(sq) then 
				self:setWalkToAttempt(sq,0)
			end			
		end							
	end
end

function SuperSurvivor:Explore(sq)
	if(sq) then
		local key = tostring(sq:getX()).. "/" ..tostring(sq:getY())
		if(self.SquaresExplored[key] == nil) then self.SquaresExplored[key] = 1
		else self.SquaresExplored[key] = self.SquaresExplored[key] + 1 end
	end
end
function SuperSurvivor:getExplore(sq)	
	if(sq) then
		local key = tostring(sq:getX()).. "/" ..tostring(sq:getY())
		if(self.SquaresExplored[key] == nil) then return 0
		else return self.SquaresExplored[key] end
	end
	return 0
end

function SuperSurvivor:ContainerSquareLooted(sq,Category)
	if(sq) then
		local key = sq:getX()..sq:getY()
		if(self.SquareContainerSquareLooteds[Category][key] == nil) then self.SquareContainerSquareLooteds[Category][key] = 1
		else self.SquareContainerSquareLooteds[Category][key] = self.SquareContainerSquareLooteds[Category][key] + 1 end
	end
end
function SuperSurvivor:setContainerSquareLooted(sq,toThis,Category)
	if(sq) then
		local key = sq:getX()..sq:getY()
		 self.SquareContainerSquareLooteds[Category][key] = toThis
		
	end
end
function SuperSurvivor:getContainerSquareLooted(sq,Category)	
	if(sq) then
		local key = sq:getX()..sq:getY()
		if(self.SquareContainerSquareLooteds[Category][key] == nil) then return 0
		else return self.SquareContainerSquareLooteds[Category][key] end
	end
	return 0
end

function SuperSurvivor:WalkToAttempt(sq)
	if(sq) then
		local key = sq:getX()..sq:getY()
		if(self.SquareWalkToAttempts[key] == nil) then self.SquareWalkToAttempts[key] = 1
		else self.SquareWalkToAttempts[key] = self.SquareWalkToAttempts[key] + 1 end
	end
end
function SuperSurvivor:setWalkToAttempt(sq,toThis)
	if(sq) then
		local key = sq:getX()..sq:getY()
		 self.SquareWalkToAttempts[key] = toThis
		
	end
end

function SuperSurvivor:setRouteID(routeid)
	self.player:getModData().RouteID = routeid
end
function SuperSurvivor:getRouteID()
	if(self.player:getModData().RouteID == nil) then return 0
	else return self.player:getModData().RouteID end
end

function SuperSurvivor:getWalkToAttempt(sq)	
	if(sq) then
		local key = sq:getX()..sq:getY()
		if(self.SquareWalkToAttempts[key] == nil) then return 0
		else return self.SquareWalkToAttempts[key] end
	end
	return 0
end

function SuperSurvivor:updateTime()
		self:renderName()
	self.Reducer = self.Reducer + 1 
	if(self.TriggerHeldDown) then 
		--self.player:AttemptAttack() 
		self:Attack(self.LastEnemeySeen)
	end
	if(self.Reducer % 30 == 0) then 
		if(self.WaitTicks == 0) then
			return true
		else
			self.WaitTicks = self.WaitTicks - 1
			return false
		end
	else return false end
end

function SuperSurvivor:inUnLootedBuilding()
	
	if(self.player:isOutside()) then return false end
	local sq = self.player:getCurrentSquare()
	if(sq) then
		local room = sq:getRoom()
		if(room) then
			local building = room:getBuilding()
			if(building) and (self:getBuildingExplored(building) == false) then 	
				
				return true 
			else 
				
				return false 
			end
		end
	end
	
	return false
end
function SuperSurvivor:getBuilding()
	if(self.player == nil) then return nil end
	local sq = self.player:getCurrentSquare()
	if(sq) then
		local room = sq:getRoom()
		if(room) then
			local building = room:getBuilding()
			if(building) then return building 
			else return nil end
		end
	end
	
	return nil
end

function SuperSurvivor:isInBuilding(building)
	if(building == self:getBuilding()) then return true
	else return false end
end

function SuperSurvivor:AttemptedLootBuilding(building)
	
	if( not building ) then return false end
		
	local buildingSquareRoom = building:getRandomRoom()
	if not buildingSquareRoom then return false end
	
	local buildingSquare = buildingSquareRoom:getRandomFreeSquare()
	if not buildingSquare then return false end

	if(self:getWalkToAttempt(buildingSquare) == 0) then 
		return false 	
	elseif (self:getWalkToAttempt(buildingSquare) >= 8) then 
		return true 
	else
		return false
	end
	
end

function SuperSurvivor:getUnBarricadedWindow(building)

	local pcs = self.player:getCurrentSquare()
	local WindowOut = nil
	local closestSoFar = 100
	local bdef = building:getDef()	
	for x=bdef:getX()-1,(bdef:getX() + bdef:getW() + 1) do	
		for y=bdef:getY()-1,(bdef:getY() + bdef:getH() + 1) do
			
			local sq = getCell():getGridSquare(x,y,self.player:getZ())			
			if(sq) then 
				local Objs = sq:getObjects();
				for j=0, Objs:size()-1 do
					local Object = Objs:get(j)
					local objectSquare = Object:getSquare()
					local distance = getDistanceBetween(objectSquare,self.player)
					if(instanceof(Object,"IsoWindow"))  and (self:getWalkToAttempt(objectSquare) < 8) and distance < closestSoFar then
						
						 local barricade = Object:getBarricadeForCharacter(self.player)
						 if barricade == nil or (barricade:canAddPlank()) then 
							closestSoFar = distance	
							WindowOut = Object 
						end
					end
				end	
			end
			
		end
							
	end
	return WindowOut
end

function SuperSurvivor:isEnemy(character)

	local group = self:getGroup()
	if(group) then
		return group:isEnemy(self,character)
	else
		-- zombie is enemy to anyone
		if character:isZombie() then return true 
		elseif (self:isInGroup(character)) then return false
		elseif (self.player:getModData().hitByCharacter == true) and (character:getModData().semiHostile == true) then return true 
		elseif (character:getModData().isHostile ~= self.player:getModData().isHostile) then 
			--print(tostring(character:getForname()).."("..tostring(character:getModData().Group)..") is enemy to "..self:getName().."("..tostring(self:getGroupID()))
			return true
		else 
			return false
		end 
	end

end

function SuperSurvivor:hasWeapon()

	if(self.player:getPrimaryHandItem() ~= nil) and (instanceof(self.player:getPrimaryHandItem(),"HandWeapon")) then return self.player:getPrimaryHandItem() 
	else return false end

end

function SuperSurvivor:hasGun()

	if(self.player:getPrimaryHandItem() ~= nil) and (instanceof(self.player:getPrimaryHandItem(),"HandWeapon")) and (self.player:getPrimaryHandItem():isAimedFirearm()) then return true 
	else return false end

end

function SuperSurvivor:getBag()

	if(self.player:getClothingItem_Back() ~= nil) and (instanceof(self.player:getClothingItem_Back(),"InventoryContainer")) then return self.player:getClothingItem_Back():getItemContainer() end
	if(self.player:getSecondaryHandItem() ~= nil) and (instanceof(self.player:getSecondaryHandItem(),"InventoryContainer")) then return self.player:getSecondaryHandItem():getItemContainer() end
	if(self.player:getPrimaryHandItem() ~= nil) and (instanceof(self.player:getPrimaryHandItem(),"InventoryContainer")) then return self.player:getPrimaryHandItem():getItemContainer() end
	
	return self.player:getInventory()
end

function SuperSurvivor:getWeapon()

	if(self.player:getInventory() ~= nil) and (self.player:getInventory():FindAndReturnCategory("Weapon")) then return self.player:getInventory():FindAndReturnCategory("Weapon") end
	if(self.player:getClothingItem_Back() ~= nil) and (instanceof(self.player:getClothingItem_Back(),"InventoryContainer")) and (self.player:getClothingItem_Back():getItemContainer():FindAndReturnCategory("Weapon")) then return self.player:getClothingItem_Back():getItemContainer():FindAndReturnCategory("Weapon") end
	if(self.player:getSecondaryHandItem() ~= nil) and (instanceof(self.player:getSecondaryHandItem(),"InventoryContainer")) and (self.player:getSecondaryHandItem():getItemContainer():FindAndReturnCategory("Weapon")) then return self.player:getSecondaryHandItem():getItemContainer():FindAndReturnCategory("Weapon") end
	
	return nil
end

function SuperSurvivor:hasRoomInBag()

	local playerBag = self:getBag()
	
	if(playerBag:getCapacityWeight() >= (playerBag:getMaxWeight() * 0.9)) then return false
	else return true end
	
end

function SuperSurvivor:hasRoomInBagFor(item)

	local playerBag = self:getBag()
	
	if(playerBag:getCapacityWeight() + item:getWeight() >= (playerBag:getMaxWeight() * 0.9)) then return false
	else return true end
	
end

function SuperSurvivor:getSeenCount()
	return self.seenCount
end
function SuperSurvivor:getDangerSeenCount()
	return self.dangerSeenCount
end

function SuperSurvivor:isInSameRoom(movingObj)
	if not movingObj then return false end
	local objSquare = movingObj:getCurrentSquare()
	if (not objSquare) then return false end
	local selfSquare = self.player:getCurrentSquare()
	if (not selfSquare) then return false end
	if(selfSquare:getRoom() == objSquare:getRoom()) then return true
	else return false end
end

function SuperSurvivor:isInSameBuilding(movingObj)
	if not movingObj then return false end
	local objSquare = movingObj:getCurrentSquare()
	if (not objSquare) then return false end
	local selfSquare = self.player:getCurrentSquare()
	if (not selfSquare) then return false end
	if(selfSquare:getRoom() ~= nil and objSquare:getRoom() ~= nil) then 
		return (selfSquare:getRoom():getBuilding() == objSquare:getRoom():getBuilding())
	end
	if(selfSquare:getRoom() == objSquare:getRoom()) then return true end
	
	return false 
end

function SuperSurvivor:getAttackRange()
			 
	return self.AttackRange 
	
end

function SuperSurvivor:DoVision()

	local atLeastThisClose = 15;
	local spottedList = self.player:getCell():getObjectList()
	local closestSoFar = 200
	local closestSurvivorSoFar = 200
	self.seenCount = 0
	self.dangerSeenCount = 0
	self.EnemiesOnMe = 0
	self.LastEnemeySeen = nil
	self.LastSurvivorSeen = nil
	local dangerRange = 6
	if self.AttackRange > dangerRange then dangerRange = self.AttackRange end
	
	local closestNumber = nil
	local tempdistance = 1
	
	
	if(spottedList ~= nil) then
		for i=0, spottedList:size()-1 do
			local character = spottedList:get(i);
			if(character ~= nil) and (character ~= self.player) and (character:isCharacter() or character:isZombie()) then
			
				if (character:isDead() == false) then
					tempdistance = tonumber(getDistanceBetween(character,self.player))
					
					if( self:isEnemy(character) ) then							
						
						if(tempdistance < 1) and (character:getZ() == self.player:getZ()) then 
							self.EnemiesOnMe = self.EnemiesOnMe + 1 
						end
						if(tempdistance < 10) then 
							self.seenCount = self.seenCount + 1 
						end
						if(tempdistance < dangerRange) and (character:getZ() == self.player:getZ()) then
							if((character:CanSee(self.player)) and (self:isInSameRoom(character))) or (tempdistance <= 1) then 
								self.dangerSeenCount = self.dangerSeenCount + 1 
							end 
						end
						if( (self.player:CanSee(character) or (tempdistance < 0.5)) and (tempdistance < closestSoFar) and (tempdistance <= atLeastThisClose) ) then
							closestSoFar = tempdistance ;
							self.player:getModData().seenZombie = true;
							closestNumber = i;							
						end
						
					elseif (tempdistance < closestSurvivorSoFar) and (self.player:CanSee(character)) then
						closestSurvivorSoFar = tempdistance
						self.LastSurvivorSeen = character						
					end
				end
				
			end
		end
	end
		
	if(closestNumber ~= nil) then 
		self.LastEnemeySeen = spottedList:get(closestNumber)
		
		return self.LastEnemeySeen
	end
	
end

function SuperSurvivor:isInCell()	
	if(self.player == nil) or (self.player:getCurrentSquare() == nil) or (self:isDead()) then return false
	else return true end	
end
function SuperSurvivor:isOnScreen()	
	if(self.player:getCurrentSquare() ~= nil) and (self.player:getCurrentSquare():IsOnScreen()) then return true
	else return false end	
end

function SuperSurvivor:isInAction()
	if(self.player:getModData().bWalking == true) then return true end
	
    local queue = ISTimedActionQueue.queues[self.player]
    if queue == nil then return false end
    for k,v in ipairs(queue.queue) do
        if v then return true end
    end
	return false;
		
end

function SuperSurvivor:isWalking()
	
    local queue = ISTimedActionQueue.queues[self.player]
    if queue == nil then return false end
    for k,v in ipairs(queue.queue) do
        if v then return true end
    end
	return false;
		
end


function SuperSurvivor:walkTo(square)


	if(square == nil) then return false end
	
	--self.player:StopAllActionQueue()

	local parent
	if(instanceof(square,"IsoObject")) then parent = square:getSquare() 
	else parent = square end
	
	self.TargetSquare = square
	if(square:getRoom() ~= nil) and (square:getRoom():getBuilding() ~= nil) then self.TargetBuilding = square:getRoom():getBuilding() end
	
	local adjacent = AdjacentFreeTileFinder.Find(parent, self.player);
	if instanceof(square, "IsoWindow") or instanceof(square, "IsoDoor") then
		adjacent = AdjacentFreeTileFinder.FindWindowOrDoor(parent, square, self.player);
	end
	if adjacent ~= nil then
		self:WalkToAttempt(square)
		self:WalkToPoint(adjacent:getX(),adjacent:getY(),adjacent:getZ())
	end
	
end

function SuperSurvivor:walkTowards(x,y,z)


	
	local towardsSquare = getTowardsSquare(self:Get(),x,y,z)
	if(towardsSquare == nil) then return false end
	
	self:WalkToPoint(towardsSquare:getX(),towardsSquare:getY(),towardsSquare:getZ())
	
	
end

function SuperSurvivor:setHostile(toValue)
	if(toValue) then
		self.userName:setDefaultColors(128,128, 128, 255);
		self.userName:setOutlineColors(180,0, 0,255);
	else		
		self.userName:setDefaultColors(255,255, 255, 255);
		self.userName:setOutlineColors(0,0, 0,255);	
	end
	self.player:getModData().isHostile = toValue
end

function SuperSurvivor:walkToDirect(square)

	if(square == nil) then return false end
	
	self:WalkToAttempt(square)
	self:WalkToPoint(square:getX(),square:getY(),square:getZ())
	
end

 
function SuperSurvivor:WalkToPoint(tx, ty, tz) 

    if(not self.player:getPathFindBehavior2():isTargetLocation(tx,ty,tz)) then
	
        self.player:getModData().bWalking = true
		
        self.player:setPath2(nil);
        self.player:getPathFindBehavior2():pathToLocation(tx,ty,tz);
		
    end
        
  end




function SuperSurvivor:inFrontOfLockedDoor()

	local door = self:inFrontOfDoor()
			
	if (door ~= nil) and (door:isLocked() or door:isLockedByKey())  then
		return true
	else 
		return false
	end
	
end
function SuperSurvivor:inFrontOfDoor()

	 local cs = self.player:getCurrentSquare()
	 local osquare = GetAdjSquare(cs,"N")
	 if cs and osquare and cs:getDoorTo(osquare) then return cs:getDoorTo(osquare) end
	 
	 osquare = GetAdjSquare(cs,"E")
	 if cs and osquare and cs:getDoorTo(osquare) then return cs:getDoorTo(osquare) end
	 
	 osquare = GetAdjSquare(cs,"S")
	 if cs and osquare and cs:getDoorTo(osquare) then return cs:getDoorTo(osquare) end
	 
	 osquare = GetAdjSquare(cs,"W")
	 if cs and osquare and cs:getDoorTo(osquare) then return cs:getDoorTo(osquare) end
	 
	 return nil 
	
end
function SuperSurvivor:inFrontOfWindow()

	 local cs = self.player:getCurrentSquare()
	 local fsquare = cs:getTileInDirection(self.player:getDir());
	 if cs and fsquare then return cs:getWindowTo(fsquare)
	 else return nil end
	
end




function SuperSurvivor:update()
	
	if(self:isDead()) then return false end
	
	self.TriggerHeldDown = false
	if(not SurvivorHunger) then
		self.player:getStats():setThirst(0.0)
		self.player:getStats():setHunger(0.0)	
	else
		self.player:getStats():setThirst(self.player:getStats():getThirst() + 0.00005) -- survivor thirst does not move so manually incremnt it
	end
	
	self.player:getBodyDamage():setWetness(0.0);	
	self.player:getStats():setFatigue(0.0);	
	self.player:getStats():setBoredom(0.0);
	self.player:getStats():setMorale(0.0);
	

	local cs = self.player:getCurrentSquare()
	if(cs ~= nil) then
		if(self.LastSquare == nil) or (self.LastSquare ~= cs) then
			self.TicksSinceSquareChanged = 0
			self.LastSquare = cs
		elseif (self.LastSquare == cs) then
			self.TicksSinceSquareChanged = self.TicksSinceSquareChanged + 1
			--self:Speak(tostring(self.TicksSinceSquareChanged))
		end
	end
	
	--self.player:Say(tostring(self:isInAction()) ..",".. tostring(self.TicksSinceSquareChanged > 6) ..",".. tostring(self:inFrontOfLockedDoor()) ..",".. tostring(self:getTaskManager():getCurrentTask() ~= "Enter New Building") ..",".. tostring(self.TargetBuilding ~= nil))
	--print( self:getName()..": "..tostring((self.TargetBuilding ~= nil)))
	if ((self:inFrontOfLockedDoor())or(self:inFrontOfWindow())) and (self:getTaskManager():getCurrentTask() ~= "Enter New Building") and (self.TargetBuilding ~= nil) and ( ((self.TicksSinceSquareChanged > 6) and (self:isInAction() == false)) or (self:getCurrentTask() == "Pursue") ) then
		self:getTaskManager():AddToTop(AttemptEntryIntoBuildingTask:new(self, self.TargetBuilding))
		self.TicksSinceSquareChanged = 0
	end
	--self.player:Say(tostring(self:isInAction()) ..",".. tostring(self.TicksSinceSquareChanged > 6) ..",".. tostring((self:inFrontOfWindow())))
	
	if (self.TicksSinceSquareChanged > 9) and (self:isInAction() == false) and (self:inFrontOfWindow()) and (self:getCurrentTask() ~= "Enter New Building") then
		self.player:setBlockMovement(false)
		self.player:climbThroughWindow(self:inFrontOfWindow())
		self.player:setBlockMovement(true)
		self.TicksSinceSquareChanged = 0
	end
	
	
	
		
	self:DoVision()
	--self:Speak(tostring(self:isInBase()))
	
	self.MyTaskManager:update()
	if(self.Reducer % 480 == 0) then 
	
		local group = self:getGroup()
		if(group) then group:checkMember(self:getID()) end
		self:SaveSurvivor()
		if(self:Get():getPrimaryHandItem() ~= nil) and (self:Get():getPrimaryHandItem():getDisplayName()=="Corpse") and (self:getCurrentTask() ~= "Pile Corpses") then
			
			ISTimedActionQueue.add(ISDropItemAction:new(self:Get(),self:Get():getPrimaryHandItem(),30))
			self:Get():setPrimaryHandItem(nil)
			self:Get():setSecondaryHandItem(nil)
		end
		if(self:Get():getPrimaryHandItem() == nil) and (self:getWeapon()) then self:Get():setPrimaryHandItem(self:getWeapon()) end
		
		self:ManageXP()
		
	else self:SaveSurvivorOnMap() end

end

function SuperSurvivor:ManageXP()

	local currentLevel
	local currentXP,XPforNextLevel
	local ThePerk
	for i=1, #SurvivorPerks do
		ThePerk = Perks.FromString(SurvivorPerks[i])
		if(ThePerk) then
			
			currentLevel = self.player:getPerkLevel(ThePerk)
			currentXP = self.player:getXp():getXP(ThePerk)
			XPforNextLevel = self.player:getXpForLevel(currentLevel+1)
			if(currentXP >= XPforNextLevel) and (currentLevel < 10) then 
				self.player:LevelPerk(ThePerk)
				local display_perk = PerkFactory.getPerkName(Perks.FromString(SurvivorPerks[i]))
				if( string.match(SurvivorPerks[i], "Blade") ) or ( SurvivorPerks[i] == "Axe" ) then
					display_perk = getText("IGUI_perks_Blade") .. " " .. display_perk
				elseif( string.match(SurvivorPerks[i], "Blunt") ) then
					display_perk = getText("IGUI_perks_Blunt") .. " " .. display_perk
				end
				self:Speak(getText("ContextMenu_SD_PerkLeveledUp_Before")..tostring(display_perk)..getText("ContextMenu_SD_PerkLeveledUp_After"))
			end
			--if(SurvivorPerks[i] == "Aiming") then self.player:Say(tostring(currentXP).."/"..tostring(XPforNextLevel)) end
		end
	end

end

function SuperSurvivor:getTaskManager()
	return self.MyTaskManager	
end

function SuperSurvivor:HasInjury()

	local bodyparts = self.player:getBodyDamage():getBodyParts()
	
	for i=0, bodyparts:size()-1 do

		local bp = bodyparts:get(i)
		if(bp:HasInjury()) and (bp:bandaged() == false) then
			return true
		end
		
	end
	
	return false

end

function SuperSurvivor:getID()

	if(instanceof(self.player,"IsoPlayer")) then return self.player:getModData().ID 
	else return 0 end

end
function SuperSurvivor:setID(id)

	self.player:getModData().ID = id;

end

function SuperSurvivor:delete()

	self.player:getInventory():emptyIt();
	self.player:setPrimaryHandItem(nil);
	self.player:setSecondaryHandItem(nil);
	self.player:getModData().ID = 0;
	local filename = getSaveDir() .. "SurvivorTemp";
	self.player:save(filename);
	self.player:setX(9303);
	self.player:setY(5709);
	self.player:Despawn();
	self.player = nil;
	--self.o = nil;
	--self.TaskManager = nil
	
end

function SuperSurvivor:SaveSurvivorOnMap()

	if self.player:getModData().RealPlayer == true then return false end
	local ID = self.player:getModData().ID;
	
	if (ID ~= nil) then
	
		local x = math.floor(self.player:getX())
		local y = math.floor(self.player:getY())
		local z = math.floor(self.player:getZ())
		local key = x .. y .. z
		if(not SurvivorMap[key]) then SurvivorMap[key] = {} end
		
		if (has_value(SurvivorMap[key],ID) == false) then
			
			local removeFailed = false;
			if(self.player:getModData().LastSquareSaveX ~= nil) then
				local lastkey = self.player:getModData().LastSquareSaveX .. self.player:getModData().LastSquareSaveY .. self.player:getModData().LastSquareSaveZ
				if(lastkey) and ( SurvivorMap[lastkey] ~= nil ) then
					table.remove(SurvivorMap[lastkey] , ID);
				else 
					removeFailed = true;
				end
			end
			
			if(removeFailed == false) then
				--print("saving survivor "..tostring(ID).." to key " .. tostring(key))
				table.insert(SurvivorMap[key], ID);			
				self.player:getModData().LastSquareSaveX = x;
				self.player:getModData().LastSquareSaveY = y;
				self.player:getModData().LastSquareSaveZ = z;
			end
		
		end
	
	end
end

function SuperSurvivor:SaveSurvivor()
	if self.player:getModData().RealPlayer == true then return false end
	local ID = self.player:getModData().ID;
	if(ID ~= nil) then
		--local filename = getWorld():getGameMode() .. "-" .. getWorld():getWorld() .. "-" .. "Survivor"..tostring(ID);
		local filename = getSaveDir() .. "Survivor"..tostring(ID);
		self.player:save(filename);
		--print("saved survivor "..tostring(ID))
		if(self.player ~= nil and self.player:isDead() == false and self.player:getCurrentState() ~= DieState.instance() ) then
			self:SaveSurvivorOnMap()		
		else			
			local group = self:getGroup()
			if(group) then 
				print("remove member "..self:getName().." from group because he died.")
				group:removeMember(self) 
			end
		end
		
	end
end


function SuperSurvivor:FindClosestOutsideSquare(thisBuildingSquare)

	if(thisBuildingSquare == nil) then return nil end 
	
	local bx=thisBuildingSquare:getX()
	local by=thisBuildingSquare:getY()
	local px=self.player:getX()
	local py=self.player:getY()
	local xdiff = AbsoluteValue(bx-px)
	local ydiff = AbsoluteValue(by-py)
	
	if(xdiff > ydiff) then
		if(px > bx) then
			for i=1,20 do
				local sq = getCell():getGridSquare(bx + i, by, 0)
				if(sq:isOutside()) then return sq end
			end
		else
			for i=1,20 do
				local sq = getCell():getGridSquare(bx - i, by, 0)
				if(sq:isOutside()) then return sq end
			end
		end
	else 
		if(py > by) then
			for i=1,20 do
				local sq = getCell():getGridSquare(bx, by + i, 0)
				if(sq:isOutside()) then return sq end
			end
		else
			for i=1,20 do
				local sq = getCell():getGridSquare(bx, by - i, 0)
				if(sq:isOutside()) then return sq end
			end
		end
	end

	return thisBuildingSquare
end



function SuperSurvivor:giveWeapon(weaponType,equipIt )
	
	local weapon = self.player:getInventory():AddItem(weaponType);
	if(weapon == nil) then return false end
	
	if(weapon:isAimedFirearm()) then 
		if(isModEnabled("ORGM")) then ORGM.setupGun(ORGM.getFirearmData(weapon), weapon) end
		self:setGunWep(weapon)
	else self:setMeleWep(weapon) end
	
	
	if(equipIt) then self.player:setPrimaryHandItem(weapon) end
	
	
	local ammotypes = getAmmoBullets(weapon,true);
	if(ammotypes) then 
		
		local bwep = self.player:getInventory():AddItem( MeleWeapons[ZombRand(1,#MeleWeapons)] ) -- give a beackup mele wepaon if using ammo gun
		if(bwep) then 
			self.player:getModData().weaponmele = bwep:getType() 
			self:setMeleWep(bwep)
		end
		
		local ammo = ammotypes[1]
		if(ammo) then
			local tempammoitem = self.player:getInventory():AddItem(ammo);
			if(tempammoitem ~= nil) then
				local groupcount = tempammoitem:getCount() ;
				local randomammo = math.floor(ZombRand(40,100)/groupcount);
				print("giving "..tostring(randomammo).." ".. ammo.. " to s for weapon:"..weapon:getType())
				for i=0, randomammo do
				self.player:getInventory():AddItem(ammo);
				end
			end
		end
		ammotypes = getAmmoBullets(weapon,false);
		self.player:getModData().ammoCount = self:FindAndReturnCount(ammotypes[1])
		
	else
		print("no ammo types for weapon:"..weapon:getType())
	end
end

function SuperSurvivor:FindAndReturn(thisType)

	local item
	item = self.player:getInventory():FindAndReturn(thisType);

	
	if(not item) and (self.player:getSecondaryHandItem() ~= nil) and (self.player:getSecondaryHandItem():getCategory() == "Container") then item = self.player:getSecondaryHandItem():getItemContainer():FindAndReturn(thisType); end
	if(not item) and (self.player:getClothingItem_Back() ~= nil) then item = self.player:getClothingItem_Back():getItemContainer():FindAndReturn(thisType); end
			
	return item
	
end
function SuperSurvivor:FindAndReturnCount(thisType)

	local count = 0
	count = count + self.player:getInventory():getItemsFromType(thisType):size()

	
	if(self.player:getSecondaryHandItem() ~= nil) and (self.player:getSecondaryHandItem():getCategory() == "Container") then count = count + self.player:getSecondaryHandItem():getItemContainer():getItemsFromType(thisType):size() end
	if(self.player:getClothingItem_Back() ~= nil) then count = count + self.player:getClothingItem_Back():getItemContainer():getItemsFromType(thisType):size() end
			
	return count
	
end

function SuperSurvivor:WeaponReady()
	local primary = self.player:getPrimaryHandItem()
	if(primary ~= nil) and (self.player ~= nil) and (instanceof(primary,"HandWeapon")) and (primary:isAimedFirearm()) then
	
		primary:setCondition(primary:getConditionMax())	
			
		if(SurvivorInfiniteAmmo) then 
			primary:getModData().roundChambered = 1 ;
			primary:getModData().currentCapacity = 1 ;
			primary:getModData().isJammed = nil 
		return true end
		
		local ammo, ammoBox, result;
		
		local bulletcount = 0
		for i=1,#self.AmmoTypes do			
			bulletcount = bulletcount + self:FindAndReturnCount(self.AmmoTypes[i])
		end
		
		self.player:getModData().ammoCount = bulletcount
		
		for i=1, #self.AmmoTypes do	
			ammo = self:FindAndReturn(self.AmmoTypes[i])
			if(ammo) then break end
		end
		
		if(not ammo) then
				self.TriggerHeldDown = false
				local index = 0
				for i=1,#self.AmmoBoxTypes do	
					index = i
					ammoBox = self:FindAndReturn(self.AmmoBoxTypes[i])
					if(ammoBox) then break end
				end
				
				if(ammoBox) then 
					
					local ORGMEnabled = false
					if(isModEnabled("ORGM")) then ORGMEnabled = true end
				
					local ammotype = self.AmmoTypes[index]
					inv = self.player:getInventory()
					
					local modl = ammoBox:getModule() .. "."
					
					local tempBullet = instanceItem(modl..ammotype)
					local groupcount = tempBullet:getCount()
					local count = 0
					if ORGMEnabled then 
						print(ammoBox:getType())
						count = ORGM.getAmmoData(ammotype).BoxCount
					else
						count = (getBoxCount(ammoBox:getType()) / groupcount)
					end
										
					--print("box tyoe count was "..tostring(count))
					for i=1, count do
						--print("in loop!")
						inv:AddItem(modl..ammotype)
					end
					self:Speak("**".. getText("ContextMenu_SD_Opens_Before") .. ammoBox:getDisplayName() .. getText("ContextMenu_SD_Opens_After") ..  "*")
					ammoBox:getContainer():Remove(ammoBox)
					ammo = self.player:getInventory():FindAndReturn(ammotype);
				else
					--print("could not find ammo box for "..tostring(boxType))
				end
			
		else
			
		end
		
		if(ammo) then
			
			primary:getModData().roundChambered = 1
			primary:getModData().currentCapacity = 1 ;
			primary:getModData().isJammed = nil 
			self.roundChambered = ammo
			return true
			
		end
		
		return false
		
	end
	
	return true
end


function SuperSurvivor:hasAmmoForPrevGun()
	if(self.AmmoTypes ~= nil) and (#self.AmmoTypes > 0) then 	
		
		local ammoRound
		for i=1,#self.AmmoTypes do		
			ammoRound = self:FindAndReturn(self.AmmoTypes[i])
			if(ammoRound) then break end
		end
		
		if (ammoRound ~= nil) then
			return true
		end
		
		local ammoBox 
		for i=1,#self.AmmoBoxTypes do		
			ammoBox = self:FindAndReturn(self.AmmoBoxTypes[i])
			if(ammoBox) then break end
		end
		
		if (ammoBox ~= nil) then
			return true
		end	
	end
	
	return false
end
function SuperSurvivor:reEquipGun()
	
	if(self.LastGunUsed == nil) then return false end
		
	self.player:setPrimaryHandItem(self.LastGunUsed)
	
	return true
	
end
function SuperSurvivor:reEquipMele()
	
	if(self.LastMeleUsed == nil) then return false end
		
	self.player:setPrimaryHandItem(self.LastMeleUsed)
	
	return true
	
end

function SuperSurvivor:setMeleWep(handWeapon)

	self:Get():getModData().meleWeapon = handWeapon:getType()
	self.LastMeleUsed = handWeapon
	
end

function SuperSurvivor:setGunWep(handWeapon)

	self:Get():getModData().gunWeapon = handWeapon:getType()
	self.LastGunUsed = handWeapon
	
end

function SuperSurvivor:Attack(victim)
	--if(self.player:getCurrentState() == SwipeStatePlayer.instance()) then return false end -- already attacking wait
	
	if not (instanceof(victim,"IsoPlayer") or instanceof(victim,"IsoZombie")) then return false end
	if(self:WeaponReady()) then
		if(instanceof(victim,"IsoPlayer") and IsoPlayer.getCoopPVP() == false) then
			ForcePVPOn = true;
			SurvivorTogglePVP();
		end
		
		StopWalk(self.player)
		self.player:faceThisObject(victim);
		if(self.UsingFullAuto) then self.TriggerHeldDown = true end
		if(self.player ~= nil) then self.player:AttemptAttack() end
	else
		local pwep = self.player:getPrimaryHandItem()
		local pwepContainer = pwep:getContainer()
		if(pwepContainer) then pwepContainer:Remove(pwep) end -- remove temporarily so FindAndReturn("weapon") does not find this ammoless gun
		
		self:Speak(getSpeech("OutOfAmmo"));
		
		for i=1, #self.AmmoBoxTypes do
			self:getTaskManager():AddToTop(FindThisTask:new(self,self.AmmoBoxTypes[i],"Type",1))
		end
		for i=1, #self.AmmoTypes do
			self:getTaskManager():AddToTop(FindThisTask:new(self,self.AmmoTypes[i],"Type",20))
		end	
		self:setNeedAmmo(true)	
	
		local mele = self:FindAndReturn(self.player:getModData().weaponmele);
		if(mele) then self.player:setPrimaryHandItem(mele) 
		else
			local bwep = self.player:getInventory():getBestWeapon();
			if(bwep) and (bwep ~= pwep) then self.player:setPrimaryHandItem(bwep) ;
			else 
				bwep = self:getWeapon()
				if(bwep) then
					self.player:setPrimaryHandItem(bwep) ;
				else
					
					self.player:setPrimaryHandItem(nil) 
					self:getTaskManager():AddToTop(FindThisTask:new(self,"Weapon","Category",1))
				
				end
			end
		end
		
		if(pwepContainer) and (not pwepContainer:contains(pwep)) then pwepContainer:AddItem(pwep) end -- re add the former wepon that we temp removed
		
	end

end

function SuperSurvivor:DrinkFromObject(waterObject)
    local playerObj = self.player
	self:Speak(getText("ContextMenu_SD_Drinking"))
	if not waterObject:getSquare() or not luautils.walkAdj(playerObj, waterObject:getSquare()) then
		return
	end
	local waterAvailable = waterObject:getWaterAmount()
	local waterNeeded = math.min(math.ceil(playerObj:getStats():getThirst() * 10), 10)
	local waterConsumed = math.min(waterNeeded, waterAvailable)
	ISTimedActionQueue.add(ISTakeWaterAction:new(playerObj, nil, waterConsumed, waterObject, (waterConsumed * 10) + 15));
end

function SuperSurvivor:findNearestSheetRopeSquare(down)

	local sq, CloseSquareSoFar;
		local range = 20
		local minx=math.floor(self.player:getX() - range);
		local maxx=math.floor(self.player:getX() + range);
		local miny=math.floor(self.player:getY() - range);
		local maxy=math.floor(self.player:getY() + range);
		local closestSoFar = 999;
		
		for x=minx, maxx do
			for y=miny, maxy do
				sq = getCell():getOrCreateGridSquare(x,y,self.player:getZ());
				if(sq ~= nil) then
					local distance = getDistanceBetween(sq,self.player)
				
					if down and (distance < closestSoFar) and self.player:canClimbDownSheetRope(sq) then
						closestSoFar = distance
						CloseSquareSoFar = sq
					elseif not down and (distance < closestSoFar) and self.player:canClimbSheetRope(sq) then
						closestSoFar = distance
						CloseSquareSoFar = sq
					end
				
				end
			end
		end
		
	return CloseSquareSoFar
end

function SuperSurvivor:isAmmoForMe(itemType)

	if(self.AmmoTypes) and (#self.AmmoTypes > 0) then		
		for i=1, #self.AmmoTypes do		
			if(itemType == self.AmmoTypes[i]) then return true end
		end	
	end
	if(self.AmmoTypesBox) and (#self.AmmoTypesBox > 0) then		
		for i=1, #self.AmmoTypesBox do		
			if(itemType == self.AmmoTypesBox[i]) then return true end
		end	
	end
		
	return false

end

function SuperSurvivor:FindThisNearBy(itemType, TypeOrCategory)
				
	local sq, itemtoReturn;
		local range = 42
		local minx=math.floor(self.player:getX() - range);
		local maxx=math.floor(self.player:getX() + range);
		local miny=math.floor(self.player:getY() - range);
		local maxy=math.floor(self.player:getY() + range);
		local closestSoFar = 999;
		if(self.player:getZ() > 0) or (getCell():getGridSquare(self.player:getX(),self.player:getY(),self.player:getZ() + 1) ~= nil) then
			zhigh = self.player:getZ() + 1
		else
			zhigh = 0
		end
		
		for z=zhigh, 0, -1 do
			for x=minx, maxx do
				for y=miny, maxy do
					sq = getCell():getOrCreateGridSquare(x,y,z);
					if(sq ~= nil) then
						local tempDistance = getDistanceBetween(sq,self.player)
						if (self.player:getZ() ~= z) then tempDistance = tempDistance + 10 end
						local items = sq:getObjects()
						for j=0, items:size()-1 do
							if(items:get(j):getContainer() ~= nil) then
								local container = items:get(j):getContainer()
								
								if(sq:getZ() ~= self.player:getZ()) then tempDistance = tempDistance + 13 end
								
								local FindCatResult
								if(itemType == "Food") then 
									FindCatResult = FindAndReturnBestFood(container)
								else 
									FindCatResult = MyFindAndReturnCategory(container,itemType) 
								end
								
								if(tempDistance<closestSoFar) and ((TypeOrCategory == "Category") and (FindCatResult ~= nil)) or ((TypeOrCategory == "Type") and (container:FindAndReturn(itemType)) ~= nil) then
									
									if (TypeOrCategory == "Category")  then
										itemtoReturn = FindCatResult
									else
										itemtoReturn = container:FindAndReturn(itemType)
									end
									closestSoFar = tempDistance
									
								end	
							elseif(itemType == "Water") and (items:get(j):hasWater()) and (tempDistance<closestSoFar) then
								itemtoReturn = items:get(j)
								closestSoFar = tempDistance
							end
						end	
						
					
						items = sq:getWorldObjects()
						for j=0, items:size()-1 do
							if(items:get(j):getItem()) then
								local item = items:get(j):getItem()
								if (tempDistance < closestSoFar) and 
								(item ~= nil) and 
								((TypeOrCategory == "Category") and (myIsCategory(item,itemType))) or 
								((TypeOrCategory == "Type") and (item:getType() == itemType)) then
									itemtoReturn = item
									closestSoFar = tempDistance
									self.TargetSquare = sq
								end
							end
						end	
					
						
						
					end
					
				end						
			end
		end
		
	if(self.TargetSquare ~= nil and itemtoReturn ~= nil) and (self.TargetSquare:getRoom()) and (self.TargetSquare:getRoom():getBuilding()) then 
		self.TargetBuilding = self.TargetSquare:getRoom():getBuilding() 
		print("target building set")
	end
	return itemtoReturn
			
end

function SuperSurvivor:ensureInInv(item)

	if(self:getBag():contains(item)) then self:getBag():Remove(item) end
	if(item:getWorldItem() ~= nil) then
		item:getWorldItem():removeFromSquare()
		item:setWorldItem(nil)
	end
	if(not self:Get():getInventory():contains(item)) then self:Get():getInventory():AddItem(item) end

	return item
end

------------------armor mod functions-------------------

function SuperSurvivor:getUnEquipedArmors()

	if(GlobalArmor == nil) then return nil end
	local armors = {}
	local inv = self.player:getInventory()
	local items = inv:getItems()
	
	for i=1, items:size()-1 do
		local item = items:get(i)
		if(GlobalArmor) and item ~= nil and GlobalArmor[item:getType()] ~= nil and ArmorisArmorEquipped(getSpecificPlayer(0),item) == false then table.insert(armors,item) end
	end

	return armors
end