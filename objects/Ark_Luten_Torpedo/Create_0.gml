/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

explodeType = explodeBig;

speedIncrease = 3/90;

reachedOutPt = false;

outPtx = -1;

outPty = -1;

if(global.upgrades[faction_number][15] == 1)
{
	bonusType = "ship";
}

if(global.upgrades[faction_number][16] == 1)
{
	move_speed = 7;
	
	speedIncrease = move_speed/30;
}