/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = spr_corot_select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Corot_Missile;

sprite = spr_corot_corvette;

dmgReduction = 1;

main_weapon_list = [
				//Side cannons
				// 0					1	2 3 4	5	 6	7  8  9  10  11     12 13 14 15   16 17
				[Ark_Corot_Missile, 300, 180, 90, 2, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -15, 36, 0],
				[Ark_Corot_Missile, 300, 180, -90, 2, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 15, 36, 0],
				[Ark_Corot_Missile, 300, 180, 90, 2, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -37, 12, 0],
				[Ark_Corot_Missile, 300, 180, -90, 2, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 37, 12, 0]
				
				];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y, inaccuracy
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16			17
weapon_list = [
				//Missile
				// 0					1	2	3	 4	5	 6	7  8  9  10 11     12 13 14 15   16


				];
				
minimapIcon = icon_light_ship;

if(global.upgrades[faction_number][14] == 1)
{
	array_insert(main_weapon_list, 0, 
		[Ark_Corot_Missile, 300, 180, 90, 2, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -45, -12, 0]
		)
					
	array_insert(main_weapon_list, 0, 
		[Ark_Corot_Missile, 300, 180, 90, 2, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 45, -12, 0]
		)
}

if(global.upgrades[faction_number][13] == 1)
{
	block += 1;
}

if(global.upgrades[faction_number][12] == 1)
{
	move_speed += 2.5;
}

