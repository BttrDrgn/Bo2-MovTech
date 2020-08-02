
init()
{
	Precache();
    mapEdits();
	self thread itemRotation();
	level.angles = 0;

	level.weapons.available = 1;
	level.items.available = 1;
}

Precache()
{
	PrecacheModel("t6_wpn_supply_drop_ally");
}

mapEdits()
{
	if(getDvar("mapname") == "mp_drone")
	{
		boxes = [];

		//SDC Spawn Door
		boxes[0] = spawn("script_model", (-1863.98, -986, 115));
    	boxes[0].angles = (0, 90, 0);
		
		boxes[1] = spawn("script_model", (-1863.98, -986, 150));
    	boxes[1].angles = (0, 90, 0);

		boxes[2] = spawn("script_model", (-1863.98, -986, 185));
    	boxes[2].angles = (0, 90, 0);

		//Factory Window SDC Side
		boxes[3] = spawn("script_model", (-860, -245, 315));
    	boxes[3].angles = (0, 90, 0);

		boxes[4] = spawn("script_model", (-770, -245, 315));
    	boxes[4].angles = (0, 90, 0);

		boxes[5] = spawn("script_model", (-860, -245, 345));
    	boxes[5].angles = (0, 90, 0);

		boxes[6] = spawn("script_model", (-770, -245, 345));
    	boxes[6].angles = (0, 90, 0);

		boxes[7] = spawn("script_model", (-860, -245, 375));
    	boxes[7].angles = (0, 90, 0);

		boxes[8] = spawn("script_model", (-770, -245, 375));
    	boxes[8].angles = (0, 90, 0);

		//Factory Window SEALS Side
		boxes[9] = spawn("script_model", (-860, 620, 315));
    	boxes[9].angles = (0, 90, 0);

		boxes[10] = spawn("script_model", (-770, 620, 315));
    	boxes[10].angles = (0, 90, 0);

		boxes[11] = spawn("script_model", (-860, 620, 345));
    	boxes[11].angles = (0, 90, 0);

		boxes[12] = spawn("script_model", (-770, 620, 345));
    	boxes[12].angles = (0, 90, 0);

		boxes[13] = spawn("script_model", (-860, 620, 375));
    	boxes[13].angles = (0, 90, 0);

		boxes[14] = spawn("script_model", (-770, 620, 375));
    	boxes[14].angles = (0, 90, 0);

		//Factory Stairs Blockage
		boxes[15] = spawn("script_model", (-747, -180, 280));
    	boxes[15].angles = (0, 180, 0);

		boxes[16] = spawn("script_model", (-747, -100, 280));
    	boxes[16].angles = (0, 180, 0);

		boxes[17] = spawn("script_model", (-747, -20, 280));
    	boxes[17].angles = (0, 180, 0);

		boxes[18] = spawn("script_model", (-747, 60, 280));
    	boxes[18].angles = (0, 180, 0);

		boxes[19] = spawn("script_model", (-747, 140, 280));
    	boxes[19].angles = (0, 180, 0);

		boxes[20] = spawn("script_model", (-747, 220, 280));
    	boxes[20].angles = (0, 180, 0);

		boxes[21] = spawn("script_model", (-747, 300, 280));
    	boxes[21].angles = (0, 180, 0);

		boxes[22] = spawn("script_model", (-747, 380, 280));
    	boxes[22].angles = (0, 180, 0);

		boxes[23] = spawn("script_model", (-747, 460, 280));
    	boxes[23].angles = (0, 180, 0);

		boxes[24] = spawn("script_model", (-747, 540, 280));
    	boxes[24].angles = (0, 180, 0);

		boxes[25] = spawn("script_model", (-766, 595, 280));
    	boxes[25].angles = (0, 90, 0);

		boxes[26] = spawn("script_model", (-747, -180, 310));
    	boxes[26].angles = (0, 180, 0);

		boxes[27] = spawn("script_model", (-747, -100, 310));
    	boxes[27].angles = (0, 180, 0);

		boxes[28] = spawn("script_model", (-747, -20, 310));
    	boxes[28].angles = (0, 180, 0);

		boxes[29] = spawn("script_model", (-747, 60, 310));
    	boxes[29].angles = (0, 180, 0);

		boxes[30] = spawn("script_model", (-747, 140, 310));
    	boxes[30].angles = (0, 180, 0);

		boxes[31] = spawn("script_model", (-747, 220, 310));
    	boxes[31].angles = (0, 180, 0);

		boxes[32] = spawn("script_model", (-747, 300, 310));
    	boxes[32].angles = (0, 180, 0);

		boxes[33] = spawn("script_model", (-747, 380, 310));
    	boxes[33].angles = (0, 180, 0);

		boxes[34] = spawn("script_model", (-747, 460, 310));
    	boxes[34].angles = (0, 180, 0);

		boxes[35] = spawn("script_model", (-747, 540, 310));
    	boxes[35].angles = (0, 180, 0);

		boxes[36] = spawn("script_model", (-766, 595, 310));
    	boxes[36].angles = (0, 90, 0);

		//Right of SDC Top Door
		boxes[37] = spawn("script_model", (197, -1124, 243));
    	boxes[37].angles = (0, 0, 0);

		boxes[38] = spawn("script_model", (197, -1124, 273));
    	boxes[38].angles = (0, 0, 0);

		boxes[39] = spawn("script_model", (197, -1124, 303));
    	boxes[39].angles = (0, 0, 0);

		boxes[40] = spawn("script_model", (197, -1124, 333));
    	boxes[40].angles = (0, 0, 0);

		//SEALS Factory Entrance
		boxes[41] = spawn("script_model", (-807, 1317, 150));
    	boxes[41].angles = (0, 90, 0);

		boxes[42] = spawn("script_model", (-887, 1317, 150));
    	boxes[42].angles = (0, 90, 0);

		boxes[43] = spawn("script_model", (-967, 1317, 150));
    	boxes[43].angles = (0, 90, 0);

		boxes[44] = spawn("script_model", (-807, 1317, 185));
    	boxes[44].angles = (0, 90, 0);

		boxes[45] = spawn("script_model", (-887, 1317, 185));
    	boxes[45].angles = (0, 90, 0);

		boxes[46] = spawn("script_model", (-967, 1317, 185));
    	boxes[46].angles = (0, 90, 0);

		//Tower Room Block
		boxes[47] = spawn("script_model", (884, -493, 80));
    	boxes[47].angles = (0, 90, 0);

		boxes[48] = spawn("script_model", (884, -493, 110));
    	boxes[48].angles = (0, 90, 0);

		boxes[49] = spawn("script_model", (884, -493, 140));
    	boxes[49].angles = (0, 90, 0);

		//Factory Stairs Blockage Addition - accidentally skipped it
		boxes[50] = spawn("script_model", (-747, -180, 340));
    	boxes[50].angles = (0, 180, 0);

		boxes[51] = spawn("script_model", (-747, -100, 340));
    	boxes[51].angles = (0, 180, 0);

		boxes[52] = spawn("script_model", (-747, -20, 340));
    	boxes[52].angles = (0, 180, 0);

		boxes[53] = spawn("script_model", (-747, 60, 340));
    	boxes[53].angles = (0, 180, 0);

		boxes[54] = spawn("script_model", (-747, 140, 340));
    	boxes[54].angles = (0, 180, 0);

		boxes[55] = spawn("script_model", (-747, 220, 340));
    	boxes[55].angles = (0, 180, 0);

		boxes[56] = spawn("script_model", (-747, 300, 340));
    	boxes[56].angles = (0, 180, 0);

		boxes[57] = spawn("script_model", (-747, 380, 340));
    	boxes[57].angles = (0, 180, 0);

		boxes[58] = spawn("script_model", (-747, 460, 340));
    	boxes[58].angles = (0, 180, 0);

		boxes[59] = spawn("script_model", (-747, 540, 340));
    	boxes[59].angles = (0, 180, 0);

		boxes[60] = spawn("script_model", (-766, 595, 340));
    	boxes[60].angles = (0, 90, 0);

		//Balcony
		boxes[61] = spawn("script_model", (-330, 493, 220));
    	boxes[61].angles = (0, 90, 0);

		boxes[62] = spawn("script_model", (-330, 453, 220));
    	boxes[62].angles = (0, 90, 0);

		boxes[63] = spawn("script_model", (-330, 413, 220));
    	boxes[63].angles = (0, 90, 0);

		boxes[64] = spawn("script_model", (-330, 373, 220));
    	boxes[64].angles = (0, 90, 0);

		boxes[65] = spawn("script_model", (-330, 333, 220));
    	boxes[65].angles = (0, 90, 0);

		boxes[66] = spawn("script_model", (-330, 293, 220));
    	boxes[66].angles = (0, 90, 0);

		boxes[67] = spawn("script_model", (-330, 253, 220));
    	boxes[67].angles = (0, 90, 0);

		boxes[68] = spawn("script_model", (-330, 213, 220));
    	boxes[68].angles = (0, 90, 0);

		boxes[69] = spawn("script_model", (-330, 173, 220));
    	boxes[69].angles = (0, 90, 0);

		boxes[70] = spawn("script_model", (-330, 133, 220));
    	boxes[70].angles = (0, 90, 0);

		boxes[71] = spawn("script_model", (-330, 93, 220));
    	boxes[71].angles = (0, 90, 0);

		boxes[72] = spawn("script_model", (-330, 53, 220));
    	boxes[72].angles = (0, 90, 0);

		boxes[73] = spawn("script_model", (-330, 13, 220));
    	boxes[73].angles = (0, 90, 0);

		boxes[74] = spawn("script_model", (-330, -27, 220));
    	boxes[74].angles = (0, 90, 0);

		boxes[75] = spawn("script_model", (-330, -67, 220));
    	boxes[75].angles = (0, 90, 0);

		boxes[76] = spawn("script_model", (-265, 493, 220));
    	boxes[76].angles = (0, 90, 0);

		boxes[77] = spawn("script_model", (-265, 453, 220));
    	boxes[77].angles = (0, 90, 0);

		boxes[78] = spawn("script_model", (-265, 413, 220));
    	boxes[78].angles = (0, 90, 0);

		boxes[79] = spawn("script_model", (-265, 373, 220));
    	boxes[79].angles = (0, 90, 0);

		boxes[80] = spawn("script_model", (-265, 333, 220));
    	boxes[80].angles = (0, 90, 0);

		boxes[81] = spawn("script_model", (-265, 293, 220));
    	boxes[81].angles = (0, 90, 0);

		boxes[82] = spawn("script_model", (-265, 253, 220));
    	boxes[82].angles = (0, 90, 0);

		boxes[83] = spawn("script_model", (-265, 213, 220));
    	boxes[83].angles = (0, 90, 0);

		boxes[84] = spawn("script_model", (-265, 173, 220));
    	boxes[84].angles = (0, 90, 0);

		boxes[85] = spawn("script_model", (-265, 133, 220));
    	boxes[85].angles = (0, 90, 0);

		boxes[86] = spawn("script_model", (-265, 93, 220));
    	boxes[86].angles = (0, 90, 0);

		boxes[87] = spawn("script_model", (-265, 53, 220));
    	boxes[87].angles = (0, 90, 0);

		boxes[88] = spawn("script_model", (-265, 13, 220));
    	boxes[88].angles = (0, 90, 0);

		boxes[89] = spawn("script_model", (-265, -27, 220));
    	boxes[89].angles = (0, 90, 0);

		boxes[90] = spawn("script_model", (-265, -67, 220));
    	boxes[90].angles = (0, 90, 0);

		//Weapons and Items

		//-----WEP-----
		
		//Underpass SDC right
		self thread SpawnWeapon("ballista_mp","Railgun",(-49,-998,-5));

		//SDC Stairs
		self thread SpawnWeapon("ballista_mp","Railgun",(-990,-1036,300));

		//Snipernest SEALS Left
		self thread SpawnWeapon("ballista_mp","Railgun",(677,925,286));

		//SEALS Spawn
		self thread SpawnWeapon("ballista_mp","Railgun",(851,3000,373));

		//SDC Spawn
		self thread SpawnWeapon("ksg_mp","Shotgun",(-1301,-2324,100));

		//Far SEALS left mid between boilers?
		self thread SpawnWeapon("ksg_mp","Shotgun",(1179,1182,75));

		//Balcony Mid
		self thread SpawnWeapon("usrpg_mp","Rocket Launcher",(-285,192,272));

		//SEALS Left Mid
		self thread SpawnWeapon("usrpg_mp","Rocket Launcher",(670,110,50));


		//-----ITEMS-----

		//RPG ammo Balcony
		self thread SpawnItem("t6_wpn_projectile_rpg7","Rocket Launcher Ammo",(-285,250,272),"ammo","rl");
		self thread SpawnItem("t6_wpn_projectile_rpg7","Rocket Launcher Ammo",(-285,130,272),"ammo","rl");

		//RPG ammo Helipad
		self thread SpawnItem("t6_wpn_projectile_rpg7","Rocket Launcher Ammo",(109,-940,263),"ammo","rl");
		self thread SpawnItem("t6_wpn_projectile_rpg7","Rocket Launcher Ammo",(109,-1000,263),"ammo","rl");

		//Shotgun ammo SDC Spawn
		self thread SpawnItem("p_glo_scavenger_pack","Shotgun Ammo",(-1284,-2243,100),"ammo","shotgun");

		//Shotgun Mid Car
		self thread SpawnItem("p_glo_scavenger_pack","Shotgun Ammo",(139,251,135),"ammo","shotgun");

		//Far left mid between boilers?
		self thread SpawnItem("p_glo_scavenger_pack","Shotgun Ammo",(1180,1261,70),"ammo","shotgun");
		self thread SpawnItem("p_glo_scavenger_pack","Shotgun Ammo",(1180,1094,70),"ammo","shotgun");

		//Snipernest Left
		self thread SpawnItem("t5_veh_rcbomb_gib_battery","Railgun Ammo",(756,925,280),"ammo","rg");

		//Heli Pad vents
		self thread SpawnItem("t5_veh_rcbomb_gib_battery","Railgun Ammo",(-90,-568,196),"ammo","rg");

		//SDC Stairs
		self thread SpawnItem("t5_veh_rcbomb_gib_battery","Railgun Ammo",(-990,-843,285),"ammo","rg");

		//SEALS factory side
		self thread SpawnItem("t5_veh_rcbomb_gib_battery","Railgun Ammo",(-900,830,290),"ammo","rg");

		//Underpass
		self thread SpawnItem("t5_veh_rcbomb_gib_battery","Railgun Ammo",(-68,-1103,-10),"ammo","rg");
		self thread SpawnItem("t5_veh_rcbomb_gib_battery","Railgun Ammo",(46,-905,-12),"ammo","rg");

		//SEALS Catwalk
		self thread SpawnItem("t6_attach_mag_type05_lmg_world","Machinegun Ammo",(-60,913,278),"ammo","mg");

		//SDC Stairway to Mid
		self thread SpawnItem("t6_attach_mag_type05_lmg_world","Machinegun Ammo",(253,-210,50),"ammo","mg");

		//SEALS Stairway to Mid
		self thread SpawnItem("t6_attach_mag_type05_lmg_world","Machinegun Ammo",(298,798,149),"ammo","mg");

		//SDC Beside Vent
		self thread SpawnItem("t6_attach_mag_type05_lmg_world","Machinegun Ammo",(-375,-575,78),"ammo","mg");

		//Under Balcony Mid
		self thread SpawnItem("p_glo_scavenger_pack_obj","Health Pack",(-315,251,64),"other","healthSmall");

		//SDC Spawn
		self thread SpawnItem("p_glo_scavenger_pack_obj","Health Pack",(-381,-864,36),"other","healthSmall");

		//SEALS Spawn
		self thread SpawnItem("p_glo_scavenger_pack_obj","Health Pack",(78,1948,176),"other","healthSmall");

		//SDC Right Mid
		self thread SpawnItem("p_glo_scavenger_pack_obj","Health Pack",(901,-133,56),"other","healthSmall");

		for(i = 0; i < boxes.size; i++)
		{
			boxes[i] setModel("t6_wpn_supply_drop_ally");
		}
	}
}

SpawnWeapon(Weapon,WeaponName,Location)

{
	

    weapon_model = getWeaponModel(Weapon);
    if(weapon_model=="") weapon_model = Weapon;

    Wep = spawn("script_model",Location);
    Wep setModel(weapon_model);

	
	

    for(;;)

    {
		Wep.angles = (level.angles);

		foreach(player in level.players)
		{
			Radius=distance(Location,player.origin);

			if(Radius < 60)
			{
				if(level.weapons.available == 1)
				{
					Wep Delete();
					level.weapons.available = 0;
					player thread pickupAndRespawnWep(Weapon,WeaponName,Location);
					wait 0.01;
					return;
				}
			}

			
		}

	wait 0.01;
    }
}

SpawnItem(Model,ItemName,Location,Type,ForWhat)

{

	Item = spawn("script_model",Location);
    Item setModel(Model);
	
	

    for(;;)

    {
		Item.angles = (level.angles);

		foreach(player in level.players)
		{
			Radius = distance(Location,player.origin);

			if(Radius < 60)
			{
				if(level.items.available == 1 && ForWhat != "healthSmall")
				{
					Item Delete();
					level.items.available = 0;
					player thread pickupAndRespawnItem(Model,ItemName,Location,Type,ForWhat);
					wait 0.01;
					return;
				}
				else if(level.items.available == 1 && ForWhat == "healthSmall" && self.health < 100)
				{
					Item Delete();
					level.items.available = 0;
					player thread pickupAndRespawnItem(Model,ItemName,Location,Type,ForWhat);
					wait 0.01;
					return;
				}
			}

			
		}

	wait 0.01;
    }
}

itemRotation()
{
	for(i = 0; i < 16; i++)
	{
		level.angles = (-60, 24 * i ,0);

		if(i == 15)
		{
			i = 0;
		}

		wait 0.1;
	}
}

pickupAndRespawnWep(Weapon,WeaponName,Location)
{
	self giveWeapon(Weapon);
	self switchToWeapon(Weapon);

	self IPrintLn("^3" + WeaponName + "^7 Acquired");

	level.weapon.available = 1;

	wait 5;
	self thread SpawnWeapon(Weapon,WeaponName,Location);
	return;
}

pickupAndRespawnItem(Model,ItemName,Location,Type,ForWhat)
{
	self IPrintLn("^3" + ItemName + "^7 Acquired");

		if(ForWhat == "rl")
		{
			self GiveMaxAmmo("usrpg_mp");
			wait 5;
			self thread SpawnItem(Model,ItemName,Location,Type,ForWhat);
			return;
		}

		else if(ForWhat == "shotgun")
		{
			self GiveMaxAmmo("ksg_mp");
			wait 5;
			self thread SpawnItem(Model,ItemName,Location,Type,ForWhat);
			return;
		}

		else if(ForWhat == "rg")
		{
			self GiveMaxAmmo("ballista_mp");
			wait 5;
			self thread SpawnItem(Model,ItemName,Location,Type,ForWhat);
			return;
		}

		else if(ForWhat == "mg")
		{
			self GiveMaxAmmo("tar21_mp");
			wait 5;
			self thread SpawnItem(Model,ItemName,Location,Type,ForWhat);
			return;
		}

	 	else if(ForWhat == "healthSmall")
	 	{
	 		self.health += 25;
	 		wait 5;
	 		self thread SpawnItem(Model,ItemName,Location,Type,ForWhat);
			return;
		}

		return;
}
