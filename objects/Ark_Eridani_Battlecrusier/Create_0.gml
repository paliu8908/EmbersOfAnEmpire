/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = spr_Eridani_select;

maxSprites = 4;

//main weapon, then secondaries
weapon = Ark_Eridani_Particle;

sprite = spr_Eridani_battlecruiser;

main_weapon_list = [
				//Side cannons
				// 0					1	2 3 4	5	 6	7  8  9  10  11     12 13 14 15   16  17
				[Ark_Eridani_Particle, 1800, 10, 0, 8, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 2, -59, 50],
				[Ark_Eridani_Particle, 1800, 10, 0, 8, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 2, -41, 50],
				[Ark_Eridani_Particle, 1800, 10, 0, 8, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 2, -23, 50]
				
				];

				//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
				//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16
weapon_list = [
				//Missile
				// 0			   1  2	  3	 4	5   6	7  8  9  10 11     12 13 14 15   16
						
				[Ark_Eridani_Burst, 300, 30, 90, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -42, -7, 50],
				[Ark_Eridani_Burst, 300, 30, 90, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -42, 17, 50],
				[Ark_Eridani_Burst, 300, 30, -90, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 39, -7, 50],
				[Ark_Eridani_Burst, 300, 30, -90, 1, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 39, 17, 50]
				];
				
minimapIcon = icon_heavy_ship;

self_repair = false;
repair_counter = 0;
repair_time = 30;
repair_amount = 1;

rechargeRate = 1;

shieldHealth = 50;

maxShield = shieldHealth;

shieldReduction = 0.9;

rechargeCounter = 0;

shieldSpriteRadius = 200;

shieldWidth = sprite_width + 10;

shieldHeight = sprite_height + 10;

shieldSprite = Shield;

if(global.upgrades[faction_number][27] == 1)
{
	block += 2;
}

if(global.upgrades[faction_number][28] == 1)
{
	hasShield = true;
}

if(global.upgrades[faction_number][29] == 1)
{
	self_repair = true;
}