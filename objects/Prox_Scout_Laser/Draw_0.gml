 /// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

if(if_ready && instance_exists(target) && distance_to_object(target) <= range)
{
	ds_list_clear(hit);
		
	collision_line_list(x, y, target.x, target.y, com_unit, false, false, hit, true);
		
	var missileList = ds_list_create();
		
	collision_line_list(x, y, target.x, target.y, com_missile, false, false, missileList, true);
		
	for(var m = 0; m < ds_list_size(missileList); m++)
	{
		ds_list_add(hit, ds_list_find_value(missileList, m));
	}
		
	var bombList = ds_list_create();
		
	collision_line_list(x, y, target.x, target.y, com_bomb, false, false, bombList, true);
		
	for(var m = 0; m < ds_list_size(bombList); m++)
	{
		ds_list_add(hit, ds_list_find_value(bombList, m));
	}
		
	ds_list_sort(hit, true);
		
	hitUnit = ds_list_find_value(hit, 0);
	
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
	
		draw_line_width_color(x, y, _hitUnit.x, _hitUnit.y, 5, colourOne, colourTwo);
	}
	else if(instance_exists(target) && target.faction_number != faction_number)
	{
		draw_line_width_color(x, y, target.x, target.y, 5, colourOne, colourTwo);
	}
	
	ds_list_destroy(missileList);
	ds_list_destroy(bombList);
}