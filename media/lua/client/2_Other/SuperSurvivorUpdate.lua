
function WalkToUpdate(player)
        
    if(player:getModData().bWalking) then
		local basespeed = 0.08 
		if(player:getModData().Running == true) then 
			basespeed = 0.12
			if(player.isForceOverrideAnim ~= nil) then
				if(player:isForceOverrideAnim()) then 
					if (ClimbOverFenceState.instance() ~= player:getCurrentState()) then
						local anim = "Run"						
						if(player:getModData().RunAnim) then anim = player:getModData().RunAnim end
						player:PlayAnim(anim) 
					else
						StopWalk(player)
						SSM:Get(player:getModData().ID):Wait(4)
					end
				end
			end
		
		end
		
		local realspeed = basespeed - (player:getSlowFactor() * basespeed)
        player:setMoveSpeed(realspeed);
		
		
        local myBehaviorResult = player:getPathFindBehavior2():update() 
		
      -- if(player:isSpeaking() == false) then player:Say(tostring(myBehaviorResult)) end
        if((myBehaviorResult == BehaviorResult.Failed) or (myBehaviorResult == BehaviorResult.Succeeded)) then   
            StopWalk(player)
        end
   else
	--getSpecificPlayer(0):Say(tostring(SurvivorInfiniteAmmo))
   end
end

function StopWalk(player)

  if(player.setForceOverrideAnim ~= nil) then player:setForceOverrideAnim(false) end
  player:StopAllActionQueue()
  player:setPath2(nil)
  player:getModData().bWalking = false
  player:getModData().Running = false
  
end

RealPlayerInitDone = false
function SuperSurvivorGlobalUpdate(player)

	if(player:getModData().ForceAnim ~= nil) and (player:isForceOverrideAnim()) then
		--print("forcing animation: "..tostring(player:getModData().ForceAnim))
		player:PlayAnim(player:getModData().ForceAnim) 
		return true
	end

	if(player:getModData().GCount == nil) then player:getModData().GCount = 0; 
	else player:getModData().GCount = player:getModData().GCount + 1 ; end
	local LGCount = player:getModData().GCount;
	
	if(LGCount % 600 == 0) then
		player:getModData().hitByCharacter = false
		player:getModData().semiHostile = false	
	end
	
	if(not player:isLocalPlayer()) then

		if(player:getLastSquare() ~= nil ) then
			local cs = player:getCurrentSquare()
			local ls = player:getLastSquare()
			local tempdoor = ls:getDoorTo(cs);
			if(tempdoor ~= nil and tempdoor:IsOpen() ) then
				 tempdoor:ToggleDoor(player);
				
			end		
		end
		
		WalkToUpdate(player)
		
	elseif(RealPlayerInitDone == false) then
	
		RealPlayerInitDone = true
		
		print("pre load count is "..tostring(SSGM:getCount()))
		SSGM:Load()
		print("post load count is "..tostring(SSGM:getCount()))
			
		if(player:getModData().FirstInit == nil) then -- create a group put player in it, set building spawned in as base for that group
			MyGroup = SSGM:newGroup()
			MyGroup:addMember(SSM:Get(0),"Leader")
			
			HillTopGroup:AllSpokeTo()
			BlockadeGroup:AllSpokeTo()
			--HillTopGroup:addMember(SSM:Get(0),"Leader")
			
			local spawnBuilding = SSM:Get(0):getBuilding()
			if(spawnBuilding) then -- spawn building is default group base
				print("set building "..tostring(MyGroup:getID()))
				local def = spawnBuilding:getDef()
				local bounds = {def:getX(),(def:getX() + def:getW()), def:getY(),(def:getY() + def:getH()),0}
				MyGroup:setBounds(bounds)
			else
				print("did not spawn in building")
			end
			player:getModData().FirstInit = true
		end
			local wife
			if(player:getModData().WifeID == nil) and (SuperSurvivorGetOptionValue("WifeSpawn") == true) then					
					
				player:getModData().WifeID = 0;
				if(player:isFemale()) then	
					isFemale = false;
				else
					isFemale = true;
				end
				
				wife = SSM:spawnSurvivor(isFemale, player:getCurrentSquare());
				
				local MData = wife:Get():getModData();
				if(player:isFemale()) then	
					wife:setName(getText("ContextMenu_SD_Husband"));
				else
					wife:setName(getText("ContextMenu_SD_Wife"));
				end
				
				wife:Get():getModData().InitGreeting = getSpeech("WifeIntro");
				wife:Get():getModData().seenZombie = true;
				MData.MetPlayer = true;
				MData.isHostile = false;
											
				local GID, Group
				if(SSM:Get(0):getGroupID() == nil) then
					print("SSGM:newGroup() "..tostring(SSGM:getCount()))
					Group = SSGM:newGroup()
					GID = Group:getID()					
					Group:addMember(SSM:Get(0),"Leader")
					print("POST SSGM:newGroup() "..tostring(SSGM:getCount()))
				else
					GID = SSM:Get(0):getGroupID()
					print("main player has group id detected:"..tostring(GID))
					Group = SSGM:Get(GID)
				end
				
				Group:addMember(wife,"Worker")
				
				local followtask = FollowTask:new(wife,getSpecificPlayer(0))
				local tm = wife:getTaskManager()
				wife:setAIMode("Follow")
				tm:AddToTop(followtask)
				
				if(ZombRand(100) < (ChanceToSpawnWithGun)) then 
					wife:giveWeapon(getWeapon(RangeWeapons[ZombRand(1,#RangeWeapons)]),true) 				
				elseif(ZombRand(100) < (ChanceToSpawnWithWep)) then 
					wife:giveWeapon(MeleWeapons[ZombRand(1,#MeleWeapons)],true) 
				end
				
				
			end
			
			if(player:getModData().LockNLoad == nil) and (SuperSurvivorGetOptionValue("LockNLoad") == true) then
				
				
				if(isModEnabled("ArmorMod")) then
					EquipAnyArmor(player:getInventory():AddItem("Armor.ArmorArmarmorswat"),player);
					EquipAnyArmor(player:getInventory():AddItem("Armor.ArmorArmorswat"),player);
					EquipAnyArmor(player:getInventory():AddItem("Armor.ArmorHelmswat"),player);
					EquipAnyArmor(player:getInventory():AddItem("Armor.ArmorLegarmorswat"),player);
					--EquipAnyArmor(player:getInventory():AddItem("Armor.ArmorBootriot"),player);
					EquipAnyArmor(player:getInventory():AddItem("Armor.ArmorGloveriot"),player);
					EquipAnyArmor(player:getInventory():AddItem("Armor.ArmorShieldriot"),player);
					if(wife) then
					EquipAnyArmor(wife:Get():getInventory():AddItem("Armor.ArmorArmarmorswat"),wife:Get());
					EquipAnyArmor(wife:Get():getInventory():AddItem("Armor.ArmorArmorswat"),wife:Get());
					EquipAnyArmor(wife:Get():getInventory():AddItem("Armor.ArmorHelmswat"),wife:Get());
					EquipAnyArmor(wife:Get():getInventory():AddItem("Armor.ArmorLegarmorswat"),wife:Get());
					--EquipAnyArmor(wife:Get():getInventory():AddItem("Armor.ArmorBootriot"),wife:Get());
					EquipAnyArmor(wife:Get():getInventory():AddItem("Armor.ArmorGloveriot"),wife:Get());
					EquipAnyArmor(wife:Get():getInventory():AddItem("Armor.ArmorShieldriot"),wife:Get());
					end
				end
				if(isModEnabled("ORGM")) then
					local gun = player:getInventory():AddItem("ORGM.Mac11")
					ORGM.setupGun(ORGM.getFirearmData(gun), gun)
					player:setPrimaryHandItem(gun);
					
					local ammoType = "Ammo_380ACP_FMJ"
					for i=1, 5 do
						local mag = player:getInventory():AddItem("ORGM.Mac11Mag");
						ORGM.setupMagazine(ORGM.getMagazineData(mag), mag)
						local data = mag:getModData() 
						data.currentCapacity = data.maxCapacity 
						for i=1, data.maxCapacity do 
							data.magazineData[i] = ammoType 
						end 
						data.loadedAmmo = ammoType
					end
						
					player:getInventory():AddItem("ORGM.Ammo_380ACP_FMJ_Can");
					
					
					if(wife) then
					
						local gun = wife:Get():getInventory():AddItem("ORGM.Mac11")
						ORGM.setupGun(ORGM.getFirearmData(gun), gun)
						wife:Get():setPrimaryHandItem(gun);
						
						local ammoType = "Ammo_380ACP_FMJ"
						for i=1, 100 do
							wife:Get():getInventory():AddItem("ORGM."..ammoType);
						end
						
					end
					
				else
					
					player:getInventory():AddItem("Base.Pistol");
					player:getInventory():AddItem("Base.BulletsBox");
					player:getInventory():AddItem("Base.BulletsBox");
					player:getInventory():AddItem("Base.BulletsBox");
					player:getInventory():AddItem("Base.BulletsBox");
					
					if(wife) and (wife:hasGun() == false) then
						wife:giveWeapon("Base.Pistol")
						for i=1, 12 do
							wife:Get():getInventory():AddItem("Base.Bullets9mm");
						end					
					end
					
				end
				
				for i=1, 8 do player:LevelPerk(Perks.FromString("Aiming")) end
				for i=1, 8 do player:LevelPerk(Perks.FromString("Reloading")) end
				
				if(wife) then 
					for i=1, 8 do wife:Get():LevelPerk(Perks.FromString("Aiming")) end
				end
				
				player:getModData().LockNLoad = true
				
			end						
			
			local mydesc = getSpecificPlayer(0):getDescriptor()
			if(SSM:Get(0)) then SSM:Get(0):setName(mydesc:getForename()) end
	
	end
	
end

function getCoverValue(obj)
	if (tostring(obj:getType()) == "wall") then return 0 -- walls behind player are blocking if on samve sqare
	elseif (obj:getObjectName() == "Tree") then return 25
	elseif (obj:getObjectName() == "Window") then return 70
	elseif (obj:getObjectName() == "Door") then return 80
	elseif (obj:getObjectName() == "Counter") then return 80
	elseif (obj:getObjectName() == "IsoObject") then return 10 -- drastically lowered because small stuff like garbage was blocking shots
	else return 0 end
end

function getGunShotWoundBP(player)

	local BD = player:getBodyDamage()
	local bps = BD:getBodyParts() ;
	local foundBP = false
	local list = {};
	if(bps) then
		for i=1, bps:size()-1 do		
			if(bps:get(i) ~= nil) and ( bps:get(i):haveBullet() ) and ( bps:get(i):getHealth() > 0)  then
				table.insert(list,i);
				foundBP = true
			end
		end
	end
	if(not foundBP) then return nil end
	local result = ZombRand(1,#list)
	local index = list[result]
	local outBP = bps:get(index)
	return outBP
end


function SuperSurvivorPVPHandle(wielder, victim, weapon, damage)

	local SSW = SSM:Get(wielder:getModData().ID)
	local SSV = SSM:Get(victim:getModData().ID)
	local fakehit = false
	
	if(victim.setAvoidDamage ~= nil) then
		if(SSW:isInGroup(victim)) then  
			--victim:Say("cant touch this!")
			fakehit = true
			victim:setAvoidDamage(true)		
		end
	elseif(victim.setNoDamage ~= nil) then
		if(SSW:isInGroup(victim)) then 
			--victim:Say("cant touch this!")
			fakehit = true
			victim:setNoDamage(true)
		else
			victim:setNoDamage(false)
		end
	end
	if fakehit then return false end
	

	--- obj cover calculations
	if(instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) and (instanceof(victim,"IsoPlayer")) then
		
		local angle = wielder:getAngle()
		local dir = IsoDirections.fromAngle(angle)
		dir = IsoDirections.reverse(dir)
		
		local victimSquare1 = victim:getCurrentSquare()
		local victimSquare2 = victimSquare1:getTileInDirection(dir)
		local coveredFire = false
		for q=1,2 do
			
			local objs
			if q == 1 then objs = victimSquare2:getObjects()
			else objs = victimSquare1:getObjects() end
			
			local aimingPerk = wielder:getPerkLevel(Perks.Aiming) 
			local hitChanceBonus = 0
			if wielder:HasTrait("Marksman") then hitChanceBonus = hitChanceBonus + 10 end
			if(objs) then
				for i=1, objs:size()-1 do
					if(objs:get(i)) then 
						local obj = objs:get(i)
						local chance = getCoverValue(obj) - (aimingPerk*3) - hitChanceBonus
						if ZombRand(100) < chance then
							coveredFire = true
							break
						end
					end
				end
			end
			if(coveredFire) then break end
		end
		
		
		
		if coveredFire then 
			SSV:Speak("!!") 
			if(victim.setAvoidDamage ~= nil) then victim:setAvoidDamage(true) end
			return false 	
		
		end
	end
	
	--- obj cover calculations	END
	
		-- add extra damage, bc bullet damage so low
		
			--if(LastGuyHit == nil) or (victim ~= LastGuyHit) then
			--	LastGuyHitCount = 1
			--	LastGuyHit = victim
			--elseif(victim ~= getSpecificPlayer(0)) then
			--	LastGuyHitCount = LastGuyHitCount + 1
			--end
			--if(victim ~= getSpecificPlayer(0)) then wielder:Say(tostring(LastGuyHitCount)) end
	
		--	local extraDamage = ZombRand(150,250);
			local shotPartshotPart = getGunShotWoundBP(victim)
			if(shotPartshotPart) then
				--if( shotPartshotPart:getType() == "Head") then extraDamage = 40 
				--elseif( shotPartshotPart:getType() == "Neck") then extraDamage = 30
				--elseif( shotPartshotPart:getType() == "Torso_Lower") then extraDamage = 30
				--elseif( shotPartshotPart:getType() == "Torso_Upper") then extraDamage = 35
				--end
				extraDamage = (damage*12)
				--print("added " .. tostring(extraDamage) .. " damage to gun shot wound on " .. tostring(shotPartshotPart:getType()) .. " to player number " .. tostring(victim:getModData().ID))
				--print("pre getHealth is " .. tostring(shotPartshotPart:getHealth()))
				--print("pre getHealth is " .. tostring(victim:getBodyDamage():getHealth()))
				
				shotPartshotPart:AddDamage(extraDamage);
				--victim:getBodyDamage():DamageFromWeapon(weapon);
				victim:update();
				
				--print("post getHealth is " .. tostring(shotPartshotPart:getHealth()) ) 
				--print("post getHealth is " .. tostring(victim:getBodyDamage():getHealth()) ) 
				
			end
	
	
	if instanceof(victim, "IsoPlayer") then	
		local GroupID = SSV:getGroupID()
		if(GroupID ~= nil) then
			local group = SSGM:Get(GroupID)
			if(group) then
				group:PVPAlert(wielder)
			end
		else
			victim:getModData().hitByCharacter = true
		end
	end
	if(instanceof(victim, "IsoPlayer") and victim:getModData().isHostile ~= true ) then		
		wielder:getModData().semiHostile = true		
	end
	
end
Events.OnWeaponHitCharacter.Add(SuperSurvivorPVPHandle);
Events.OnPlayerUpdate.Add(SuperSurvivorGlobalUpdate);