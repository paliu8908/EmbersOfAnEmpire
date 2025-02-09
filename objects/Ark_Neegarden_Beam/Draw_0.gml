/// @description Insert description here
// You can write your code in this editor
_wpnOffX = sqrt(sqr(turOffX)+sqr(turOffY)) * sin(degtorad((darctan2(turOffX, turOffY) + owner.direction)));
_wpnOffY = sqrt(sqr(turOffX)+sqr(turOffY)) * cos(degtorad((darctan2(turOffX, turOffY) + owner.direction)));
	
x = owner.x + _wpnOffX;
y = owner.y + _wpnOffY;

move_x = x + range * cos(degtorad(owner.direction));
move_y = y - range * sin(degtorad(owner.direction));

if(if_ready)
{
	 hitD = ds_list_create();
		
	collision_line_list(x, y, move_x, move_y, com_unit, false, false, hitD, true);
	
	var _hitUnit = ds_list_find_value(hitD, 0);
	
	var check = 0;
			
	if(_hitUnit == undefined)
	{
		_hitUnit = 0;
	}
		
	while(check < ds_list_size(hitD) && _hitUnit.faction_number == faction_number)
	{
		ds_list_delete(hitD, 0);
			
		_hitUnit = ds_list_find_value(hitD, 0);			
	}
	
	if(instance_exists(_hitUnit) && _hitUnit.faction_number != faction_number)
	{
		var len = point_distance(x, y, _hitUnit.x, _hitUnit.y);
		var drawX = x + len * cos(degtorad(owner.direction));
		var drawY = y - len * sin(degtorad(owner.direction));
		
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, drawX, drawY, width, colourOne, colourTwo);
		
		draw_set_color(c_white);
	}
	else
	{
		draw_set_color(colourOne);
		
		draw_line_width_color(x, y, move_x, move_y, width, colourOne, colourTwo);
		
		draw_set_color(c_white);
	}
}

