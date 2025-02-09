/// @description Insert description here
// You can write your code in this editor

if(if_ready && instance_exists(target) && distance_to_object(target) <= range)
{
	var hit = ds_list_create();
		
	collision_line_list(x, y, target.x, target.y, com_unit, false, false, hit, true);
	
	var _hitUnit = ds_list_find_value(hit, 0);
	
	if(_hitUnit == undefined)
	{
		_hitUnit = 0;
	}
	
	var check = 1;
	
	while(check < ds_list_size(hit) && instance_exists(_hitUnit) && _hitUnit.faction_number == self.faction_number)
	{
		_hitUnit = ds_list_find_value(hit, check);	
		
		check++;	
	}
	
	if(check > ds_list_size(hit) || !instance_exists(_hitUnit))
	{
		instance_destroy();
	}
	
	else if(_hitUnit.faction_number != faction_number)
	{
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, _hitUnit.x, _hitUnit.y, width, colourOne, colourOne);
		
		draw_set_color(c_white);
	}
	else if(instance_exists(target) && target.faction_number != faction_number)
	{
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, _hitUnit.x, _hitUnit.y, width, colourOne, colourOne);
		
		draw_set_color(c_white);
	}
	
	ds_list_destroy(hit);
}