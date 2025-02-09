/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = spr_Gliese_Destroyer_Select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Destroyer_Beam;

sprite = spr_Gliese_Destroyer;

multiShot = [
				//Side cannons
				// 0					1	2 3 4	5	 6	7  8  9  10  11     12 13 14 15   16  17 
				[Ark_Destroyer_Beam, 400, 360, 0, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -46, 0, true],
				[Ark_Destroyer_Beam, 400, 360, 60, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -46, 0, true],
				[Ark_Destroyer_Beam, 400, 360, 120, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -46, 0, true],
				[Ark_Destroyer_Beam, 400, 360, 0, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -20, 0, true],
				[Ark_Destroyer_Beam, 400, 360, 60, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -20, 0, true],
				[Ark_Destroyer_Beam, 400, 360, 120, 4, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -20, 0, true],
				
				]; 
				
focusWeapons = [
				[Ark_Destroyer_BeamFocus, 800, 360, 0, 5, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -46, 0],
				[Ark_Destroyer_BeamFocus, 800, 360, 0, 5, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -20, 0]
				
			];

main_weapon_list = multiShot;

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				//Missile
				// 0			   1  2	  3	 4	5   6	7  8  9  10 11     12 13 14 15   16
						
				//[Ark_Eridani_Burst, 300, 15, 90, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -42, -7, 50]
				];
				
abilities = [

			//[noone, "Swap", 0, 0, 0, true]
			
			];
				
minimapIcon = icon_light_ship;

targetList = ds_list_create();

focusShot = false;

ds_list_add(buttons, com_button_swap);

canSwap = false;

if(global.upgrades[faction_number][18] == 1)
{
	canSwap = true;
}

if(global.upgrades[faction_number][19] == 1)
{
	for(var _w = 0; _w < array_length(multiShot); _w++)
	{
		multiShot[_w, 1] += 100; 
	}
					
	for(var _w = 0; _w < array_length(focusWeapons); _w++)
	{
		focusWeapons[_w, 1] += 200; 
	}
	
	main_weapon_list = _unit.multiShot;
}

if(global.upgrades[faction_number][20] == 1)
{
	move_speed += 1
}