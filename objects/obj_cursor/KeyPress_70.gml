/// @description Insert description here
// You can write your code in this editor
if(ds_list_size(global.selection) > 0 && array_length(ds_list_find_value(global.primarySelect, 0).abilities) > 0)  
{
	keyDown[4] = true;
	check_for_activation(4);
}
