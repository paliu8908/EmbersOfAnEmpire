/// @description Insert description here
// You can write your code in this editor
var tarDis = distance_to_object(target);
var ptDis = distance_to_point(move_x, move_y);

if(if_ready && instance_exists(target) && tarDis <= range)
{
	 hitD = ds_list_create();
		
	collision_line_list(x, y, target.x, target.y, com_unit, false, false, hitD, true);
	
	var _hitUnit = ds_list_find_value(hitD, 0);
	
	if(_hitUnit == undefined)
	{
		_hitUnit = 0;
	}
	
	var check = 1;
	
	while(check < ds_list_size(hitD) && instance_exists(_hitUnit) && _hitUnit.faction_number == self.faction_number)
	{
		_hitUnit = ds_list_find_value(hitD, check);	
		
		check++;	
	}
	
	if(check > ds_list_size(hitD) || !instance_exists(_hitUnit))
	{
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, _hitUnit.x, _hitUnit.y, width, colourOne, colourOne);
		
		draw_set_color(c_white);
	}
	
	else if(instance_exists(_hitUnit) && _hitUnit.faction_number != faction_number)
	{
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, _hitUnit.x, _hitUnit.y, width, colourOne, colourOne);
		
		draw_set_color(c_white);
	}
	
	else if(instance_exists(target) && target.faction_number != faction_number)
	{
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, target.x, target.y, width, colourOne, colourOne);
		draw_set_color(c_white);
	}
}
else if(if_ready)
{
		
	collision_line_list(x, y, move_x, move_y, com_unit, false, false, hitD, true);
	
	var _hitUnit = ds_list_find_value(hitD, 0);
	
	if(_hitUnit == undefined)
	{
		_hitUnit = 0;
	}
	
	var check = 1;
	
	while(check < ds_list_size(hitD) && instance_exists(_hitUnit) && _hitUnit.faction_number == self.faction_number)
	{
		_hitUnit = ds_list_find_value(hitD, check);	
		
		check++;	
	}
	
	if(check > ds_list_size(hitD) && !instance_exists(_hitUnit))
	{
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, _hitUnit.x, _hitUnit.y, width, colourOne, colourOne);
		
		draw_set_color(c_white);
	}
	
	else if(instance_exists(_hitUnit) && _hitUnit.faction_number != faction_number)
	{
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, _hitUnit.x, _hitUnit.y, width, colourOne, colourOne);
		
		draw_set_color(c_white);
	}
	else
	{
		
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, move_x, move_y, width, colourOne, colourOne);
		
		draw_set_color(c_white);
	}
}
