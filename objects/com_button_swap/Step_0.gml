/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(slot >= 0 && instance_exists(ds_list_find_value(global.primarySelect, 0)))
{
	if_able = ds_list_find_value(global.primarySelect, 0).canSwap;
}