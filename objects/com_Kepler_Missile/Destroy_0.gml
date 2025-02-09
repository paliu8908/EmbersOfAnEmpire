/// @description Insert description here
// You can write your code in this editor
if(splash_radius > 0)
{

	var enemies = ds_list_create()
	
	collision_circle_list(mouse_x, mouse_y, splash_radius, com_unit, false, true, enemies, true);

	for(var _units = 0; _units < ds_list_size(enemies); _units++)
	{
		var _trooper = ds_list_find_value(enemies, _units)
		if(faction_number != _trooper.faction_number && damage - _trooper.block > 0)
		{
	
			_trooper.hp -= damage - _trooper.block;
		
		}
		
	}
	
	ds_list_destroy(enemies);
}