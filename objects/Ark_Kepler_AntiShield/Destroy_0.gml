/// @description Insert description here
// You can write your code in this editor
if(splash_radius > 0)
{

	var enemies = ds_list_create()
	
	collision_circle_list(mouse_x, mouse_y, splash_radius, com_unit, false, true, enemies, true);

	for(var _units = 0; _units < ds_list_size(enemies); _units++)
	{
		var _trooper = ds_list_find_value(enemies, _units)
		_trooper.shieldHealth = 0;
		
	}
	
	ds_list_destroy(enemies);
}