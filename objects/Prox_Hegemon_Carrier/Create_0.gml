/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = Hegemon_Select;

maxSprites = 1;

//main weapon, then secondaries
weapon = noone;

sprite = Hegemon;

main_weapon_list = [
				
				// 0				1	2	3	4  5   6  7 8   9 10  11    12 13  14 15 16   17  18
				
				];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				];
				
minimapIcon = icon_heavy_ship;

rechargeRate = 10;

shieldHealth = 500;

maxShield = shieldHealth;

shieldReduction = 1;

rechargeCounter = 0;

hasShield = true;

shieldSpriteRadius = 200;

shieldWidth = sprite_width + 500;

shieldHeight = sprite_height + 500;

shieldSprite = Shield;

image_xscale = 2;
image_yscale = 2;

abilities = [	
				[Prox_Mining_Station, "Spawn", 30 * 5, 0, false, true, icon_Prox_Station, 0, 500, true, 50] //(last one is cost)
			];
			
		//		weapon	type	reload	counter	deploys recharged sprite duration  start x start y1 start y2	end x end y1  end y2 unlocked 
		//			0	  1			2		3	   4		5		6		7		8			9		 10		11		12		13     14
		
ds_list_add(buttons, com_button_ability1);

modules = [
			[noone, 150, -210],
			[noone, 150, 210],
			[noone, 42, -150],
			[noone, 42, 150]
			];

		// 0: object, 1 : x, 2 : y
