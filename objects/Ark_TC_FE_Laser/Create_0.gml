/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

explodeType = explode;

colourOne = c_yellow;

colourTwo = c_yellow; 

dmgIncreaseAmount = 1/30;

sprite = Ace_Phosphor;

hit = ds_list_create();

if(global.upgrades[faction_number][38] == 1)
{
	range += 700;
}

if(global.upgrades[faction_number][37] == 1)
{
	dmgIncreaseAmount = 1.25/30;
}