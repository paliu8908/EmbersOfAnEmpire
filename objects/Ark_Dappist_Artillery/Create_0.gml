/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = Spr_Dappist_Cannon_Select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Dappist_Particle;

sprite = spr_Dappist_Cannon;

dmgReduction = 1;

main_weapon_list = [
				[Ark_Dappist_Particle, 1000, 25, 0, 2, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, 0, 0]
				// 0				     1	 2	 3	4  5   6  7 8   9 10  11    12 13  14 15 16   17  18
				
				];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				];
				
minimapIcon = icon_heavy_ship;

rechargeRate = 10;

shieldHealth = 200;

maxShield = shieldHealth;

shieldReduction = 1;

rechargeCounter = 0;

hasShield = true;

shieldSpriteRadius = 200;

shieldWidth = sprite_width + 500;

shieldHeight = sprite_height + 500;

shieldSprite = Shield;

abilities = [
	
			];
			
		//		weapon	type	reload	counter	deploys recharged sprite duration  start x start y1 start y2	end x end y1  end y2	 
		//			0	  1			2		3	   4		5		6		7		8			9		 10		11		12		13
		
if(global.upgrades[faction_number][42] == 1)
{
	for(var _w = 0; _w < array_length(main_weapon_list); _w++)
	{
		main_weapon_list[_w, 1] += 300; 
	}
}


if(global.upgrades[faction_number][44] == 1)
{
	move_speed += 1;
}