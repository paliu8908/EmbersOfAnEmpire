// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function valid_target(UnitID){
	var enemies = ds_list_create();
	
	var _t = -1;
	
	collision_circle_list(mouse_x, mouse_y, 20, com_unit, false, true, enemies, true);
	
	while(_t == -1 && ds_list_size(enemies) > 0)
	{
		var _checkTarget = ds_list_find_value(enemies, 0);
		
		if(_checkTarget.faction_number != UnitID.faction_number)
		{
			_t = _checkTarget;
		}
		else
		{
			ds_list_delete(enemies, 0);
		}
	}
	
	ds_list_destroy(enemies);
	
	return _t;
}