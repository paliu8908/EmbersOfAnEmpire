/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(ds_list_find_index(global.factions, "player") == 1)
{
	sprite = icon_Prox_Stop;
}

else {
	sprite = Icon_Ark_Stop;
}