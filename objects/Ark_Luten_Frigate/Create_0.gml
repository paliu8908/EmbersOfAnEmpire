/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = spr_luten_frigate_new_select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Luten_Torpedo;

sprite = spr_luten_frigate_new;

dmgReduction = 1;

main_weapon_list = [
				//Side cannons
				// 0					1		2	  3			4	  5	 6	7  8  9  10  11    12 13 14 15 16  17
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -15, -17, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 30, 1, 0, 0, 0, 0, false, 0, 0, 0, -15, -5, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 60, 1, 0, 0, 0, 0, false, 0, 0, 0, -15, 7, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 90, 1, 0, 0, 0, 0, false, 0, 0, 0, -15, 19, 0],
				
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 15, 1, 0, 0, 0, 0, false, 0, 0, 0, -11, -17, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 45, 1, 0, 0, 0, 0, false, 0, 0, 0, -11, -5, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 75, 1, 0, 0, 0, 0, false, 0, 0, 0, -11, 7, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 105, 1, 0, 0, 0, 0, false, 0, 0, 0, -11, 19, 0],
				
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 5, 1, 0, 0, 0, 0, false, 0, 0, 0, 9, -17, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 35, 1, 0, 0, 0, 0, false, 0, 0, 0, 9, -5, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 65, 1, 0, 0, 0, 0, false, 0, 0, 0, 9, 7, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 95, 1, 0, 0, 0, 0, false, 0, 0, 0, 9, 19, 0],
				
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 10, 1, 0, 0, 0, 0, false, 0, 0, 0, 13, -17, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 40, 1, 0, 0, 0, 0, false, 0, 0, 0, 13, -5, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 70, 1, 0, 0, 0, 0, false, 0, 0, 0, 13, 7, 0],
				[Ark_Luten_Torpedo, range, fireAngle, 0, reload_time, 100, 1, 0, 0, 0, 0, false, 0, 0, 0, 13, 19, 0]
				
				];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				//Missile
				// 0			   1  2	  3	 4	5   6	7  8  9  10 11     12 13 14 15   16

				];
				
minimapIcon = icon_light_ship;

if(global.upgrades[faction_number][17] == 1)
{
	move_speed += 1;
}