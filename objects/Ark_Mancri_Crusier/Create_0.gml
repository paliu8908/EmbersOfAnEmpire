/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = spr_mancri_crusier_select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Mancri_Ion;

sprite = spr_mancri_crusier;

dmgReduction = 1;

main_weapon_list = [
				//Side cannons
				// 0		    	1	2  3  4  	5	 6	7  8  9  10  11     12 13 14 15   16
				[Ark_Mancri_Ion, 450, 22.5, 0, 3, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, 24, 100],
				[Ark_Mancri_Ion, 450, 22.5, 0, 3, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -7, 100]
				
				];

standReload = main_weapon_list[0, 4];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				//Missile
				// 0			        1  2  3	   4  5  6	7  8  9  10 11     12 13 14 15   16
			/*	[Ark_Mancri_Burst, 400, 80, 90, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -34, -1],
				[Ark_Mancri_Burst, 400, 80, -90, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 34, -1]*/
				
				];
				
minimapIcon = icon_light_ship;

reloadDecrease = 0.5;

reloadMin = 0.1;

//shields

rechargeRate = 4;

shieldHealth = 75;

maxShield = shieldHealth;

shieldReduction = 0.9;

rechargeCounter = 0;

hasShield = true;

shieldSpriteRadius = 200;

shieldWidth = sprite_width;

shieldHeight = sprite_height;

shieldSprite = Shield;

if(global.upgrades[faction_number][21] == 1)
{
	dmgReduction = 0.75;
}

if(global.upgrades[faction_number][22] == 1)
{
	for(var _w = 0; _w < array_length(main_weapon_list); _w++)
	{
		main_weapon_list[_w, 1] += 200;
	}
}

if(global.upgrades[faction_number][23] == 1)
{
	maxShield += 25;
	shieldReduction = 0.75;
	rechargeRate += 1;
}