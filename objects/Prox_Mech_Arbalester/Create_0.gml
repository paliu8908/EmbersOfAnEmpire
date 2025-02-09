/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = Arbalester_Select;

maxSprites = 1;

weapon = Prox_Arbalester_Laser;

sprite = Arbalester;

main_weapon_list = [
				//Side cannons
				// 0		1		2	   3		4	  5	 6	7  8  9  10  11    12 13 14 15  16 17 18, 19 
				[weapon, range, fireAngle, 0, reload_time, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, 0, 50, 5, 30],
				
				
				];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y 
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
				// rotation speed tranversal amount
				//		18					19
weapon_list = [
				//Missile
				// 0						1  2   3   4	5   6 7  8  9  10 11     12 13 14 15   16
				[Prox_Arbalester_Burst, range, 120, 0, 0.25, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, 0, 0,],
				[Prox_Arbalester_Burst, range, 120, 0, 0.25, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, 40, 0],
				];
				
Add_Skill_Options(self);
ds_list_add(buttons, com_button_ability5.id, com_button_ability6.id, com_button_ability7.id);