// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function use_abilities(_i){
	var casted = false;
	
	for(var _u = 0; _u < ds_list_size(global.primarySelect) && !casted; _u++)
	{
		var _uni = ds_list_find_value(global.primarySelect, _u);
				
		if(_uni.abilities[_i][1] == "Attack" && distance_to_point(mouse_x, mouse_y) < _uni.abilities[_i][8] && _uni.abilities[_i][5] && !if_affected(_uni.effects, "CannotAttack") && _uni.abilities[_i][9])
		{
			if(_uni.abilities[_i][4])
			{
				_uni.if_shoot = false;
		
				_uni.if_move = -1;
	
				_uni.speed = 0;
	
				ds_list_clear(moveXList);
				ds_list_clear(moveYList);
				
				array_insert(_uni.effects, 0, ["CannotMoveSpeedBoost", _uni.abilities[_i][7] * 60, -_uni.move_speed]);
				_uni.move_speed = 0;
			}
			
			_uni.direction = point_direction(_uni.x, _uni.y, mouse_x, mouse_y);
	
			_uni.image_angle = _uni.direction;
	
			var attack = instance_create_depth(_uni.x, _uni.y, depth-1, _uni.abilities[_i][0]);
			
			attack.faction_number = _uni.faction_number;
			
			attack.speed = attack.move_speed;
	
			attack.owner = _uni;
	
			attack.move_x = mouse_x;
	
			attack.move_y = mouse_y;
	
			attack.create_x = attack.x;
	
			attack.create_y = attack.y;
	
			attack.direction = point_direction(attack.x, attack.y, attack.move_x, attack.move_y);
	
			attack.image_angle = attack.direction;
	
			_uni.abilities[_i][5] = false;
			
			//_u = ds_list_size(global.primarySelect);
			
			attack.if_ready = true;
			
			casted = true;
		}
		
		else if(_uni.abilities[_i][1] == "Spawn" && point_distance(_uni.x, _uni.y, mouse_x, mouse_y) < _uni.abilities[_i][8] && _uni.abilities[_i][5] && !if_affected(_uni.effects, "Stun") && _uni.abilities[_i][9] && _uni.abilities[_i][10] <= ds_list_find_value(global.metal, faction_number))
		{
			if(_uni.abilities[_i][4])
			{
				_uni.if_shoot = false;
		
				_uni.if_move = -1;
	
				_uni.speed = 0;
	
				ds_list_clear(moveXList);
				ds_list_clear(moveYList);
				
				array_insert(_uni.effects, 0, ["CannotMoveSpeedBoost", _uni.abilities[_i][7] * 60, -_uni.move_speed]);
				_uni.move_speed = 0;
			}
	
			var unit = instance_create_depth(mouse_x, mouse_y, depth-1, _uni.abilities[_i][0]);
			
			unit.faction_number = _uni.faction_number;
	
			_uni.abilities[_i][5] = false;
			
			//_u = ds_list_size(global.primarySelect);
			
			casted = true;
			
			ds_list_replace(global.metal, _uni.faction_number, ds_list_find_value(global.metal, faction_number) - _uni.abilities[_i][10]);
		}
		
		else if(_uni.abilities[_i][1] == "AmmoSplashMissile" && distance_to_point(mouse_x, mouse_y) < _uni.abilities[_i][8] && _uni.abilities[_i][5] && _uni.abilities[_i][9])
		{
			if(_uni.abilities[_i][4])
			{
				_uni.if_shoot = false;
		
				_uni.if_move = -1;
	
				_uni.speed = 0;
	
				ds_list_clear(moveXList);
				ds_list_clear(moveYList);
				
				array_insert(_uni.effects, 0, ["CannotMoveSpeedBoost", _uni.abilities[_i][7] * 60, -_uni.move_speed]);
				_uni.move_speed = 0;
			}
			
			missile = _uni.abilities[_i][0]
			
			var _f = function(_element, _index)
			{
			    return (_element == missile);
			}
			
			array_delete(_uni.ammo, array_find_index(_uni.ammo, _f), 1);
			
			if(!array_contains(_uni.ammo, _uni.abilities[_i][0]))
			{
				_uni.abilities[_i, 5] = false
			}
	
			var attack = instance_create_depth(_uni.x, _uni.y, depth-1, _uni.abilities[_i][0]);
			
			attack.faction_number = _uni.faction_number;
			
			attack.speed = attack.move_speed;
	
			attack.owner = _uni;
	
			attack.move_x = mouse_x;
	
			attack.move_y = mouse_y;
	
			attack.create_x = attack.x;
	
			attack.create_y = attack.y;
	
			attack.direction = point_direction(attack.x, attack.y, mouse_x, mouse_y)
	
			attack.image_angle = attack.direction;
			
			if(attack.type == "missile")
			{
				attack.existingTime = _uni.abilities[_i][7] * 60;
			}
			
			//_u = ds_list_size(global.primarySelect);
			
			attack.if_ready = true;
			
			casted = true;
		}
		
		else if(_uni.abilities[_i][1] == "Missile" && valid_target(self.id) != -1 && distance_to_point(mouse_x, mouse_y) < _uni.abilities[_i][8] && _uni.abilities[_i][5] && _uni.abilities[_i][9])
		{
			if(_uni.abilities[_i][4])
			{
				_uni.if_shoot = false;
		
				_uni.if_move = -1;
	
				_uni.speed = 0;
	
				ds_list_clear(moveXList);
				ds_list_clear(moveYList);
				
				array_insert(_uni.effects, 0, ["CannotMoveSpeedBoost", _uni.abilities[_i][7] * 60, -_uni.move_speed]);
				_uni.move_speed = 0;
			}
	
			var attack = instance_create_depth(_uni.x, _uni.y, depth-1, _uni.abilities[_i][0]);
			
			attack.faction_number = _uni.faction_number;
			
			attack.speed = attack.move_speed;
	
			attack.owner = _uni;
			
			attack.target = valid_target(self.id);
	
			attack.move_x = attack.target.x;
	
			attack.move_y = attack.target.y;
	
			attack.create_x = attack.x;
	
			attack.create_y = attack.y;
	
			attack.direction = _uni.direction;
	
			attack.image_angle = attack.direction;
	
			_uni.abilities[_i][5] = false;
			
			if(attack.type == "missile")
			{
				attack.existingTime = _uni.abilities[_i][7] * 60;
			}
			
			//_u = ds_list_size(global.primarySelect);
			
			attack.if_ready = true;
			
			casted = true;
		}
		
		else if(_uni.abilities[_i][1] == "Field" && distance_to_point(mouse_x, mouse_y) < _uni.abilities[_i][11] - _uni.abilities[_i][8] && _uni.abilities[_i][5] && !if_affected(_uni.effects, "CannotAttack") && _uni.abilities[_i][14])
		{
			
			if(_uni.abilities[_i][4])
			{
				_uni.if_shoot = false;
		
				_uni.if_move = -1;
	
				_uni.speed = 0;
	
				ds_list_clear(moveXList);
				ds_list_clear(moveYList);
				
				array_insert(_uni.effects, 0, ["CannotMoveSpeedBoost", _uni.abilities[_i][7] * 60, -_uni.move_speed]);
				_uni.move_speed = 0;
			}
	
			var attack = instance_create_depth(_uni.x, _uni.y, depth-1, _uni.abilities[_i][0]);
			
			attack.faction_number = _uni.faction_number;
			
			attack.speed = attack.move_speed;
	
			attack.owner = _uni;
	
			attack.move_x = mouse_x;
	
			attack.move_y = mouse_y;
	
			attack.rect = [_uni.abilities[_i][8], _uni.abilities[_i][9], _uni.abilities[_i][10], _uni.abilities[_i][11], _uni.abilities[_i][12], _uni.abilities[_i][13]]
								//		start x					start y1				start y2				end x				end y1					end y2
		
			attack.direction = _uni.direction
			
			array_insert(_uni.effects, 0, ["CannotAttack", _uni.abilities[_i][7] * 60, 10 * _uni.abilities[_i][7]]);
			
			if(string_ends_with(_uni.type, "ship"))
			{
				for(var u = 0; u < array_length(_uni.main_weapon_list); u++)
				{
				
					var duration = _uni.abilities[_i][7];
					var reloadTIme = _uni.main_weapon_list[u][4];
					_uni.main_weapon_list[u][4] = _uni.main_weapon_list[u][4] * _uni.abilities[_i][7] * 10;
					_uni.main_weapon_list[u][10] = 0;
				
					for(var a = 0; a < instance_number(_uni.main_weapon_list[u][0]); a++)
					{
						var _atk = instance_find(_uni.main_weapon_list[u][0], a);
					
						if(_atk.owner == _uni.id)
						{
							instance_destroy(_atk);
						}
					}
				}
				
				for(var u = 0; u < array_length(_uni.weapon_list); u++)
				{
					_uni.weapon_list[u][4] *= 10 * _uni.abilities[_i][7];
					_uni.weapon_list[u][10] = 0;
				
					for(var a = 0; a < instance_number(_uni.weapon_list[u][0]); a++)
					{
						var _atk = instance_find(_uni.weapon_list[u][0], a);
					
						if(_atk.owner == _uni.id)
						{
							instance_destroy(_atk);
						}
					}
				}
			}
			
			attack.image_angle = _uni.direction;
			
			attack.existingTime = _uni.abilities[_i][7];
	
			_uni.abilities[_i][5] = false;
			
			//_u = ds_list_size(global.primarySelect);
			
			attack.if_ready = true;
			
			casted = true;
		}
		
		else if(_uni.abilities[_i][1] == "Bombard" && distance_to_point(mouse_x, mouse_y) < _uni.abilities[_i][8] && _uni.abilities[_i][5] && !if_affected(_uni.effects, "CannotAttack") && _uni.abilities[_i][12])
		{
			//unable to move for the duration
			if(_uni.abilities[_i][4])
			{
				_uni.if_shoot = false;
		
				_uni.if_move = -1;
	
				_uni.speed = 0;
	
				ds_list_clear(_uni.moveXList);
				ds_list_clear(_uni.moveYList);
				
				array_insert(_uni.effects, 0, ["CannotMoveSpeedBoost", _uni.abilities[_i][7] * 60, -_uni.move_speed]);
				_uni.move_speed = 0;
			}
				
			var duration = _uni.abilities[_i][7] + _uni.abilities[_i][11];
			
			array_insert(_uni.effects, 0, ["CannotAttack", 60 * duration, 60 * duration]);
			
			if(string_ends_with(_uni.type, "ship"))
			{
				for(var u = 0; u < array_length(_uni.main_weapon_list); u++)
				{
					var reloadTIme = _uni.main_weapon_list[u][4];
					_uni.main_weapon_list[u][4] = _uni.main_weapon_list[u][4] * duration * 60;
					_uni.main_weapon_list[u][10] = 0;
				
					for(var a = 0; a < instance_number(_uni.main_weapon_list[u][0]); a++)
					{
						var _atk = instance_find(_uni.main_weapon_list[u][0], a);
					
						if(_atk.owner == _uni.id)
						{
							instance_destroy(_atk);
						}
					}
				}
				
				for(var u = 0; u < array_length(_uni.weapon_list); u++)
				{
					_uni.weapon_list[u][4] *= 60 * duration;
					_uni.weapon_list[u][10] = 0;
				
					for(var a = 0; a < instance_number(_uni.weapon_list[u][0]); a++)
					{
						var _atk = instance_find(_uni.weapon_list[u][0], a);
					
						if(_atk.owner == _uni.id)
						{
							instance_destroy(_atk);
						}
					}
				}
			}
			
			_uni.abilityTargetx = mouse_x;
			_uni.abilityTargety = mouse_y;
			
			_uni.abilities[_i][9] = true;
	
			_uni.abilities[_i][5] = false;
			
			casted = true;
			
		}
		
		else if(_uni.abilities[_i][1] == "LevelUp" && _uni.abilities[_i][5] && !if_affected(_uni.effects, "CannotAttack") && _uni.abilities[_i][7])
		{
			
			if(_uni.skill_points >= _uni.abilities[_i][8])
			{
				
				//atk
				if(_uni.abilities[_i][0] == 0)
				{
					_uni.skill_points -= _uni.abilities[_i][8];
					_uni.atk_skill += _uni.abilities[_i][9];
					
					var buff = _uni.atk_skill % 5;
					
					if(buff == 0)
					{
						_uni.leadership_buffs[1] = true;
					}
					
					else if(buff == 1)
					{
						_uni.reloadSpeed *= 1.05;
					}
					
					else if(buff == 2)
					{
						_uni.reloadSpeed *= 1.05;
						
						for(var u = 0; u < array_length(_uni.main_weapon_list); u++)
						{
							_uni.main_weapon_list[u][1] *= 1.05;
				
						}
				
						for(var u = 0; u < array_length(_uni.weapon_list); u++)
						{
							
							_uni.weapon_list[u][1] *= 1.05;
						}
					}
					
					else if(buff == 3)
					{
						var hasDash = false;
						
						for(var a = 0; a < array_length(_uni.abilities); a++)
						{
							if(_uni.abilities[a, 1] == "speedbuff")
							{
								hasDash = true;
								array_set(_uni.abilities, a, 
											[4, "speedbuff", 60, 0, false, false, icon_Prox_Dash, _uni.abilities[a, 8] * 1.25, true]
										   // 0     1         2				 3		 4      5           6	 7       8
										   // buff, name,    reload_time, counter, deploy, recharged, icon, time, unlocked
											);
								break;
							}
						}
						
						if(!hasDash)
						{
							array_insert(_uni.abilities, array_length(_uni.abilities), [10, "speedbuff", 60, 0, false, false, icon_Prox_Dash, 10, true]);
							
							var slot = ds_list_find_value(_uni.buttons, ds_list_size(_uni.buttons) - 1);
							ds_list_add(_uni.buttons, ds_list_find_value(global.add_ability_buttons, 1 + ds_list_find_index(global.add_ability_buttons, slot)).id);
							ShowButtons(_uni);
						}
					}
					
					else
					{
						 _uni.move_speed += 1;
						 _uni.maxSpeed += 1;
						 _uni.acceleration *= 2;
						
						for(var u = 0; u < array_length(_uni.main_weapon_list); u++)
						{
							_uni.main_weapon_list[u][18] *= 2;
							_uni.main_weapon_list[u][2] *= 1.25;
				
						}
					}
					
				}
				//def
				else if(_uni.abilities[_i][0] == 1)
				{
					_uni.skill_points -= _uni.abilities[_i][8];
					_uni.def_skill += _uni.abilities[_i][9];
					
					var buff =  _uni.def_skill % 12;
					
					if(buff == 0)
					{
						_uni.leadership_buffs[1] = true;
					}
					
					else if(buff == 1)
					{
						_uni.dodgeChance += 0.1
					}
					
					else if(buff == 2)
					{
						_uni.dmgReduction += 0.02;
						_uni.dodgeChance += 0.1
					}
					
					else if(buff == 3)
					{
						
						_uni.dodgeChance += 0.1
						
						for(var u = 0; u < array_length(_uni.main_weapon_list); u++)
						{
							_uni.main_weapon_list[u][19] = 180;
				
						}
					}
					
					else if(buff == 4)
					{
						_uni.maxHp *= 0.1;
						_uni.hp *= 0.1
					}
				
				}
				else if(_uni.abilities[_i][0] == 2)
				{
					_uni.skill_points -= _uni.abilities[_i][8];
					_uni.ability_skill += _uni.abilities[_i][9];
					
					var buff =  _uni.ability_skill % 12;
					
					if(buff == 0)
					{
						_uni.leadership_buffs[2] = true;
					}
					
					else if(buff == 1)
					{
						_uni.abilityChargeRate *= 0.04;
					
					}
					
					else if(buff == 2)
					{
						_uni.stunResist *= 2;
					
					}
					
					else if(buff == 3)
					{
						_uni.abilityChargeRate *= 0.04;
						_uni.maxEnergy *= 1.1; 
					
					}
					
					else if(buff == 4 )
					{
						_uni.maxEnergy *= 1.1; 
						
						_uni.energyRegen += 2;
					}
					
				}
			}
			
			casted = true;
			
		}
		
		else if(_uni.abilities[_i][1] == "speedbuff" && _uni.abilities[_i][5] && !if_affected(_uni.effects, "CannotSpeedBoost") && _uni.abilities[_i][8])
		{
			_uni.abilities[_i][5] = false;
			
			array_insert(_uni.effects, 0, ["speedbuff", _uni.abilities[_i][7] * 30, _uni.maxSpeed * 3]);
			_uni.move_speed += _uni.maxSpeed * 3;
			_uni.speed *= 4;
			
			casted = true;
			
		}
		
	}
	
	
}