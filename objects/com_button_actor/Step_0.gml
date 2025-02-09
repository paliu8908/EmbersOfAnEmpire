/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(slot <= -1)
{
	visible = false;
}

/*if(slot == 0)
{
	x = UI_Back.x - 628;
	
	y = UI_Back.y - 75;
	
	visible = true;
}*/

if(slot < 6)
{
	x = UI_Back.x + 75 + (slot) * 100;
	
	y = UI_Back.y - 90;
	
	visible = true;
}

else if(slot < 12)
{
	x = UI_Back.x + 75  + (slot - 6) * 100;
	
	y = UI_Back.y - 90 + 100;
	
	visible = true;
}
else
{
	x = UI_Back.x + 75  + (slot - 12) * 100;
	
	y = UI_Back.y - 90 + 200;
	
	visible = true;
}