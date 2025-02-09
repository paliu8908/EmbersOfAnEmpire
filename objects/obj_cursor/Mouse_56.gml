 /// @description Insert description here
// You can write your code in this editor

//move with keyboard
if(keyboard_check(ord("Q")))
{
	for(var _u = 0; _u < ds_list_size(global.selection); _u++)
	{
		var _uni = ds_list_find_value(global.selection, _u);
				
		if(keyboard_check(vk_shift) == false)
		{
			ds_list_clear(_uni.moveXList);
			ds_list_clear(_uni.moveYList);
		}
		
		var spot = ds_list_find_index(global.selection, _uni);
		
		var size = ds_list_size(global.selection);
		
		var _columns = floor(sqrt(size));
		
		var _rows = floor(size/_columns);
		
		//sqrt(global.selection) gives rows, % gives columns.
		ds_list_add(_uni.moveXList, mouse_x + _columns * 0.5 * _uni.unitSpread - floor(spot%_rows) * _uni.unitSpread);
		ds_list_add(_uni.moveYList, mouse_y + _rows * 0.5 * _uni.unitSpread - floor(spot/_rows) * _uni.unitSpread);
		
		if(ds_list_size(_uni.moveXList) == 1 && _uni.type != "structure")
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

//attack with keyboard
else if(keyboard_check(ord("W")))
{
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
				
				if(keyboard_check(vk_shift) == false)
				{
					ds_list_clear(_uni.attackTargets);
				}
			
				ds_list_add(_uni.attackTargets, _checkTarget);
			
				if(ds_list_size(_uni.attackTargets) == 1 && _uni.type != "structure")
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
	
	ds_list_destroy(enemies);
}

//move with button
else if(global.movePressed)
{
	for(var _u = 0; _u < ds_list_size(global.selection); _u++)
	{
		var _uni = ds_list_find_value(global.selection, _u);
		
		if(_uni.type != "structure")
		{
				
			if(keyboard_check(vk_shift) == false)
			{
				ds_list_clear(_uni.moveXList);
				ds_list_clear(_uni.moveYList);
			}
		
			var spot = ds_list_find_index(global.selection, _uni);
		
			var size = ds_list_size(global.selection);
		
			var _columns = floor(sqrt(size));
		
			var _rows = floor(size/_columns);
		
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
	
	global.movePressed = false;
}

//attack with button
else if(global.atkPressed)
{
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
				
				if( _uni.type != "structure")
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
	
	ds_list_destroy(enemies);
	
	global.atkPressed = false;
}

//ability 5
else if(keyDown[0] && ds_list_size(global.selection) > 0 && array_length(ds_list_find_value(global.primarySelect, 0).abilities) > 0)
{
	use_abilities(0);
	
	keyDown[0] = false;
}
//ability 6
else if(keyDown[1] && ds_list_size(global.selection) > 0 && array_length(ds_list_find_value(global.primarySelect, 0).abilities) > 1)
{
	use_abilities(1);
	
	keyDown[1] = false;
}
//ability 7
else if(keyDown[2] && ds_list_size(global.selection) > 0 && array_length(ds_list_find_value(global.primarySelect, 0).abilities) > 2)
{
	use_abilities(2);
	
	keyDown[2] = false;
}
//ability 8
else if(keyDown[3] && ds_list_size(global.selection) > 0 && array_length(ds_list_find_value(global.primarySelect, 0).abilities) > 3)
{
	use_abilities(3);
	
	keyDown[3] = false;
}
//ability 9
else if(keyDown[4] && ds_list_size(global.selection) > 0 && array_length(ds_list_find_value(global.primarySelect, 0).abilities) > 4)
{
	use_abilities(4);
	
	keyDown[4] = false;
}
//ability 10
else if(keyDown[5] && ds_list_size(global.selection) > 0 && array_length(ds_list_find_value(global.primarySelect, 0).abilities) > 5)
{
	use_abilities(5);
	
	keyDown[5] = false;
}
//ability 11
else if(keyDown[6] && ds_list_size(global.selection) > 0 && array_length(ds_list_find_value(global.primarySelect, 0).abilities) > 6)
{
	use_abilities(6);
	
	keyDown[6] = false;
}
//ability 12
else if(keyDown[7] && ds_list_size(global.selection) > 0 && array_length(ds_list_find_value(global.primarySelect, 0).abilities) > 7)
{
	use_abilities(7);
	
	keyDown[7] = false;
}
//stop with button
else if(collision_circle(mouse_x, mouse_y, 50, com_button_stop, false, false))
{
	for(var _u = 0; _u < ds_list_size(global.selection); _u++)
	{
		var _uni = ds_list_find_value(global.selection, _u);
		
		if(!_uni.stun && _uni.type != "structure")
		{
		
			_uni.if_shoot = false;
		
			_uni.if_move = 5;
	
			_uni.speed = 0;
	
			ds_list_clear(_uni.moveXList);
			ds_list_clear(_uni.moveYList);
		}
	}
}

else if(point_in_rectangle(x, y, minimapX - 125, minimapY, minimapX + 300, minimapY + 300))
{
	x = room_width * (mouse_x - minimapX)/150 - camera_get_view_width(view_camera[0]) div 2;
	y = room_height * (mouse_y- minimapY)/300 + camera_get_view_height(view_camera[0]) div 2;
	
	camera_set_view_pos(view_camera[0], x, y);
}

//selection
else if(!collision_circle(x, y, 20, com_button, false, true) && !keyboard_check(ord("Q")) && !keyboard_check(ord("E")) && !keyboard_check(ord("R")))
{

	time_down = 0;

	global.ifmbdown = 0;

	global.releasex = mouse_x;

	global.releasey = mouse_y;

	rx = mouse_x;

	ry = mouse_y;

	if(global.releasex < global.mx)
	{
		global.releasex = mx;
		global.mx = rx;
	}

	if(global.releasey < global.my)
	{
		global.releasey = my;
	
		global.my = ry;
	}

	global.reccentrex = (global.releasex + global.mx)/2;

	global.reccentrey = (global.releasey + global.my)/2;
	
	//var _prior = 0;
	
	//reset all buttons
	if(!keyboard_check(vk_shift) && !collision_circle(x, y, 20, com_button, false, false))
	{
		ds_list_clear(global.selection);
		
		for (var reset = 0 ; reset < instance_number(com_button_actor); reset++)
		{
			com_button_actor.slot = -1;
		
		}
		
		for (var reset = 0 ; reset < instance_number(com_button_actor_produce); reset++)
		{
			com_button_actor_produce.topsprite = 0;
			
			if(ds_list_find_index(global.factions, "player") == 1)
			{
				com_button_actor_produce.sprite = icon_Prox_Base;
			}

			else {
				com_button_actor_produce.sprite = icon_Ark_Base;
			}
			
			com_button_actor_produce.if_able = true;
		
		}
	}
	
	ds_list_clear(global.primarySelect);
	
	//find who is in selection
	
	var _select = ds_list_create();
	
	collision_rectangle_list(global.mx, global.my, global.releasex, global.releasey, com_unit, false, false, _select, false);
	
	for(var _u = 0; _u < ds_list_size(_select); _u++)
	{
		var _unit = ds_list_find_value(_select, _u);
		
		if(_unit.faction_number == faction_number && ds_list_find_index(global.selection, _unit.id) == -1)
		{
			ds_list_add(global.selection, _unit.id);
		}
	}
	
	ds_list_destroy(_select);
	
	if(ds_list_size(global.selection) > 1)
	{
		global.selection = sortPriorities(global.selection);
	}
	
	//choose primary selection
	if(ds_list_size(global.selection) > 0)
	{
		
		//add to primary select all units of same type
		priority = ds_list_find_value(global.selection, 0).priority;
		
		var _p = 0;
		
		while(_p < ds_list_size(global.selection) && ds_list_find_value(global.selection, _p).priority == priority)
		{
			ds_list_add(global.primarySelect, ds_list_find_value(global.selection, _p).id);
			
			_p++;
		}
		
		//show UI
		ShowButtons(ds_list_find_value(global.primarySelect, 0));
	}
	 
	
	
}

time_held = 0; 
time_down = 0;

global.releasex = 0;
global.releasey = 0;
	
global.mx = 0;
global.my = 0;
	
global.ifmbdown = 0;

//Buttons
if(collision_circle(x, y, 20, com_button_atk, false, false))
{
	global.atkPressed = true;
}

else if(collision_circle(x, y, 20, com_button_move, false, false))
{
	global.movePressed = true;
}
else if(collision_circle(x, y, 20, com_button_ability5, false, false))
{
	keyDown[0] = true;
	check_for_activation(0);
}
else if(collision_circle(x, y, 20, com_button_ability6, false, false))
{
	keyDown[1] = true;
	check_for_activation(1);
}
else if(collision_circle(x, y, 20, com_button_ability7, false, false))
{
	keyDown[2] = true;
	check_for_activation(2);
}
else if(collision_circle(x, y, 20, com_button_ability8, false, false))
{
	keyDown[3] = true;
	check_for_activation(3);
}
else if(collision_circle(x, y, 20, com_button_ability9, false, false))
{
	keyDown[4] = true;
	check_for_activation(4);
}
else if(collision_circle(x, y, 20, com_button_ability10, false, false))
{
	keyDown[5] = true;
	check_for_activation(5);
}
else if(collision_circle(x, y, 20, com_button_ability11, false, false))
{
	keyDown[6] = true;
	check_for_activation(6);
}
else if(collision_circle(x, y, 20, com_button_ability12, false, false))
{
	keyDown[7] = true;
	check_for_activation(7);
}

else if(collision_circle(x, y, 20, com_button_patrol, false, false))
{
	for(var _u = 0; _u < ds_list_size(global.selection); _u++)
	{
		if(instance_exists(ds_list_find_value(global.selection, _u)))
		{
			ds_list_find_value(global.selection, _u).patrol = true;
		}
	}
}