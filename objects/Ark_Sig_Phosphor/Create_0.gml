/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

explodeType = explode;

colourOne = c_yellow;

colourTwo = c_yellow;

dmgIncreaseTime = 60 * 1; // 1 of a frame if running at 30 fps

dmgIncreaseAmount = 0.5;

dmgIncreaseCounter = 0;

sprite = Ace_Phosphor;

hit = ds_list_create();

if(global.upgrades[faction_number][6] == 1)
{
	range += 50;
}

if(global.upgrades[faction_number][7] == 1)
{
	damage += 0.25;
}