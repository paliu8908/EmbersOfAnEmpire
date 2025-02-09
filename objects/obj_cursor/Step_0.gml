/// @description Insert description here
// You can write your code in this editor
x = mouse_x

y = mouse_y

/*if(time_down = 1)
{
	global.ifmbdown = 1;
	
	if(global.mx = 0 && global.my = 0)
	{
		global.mx = mouse_x;

		global.my = mouse_y;
	}
}*/


var enemies = ds_list_create();

collision_point_list(mouse_x, mouse_y, com_unit, false, true, enemies, false)

if(ds_list_size(enemies) < 1)
{
	collide_enemy = false
	
	press_unit = false
}

ds_list_destroy(enemies);