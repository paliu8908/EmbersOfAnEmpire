/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = Reaper_Select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Prox_Reaper_Laser;

sprite = Reaper_Class_Third_Rater;

dmgReduction = 1;

main_weapon_list = [
				//Side cannons
				// 0		    	1	2  3  4  	5	 6	7  8  9  10  11     12 13 14 15   16
				[Prox_Reaper_Laser, range, fireAngle, shootAngle, reload_time, burst_delay, burst, 0, 0, 0, 0, false, 0, 0, 0, 0, 0, -7]
				
				];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				//Missile
				// 0			        1  2  3	   4  5  6	7  8  9  10 11     12 13 14 15   16
			/*	[Ark_Mancri_Burst, 400, 80, 90, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -34, -1],
				[Ark_Mancri_Burst, 400, 80, -90, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 34, -1]*/
				
				];
				
minimapIcon = icon_light_ship;