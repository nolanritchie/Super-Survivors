function isModEnabled(modname)

	local actmods = getActivatedMods();
	for i=0, actmods:size()-1, 1 do
		if actmods:get(i) == modname then
			return true;
		end
	end
	return false;
end


function getWeapon(kind)

	if(isModEnabled("ORGM")) then
		if kind == "Base.Shotgun" then return "ORGM.Rem870" end
		if kind == "Base.HuntingRifle" then return "ORGM.Garand" end
		if kind == "Base.VarmintRifle" then return "ORGM.AR15" end
		if kind == "Base.Pistol" then return "ORGM.Ber92" end
		return kind;
	end
	return kind;
end

PresetSpawns = {};
-- set ChanceToSpawn from 1 to 100, nil assumes 100

 --WESTPOINT BEGIN
PresetSpawns[#PresetSpawns+1] = { Name = "Prison Guard", X = 11899, Y = 6937, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {Greeting = "YOU WANT SOME?! I\'LL TAKE YOU ALL DOWN!", Name = "Prison Guard", X = 11900, Y = 6937, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {ChanceToSpawn=75,  Name = "Prison Guard", X = 11901, Y = 6937, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = true};

PresetSpawns[#PresetSpawns+1] = { Name = "Gun Shop Owner", X = 12066, Y = 6759, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=0,PY=3};
PresetSpawns[#PresetSpawns+1] = { Name = "Gun Shop Owner", X = 12067, Y = 6759, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=0,PY=3};
PresetSpawns[#PresetSpawns+1] = {Greeting = "YOU BETTER GET OUTTA HERE!", Name = "Gun Shop Owner", X = 12068, Y = 6759, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=0,PY=3};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Pastor Bob was right, all us sinners are having to pay!", Name = "Giga Shop Owner", X = 12033, Y = 6849, Z = 1 , Weapon = "Base.Screwdriver", Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Great to see a friendly face. Take what you need", Name = "Giga Shop Owner", X = 12033, Y = 6850, Z = 1 , Weapon = "Base.Screwdriver", Orders = "Standing Ground", isHostile = false};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Thought you were Bob. Hope he is ok. Anyways, make yourself at home and I\'ll pour you a stiff one. Ya probably need it", Name = "Twiggys Shop Owner", X = 12063, Y = 6798, Z = 0 , Weapon = "Base.Hammer", Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Its like the end of the world out there! That military blockade made matters worse, kept the infected in town. Bastards!", Name = "Twiggys Shop Owner", X = 12062, Y = 6797, Z = 0 , Weapon = "Base.Hammer", Orders = "Standing Ground", isHostile = false};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Bonjour! Rooms are now free. Do you have somewhere better to stay?", Name = "Hotel Manager", X = 12009, Y = 6919, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = false}; 

PresetSpawns[#PresetSpawns+1] = { Name = "Thug", X = 12310, Y = 6729, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=0,PY=-5};
PresetSpawns[#PresetSpawns+1] = { Name = "Thug", X = 12313, Y = 6729, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=0,PY=-5};
PresetSpawns[#PresetSpawns+1] = { Name = "Thug", X = 12316, Y = 6729, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=0,PY=-5};

PresetSpawns[#PresetSpawns+1] = { Name = "Principal", X = 11327, Y = 6765, Z = 1 , Weapon = "Base.Plank", Orders = "Patrol", isHostile = false, Patrolling=true, PX=2,PY=0};

PresetSpawns[#PresetSpawns+1] = { Name = "A Savior", X = 12132, Y = 7085, Z = 1 , Weapon = getWeapon("Base.Pistol"), Orders = "Explore", isHostile = true, Patrolling=true, PX=10,PY=10};
PresetSpawns[#PresetSpawns+1] = { Name = "A Savior", X = 12133, Y = 7084, Z = 1 , Weapon = getWeapon("Base.Pistol"), Orders = "Explore", isHostile = true, Patrolling=true, PX=20,PY=0};
PresetSpawns[#PresetSpawns+1] = { Name = "A Savior", X = 12130, Y = 7083, Z = 1 , Weapon = getWeapon("Base.Pistol"), Orders = "Explore", isHostile = true, Patrolling=true, PX=-3,PY=15};
PresetSpawns[#PresetSpawns+1] = {Greeting = 'So now I\'m going to beat the HOLY FUCK FUCKING FUCKEDY FUCK out of you with my bat. Who I call \"Lucille\"',PerkName = "Blunt",PerkLevel = 10,isFemale = false,  Name = "Negan", X = 12131, Y = 7084, Z = 1 , Weapon = "Base.BaseballBat", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = { Name = "A Savior", X = 12138, Y = 7098, Z = 1 , Weapon = getWeapon("Base.Pistol"), Orders = "Explore", isHostile = true, Patrolling=true, PX=10,PY=10};
PresetSpawns[#PresetSpawns+1] = { Name = "A Savior", X = 12146, Y = 7098, Z = 1 , Weapon = getWeapon("Base.Pistol"), Orders = "Explore", isHostile = true, Patrolling=true, PX=20,PY=0};
PresetSpawns[#PresetSpawns+1] = { Name = "A Savior", X = 12134, Y = 7099, Z = 1 , Weapon = getWeapon("Base.Pistol"), Orders = "Explore", isHostile = true, Patrolling=true, PX=-3,PY=15};

PresetSpawns[#PresetSpawns+1] = {PerkName = "Aiming",PerkLevel = 4,Greeting = "Hey Milton, fellow survivors are here!  Perhaps they can save us from The Governor!",isFemale = true,  Name = "Andrea ", X = 12064, Y = 6922, Z = 0 , Weapon = "Base.Shovel", Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Okay Andrea. There\'s no such thing as a free lunch... but it might be our only option! LETS GET OUT OF HERE!",isFemale = false,  Name = "Milton", X = 12064, Y = 6924, Z = 0 , Weapon = "Base.Shovel", Orders = "Standing Ground", isHostile = false};

PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID, Greeting = 'Get Back!', Name = "Woodbury Guard", X = 12056, Y = 6931, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = true, Patrolling=true, PX=10,PY=10};
PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID, Greeting = 'Halt', Name = "Woodbury Guard", X = 12057, Y = 6936, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = true, Patrolling=true, PX=20,PY=0};
PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID, Greeting = 'Get Back!', Name = "Woodbury Guard", X = 12057, Y = 6941, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = true, Patrolling=true, PX=-3,PY=15};
PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID, Greeting = 'No one can leave!', Name = "Woodbury Guard", X = 12056, Y = 6946, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID, Greeting = 'Get Back!', Name = "Woodbury Guard", X = 12093, Y = 6934, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = true, Patrolling=true, PX=-3,PY=15};
PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID, Greeting = 'Stop right there!', Name = "Woodbury Guard", X = 12093, Y = 6938, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = true};

PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID, Greeting = "In this life now you kill or you die. Or you die and you kill",PerkName = "Aiming",PerkLevel = 5,isFemale = false,  Name = "The Governor", X = 12096, Y = 6939, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true};

PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID,  Name = "Woodbury Citizen", X = 12070, Y = 6939, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-10};
PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID,  Name = "Woodbury Citizen", X = 12075, Y = 6939, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-10};
PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID,  Name = "Woodbury Citizen", X = 12080, Y = 6939, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-10};
PresetSpawns[#PresetSpawns+1] = {GroupID = WoodburyGroupID,  Name = "Woodbury Citizen", X = 12085, Y = 6939, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-10};

PresetSpawns[#PresetSpawns+1] = {X = 12086, Y = 6919, Z = 0 , itemType="RandomCannedFood", count = 30, isItemSpawn = true,GroupID=WoodburyGroupID}
PresetSpawns[#PresetSpawns+1] = {GroupID=WoodburyGroupID,Greeting = "Best be on your way now", InitGreeting=getText("ContextMenu_speech_DoNotTouchFood"), PerkName = "Aiming",PerkLevel = 2, NoParty = true,  Name = "Food Guard", X = 12086, Y = 6916, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false};


PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true, Greeting = "We saw this coming a long time ago, and set up this community",InitGreeting=getText("ContextMenu_speech_HilltopIntro"), Name = "Hilltop Governor", X = 11729, Y = 7935, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false, AIMode = "",Role="Leader"}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, PerkName = "Aiming",PerkLevel = 2, NoParty = true,  Name = "Hilltop Guard", X = 11708, Y = 7938, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, PerkName = "Aiming",PerkLevel = 2, NoParty = true,  Name = "Hilltop Guard", X = 11711, Y = 7941, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Role = "Guard", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, PerkName = "Aiming",PerkLevel = 2, NoParty = true,  Name = "Hilltop Guard", X = 11711, Y = 7944, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, PerkName = "Aiming",PerkLevel = 2, NoParty = true,  Name = "Hilltop Guard", X = 11708, Y = 7946, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Role = "Guard", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Citizen", X = 11722, Y = 7924, Z = 0 , Weapon = "Base.Axe", Role = "Worker", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Citizen", X = 11735, Y = 7922, Z = 0 , Weapon = "Base.Axe", Role = "Worker", isHostile = false, AIMode = ""};
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Citizen", X = 11715, Y = 7928, Z = 0 , Weapon = "Base.HuntingKnife", Role = "Worker", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Citizen", X = 11735, Y = 7952, Z = 0 , Weapon = "Base.HuntingKnife", Role = "Worker", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Citizen", X = 11730, Y = 7942, Z = 0 , Weapon = "Base.Axe", Role = "Worker", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Citizen", X = 11726, Y = 7939, Z = 0 , Weapon = "Base.Axe", Role = "Worker", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Citizen", X = 11737, Y = 7942, Z = 0 , Weapon = "Base.Axe", Role = "Worker", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Citizen", X = 11741, Y = 7936, Z = 0 , Weapon = "Base.Axe",Role = "Worker", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Scout", InitGreeting=getText("ContextMenu_speech_FollowMeToHilltop"), X = 10839, Y = 9536, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "FollowRoute", RouteID="MuldToHilltop", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Scout", InitGreeting=getText("ContextMenu_speech_FollowMeToHilltop"), X = 11484, Y = 7050, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "FollowRoute", RouteID="WPToHilltop", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true,  Name = "Hilltop Guard", X = 11711, Y = 7943, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID = HillTopGroupID, NoParty = true, Greeting = "If you need some medical treatment, stop by anytime.", Role="Doctor",Name = getText("ContextMenu_SD_DoctorPrefix_Before").."Hilltop"..getText("ContextMenu_SD_DoctorPrefix_After"), X = 11722, Y = 7942, Z = 0 , PerkName="Doctor",PerkLevel=3, Weapon = getWeapon("Base.HuntingKnife"), Orders = "Doctor", isHostile = false, AIMode = ""}
PresetSpawns[#PresetSpawns+1] = {GroupID=HillTopGroupID,Greeting = "Best be on your way now", InitGreeting=getText("ContextMenu_speech_DoNotTouchFood"), PerkName = "Aiming",PerkLevel = 2, NoParty = true,  Name = "Food Guard", X = 11715, Y = 7929, Z = 0  , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false, AIMode = ""}

PresetSpawns[#PresetSpawns+1] = {GroupID=Gang1GroupID, Name = "Gang Member", X = 11373, Y = 7034, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=Gang1GroupID,  Name = "Gang Member", X = 11370, Y = 7036, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=Gang1GroupID,  Name = "Gang Member", X = 11374, Y = 7027, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=Gang1GroupID,  Name = "Gang Member", X = 11364, Y = 7024, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=Gang1GroupID,  Name = "Gang Member", X = 11365, Y = 7032, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=Gang1GroupID,Greeting = "Look man, it\'s nothing personal!", Name = "Gang Leader", X = 11367, Y = 7024, Z = 0 , Weapon = "Base.Sledgehammer", Orders = "Guard", isHostile = true};

BaseX = 12178
BaseY = 7201  -- traveling bandit group
PresetSpawns[#PresetSpawns+1] = {RouteID="TrainTracksToValleyStation", GroupID=Gang2GroupID, Name = "Bandit", X = BaseX, Y = BaseY, Z = 0 , Weapon = "Base.Shotgun", Orders = "FollowRoute", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {RouteID="TrainTracksToValleyStation",GroupID=Gang2GroupID,  Name = "Bandit", X = BaseX, Y = BaseY+1, Z = 0 , Weapon = "Base.Shotgun", Orders = "FollowRoute", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {RouteID="TrainTracksToValleyStation",GroupID=Gang2GroupID,  Name = "Bandit", X = BaseX+1, Y = BaseY, Z = 0 , Weapon = "Base.Pistol", Orders = "FollowRoute", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {RouteID="TrainTracksToValleyStation",GroupID=Gang2GroupID,  Name = "Bandit", X = BaseX+1, Y = BaseY+1, Z = 0 , Weapon = "Base.Shotgun", Orders = "FollowRoute", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {RouteID="TrainTracksToValleyStation",GroupID=Gang2GroupID,  Name = "Bandit", X = BaseX, Y = BaseY-1, Z = 0 , Weapon = "Base.Shotgun", Orders = "FollowRoute", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {RouteID="TrainTracksToValleyStation",GroupID=Gang2GroupID, Greeting = "Look! There is someone! Get Him!", Name = "Bandits Leader", X = BaseX-1, Y = BaseY, Z = 0 , Weapon = "Base.Pistol", Orders = "FollowRoute", isHostile = true};


PresetSpawns[#PresetSpawns+1] = {Greeting = "How did you get past the traps? You\'ll be sorry for trespassing around here!",PerkName = "Aiming",PerkLevel = 5, Name = "Hunter", X = 11827, Y = 6574, Z = 0 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Standing Ground", isHostile = true};

PresetSpawns[#PresetSpawns+1] = {GroupID=LoslokosGroupID, Name = "Loslokos Gang Member", X = 11660, Y = 7039, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=LoslokosGroupID,  Name = "Loslokos Gang Member", X = 11660, Y = 7041, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=LoslokosGroupID,  Name = "Loslokos Gang Member", X = 11660, Y = 7040, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=LoslokosGroupID,  Name = "Loslokos Gang Member", X = 11659, Y = 7039, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=LoslokosGroupID,  Name = "Loslokos Gang Member", X = 11659, Y = 7041, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {GroupID=LoslokosGroupID, Greeting = "Amigo. We will be taking all your stuff. Gracias", Name = "Loslokos Gang Leader", X = 11659, Y = 7040, Z = 0 , Weapon = "Base.Sledgehammer", Orders = "Guard", isHostile = true};

PresetSpawns[#PresetSpawns+1] = {Greeting = "GET OUT OF HERE ASSHOLES!!", Name = "Gas Station Owner", X = 12070, Y = 7140, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Shit, she is not anwering her phone...",PerkName = "Blunt",PerkLevel = 5, Name = "Mechanic", X = 11894, Y = 6804, Z = 0 , Weapon = "Base.Screwdriver", Orders = "Patrol", isHostile = false, Patrolling=true, PX=10,PY=0};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Take what you need. Just dont kill me!", Name = "Pharmacist", X = 11939, Y = 6798, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Explore", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I\'m okay. I\'m okay. I\'m in control. It\'s fine, it\'s okay. Maybe I could use a little help here", Name = "Mayor", X = 11954, Y = 6879, Z = 1 , Weapon = "Base.HuntingKnife", Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Man, I don\'t get paid nearly enough for this gig",PerkName = "Aiming",PerkLevel = 5,  Name = "Body Guard", X = 11955, Y = 6879, Z = 1 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false};

PresetSpawns[#PresetSpawns+1] = {Greeting = "You can take what you want, but take me with you! Any place is safer than here", Name = "Shop Owner", X = 11905, Y = 6852, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Praise God! Hallelujah!",isFemale = false,  Name = "Pastor Bob", X = 11973, Y = 6990, Z = 0 , Weapon = "Base.Plank", Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Please help us!", Name = "Teacher", X = 11306, Y = 6785, Z = 1 , Weapon = "Base.Plank", Orders = "Patrol", isHostile = false, Patrolling=true, PX=10,PY=0};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Are you friendly?", Name = "Teacher", X = 11345, Y = 6785, Z = 1 , Weapon = "Base.Plank", Orders = "Patrol", isHostile = false, Patrolling=true, PX=2,PY=0};
PresetSpawns[#PresetSpawns+1] = {Greeting = "He has sent me a miracle. Amen!",isFemale = false,  Name = "Pastor Aaron", X = 11096, Y = 6710, Z = 0 , Weapon = "Base.Plank", Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {PerkName = "Aiming",PerkLevel = 5,Greeting = "Did you have to sneak up on me?", Name = "Sam", X = 11991, Y = 6945, Z = 2 , Weapon = getWeapon("Base.HuntingRifle"),  Orders = "Standing Ground", isHostile = false};

PresetSpawns[#PresetSpawns+1] = {Greeting = "As you can tell, I\'m an axe man",PerkName = "Axe",PerkLevel = 5,  Name = "Lumberjack", X = 12064, Y = 7213, Z = 0 , Weapon = "Base.Axe", Orders = "Chop Wood", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Shoot, you scared me, thought you were one of those damn zombies",PerkName = "Axe",PerkLevel = 5,  Name = "Lumberjack", X = 12070, Y = 7213, Z = 0 , Weapon = "Base.Axe", Orders = "Chop Wood", isHostile = false};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Could have been the Russians, aliens, some secret military experiments",PerkName = "PlantScavenging",PerkLevel = 5,   Name = "Survivalist", X = 12074, Y = 7306, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Forage", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I focused on being prepared. Crazy is building the ark after the flood has already come. Don\'t you agree?",PerkName = "PlantScavenging",PerkLevel = 5,   Name = "Survivalist", X = 12084, Y = 7306, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Explore", isHostile = false};

-- WESTPOINT END PlantScavenging 

-- MULDRAUGH BEGIN

PresetSpawns[#PresetSpawns+1] = {Greeting = "All life is precious",PerkName = "Blunt",PerkLevel = 10, isFemale=false, NoParty = true,   Name = "Morgan", X = 9834, Y = 9515, Z = 0 , Weapon = "Base.BaseballBat", Orders = "Guard", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "We get comfortable here, we let our guard down, this place is gonna make us weak",PerkName = "Aiming",PerkLevel = 10, isFemale=false, NoParty = true,   Name = "Carol", X = 9833, Y = 9517, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=-15,PY=0};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Have you ever had to kill people because they had already killed your friends and were coming for you next? Have you ever done things that made you feel afraid of yourself afterward? Have you ever been covered in so much blood that you didn\'t know if it was yours or walkers\' or your friends\'? Huh? Then you don\'t know",PerkName = "Blunt",PerkLevel = 10, isFemale=true, NoParty = true,   Name = "Michonne", X = 9809, Y = 9501, Z = 0 , Weapon = "Base.Poolcue", Orders = "Guard", isHostile = false}; --ALT QUOTE: Don\'t you want one more day with a chance? 
PresetSpawns[#PresetSpawns+1] = {Greeting = "Why are we running? What are we doing?",PerkName = "Aiming",PerkLevel = 10, isFemale=false,   Name = "Carl", X = 9833, Y = 9519, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {Greeting = "I\'ve already lost three of the people that I care about most in this world",PerkName = "Aiming",PerkLevel = 10, isFemale=true, NoParty = true,   Name = "Maggie", X = 9803, Y = 9507, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Nice moves there, Clint Eastwood. You\'re the new sheriff come riding in to clean up the town?",PerkName = "Blunt",PerkLevel = 10, isFemale=false, NoParty = true,   Name = "Glenn", X = 9806, Y = 9506, Z = 0 , Weapon = "Base.BaseballBat", Orders = "Guard", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "You want to know what I was before all this? I was nobody. Nothing",PerkName = "Aiming",PerkLevel = 10, isFemale=false, NoParty = true,   Name = "Daryl", X = 9799, Y = 9503, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=10};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Everyone who made it this far, we\'ve all done worse kinds of things, just to stay alive.. But we can still come back. We\'re not too far gone",PerkName = "Axe",PerkLevel = 10,isFemale=false,   Name = "Rick", X = 9800, Y =9488, Z = 0 , Weapon = "Base.Axe", Orders = "Guard", isHostile = false}; 

PresetSpawns[#PresetSpawns+1] = {Greeting = "It\'s so good to see friendly faces",PerkName = "Axe",PerkLevel = 5,   Name = "Lumberjack", X = 10470, Y = 9277, Z = 0 , Weapon = "Base.Axe", Orders = "Chop Wood", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "We came back to McCoy\'s looking for supplies. Muldraugh is a god awful mess",PerkName = "Axe",PerkLevel = 5,   Name = "Lumberjack", X = 10472, Y = 9279, Z = 0 , Weapon = "Base.Axe", Orders = "Chop Wood", isHostile = false};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Doctor Kildare? Oh.. how did you get up here? The doors should have been locked. Are you bitten?",PerkName = "Doctor",PerkLevel = 3,isFemale=true,  Name = "Nurse", X = 10880, Y = 10029, Z = 1 , Weapon = "Base.KitchenKnife", Orders = "Doctor", isHostile = false}; 

PresetSpawns[#PresetSpawns+1] = {Greeting = "They should be terrified. The world\'s ending. Otherwise, who gives a shit. With God, it\'s never too late to make things right",PerkName = "Aiming",PerkLevel = 10,isFemale=false,  Name = "Preacher", X = 10787, Y = 10172, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Standing Ground", isHostile = false}; 

PresetSpawns[#PresetSpawns+1] = {Greeting = "HELP! HELP! They are trying to eat me!",  Name = "Food Inspector", X = 10621, Y = 9829, Z = 1 , Weapon = "Base.Plank", Orders = "Standing Ground", isHostile = false}; 

PresetSpawns[#PresetSpawns+1] = {Greeting = "Stay...STAY AWAY FROM ME! ARRRRGGH!!!",PerkName = "Aiming",PerkLevel = 1,isFemale=false,  Name = "Security Guard", X =  10627, Y = 9410, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Ya know wut? This is the most exciting goddamn thing that\'s ever happened in this town",PerkName = "Blade",PerkLevel = 5,isFemale=false,  Name = "Mad Man", X = 10686, Y = 10328, Z = 0 , Weapon = "Base.HuntingKnife", Orders = "Standing Ground", isHostile = false};  

--MULDRAUGH END

--WAREHOUSES OUTSIDE OF MULDRAUGH 
--Barney Calhoun ;-)
PresetSpawns[#PresetSpawns+1] = {Greeting = "Hey Gordon, is that you? What the bejesus?! Put your weapons away or I\'ll shoot!",isFemale=false,  Name = "Security Guard", X =  9987, Y = 10962, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = false};
--WAREHOUSES END

--MARCH RIDGE
PresetSpawns[#PresetSpawns+1] = {Greeting = "To hell with circumstances; I create opportunities. Knowing is not enough, we must apply. Willing is not enough, we must do",PerkName = "Blunt",PerkLevel = 10,isFemale=false,  Name = "Martial Arts Instructor", X =  10010, Y = 12735, Z = 1 , Weapon = "Base.BaseballBat", Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "We\'ve got to get out of here! Its not safe. There is a gang of lunatics coming back here for me and the supplies. They want a doctor",isFemale=true, PerkLevel = 4, PerkName = "Doctor", Name = "Doctor", X = 10167, Y = 12754, Z = 0 , Weapon = "Base.BaseballBat", Orders = "Doctor", isHostile = false};

--MARCH RIDGE END

--ROSEWOOD 
PresetSpawns[#PresetSpawns+1] = {Greeting = "Howdy. You can call me Tex. Been waiting for the military or some such, but you\'ll do my friend. Welcome!",PerkName = "Axe",PerkLevel = 5,isFemale=false,  Name = "Fire Fighter", X = 8143, Y = 11736, Z = 1 , Weapon = "Base.Axe", Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "ARRRRGGH!!!! Got you! Don\'t even think about escaping!",  Name = "Attorney", X = 7991, Y = 11449, Z = 0 , Weapon = "Base.Golfclub", Orders = "Standing Ground", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Thank God! Please help me!",  Name = "Librarian", X = 8335, Y = 11615, Z = 0 , Weapon = "Base.BaseballBat", Orders = "Standing Ground", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I\'ve been to eight county fairs and a goat rodeo, but I\'ve never seen anything like that. Thanks for the rescue. Now I gotta find Rick",PerkName = "Aiming",PerkLevel = 10, isFemale=false, NoParty = true,   Name = "Abraham", X = 8211, Y = 11805, Z = 0 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Guard", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Thank you for saving me. So you\'re aware, I\'m on record as stating that I\'m not combat ready or even for that matter combat inclined",PerkName = "Blunt",PerkLevel = 3, isFemale=false, NoParty = true,   Name = "Eugene", X = 8231, Y = 11816, Z = 0 , Weapon = "Base.Plank", Orders = "Guard", isHostile = false}; 
--ROSEWOOD END

--RAILYARD SOUTH OF MULD
PresetSpawns[#PresetSpawns+1] = {Greeting = "Hey! Who goes there?! Better watch yer self pally!",PerkName = "Blunt",PerkLevel = 5,isFemale=false,  Name = "Hobo", X = 11629, Y = 9852, Z = 0 , Weapon = "Base.BaseballBat", Orders = "Patrol", isHostile = false,Patrolling=true, PX=0,PY=-15};

---RAILYARD END

--cabins far east of muldraugh 
PresetSpawns[#PresetSpawns+1] = {Greeting = "I\'ve have been watching you, but you seem friendly. How did you make it out alive?",PerkName = "Aiming",PerkLevel = 7,isFemale=false,  Name = "Hunter", X = 12475, Y = 8969, Z = 0 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Patrol", isHostile = false,Patrolling=true, PX=10,PY=0};

--end cabins

 --DIXIE 

PresetSpawns[#PresetSpawns+1] = {Greeting = "I\'ve had my gun sight on you for the last 5 minutes, but you seem friendly. How did you make it out alive?",PerkName = "Aiming",PerkLevel = 7,isFemale=false,  Name = "Hunter", X = 11608, Y = 9303, Z = 0 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Patrol", isHostile = false,Patrolling=true, PX=10,PY=0};

---END DIXIE 

--VALLEY & MALL AREA
PresetSpawns[#PresetSpawns+1] = {Greeting = "Oh my God! Normal people for a change! This is my BOOMSTICK! Groovy. Found it off a dead dude. Luckily they sell ammo at S-MART",PerkName = "Aiming",PerkLevel = 3,isFemale=false,  Name = "B-Movie Actor", X = 13643, Y = 5868, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Patrol", isHostile = false,Patrolling=true, PX=0,PY=15};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Honey, we\'ve got some visitors. Stop looking for where you left the champagne and get over here!",isFemale=true,  Name = "Shopper Kim", X = 13923, Y = 5829, Z = 2 , Weapon = "Base.KitchenKnife", Orders = "Patrol", isHostile = true,Patrolling=true, PX=0,PY=15};
PresetSpawns[#PresetSpawns+1] = {Greeting = "What\'s up Goldigger?...Nothing in life is promised except.... death!",isFemale=false,  Name = "Shopper Kanye", X = 13923, Y = 5824, Z = 2 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true,Patrolling=true, PX=-15,PY=0};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Ya better be real cool buddy, or I\'ll shovel your sorry ass outta here.",PerkName = "Blunt",PerkLevel = 3,isFemale=false,  Name = "Construction Worker", X = 14087, Y = 5453, Z = 0 , Weapon = "Base.Shovel", Orders = "Standing Ground", isHostile = false};

PresetSpawns[#PresetSpawns+1] = {Greeting = "Finally! Help has arrived! I..I...came to the Academy during the curfew to grab some books before we tried to escape by foot around the military blockade",isFemale=true,  Name = "Professor", X = 12869, Y = 4848, Z = 0 , Weapon = "Base.BaseballBat", Orders = "Standing Ground", isHostile = false};


--END VALLEY & MALL AREA    

-- NORTH EAST BLOCKADE

PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, InitGreeting = getText("ContextMenu_speech_BlockadeIntro"), PerkName = "Aiming",PerkLevel = 10, NoParty = true, isFemale=false,   Name = "General Carter", X = 12508, Y = 4487, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "Move along now", PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12512, Y = 4487, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12517, Y = 4487, Z = 0 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "You\'re not supposed to be up here, Move along!", PerkName = "Aiming", PerkLevel = 10, NoParty = true, isFemale=false,   Name = "Sniper", X = 12499, Y = 4497, Z = 3 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Standing Ground", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "What are you doing up here? Move along!", PerkName = "Aiming", PerkLevel = 10, NoParty = true, isFemale=false,   Name = "Sniper", X = 12527, Y = 4497, Z = 3 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Standing Ground", isHostile = false}; 

PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I\'m busy", PerkName = "Aiming", PerkLevel = 2, NoParty = true, isFemale=false,   Name = "Soldier", X = 12527, Y = 4485, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=-35,PY=-13}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I\'m busy", NoParty = true, isFemale=false,   Name = "Cook", X = 12481, Y = 4446, Z = 0 , Weapon = "Base.KitchenKnife", Orders = "Patrol", isHostile = false, Patrolling=true, PX=-4,PY=-8}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I\'m scared", NoParty = true,   Name = "Refugee", X = 12490, Y = 4443, Z = 0 , Weapon = "Base.KitchenKnife", Orders = "Patrol", isHostile = false, Patrolling=true, PX=-10,PY=12}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I can\'t get a good signal", NoParty = true, isFemale=false,   Name = "Refugee Bob", X = 12485, Y = 4463, Z = 0 , Weapon = "Base.KitchenKnife", Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, NoParty = true,   Name = "Refugee", X = 12485, Y = 4463, Z = 0 , Weapon = "Base.KitchenKnife", Orders = "Explore", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I\'m busy", PerkName = "Aiming", PerkLevel = 2, NoParty = true,   Name = "Soldier", X = 12541, Y = 4456, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=0,PZ=1}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "We cannot wait any longer! We must proceed with operation Bluejay NOW!", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Captian", X = 12540, Y = 4402, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "Communication has been down for far too long. We must assume the worst.", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Major Mike", X = 12533, Y = 4405, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "We can\'t hold off here without backup for much longer. We need to do something!", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Lt. Dan", X = 12533, Y = 4407, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 

PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12512, Y = 4400, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Stop!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12515, Y = 4400, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Go No Futher!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12519, Y = 4397, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12508, Y = 4397, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "No one may pass the Blockade. NO exceptions!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12505, Y = 4417, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=15,PY=0}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "No one may pass the Blockade. NO exceptions!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12470, Y = 4425, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=15,PY=17}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12552, Y = 4397, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Go No Further!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12556, Y = 4458, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "Talk to the General up by the North West Entrance", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Srgt. Sam", X = 12552, Y = 4498, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "Need some treatment?", PerkName = "Doctor", isFemale=false, PerkLevel = 3, NoParty = true,   Name = getText("ContextMenu_SD_DoctorPrefix_Before").."Dan"..getText("ContextMenu_SD_DoctorPrefix_After"), X = 12483, Y = 4457, Z = 0 , Weapon = getWeapon("Base.HuntingKnife"), Orders = "Doctor", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "Move along now", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Soldier", X = 12555, Y = 4498, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, NoParty=true,Greeting = "I\'m supposed to take down all these trees.",PerkName = "Axe",PerkLevel = 5,  Name = "Worker", X = 12555, Y = 4478, Z = 0 , Weapon = "Base.Axe", Orders = "Explore", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I tried to warn everyone, no one would listen.",PerkName = "Aiming",PerkLevel = 6,  Name = "Private Manning", X = 12467, Y = 4409, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol",  Patrolling=true, PX=0,PY=9, isHostile = false};
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Hey! Your not aloud in here!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12497, Y = 4366, Z = 3 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=-4,PY=-7}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Hey! Your not aloud in here!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12537, Y = 4368, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=-25,PY=1}; 

-- NORTH EAST BLOCKADE END

 -- OTHER START

PresetSpawns[#PresetSpawns+1] = {  Name = "A Savior", X = 8217, Y = 11810, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=10,PY=0};
PresetSpawns[#PresetSpawns+1] = {  Name = "A Savior", X = 8256, Y = 11845, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {  Name = "A Savior", X = 8255, Y = 11850, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {  Name = "A Savior", X = 8248, Y = 11859, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {  Name = "A Savior", X = 8235, Y = 11837, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true};
PresetSpawns[#PresetSpawns+1] = {Greeting = "Hi, I\'m Negan",isFemale=false,   Name = "I\'m Negan", X = 8226, Y = 11869, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=10,PY=-10}; 

PresetSpawns[#PresetSpawns+1] = {Greeting = "The Lord sent you here to finally punish me. I'm damned. I was damned before. I always lock the doors. I always lock the doors",PerkName = "Blade",PerkLevel = 5,isFemale = false,  Name = "Father Gabriel", X = 10323, Y = 12787, Z = 0, Weapon = "Base.HuntingKnife", Orders = "Guard", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = " Nobody\'s got to die today",PerkName = "Axe",PerkLevel = 5,isFemale = false,  Name = "Tyreese", X = 9206, Y = 12139, Z = 0 , Weapon = "Base.Axe", Orders = "Guard", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I move through town... I\'m quiet... like a fire",PerkName = "Aiming",PerkLevel = 5,isFemale = true,  Name = "Sasha", X = 9207, Y = 12143, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {Greeting = "The people around you dying...that\'s the hard part",PerkName = "Aiming",PerkLevel = 10,isFemale = true,  Name = "Rosita", X = 14421, Y = 4628, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false};

-- OTHER END 

-- NORTH EAST AIZ BLOCKADE

PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "This is the North East Blockade. No one is aloud past the rear Blockade. Lethal force will be used if necessary", PerkName = "Aiming",PerkLevel = 10, NoParty = true, isFemale=false,   Name = "Captain B.J. Blazkowicz", X = 12508, Y = (-2*300) + 4487, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "Move along now", PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12512, Y = (-2*300) + 4487, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12517, Y = (-2*300) +4487, Z = 0 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "You\'re not supposed to be up here, Move along!", PerkName = "Aiming", PerkLevel = 10, NoParty = true, isFemale=false,   Name = "Sniper", X = 12499, Y = (-2*300) + 4497, Z = 3 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Standing Ground", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "What are you doing up here? Move along!", PerkName = "Aiming", PerkLevel = 10, NoParty = true, isFemale=false,   Name = "Sniper", X = 12527, Y = (-2*300) + 4497, Z = 3 , Weapon = getWeapon("Base.HuntingRifle"), Orders = "Standing Ground", isHostile = false}; 

PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I\'m busy", PerkName = "Aiming", PerkLevel = 2, NoParty = true, isFemale=false,   Name = "Soldier", X = 12527, Y = (-2*300) + 4485, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=-35,PY=-13}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I\'m busy", NoParty = true, isFemale=false,   Name = "Cook", X = 12481, Y = (-2*300) + 4446, Z = 0 , Weapon = "Base.KitchenKnife", Orders = "Patrol", isHostile = false, Patrolling=true, PX=-4,PY=-8}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I\'m scared", NoParty = true,   Name = "Refugee", X = 12490, Y = (-2*300) + 4443, Z = 0 , Weapon = "Base.KitchenKnife", Orders = "Patrol", isHostile = false, Patrolling=true, PX=-10,PY=12}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I can\'t get a good signal", NoParty = true, isFemale=false,   Name = "Refugee Bob", X = 12485, Y = (-2*300) + 4463, Z = 0 , Weapon = "Base.KitchenKnife", Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, NoParty = true,   Name = "Refugee", X = 12485, Y = (-2*300) + 4463, Z = 0 , Weapon = "Base.KitchenKnife", Orders = "Explore", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I\'m busy", PerkName = "Aiming", PerkLevel = 2, NoParty = true,   Name = "Soldier", X = 12541, Y = (-2*300) + 4456, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=0,PZ=1}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "We cannot wait any longer! We must proceed with operation Bluejay NOW!", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Captian", X = 12540, Y = (-2*300) + 4402, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "Communication has been down for far too long. We must assume the worst.", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Major Mike", X = 12533, Y = (-2*300) + 4405, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "We can\'t hold off here without backup for much longer. We need to do something!", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Lt. Dan", X = 12533, Y = (-2*300) + 4407, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 

PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12512, Y = (-2*300) + 4400, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Stop!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12515, Y = (-2*300) + 4400, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Go No Futher!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12519, Y = (-2*300) + 4397, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12508, Y = (-2*300) + 4397, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "No one may pass the Blockade. NO exceptions!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12505, Y = (-2*300) + 4417, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=15,PY=0}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "No one may pass the Blockade. NO exceptions!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12470, Y = (-2*300) + 4425, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = false, Patrolling=true, PX=15,PY=17}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12552, Y = (-2*300) + 4397, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Go No Further!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12556, Y = (-2*300) + 4397, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "Talk to the Captain up by the North West Entrance", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Srgt. Sam", X = 12552, Y = (-2*300) + 4498, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "Move along now", PerkName = "Aiming", isFemale=false, PerkLevel = 2, NoParty = true,   Name = "Soldier", X = 12555, Y = (-2*300) + 4498, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, NoParty=true,Greeting = "I\'m supposed to take down all these trees.",PerkName = "Axe",PerkLevel = 5,  Name = "Worker", X = 12555, Y = (-2*300) + 4478, Z = 0 , Weapon = "Base.Axe", Orders = "Explore", isHostile = false};
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting = "I tried to warn everyone, no one would listen.",PerkName = "Aiming",PerkLevel = 6,  Name = "Private Manning", X = 12467, Y = (-2*300) + 4409, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol",  Patrolling=true, PX=0,PY=9, isHostile = false};
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Hey! Your not allowed in here!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12497, Y = (-2*300) + 4366, Z = 3 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=-4,PY=-7}; 
PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Hey! Your not allowed in here!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12537, Y = (-2*300) + 4368, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Patrol", isHostile = true, Patrolling=true, PX=-25,PY=1}; 
	if isModEnabled("SurvivorQuests") then
			PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Hey! You're not allowed up here!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12505, Y = 3742, Z = 0 , Weapon = "Base.Pistol", Orders = "Patrol", isHostile = true, Patrolling=true, PX=0,PY=-7}; 
			PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Hey! You're not allowed over here!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12506, Y =3752, Z = 0 , Weapon = "Base.Pistol", Orders = "Guard", isHostile = true}; 
			PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Hey! You're not allowed in here!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12499, Y = 3764, Z = 0 , Weapon = "Base.Pistol", Orders = "Guard", isHostile = true}; 
			PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Hey! You're not allowed over here!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12459, Y = 3759, Z = 0 , Weapon = "Base.Pistol", Orders = "Guard", isHostile = true}; 
			PresetSpawns[#PresetSpawns+1] = {GroupID = BlockadeGroupID, Greeting="Hey! You're not alloweed over here!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 12459, Y = 3778, Z = 0 , Weapon = "Base.Pistol", Orders = "Guard", isHostile = true}; 
			
	end
	

PresetSpawns[#PresetSpawns+1] = {X = 12484, Y = 4443, Z = 0 , itemType="RandomCannedFood", count = 30, isItemSpawn = true,GroupID=BlockadeGroupID}
PresetSpawns[#PresetSpawns+1] = {X = 12484, Y = 4444, Z = 0 , itemType="RandomCannedFood", count = 30, isItemSpawn = true,GroupID=BlockadeGroupID}
PresetSpawns[#PresetSpawns+1] = {X = 12484, Y = 4445, Z = 0 , itemType="RandomCannedFood", count = 30, isItemSpawn = true,GroupID=BlockadeGroupID}
PresetSpawns[#PresetSpawns+1] = {GroupID=BlockadeGroupID,Greeting = "Best be on your way now", InitGreeting=getText("ContextMenu_speech_DoNotTouchFood"), PerkName = "Aiming",PerkLevel = 2, NoParty = true,  Name = "Food Guard", X = 12484, Y = 4446, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = false};


-- NORTH EAST BLOCKADE AIZ END

-- prison
PresetSpawns[#PresetSpawns+1] = {Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7753, Y = 11884, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {Greeting="Stop!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7753, Y = 11889, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Standing Ground", isHostile = true}; 

PresetSpawns[#PresetSpawns+1] = {Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7743, Y = 11905, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Guard", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {Greeting="Stop!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7709, Y = 11878, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Guard", isHostile = true}; 

PresetSpawns[#PresetSpawns+1] = {Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7680, Y = 11878, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Explore", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {Greeting="Stop!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7680, Y = 11878, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Explore", isHostile = true}; 

PresetSpawns[#PresetSpawns+1] = {Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7651, Y = 11855, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Explore", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {Greeting="Stop!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7651, Y = 11855, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Explore", isHostile = true}; 

PresetSpawns[#PresetSpawns+1] = {Greeting="Halt!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7729, Y = 11913, Z = 0 , Weapon = getWeapon("Base.Shotgun"), Orders = "Explore", isHostile = true}; 
PresetSpawns[#PresetSpawns+1] = {Greeting="Stop!",PerkName = "Aiming", PerkLevel = 5, NoParty = true, isFemale=false,   Name = "Soldier", X = 7729, Y = 11913, Z = 0 , Weapon = getWeapon("Base.Pistol"), Orders = "Explore", isHostile = true}; 

--recruitable farmers
PresetSpawns[#PresetSpawns+1] = {Greeting = "You\'re the one stealing my crops? I\'m sure it was no damn zombie. These city folk don\'t know how to fend for themselves. We can work together here",isFemale = false, PerkName="Farming",PerkLevel=5,  Name = "Farmer John", X = 11137, Y = 6855, Z = 1 , Weapon = "Base.Hammer",  Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-4};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I bet you could use someone who knows about farming. If you make it worth my while I just might go with you.",isFemale = false, PerkName="Farming",PerkLevel=5,  Name = "Farmer Nick", X = 8616, Y = 8823, Z = 0 , Weapon = "Base.Hammer",  Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-4};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I bet you could use someone who knows about farming. If you make it worth my while I just might go with you.",isFemale = false, PerkName="Farming",PerkLevel=5,  Name = "Farmer Dan", X = 10824, Y = 9072, Z = 0 , Weapon = "Base.Hammer",  Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-4};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I bet you could use someone who knows about farming. If you make it worth my while I just might go with you.",isFemale = false, PerkName="Farming",PerkLevel=5,  Name = "Farmer Fransis", X = 14322, Y = 4957, Z = 0 , Weapon = "Base.Hammer",  Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-4};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I bet you could use someone who knows about farming. If you make it worth my while I just might go with you.",isFemale = false, PerkName="Farming",PerkLevel=5,  Name = "Farmer Franko", X = 11132, Y = 6853, Z = 0 , Weapon = "Base.Hammer",  Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-4};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I bet you could use someone who knows about farming. If you make it worth my while I just might go with you.",isFemale = false, PerkName="Farming",PerkLevel=5,  Name = "Farmer Jacob", X = 14394, Y = 4557, Z = 0 , Weapon = "Base.Hammer",  Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-4};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I bet you could use someone who knows about farming. If you make it worth my while I just might go with you.",isFemale = false, PerkName="Farming",PerkLevel=5,  Name = "Farmer Jack", X = 6817, Y = 7720, Z = 0 , Weapon = "Base.Hammer",  Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-4};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I bet you could use someone who knows about farming. If you make it worth my while I just might go with you.",isFemale = false, PerkName="Farming",PerkLevel=5,  Name = "Farmer Frank", X = 9067, Y = 12184, Z = 0 , Weapon = "Base.Hammer",  Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-4};
PresetSpawns[#PresetSpawns+1] = {Greeting = "I bet you could use someone who knows about farming. If you make it worth my while I just might go with you.",isFemale = false, PerkName="Farming",PerkLevel=5,  Name = "Farmer Phil", X = 12059, Y = 7363, Z = 0 , Weapon = "Base.Hammer",  Orders = "Patrol", isHostile = false, Patrolling=true, PX=0,PY=-4};


--recuritable doctors
PresetSpawns[#PresetSpawns+1] = {X = 10877, Y = 10029, Z = 0, Greeting = "Need some treatment?", PerkName = "Doctor", PerkLevel = 5,isFemale=false, Name = getText("ContextMenu_SD_DoctorPrefix_Before")..getSpeech("BoyNames")..getText("ContextMenu_SD_DoctorPrefix_After") , Weapon = getWeapon("Base.HuntingKnife"), Orders = "Doctor", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {X = 8093, Y = 11521, Z = 0, Greeting = "Need some treatment?", PerkName = "Doctor",  PerkLevel = 5,isFemale=false, Name = getText("ContextMenu_SD_DoctorPrefix_Before")..getSpeech("BoyNames")..getText("ContextMenu_SD_DoctorPrefix_After") , Weapon = getWeapon("Base.HuntingKnife"), Orders = "Doctor", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {X = 11882, Y = 6883, Z = 0, Greeting = "Need some treatment?", PerkName = "Doctor", PerkLevel = 5,isFemale=false, Name = getText("ContextMenu_SD_DoctorPrefix_Before")..getSpeech("BoyNames")..getText("ContextMenu_SD_DoctorPrefix_After") , Weapon = getWeapon("Base.HuntingKnife"), Orders = "Doctor", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {X = 11937, Y = 6797, Z = 0, Greeting = "Need some treatment?", PerkName = "Doctor", PerkLevel = 5,isFemale=false, Name = getText("ContextMenu_SD_DoctorPrefix_Before")..getSpeech("BoyNames")..getText("ContextMenu_SD_DoctorPrefix_After") , Weapon = getWeapon("Base.HuntingKnife"), Orders = "Doctor", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {X = 10143, Y = 12750, Z = 0, Greeting = "Need some treatment?", PerkName = "Doctor", PerkLevel = 5,isFemale=false, Name = getText("ContextMenu_SD_DoctorPrefix_Before")..getSpeech("BoyNames")..getText("ContextMenu_SD_DoctorPrefix_After") , Weapon = getWeapon("Base.HuntingKnife"), Orders = "Doctor", isHostile = false}; 
PresetSpawns[#PresetSpawns+1] = {X = 6477, Y = 5259, Z = 0, Greeting = "Need some treatment?", PerkName = "Doctor", PerkLevel = 5,isFemale=false, Name = getText("ContextMenu_SD_DoctorPrefix_Before")..getSpeech("BoyNames")..getText("ContextMenu_SD_DoctorPrefix_After") , Weapon = getWeapon("Base.HuntingKnife"), Orders = "Doctor", isHostile = false}; 


local CannedFoods = {"TinnedBeans","CannedBolognese","CannedCarrots2","CannedChili","CannedCorn","CannedCornedBeef","CannedMushroomSoup","CannedPeas","CannedPotato2","CannedSardines","TinnedSoup","CannedTomato2"}

--- floor item spawns for hilltop camp---
PresetSpawns[#PresetSpawns+1] = {X = 11730, Y = 7935, Z = 0 , itemType="RandomCannedFood", count = 2, isItemSpawn = true}
PresetSpawns[#PresetSpawns+1] = {X = 11714, Y = 7926, Z = 0 , itemType="RandomCannedFood", count = 30, isItemSpawn = true,GroupID=HillTopGroupID}
PresetSpawns[#PresetSpawns+1] = {X = 11716, Y = 7926, Z = 0 , itemType="RandomCannedFood", count = 30, isItemSpawn = true,GroupID=HillTopGroupID}
PresetSpawns[#PresetSpawns+1] = {X = 11726, Y = 7941, Z = 0 , itemType="Base.WaterPot", count = 2, isItemSpawn = true}
PresetSpawns[#PresetSpawns+1] = {X = 11727, Y = 7939, Z = 0 , itemType="Base.Log", count = 4, isItemSpawn = true}


SurvivorCount = 1;
local sc = 1;
RPresetSpawns = {};
while PresetSpawns[sc] do
	if PresetSpawns[sc].Z == nil then PresetSpawns[sc].Z = 0 end
	local pindex = PresetSpawns[sc].X .. PresetSpawns[sc].Y .. PresetSpawns[sc].Z;
	--print("pindex:"..pindex.." for index: "..sc);
	RPresetSpawns[pindex] = PresetSpawns[sc];
	RPresetSpawns[pindex].ID = sc;
	sc = sc + 1;
end


			
SurvivorRoutes = {

	WPToHilltop = {
		{x=11589,y=7076,z=0},
		{x=11699,y=7166,z=0},
		{x=11648,y=7212,z=0},
		{x=11649,y=7906,z=0},
		{x=11686,y=7932,z=0},
		{x=11731,y=7939,z=0},
	},
	
	MuldToHilltop = {
		{x=10647,y=9295,z=0},
		{x=10692,y=9154,z=0},
		{x=10820,y=9142,z=0},
		{x=10964,y=9068,z=0},
		{x=10962,y=8764,z=0},
		{x=11635,y=8753,z=0},
		{x=11648,y=7948,z=0},
		{x=11731,y=7939,z=0},
	},
	
	TrainTracksToValleyStation = {
		{x=12181,y=6821,z=0},
		{x=12296,y=6775,z=0},
		{x=12298,y=6609,z=0},
		{x=12576,y=6606,z=0},
		{x=12621,y=6564,z=0},
		{x=12620,y=5863,z=0},
		{x=12735,y=5772,z=0},
	},

}

		

function SuperSurvivorPresetSpawn(square)
	
	if(RPresetSpawns ~= nil) then
		
		local x = square:getX();
		local y = square:getY();
		local z = square:getZ();

		local i = x..y..z;
		
		if(RPresetSpawns[i]) and square:getModData().SurvivorSquareLoaded == nil and (RPresetSpawns[i].ChanceToSpawn == nil or ZombRand(1,100) > RPresetSpawns[i].ChanceToSpawn) then
			
			square:getModData().SurvivorSquareLoaded = true
			
			if(RPresetSpawns[i].isItemSpawn ~= nil) and (RPresetSpawns[i].itemType ~= nil) then
			
				local item = RPresetSpawns[i].itemType
				local count = RPresetSpawns[i].count
				if not count then count = 1 end
				local dropItem = item
				for i=0, count-1 do
					if(item == "RandomCannedFood") then dropItem = "Base."..tostring(CannedFoods[ZombRand(#CannedFoods)+1])
					else dropItem = item end
					square:AddWorldInventoryItem(dropItem, (ZombRand(99)/100), (ZombRand(99)/100),0)
				end
				if(RPresetSpawns[i].GroupID) then square:getModData().Group = RPresetSpawns[i].GroupID end-- who it belongs to
			
			else			
				
				if RPresetSpawns[i].isFemale ~= nil then isFemale = RPresetSpawns[i].isFemale end
				local SuperSurvivor = SSM:spawnSurvivor(nil,square)
				if(SuperSurvivor == nil) then return false end
				
				local Buddy = SuperSurvivor.player
				
				if(RPresetSpawns[i].AIMode ~= nil) then SuperSurvivor:setAIMode(RPresetSpawns[i].AIMode) end
							
				Buddy:setZ(RPresetSpawns[i].Z);
				
				local tempTM = SuperSurvivor:getTaskManager()
				tempTM:clear()
				
				if(RPresetSpawns[i].Orders ~= nil) and (RPresetSpawns[i].Orders == "Guard") then				
					tempTM:AddToTop(GuardTask:new(SuperSurvivor,Buddy:getCurrentSquare()))
					--SuperSurvivor:setBravePoints(5)
					SuperSurvivor:setAIMode("Guard")
				end
				
				if(RPresetSpawns[i].Orders ~= nil) and (RPresetSpawns[i].Orders == "Doctor") then				
					tempTM:AddToTop(DoctorTask:new(SuperSurvivor))
					SuperSurvivor:setAIMode("Doctor")
				end
				
				if(RPresetSpawns[i].Orders ~= nil) and (RPresetSpawns[i].Orders == "Wander") or (RPresetSpawns[i].Orders == "Explore")then				
					tempTM:AddToTop(WanderTask:new(SuperSurvivor))
					SuperSurvivor:setAIMode("Wander")
				end
				
				if(RPresetSpawns[i].Orders ~= nil) and (RPresetSpawns[i].Orders == "FollowRoute") then	
					local routeID = RPresetSpawns[i].RouteID 
					tempTM:AddToTop(FollowRouteTask:new(SuperSurvivor,routeID))
					SuperSurvivor:setAIMode("FollowRoute")
				end
				
				if(RPresetSpawns[i].Orders ~= nil) and (RPresetSpawns[i].Orders == "Standing Ground") then
					SuperSurvivor:setWalkingPermitted(false)
					--SuperSurvivor:setBravePoints(5)
					SuperSurvivor:setAIMode("Stand Ground")
				end
				
				if(RPresetSpawns[i].Patrolling ~= nil) then
					local patrolSquare = getCell():getOrCreateGridSquare(x + RPresetSpawns[i].PX,y + RPresetSpawns[i].PY,RPresetSpawns[i].Z)				
					SuperSurvivor.player:getModData().PX = x + RPresetSpawns[i].PX
					SuperSurvivor.player:getModData().PY = y + RPresetSpawns[i].PY
					SuperSurvivor.player:getModData().PZ = RPresetSpawns[i].Z
					tempTM:AddToTop(PatrolTask:new(SuperSurvivor,Buddy:getCurrentSquare(),patrolSquare))
					--SuperSurvivor:setBravePoints(5)			
					SuperSurvivor:setAIMode("Patrol")		
				end
				
				if(RPresetSpawns[i].GroupID ~= nil) then
					
					local Role = RPresetSpawns[i].Role
					if not Role then Role = "Worker" end
					local tempGroup = SSGM:Get(RPresetSpawns[i].GroupID)
					if(tempGroup:getLeader() == -1) then
						tempGroup:addMember(SuperSurvivor,"Leader")
					else 
						tempGroup:addMember(SuperSurvivor,Role)
					end
											
				end
				
				if(RPresetSpawns[i].NoParty ~= nil) then 
					Buddy:getModData().NoParty = true;
				end
				
				if( RPresetSpawns[i].isHostile == true) then SuperSurvivor:setHostile(true) end
				Buddy:getModData().seenZombie = true;
							
				if(RPresetSpawns[i].Weapon ~= nil) then
					SuperSurvivor:giveWeapon(RPresetSpawns[i].Weapon,true);
				end
				if(RPresetSpawns[i].ShowName ~= nil) then
					Buddy:getModData().ShowName = true;
				end
				if(RPresetSpawns[i].Greeting) then
					Buddy:getModData().Greeting = RPresetSpawns[i].Greeting;
				end
				if(RPresetSpawns[i].InitGreeting) then
					Buddy:getModData().InitGreeting = RPresetSpawns[i].InitGreeting;
				end
				SuperSurvivor:setName(RPresetSpawns[i].Name)
				
				if(RPresetSpawns[i].PerkLevel ~= nil and RPresetSpawns[i].PerkName ~= nil) then
					local perk  = Perks.FromString(RPresetSpawns[i].PerkName);
					local level 
					if(RPresetSpawns[i].PerkLevel == nil) then level = ZombRand(3,9)
					else level = RPresetSpawns[i].PerkLevel end
					local count = 0;
					while(count < level) do
						Buddy:LevelPerk(perk);
						count = count + 1;
					end
				end
				
				RPresetSpawns[i] = nil;
			end
			
			return true			
			
		end
	
	end
	return false
end