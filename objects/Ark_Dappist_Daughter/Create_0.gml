/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

explodeType = invisible;

effect_dmg = 0.5/30;

if(global.upgrades[owner_faction_number][42] == 1)
{
	range += 50;
}

if(global.upgrades[owner_faction_number][43] == 1)
{
	effect_dmg = 0.75/30;
}