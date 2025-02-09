/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = Fighter_Select;

maxSprites = 4;

weapon = Ark_Fighter_burst;

sprite = Fighter;

if(global.upgrades[faction_number][0] == 1)
{
	stunResist = 1.5;
}

if(global.upgrades[faction_number][2] == 1)
{
	turnRate += 5;
	move_speed += 0.25;
}