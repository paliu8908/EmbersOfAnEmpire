/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = spr_Hapten_Select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Hapten_Gauss;

sprite = spr_Hapten_battleship;

main_weapon_list = [
				//Side cannons
				// 0				1	2    3   4	5 6	7  8  9  10  11     12 13 14 15   16  17
				[Ark_Hapten_Gauss, 1200, 10, 0, 10, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -52 * image_yscale, -52 * image_xscale, 75],
				[Ark_Hapten_Gauss, 1200, 10, 0, 10, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -36 * image_yscale, -94 * image_xscale, 75],
				[Ark_Hapten_Gauss, 1200, 10, 0, 10, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 41 * image_yscale, -94 * image_xscale, 75],
				[Ark_Hapten_Gauss, 1200, 10, 0, 10, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 56 * image_yscale, -52 * image_xscale, 75]
				];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				//Missile
				// 0			   1  2	  3	 4	5   6	7  8  9  10 11     12 13 14 15   16
						
				[Ark_Hapten_Laser, 350, 24, 90, 6, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -17, -54, 0],
				[Ark_Hapten_Laser, 350, 24, 90, 6, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -24, -79, 0],
				[Ark_Hapten_Laser, 350, 24, 90, 6, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -34, 10, 0],
				[Ark_Hapten_Rocket, 500, 360, 90, 3, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -24, 26, 0],
				[Ark_Hapten_Rocket, 500, 360, 90, 3, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -2, 114, 0],
				
				[Ark_Hapten_Laser, 350, 24, -90, 6, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 17, -54, 0],
				[Ark_Hapten_Laser, 350, 24, -90, 6, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 24, -79, 0],
				[Ark_Hapten_Laser, 350, 24, -90, 6, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 34, 10, 0],
				[Ark_Hapten_Rocket, 500, 360, -90, 3, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 24, 26, 0],
				[Ark_Hapten_Rocket, 500, 360, -90, 3, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 2, 114, 0],
				
				/*[Ark_Hapten_Cannon, 750, 12, 90, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -34, -23, 35],
				[Ark_Hapten_Cannon, 750, 12, 90, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -29, 8, 35],
				[Ark_Hapten_Cannon, 750, 12, 90, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -17, 52, 35],
				
				[Ark_Hapten_Cannon, 750, 12, -90, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 34, -23, 35],
				[Ark_Hapten_Cannon, 750, 12, -90, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 29, 8, 35],
				[Ark_Hapten_Cannon, 750, 12, -90, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 17, 52, 35],*/
				];
				
minimapIcon = icon_heavy_ship;

abilityTargetx = 0;
abilityTargety = 0;

shootCounter = 0;

abilities = [

			[Ark_Hapten_Decimate, "Bombard", 60 * 60, 0, true, true, icon_Ark_Decimate, 10, 2200, false, 200, 10, false],
			[Ark_Hapten_Creeping, "Bombard", 60 * 60, 0, true, true, icon_Ark_Creeping, 10, 2200, false, 0, 10, false],
			[Ark_Hapten_Concentrate, "Bombard", 60 * 60, 0, true, true, icon_Ark_Concentrate, 10, 2200, false, 25, 10, false]
			
			];
			
			//[Ark_Hapten_Creeping, "Bombard", 60 * 60, 0, true, false, Icon_Ark_Plasma, 2200, 10, false],
			//[Ark_Hapten_Concetrate, "Bombard", 60 * 60, 0, true, false, icon_Ark_AntiShield, 2200, 10,  false]
			
		//		weapon	type	reload	counter	deploys recharged sprite duration range  active	radius timeAfter unlocked
		//			0	  1			2		3	   4		5		6		7	   8		9	  10	   11	    12

ds_list_add(buttons, com_button_ability5, com_button_ability6, com_button_ability7);



if(global.upgrades[faction_number][39] == 1)
{
	abilities[0][12] = true;
}


if(global.upgrades[faction_number][40] == 1)
{
	abilities[1][12] = true;
}


if(global.upgrades[faction_number][41] == 1)
{
	abilities[2][12] = true;
}