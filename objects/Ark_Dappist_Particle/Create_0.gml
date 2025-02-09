/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

explodeType = invisible;
		
hit = ds_list_create();

effect_dmg = 0.5/30

if(global.upgrades[faction_number][42] == 1)
{
	range += 300;
}

if(global.upgrades[faction_number][43] == 1)
{
	effect_dmg = 0.75/30;
}