require "SuperSurvivorGroup"

SuperSurvivorGroupManager = {}
SuperSurvivorGroupManager.__index = SuperSurvivorGroupManager

function SuperSurvivorGroupManager:new()

	local o = {}
	setmetatable(o, self)
	self.__index = self
	
	o.Groups = {}
	o.GroupCount = 0
	
	return o

end

function SuperSurvivorGroupManager:Get(thisID)

	return self.Groups[thisID]

end

function SuperSurvivorGroupManager:GetGroupIdFromSquare(square)

	for i=0, self.GroupCount do		
		if (self.Groups[i]) and (self.Groups[i]:IsInBounds(square)) then return self.Groups[i]:getID() end
	end
	return -1
end

function SuperSurvivorGroupManager:getCount()
	return self.GroupCount
end

function SuperSurvivorGroupManager:newGroup()

	self.Groups[self.GroupCount] = SuperSurvivorGroup:new(self.GroupCount)
	self.GroupCount = self.GroupCount + 1
	return self.Groups[self.GroupCount-1]
	
end

function SuperSurvivorGroupManager:Save()
--print("saving groups:")
	for i=0, self.GroupCount do
		if(self.Groups[i]) then 
			--print("saving group #"..tostring(i))
			self.Groups[i]:Save() 
		end
	end
--print("DOne saving groups")
end
function SuperSurvivorGroupManager:Print()
	print("printing groups, groupcount:"..tostring(self.GroupCount))
	for i=0, self.GroupCount do
		if(self.Groups[i]) then self.Groups[i]:Print() end
	end

end
function SuperSurvivorGroupManager:Load()
	if(doesFileExist("SurvivorGroup0.lua")) then -- only load if any groups detected at all
		self.GroupCount = 0
		print("loading groups")
		while doesFileExist("SurvivorGroup"..tostring(self.GroupCount)..".lua") do
			print("loading group#" .. tostring(self.GroupCount))
			local newGroup = self:newGroup()
			newGroup:Load()
		end
	end

end


SSGM = SuperSurvivorGroupManager:new()

HillTopGroup = SSGM:newGroup()  -- 0
HillTopGroupID = HillTopGroup:getID()

HillTopGroup:setBounds({11707,11753,7917,7967,0})
HillTopGroup:setGroupArea("ForageArea",11686,11706,7912,7967,0)
HillTopGroup:setGroupArea("CorpseStorageArea",11691,11691,7936,7936,0)
HillTopGroup:setGroupArea("FoodStorageArea",11715,11715,7926,7926,0)
HillTopGroup:setGroupArea("GuardArea",11707,11711,7938,7946,0)
HillTopGroup:setGroupArea("ChopTreeArea",11679,11700,7951,7973,0)

BlockadeGroup = SSGM:newGroup()  -- 1
BlockadeGroupID = BlockadeGroup:getID()
WoodburyGroup = SSGM:newGroup()  -- 2 
WoodburyGroupID = WoodburyGroup:getID()
LoslokosGroup = SSGM:newGroup()  -- 3
LoslokosGroupID = LoslokosGroup:getID()
Gang1Group = SSGM:newGroup()  -- 4
Gang1GroupID = Gang1Group:getID()
Gang2Group = SSGM:newGroup()  -- 5
Gang2GroupID = Gang2Group:getID()






