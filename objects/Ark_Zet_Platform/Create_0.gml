/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = Zeta_Mobile_Turret_Select;

maxSprites = 1;

weapon = Ark_Zeta_Neutrino;

sprite = Zeta_Mobile_Turret;

turretAngle = 0;

turretTurnAngle = 22.5;

turretRotation = 10/30;

ds_list_add(buttons, com_button_deploy);

abilities = [
				//[noone, "Deploy", 0, 0, 0, true]
			];
		//		weapon	type	reload	counter	range recharged
		//			0	  1			2		3	   4	5
		
rechargeRate = 2;

shieldHealth = 0;

maxShield = 20;

shieldReduction = 1;

rechargeCounter = 0;

shieldSpriteRadius = 556;

shieldWidth = sprite_width + 20;

shieldHeight = sprite_height + 20;

shieldSprite = AlternateShield;

if(global.upgrades[faction_number][11] == 1)
{
	turretTurnAngle = 45;
}

if(global.upgrades[faction_number][10] == 1)
{
	hasShield = true;
}

if(global.upgrades[faction_number][9] == 1)
{
	range += 500;
}
