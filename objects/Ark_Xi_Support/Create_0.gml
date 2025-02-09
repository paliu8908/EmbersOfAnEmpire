/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();

selectSprite = Xi_Support_Select;

maxSprites = 4;

weapon = Ark_Xi_Taser;

sprite = Xi_Support;

repair_amount = 10;

repairs = true;

abilities = [

			[Ark_Xi_EMP, "Attack", 60 * 15, 0, false, false, icon_Ark_EMP, 0, 750, true]
			
			];

		//		weapon	type	reload	counter	deploys recharged sprite duration range	unlocked
		//			0	  1			2		3	   4	5			6	   7		8      9

ds_list_add(buttons, com_button_ability5);

//shields

rechargeRate = 1;

shieldHealth = 0;

maxShield = 10;

shieldReduction = 1;

rechargeCounter = 0;

shieldSpriteRadius = 556;

shieldWidth = sprite_width + 10;

shieldHeight = sprite_height + 10;

shieldSprite = AlternateShield;

if(global.upgrades[faction_number][8] == 1)
{
	hasShield = true;
}