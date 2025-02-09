/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = spr_ross_crusier_select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Ross_Gauss;

sprite = spr_ross_crusier;

dmgReduction = 1;

main_weapon_list = [
				[Ark_Ross_Gauss, 1000, 5, 0, 6, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, -36, -1],
				[Ark_Ross_Gauss, 1000, 5, 0, 6, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 0, 42, -1],
				
				];
				
longShot = [
			[Ark_Ross_Gauss, 1000, 5, main_weapon_list[0][3], 6, 0, 1, main_weapon_list[0][7], 0, 0, 0, false, 0, 0, 0, 0, -36, -1],
			[Ark_Ross_Gauss, 1000, 5, main_weapon_list[0][3], 6, 0, 1, main_weapon_list[0][7], 0, 0, 0, false, 0, 0, 0, 0, 42, -1]
			];

fastShot = [
			[Ark_Ross_GaussFast, 500, 5, main_weapon_list[0][3], 0.5, 0, 1, main_weapon_list[0][7], 0, 0, 0, false, 0, 0, 0, 0, -36, -1],
			[Ark_Ross_GaussFast, 500, 5, main_weapon_list[0][3], 0.5, 0, 1, main_weapon_list[0][7], 0, 0, 0, false, 0, 0, 0, 0, 42, -1]
			];			
			
abilities = [

			//[noone, "Swap", 0, 0, 0, true]
			
			];
			//
				
slowShot = true;

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				
				];
				
minimapIcon = icon_light_ship;

ds_list_add(buttons, com_button_swap);

canSwap = true;

rechargeRate = 0.5;

shieldHealth = 45;

maxShield = shieldHealth;

shieldReduction = 1;

rechargeCounter = 0;

shieldSpriteRadius = 200;

shieldWidth = sprite_width + 10;

shieldHeight = sprite_height + 10;

shieldSprite = Shield;

if(global.upgrades[faction_number][24] == 1)
{
	for(var _w = 0; _w < array_length(longShot); _w++)
	{
		longShot[_w, 4] -= 2; 
	}
					
	for(var _w = 0; _w < array_length(fastShot); _w++)
	{
		fastShot[_w, 4] = 0.1; 
	}
					
	if(slowShot)
	{
		main_weapon_list = longShot;
	}
	else
	{
		main_weapon_list = fastShot;
	}
}

if(global.upgrades[faction_number][25] == 1)
{
	hasShield = true;
}

if(global.upgrades[faction_number][26] == 1)
{
	move_speed += 0.6;
}