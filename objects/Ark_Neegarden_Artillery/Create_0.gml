/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = spr_Neegarden_select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Neegarden_Beam;

sprite = spr_Neegarden_artillery;

dmgReduction = 1;

atk_off_x = 0;

atk_off_y = 0;

shots = 5;

if_reload = 1;

main_weapon_list = [
					
					[Ark_Neegarden_Beam, range, fireAngle, shootAngle, reload_time, burst_delay, burst, 0, 0, 0, 0, false, 0, 0, 0, 0, 163, 0],

					];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				//Side cannons
				// 0					1	2	3	 4	5	 6	7  8  9  10 11     12 13 14 15   16
				
				
				];
				
minimapIcon = icon_light_ship;

rechargeRate = 1;

shieldHealth = 50;

maxShield = shieldHealth;

shieldReduction = 1;

rechargeCounter = 0;

shieldSpriteRadius = 200;

shieldWidth = sprite_width + 10;

shieldHeight = sprite_height + 10;

shieldSprite = Shield;

if(global.upgrades[faction_number][30] == 1)
{
	hasShield = true;
}

if(global.upgrades[faction_number][31] == 1)
{
	for(var _w = 0; _w < array_length(_unit.main_weapon_list); _w++)
	{
		main_weapon_list[_w, 1] += 500; 
	}
}

if(global.upgrades[faction_number][32] == 1)
{
	move_speed += 2;
}