 
var enemies = ds_list_create()
	
collision_circle_list(mouse_x, mouse_y, 20, com_unit, false, true, enemies, true);

if(ds_list_size(enemies) != 0)
{
	var _checkTarget = ds_list_find_value(enemies, 0)
		
	if(_checkTarget.faction_number != self.faction_number)
	{
		for(var _u = 0; _u < ds_list_size(global.selection); _u++)
		{
			var _uni = ds_list_find_value(global.selection, _u);
				
			if(instance_exists(_uni) && !_uni.stun && _uni.type != "structure")
			{
				if(keyboard_check(vk_shift) == false)
				{
					ds_list_clear(_uni.attackTargets);
				}
			
				ds_list_add(_uni.attackTargets, _checkTarget);
			
				if(ds_list_size(_uni.attackTargets) == 1)
				{
					_uni.target = _checkTarget;
				
					_uni.target_x = _checkTarget.x;
		
					_uni.target_y = _checkTarget.y;
			
					_uni.if_shoot = true;
				
					_uni.atkOrder = true;
				
					_uni.patrol = false;
				
					_uni.if_move = 3;
				
				}
			}
		}
			
	}
	else
	{
		for(var _u = 0; _u < ds_list_size(global.selection); _u++)
		{
			var _uni = ds_list_find_value(global.selection, _u);
				
			if(instance_exists(_uni) && _uni.repairs && _uni.type != "structure")
			{
				if(keyboard_check(vk_shift) == false)
				{
					ds_list_clear(_uni.attackTargets);
				}
			
				ds_list_add(_uni.attackTargets, _checkTarget);
			
				if(ds_list_size(_uni.attackTargets) == 1 && !_uni.stun)
				{
					_uni.target = _checkTarget;
				
					_uni.target_x = _checkTarget.x;
		
					_uni.target_y = _checkTarget.y;
			
					_uni.if_shoot = true;
				
					_uni.atkOrder = true;
				
					_uni.patrol = false;
				
					_uni.if_move = 3;
				
				}
			}
		}
	}
		
}
else
{
	for(var _u = 0; _u < ds_list_size(global.selection); _u++)
	{
		var _uni = ds_list_find_value(global.selection, _u);
				
		if(instance_exists(_uni) && _uni.type != "structure")
		{
			if(keyboard_check(vk_shift) == false)
			{
				ds_list_clear(_uni.moveXList);
				ds_list_clear(_uni.moveYList);
			}
		
			var spot = ds_list_find_index(global.selection, _uni);
		
			var size = ds_list_size(global.selection);
		
			var _rows = floor(sqrt(size));
		
			var _columns = floor(size/_rows);
		
			//sqrt(global.selection) gives rows, % gives columns.
			ds_list_add(_uni.moveXList, mouse_x + _columns * 0.5 * _uni.unitSpread - floor(spot%_rows) * _uni.unitSpread);
			ds_list_add(_uni.moveYList, mouse_y + _rows * 0.5 * _uni.unitSpread - floor(spot/_rows) * _uni.unitSpread);
		
			if(ds_list_size(_uni.moveXList) == 1 && !_uni.stun)
			{ 
				_uni.move_x = ds_list_find_value(_uni.moveXList, 0);
				_uni.move_y = ds_list_find_value(_uni.moveYList, 0);

				_uni.if_move = 1;
				
				if(_uni.speed < _uni.move_speed - _uni.acceleration)
				{
					_uni.speed += _uni.acceleration;
				}
				else if(_uni.speed < _uni.move_speed)
				{
					_uni.speed = _uni.move_speed;
				}
				
				_uni.patrol = false;
				
				_uni.atkOrder = false;
				
				_uni.if_shoot = false;
				
				_uni.target = 0;
			
			}
		}
	}
}

ds_list_destroy(enemies);