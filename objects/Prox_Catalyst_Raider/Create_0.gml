/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = Catalyst_Raider_Select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Prox_Catalyst_AMatter;

sprite = Catalyst_Raider;

dmgReduction = 1;

main_weapon_list = [
				//Side cannons
				// 0		    	1	2  3  4  	5	 6	7  8  9  10  11     12 13 14 15   16
				[Prox_Catalyst_AMatter, 900, fireAngle, shootAngle, reload_time, burst_delay, burst, 0, 0, 0, 0, false, 0, 0, 0, 0, -54, 20]
				
				];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				//Missile
				// 0			        1  2  3	   4  5  6	7  8  9  10 11     12 13 14 15   16
				[Prox_Catalyst_Burst, 300, 50, 0, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -16, -10, 10],
				[Prox_Catalyst_Burst, 300, 50, 0, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 16, -10, 10]
				
				];
				
minimapIcon = icon_light_ship;