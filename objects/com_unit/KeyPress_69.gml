/// @description Insert description here
// You can write your code in this editor
if(ds_list_find_index(global.selection, self.id) != -1)
{
	if_shoot = false;
		
	if_move = 5;
	
	speed = 0;
	
	ds_list_clear(moveXList);
	ds_list_clear(moveYList);
}