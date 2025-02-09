 /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = spr_kepler_crusier_select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Kepler_Scan_Field;

sprite = spr_kepler_crusier;

dmgReduction = 1;

main_weapon_list = [
				//Side cannons
				// 0		    		1	   2  3  4 	5	 6	7  8  9  10  11     12 13 14 15   16
				[Ark_Kepler_Scan_Field, 1500, 360, 0, 6, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, 17, 40]
				
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

supplyRange = 200

abilities = [

			[Ark_Kepler_EMP_Missile, "AmmoSplashMissile", -1, 0, false, false, icon_Ark_EMP, 15, 2000, true],
			[Ark_Kepler_Plasma_Missile, "AmmoSplashMissile", -1, 0, false, false, Icon_Ark_Plasma, 15, 2000, true],
			[Ark_Kepler_AntiShield, "AmmoSplashMissile", -1, 0, false, false, icon_Ark_AntiShield, 15, 2000, true],
			[Ark_Kepler_SlowField, "AmmoSplashMissile", -1, 0, false, false, Icon_Ark_Slow, 15, 2000, true],
			[Ark_Kepler_EMP_Missile, "Arm", -1, 0, false, false, icon_Ark_EMP_Arm, Ark_Arms_Storage, supplyRange, true],
			[Ark_Kepler_Plasma_Missile, "Arm", -1, 0, false, false, Icon_Ark_Plasma_Arm, Ark_Arms_Storage, supplyRange, true],
			[Ark_Kepler_AntiShield, "Arm", -1, 0, false, false, icon_Ark_AntiShield_Arm, Ark_Arms_Storage, supplyRange, true],
			[Ark_Kepler_SlowField, "Arm", -1, 0, false, false, Icon_Ark_Slow_Arm, Ark_Arms_Storage, supplyRange, true]
			
			];

		//		weapon	type	reload	counter	deploys recharged sprite  duration range unlocked
		//			0	  1			2		3	   4		5		6		7		8		9

ds_list_add(buttons, com_button_ability5, com_button_ability6, com_button_ability7, com_button_ability8, com_button_ability9, com_button_ability10, com_button_ability11, com_button_ability12);

ammo = []

storage = 3