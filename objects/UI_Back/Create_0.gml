/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

disX =x;

disY = y;

image_yscale = 1;
image_xscale = 1.9;

if(ds_list_find_index(global.factions, "player") == 1) 
{
	sprite = Prox_UI_Panel;
}

else 
{
	sprite = UI_Panel;
	
}