#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include maps\mp\gametypes\_rank;

init()
{
	SetDvar("jump_slowdownEnable", 0);
	SetDvar("g_speed",320);
	SetDvar("friction",6.0);
	SetDvar("perk_weapSpreadMultiplier", -100);
	SetDvar("perk_healthRegenMultiplier", -100);
	SetDvar("perk_weapAdsMultiplier", 1000);

	//Map Edits and Weapon and Item Pickups + Respawning
	self thread maps\mp\_ambientpackage::init();

	level.clientid = 0;
	level thread onplayerconnect();
}

onplayerconnect()
{
	for ( ;; )
	{
		level waittill("connecting", player );
		player.clientid = level.clientid;	
		level.clientid++;
		player thread onplayerspawned();
	}
}

onplayerspawned()
{
	level endon("game_ended");
    self endon("disconnect");

	isFirstSpawn = true;
	for(;;)
	{
		self waittill("spawned_player");
		self thread movementTech();
		self thread hudStuff();
		self thread loadoutAdjustments();
		
		if(isFirstSpawn)
		{
			initOverFlowFix();
			isFirstSpawn = false;
		}
	}
}

movementTech()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
    self endon( "death" );
	
	//Debug
	//self FreezeControls(false);

	self AllowSprint(false);

	level.velMult = 0;

	self thread comboJumps();

	for(;;)
	{

		curVel = self GetVelocity();
		fSpeed = Floor((Sqrt(Pow(curVel[0], 2.0) + Pow(curVel[1], 2.0))));

		angles = self GetAngles();

		xForce = Cos(angles[1]) * (fspeed / 5) + (10 * level.velMult);
		zForce = Sin(angles[1]) * (fspeed / 5) + (10 * level.velMult);



		if(!self IsOnGround() && gainSpeed)
		{
			self setVelocity(self getVelocity() + (xForce, zForce, 0));
			gainSpeed = false;

			//DEBUG PRINTS

			//self IPrintLn("Force X: ^1" + xForce +"\nForce Z: ^2" + zForce + "\nVelMult: ^3" + level.velMult);
			//self IPrintLn("Coords: ^3" + self GetOrigin() + "\nAngle: ^2" + angles[1]);
		}
		else if(self IsOnGround() && !gainSpeed)
		{
			gainSpeed = true;
			if(self JumpButtonPressed())
			{
				Self SetVelocity(self GetVelocity() + (0,0,200));
			}
		}

		wait 0.008;
	}
}

comboJumps()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
    self endon( "death" );

	for(;;)
	{
		wait 0.35;

		if(self IsOnGround())
		{
			level.velMult = 0;
		}
		else
		{
			level.velMult += 1;
		}
	}

}

hudStuff()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
    //self endon( "death" );

	velocityText = self createText("default",1.75,"CENTER","BOTTOM",0,-10,1,curVel);
	healthText = self createText("default",1.75,"CENTER","RIGHT",0,-10,1,self.health);
	velColor = "^1";

	for(;;)
	{
		curTeam = self GetTeam();
		curHP = self.health;

		//UPS Hud
		curVel = self GetVelocity();
		fSpeed = Floor((Sqrt(Pow(curVel[0], 2.0) + Pow(curVel[1], 2.0))));

		if(fSpeed <= 100)
		{
			velColor = "^1";
		}
		else if(fSpeed > 100 && fSpeed <= 250)
		{
			velColor = "^3";
		}
		else
		{
			velColor = "^2";
		}

		velocityText setText("UPS: " + velColor + fSpeed);

		healthText setText(self.health);



		wait 0.01;
		clearStrings();
	}

} 

loadoutAdjustments()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
    //self endon( "death" );

	self AllowAds(false);

	self TakeAllWeapons();
	self ClearPerks();

	self GiveWeapon("tar21_mp");
	self SwitchToWeapon("tar21_mp");

	self SetPerk("specialty_bulletaccuracy");
	self SetPerk("specialty_healthregen");
	self SetPerk("specialty_fallheight");
	self SetPerk("specialty_fastmantle");
	self SetPerk("specialty_fastladderclimb");
	self SetPerk("specialty_fastweaponswitch");
	self SetPerk("specialty_fastads");
}

//Overflow Fix - not by me, credits to unknown

createText(font, fontscale, align, relative, x, y, sort, text)
{
	textElem = CreateFontString( font, fontscale );
	textElem setPoint( align, relative, x, y );
	textElem.sort = sort;
	textElem.hideWhenInMenu = true;

	textElem.type = "text";
	addTextTableEntry(textElem, getStringId(text));
	textElem setSafeText(self, text);

	return textElem;
}


initOverFlowFix()
{
	self.stringTable = [];
	self.stringTableEntryCount = 0;
	self.textTable = [];
	self.textTableEntryCount = 0;

	if(isDefined(level.anchorText) == false)
	{
		level.anchorText = createServerFontString("default",1.5);
		level.anchorText setText("anchor");
		level.anchorText.alpha = 0;

		level.stringCount = 0;
	}
}

clearStrings()
{
	level.anchorText clearAllTextAfterHudElem();
	level.stringCount = 0;
	self purgeTextTable();
	self purgeStringTable();
	self recreateText();
}

setSafeText(player, text)
{
	stringId = player getStringId(text);

	if(stringId == -1)
	{
		player addStringTableEntry(text);
		stringId = player getStringId(text);
	}

	player editTextTableEntry(self.textTableIndex, stringId);

	if(level.stringCount > 50)
	clearStrings();

	self setText(text);
}

recreateText()
{
	foreach(entry in self.textTable)
	entry.element setSafeText(self, lookUpStringById(entry.stringId));
}

addStringTableEntry(string)
{
	entry = spawnStruct();
	entry.id = self.stringTableEntryCount;
	entry.string = string;

	self.stringTable[self.stringTable.size] = entry;
	self.stringTableEntryCount++;
	level.stringCount++;
}

lookUpStringById(id)
{
	string = "";

	foreach(entry in self.stringTable)
	{
		if(entry.id == id)
		{
			string = entry.string;
			break;
		}
	}

	return string;
}

getStringId(string)
{
	id = -1;

	foreach(entry in self.stringTable)
	{
		if(entry.string == string)
		{
			id = entry.id;
		}
		break;
	}
return id;
}

getStringTableEntry(id)
{
	stringTableEntry = -1;

	foreach(entry in self.stringTable)
	{
		if(entry.id == id)
		{
			stringTableEntry = entry;
			break;
		}
	}

return stringTableEntry;
}

purgeStringTable()
{
	stringTable = [];

	foreach(entry in self.textTable)
	stringTable[stringTable.size] = getStringTableEntry(entry.stringId);

	self.stringTable = stringTable;
}

purgeTextTable()
{
	textTable = [];

	foreach(entry in self.textTable)
	{
		if(entry.id != -1)
		textTable[textTable.size] = entry;
	}

	self.textTable = textTable;
}

addTextTableEntry(element, stringId)
{
	entry = spawnStruct();
	entry.id = self.textTableEntryCount;
	entry.element = element;
	entry.stringId = stringId;

	element.textTableIndex = entry.id;

	self.textTable[self.textTable.size] = entry;
	self.textTableEntryCount++;
}

editTextTableEntry(id, stringId)
{
	foreach(entry in self.textTable)
	{
		if(entry.id == id)
		{
			entry.stringId = stringId;
			break;
		}
	}
}

deleteTextTableEntry(id)
{
	foreach(entry in self.textTable)
	{
		if(entry.id == id)
		{
			entry.id = -1;
			entry.stringId = -1;
		}
	}
}

clear(player)
{
	if(self.type == "text")
	player deleteTextTableEntry(self.textTableIndex);

	self destroy();
}
