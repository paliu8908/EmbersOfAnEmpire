/// @description Insert description here
// You can write your code in this editor

if(ds_list_find_index(global.selection, self.id) != -1 && collision_circle(mouse_x, mouse_y, 20, com_button_deploy, false, false))
{
	
	if(if_move != 6)
	{
		if_shoot = false;
		
		if_move = 6;
	
		speed = 0;
	
		ds_list_clear(moveXList);
		ds_list_clear(moveYList);
	}
	else
	{
		if_move = 0;
	}
}


