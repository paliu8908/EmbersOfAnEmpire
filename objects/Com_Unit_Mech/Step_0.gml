/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(hp >= 0 && !stun)
{
	//rotate turret
	for(var _i = 0; _i < array_length(main_weapon_list); _i++)
	{
			
		var _wpnTarget = main_weapon_list[_i][12];
		var _wpnShootAngle = main_weapon_list[_i][3];
		var _wpnFireAngle = main_weapon_list[_i][2];
		var _wpnRange = main_weapon_list[_i][1];
		var _turretRotation = main_weapon_list[_i][18]; //End
		var _turretTurnAngle = main_weapon_list[_i][19]; //End
			
		if(_wpnShootAngle != 0 && !instance_exists(_wpnTarget) && outOfCombat)
		{
			if(abs(_wpnShootAngle) < _turretRotation)
			{
				main_weapon_list[_i][3] = 0;
			}
			else if(_wpnShootAngle < 0 && _wpnShootAngle + _turretRotation <= _turretTurnAngle)
			{
				main_weapon_list[_i][3] += _turretRotation;
			}
			else if(_wpnShootAngle > 0 && _wpnShootAngle - _turretRotation >= -_turretTurnAngle)
			{
				main_weapon_list[_i][3] -= _turretRotation;
			}
		}
		
		else if(_wpnShootAngle != 0 && distance_to_object(_wpnTarget) > _wpnRange && outOfCombat)
		{
			if(abs(_wpnShootAngle) < _turretRotation)
			{
				main_weapon_list[_i][3] = 0;
			}
			else if(_wpnShootAngle < 0 && _wpnShootAngle + _turretRotation <= _turretTurnAngle)
			{
				main_weapon_list[_i][3] += _turretRotation;
			}
			else if(_wpnShootAngle > 0 && _wpnShootAngle - _turretRotation >= -_turretTurnAngle)
			{
				main_weapon_list[_i][3] -= _turretRotation;
			}
		}
		
		else if(instance_exists(_wpnTarget))
		{
			var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
			var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
		
			var _angleDiff = _wpnShootAngle + direction - point_direction(x + _wpnOffX, y + _wpnOffY, _wpnTarget.x, _wpnTarget.y);
	
			if(_angleDiff < -180)
			{
				_angleDiff += 360;
			}
			else if(_angleDiff > 180)
			{
				_angleDiff -= 360;
			}
		
			if(abs(_angleDiff) > 5)
			{
		
				if(abs(_angleDiff) < _turretRotation && _turretTurnAngle > point_direction(x + _wpnOffX, y + _wpnOffY, _wpnTarget.x, _wpnTarget.y))
				{
					main_weapon_list[_i][3] = point_direction(x + _wpnOffX, y + _wpnOffY, _wpnTarget.x, _wpnTarget.y);
				}
				else if(_angleDiff < 0 && _wpnShootAngle + _turretRotation <= _turretTurnAngle)
				{
					main_weapon_list[_i][3] += _turretRotation;
				}
				else if(_angleDiff > 0 && _wpnShootAngle - _turretRotation >= -_turretTurnAngle)
				{
					main_weapon_list[_i][3] -= _turretRotation;
				}
			  
				shootAngle = main_weapon_list[_i][3]; 
			} 
		}
	}

	//Adjust during movement
	if(if_move == 1)
	{
		if(speed < move_speed)
		{
			speed += acceleration;
		}
			
		var _angleDiff = direction - point_direction(x, y, move_x, move_y);
		
		if(_angleDiff < -180)
		{
			_angleDiff += 360;
		}
		else if(_angleDiff > 180)
		{
			_angleDiff -= 360;
		}
		
		if(abs(_angleDiff) <= turnRate)
		{
			direction = point_direction(x, y, move_x, move_y);
		}
		
		else if(_angleDiff < 0)
		{
			direction += turnRate;
		}
		else if(_angleDiff > 0)
		{
			direction -= turnRate;
		}
				
		if(abs(distance_to_point(move_x, move_y)) <= stopDis)
		{
		
			if(ds_list_size(moveXList) > 1 && !patrol)
			{
				ds_list_delete(moveXList, 0);
				ds_list_delete(moveYList, 0);
			
				move_x = ds_list_find_value(moveXList, 0);
				move_y = ds_list_find_value(moveYList, 0);
			                
				var _angleDiff = direction - point_direction(x, y, move_x, move_y);
		
				if(_angleDiff < -180)
				{
					_angleDiff += 360;
				}
				else if(_angleDiff > 180)
				{
					_angleDiff -= 360;
				}
		
				if(abs(_angleDiff) <= turnRate)
				{
					direction = point_direction(x, y, move_x, move_y);
				}
		
				else if(_angleDiff < 0)
				{
					direction += turnRate;
				}
				else if(_angleDiff > 0)
				{
					direction -= turnRate;
				}
	 		}
			else if(ds_list_size(moveXList) > 1)
			{
				ds_list_add(moveXList, ds_list_find_value(moveXList, 0));
				ds_list_add(moveYList, ds_list_find_value(moveYList, 0));
			
				ds_list_delete(moveXList, 0);
				ds_list_delete(moveYList, 0);
			
				move_x = ds_list_find_value(moveXList, 0);
				move_y = ds_list_find_value(moveYList, 0);
			                
				var _angleDiff = direction - point_direction(x, y, move_x, move_y);
		
				if(_angleDiff < -180)
				{
					_angleDiff += 360;
				}
				else if(_angleDiff > 180)
				{
					_angleDiff -= 360;
				}
		
				if(abs(_angleDiff) <= turnRate)
				{
					direction = point_direction(x, y, move_x, move_y);
				}
		
				else if(_angleDiff < 0)
				{
					direction += turnRate;
				}
				else if(_angleDiff > 0)
				{
					direction -= turnRate;
				}
			}
			else
			{
				ds_list_delete(moveXList, 0);
				ds_list_delete(moveYList, 0);
			
				move_x = x;
		
				move_y = y;
				
				if_move = 0;
			
				speed = 0;
			}
		}
		else
		{
			
			if(speed < move_speed)
			{
				speed += acceleration;
			}
			
			var _angleDiff = direction - point_direction(x, y, move_x, move_y);
		
			if(_angleDiff < -180)
			{
				_angleDiff += 360;
			}
			else if(_angleDiff > 180)
			{
				_angleDiff -= 360;
			}
		
			if(abs(_angleDiff) <= turnRate)
			{
				direction = point_direction(x, y, move_x, move_y);
			}
		
			else if(_angleDiff < 0)
			{
				direction += turnRate;
			}
			else if(_angleDiff > 0)
			{
				direction -= turnRate;
			}
		}

	}
	
	//accelerate for chase
	else if(if_move == 3 && instance_exists(target))
	{
		var offsetX = dcos(target.direction + shootAngle + angle) * range * 0.8;
			
		var offsetY = -dsin(target.direction + angle + shootAngle) * range * 0.8;
		
		//outside of range
		if(distance_to_object(target) > range * 0.8)
		{
			
			if(speed < move_speed)
			{
				speed += acceleration;
			}
			
			//var _angleDiff = direction - point_direction(x, y, target.x - offsetX, target.y - offsetY);
		
			var _angleDiff = direction - point_direction(x, y, target.x, target.y);
			
			if(_angleDiff < -180)
			{
				_angleDiff += 360;
			}
			else if(_angleDiff > 180)
			{
				_angleDiff -= 360;
			}
		
			if(abs(_angleDiff) <= turnRate)
			{
				//direction = point_direction(x, y, target.x - offsetX, target.y - offsetY);
				
				direction = point_direction(x, y, target.x, target.y);
			}
		
			else if(_angleDiff < 0)
			{
				direction += turnRate;
			}
			else if(_angleDiff > 0)
			{
				direction -= turnRate;
			}
		}
		
		/*
		//not sure what this case does
		else if(x - target.x - offsetX < move_speed && y - target.y - offsetY < move_speed)
		{
			//direction = point_direction(x, y, target.x - offsetX, target.y - offsetY);
			
			direction = point_direction(x, y, target.x, target.y)
			
			if(speed < move_speed)
			{
				speed += acceleration;
			}
		}*/
		
		//within range
		else
		{
			
			speed = min(move_speed, target.speed);
			
			//speed = move_speed;
			
			var _angleDiff = direction - point_direction(x, y, target.x - offsetX, target.y - offsetY);
		
			if(_angleDiff < -180)
			{
				_angleDiff += 360;
			}
			else if(_angleDiff > 180)
			{
				_angleDiff -= 360;
			}
		
			if(abs(_angleDiff) <= turnRate)
			{
				direction = point_direction(x, y, target.x - offsetX, target.y - offsetY);
			}
		
			else if(_angleDiff < 0)
			{
				direction += turnRate;
			}
			else if(_angleDiff > 0)
			{
				direction -= turnRate;
			}
			
		}

	}
	
	else if(if_move == 3)
	{
		move_x = x;

		move_y = y;
				
		if_move = 0;
			
		//direction = point_direction(x, y, x, y);
			
		speed = 0;
	}
	
	else if(if_move == 5)
	{
		
		move_x = x;

		move_y = y;
				
		if_move = 0;
			
		speed = 0;
	}
	
	else if(if_move == 7)
	{

		var go_x = x;
		var go_y = y;
		
		if(instance_exists(target))
		{
			go_x = target.x;
			go_y = target.y;
		}
		
		go_x = move_x;
		go_y = move_y;
		
		var _angleDiff = direction - point_direction(x, y, go_x, go_y);
		
		if(_angleDiff < -180)
		{
			_angleDiff += 360;
		}
		else if(_angleDiff > 180)
		{
			_angleDiff -= 360;
		}
		
		if(dodgeCounter == 0)
		{
			direction = direction - _angleDiff;
			
			if(_angleDiff > 2)
			{
				speed = move_speed;
			}
			
			if(instance_exists(target))
			{
				if_move = 3;
			}
			else
			{
				if_move = 1;
			}
			
		}
		else
		{
			if(speed > move_speed)
			{
				speed -= (speed-move_speed)/dodgeCounter; //speed decay
			}
			
			if(abs(_angleDiff) <= turnRate)
			{
				direction = point_direction(x, y, move_x, move_y);
			}
		
			else if(_angleDiff < 0)
			{
				direction += turnRate;
			}
			else if(_angleDiff > 0)
			{
				direction -= turnRate;
			}
			
			//direction += 2 * _angleDiff/dodgeCounter;
		
			dodgeCounter--;
		}
		
	}

	//ATTACKING

	//AtkOrder given.
	//Shoot if has target and because
	 
	//Main Weapon
	checkCounter++;
	
	if(checkCounter == 30)
	{
		checkCounter = 0;
	}
	
	for(var _i = 0; _i < array_length(main_weapon_list); _i++)
	{
			
		var _wpnTarget = main_weapon_list[_i][12];
		var _wpnIfShoot = main_weapon_list[_i][11];
		var _wpnRange = main_weapon_list[_i][1];
		var _wpnShootAngle = main_weapon_list[_i][3];
		var _wpnFireAngle = main_weapon_list[_i][2];
		var _wpnReload = main_weapon_list[_i][10];
		var _wpnBurst = main_weapon_list[_i][9];
		var _wpnInAcc = main_weapon_list[_i][17];

		var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
		var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
		
		
		//calculate the angle to the target
		if(instance_exists(_wpnTarget))
		{
		
			var _angleToTarget = point_direction(x +_wpnOffX, y +_wpnOffY, _wpnTarget.x, _wpnTarget.y);
			
			var _inAngle = false;
			
			if(_angleToTarget > _wpnShootAngle + direction - _wpnFireAngle && _angleToTarget < _wpnShootAngle + direction + _wpnFireAngle)
			{
				_inAngle = true;
			}
		}
		
		
		//if given order, shoot at the target
		if(atkOrder)
		{
			if(instance_exists(target))
			{
				//Distance to enemy
				var enemyDis = abs(distance_to_object(target));
				
				_wpnTarget = target;
		
				var angleDifference = abs(point_direction(x +_wpnOffX, y + _wpnOffY, target.x, target.y) - (direction + _wpnShootAngle));
			
				//choose enemy as target and fires
				if(_wpnReload != 0 && _wpnBurst == 0 && enemyDis < _wpnRange &&  angleDifference <= main_weapon_list[_i][2])
				{
					main_weapon_list[_i][10]--; //if_reload
				
					//create our projectile, then pass the information to it
					var attack = instance_create_depth(x+_wpnOffX, y+_wpnOffY, depth - 1, main_weapon_list[_i][0]);
			
					attack.owner = self.id;
			
					attack.faction_number = faction_number;
			
					attack.move_x = _wpnTarget.x;
	
					attack.move_y = _wpnTarget.y;
	
					attack.create_x = x+_wpnOffX;
	
					attack.create_y = y+_wpnOffY;
	
					attack.if_ready = true;
			
					attack.target = target;
					
					attack.speed = attack.move_speed;
					
					attack.fireAngle = _wpnFireAngle;
			
					attack.shootAngle = _wpnShootAngle;
			
					attack.turOffX = main_weapon_list[_i][16];
			
					attack.turOffY = main_weapon_list[_i][15];
					
					attack.range = _wpnRange;
					
					if(attack.type == "missile")
					{
						attack.direction = direction;
					}
					
					else
					{
						attack.direction = point_direction(attack.create_x, attack.create_y, attack.target.x + random_range(-_wpnInAcc,_wpnInAcc), attack.target.y + random_range(-_wpnInAcc,_wpnInAcc));
					}
					attack.image_angle = attack.direction;
		
					if(main_weapon_list[_i][6] != 1) //[6] is burst
					{
						main_weapon_list[_i][9] = 1;  //[9] if_burst, set to cannot burst.
					}
					
					combatlessCounter = 0;
					
					outOfCombat = false;
				}
			}
	
		
			//Choose a new target because target destroyed
			/*else if(_wpnIfShoot)
			{
				//New target if the target is destroyed
				while(ds_list_size(attackTargets) > 1 && !instance_exists(target))
				{
					ds_list_delete(attackTargets, 0);
		
					target = ds_list_find_value(attackTargets, 0);
					
					_wpnTarget = target;
			
					if(instance_exists(target))
					{
			
						self.target_x = target.x;
		
						self.target_y = target.y;
			
						if_shoot = true;
			
						atkOrder = true;
						
						main_weapon_list[_i][11] = false;
						
						main_weapon_list[_i][12] = target;
					}
					else
					{
						atkOrder = false;
		
					if_shoot = false;
			
					target = 0;
				
					main_weapon_list[_i][11] = false; //if_shoot
				
					main_weapon_list[_i][12] = 0; //target
					
					}
				}
			}*/
			else //no targets left
			{
				atkOrder = false;
		
				if_shoot = false;
			
				target = 0;
				
				main_weapon_list[_i][11] = false; //if_shoot
				
				main_weapon_list[_i][12] = 0; //target
			}
			
		}
		
		//shoot target 
		else if(instance_exists(_wpnTarget) && _wpnReload != 0 && _wpnBurst == 0 && _inAngle && _wpnRange > distance_to_object(_wpnTarget) )
		{
			main_weapon_list[_i][10]--; //if_reload
				

			var attack = instance_create_depth(x+_wpnOffX, y+_wpnOffY, depth - 1, main_weapon_list[_i][0]);
			
			attack.owner = self.id;
			
			attack.faction_number = faction_number;
			
			attack.move_x = _wpnTarget.x;
	
			attack.move_y = _wpnTarget.y;
	
			attack.create_x = x+_wpnOffX;
	
			attack.create_y = y+_wpnOffY;
	
			attack.if_ready = true;
			
			attack.target = _wpnTarget;
			
			attack.speed = attack.move_speed;
					
			attack.fireAngle = _wpnFireAngle;
			
			attack.shootAngle = _wpnShootAngle;
			
			attack.turOffX = main_weapon_list[_i][16];
			
			attack.turOffY = main_weapon_list[_i][15];
					
			attack.range = _wpnRange;
		
		
			if(attack.type == "missile")
			{
				attack.direction = direction;
			}
					
			else
			{
				attack.direction = point_direction(attack.create_x, attack.create_y, attack.target.x + random_range(-_wpnInAcc,_wpnInAcc), attack.target.y + random_range(-_wpnInAcc,_wpnInAcc));
			}
			
			attack.image_angle = attack.direction;
		
			if(main_weapon_list[_i][6] != 1) //[6] is burst
			{
				main_weapon_list[_i][9] = 1;  //[9] if_burst, set to cannot burst.
			}
					
			combatlessCounter = 0;
					
			outOfCombat = false;
		
		}
		
		//Find new target
		else if(checkCounter == 0)
		{
		
			if(!instance_exists(_wpnTarget) || _wpnIfShoot == false || distance_to_object(_wpnTarget) >= _wpnRange || !_inAngle)
			{
				var enemies = ds_list_create();

				collision_circle_list(x +_wpnOffX, y +_wpnOffY, _wpnRange, com_unit, false, true, enemies, true)
	
				if(ds_list_size(enemies) != 0)
				{
					enemy_numbers = ds_list_size(enemies);
			
					for(var choices = 0; choices < enemy_numbers; choices++;)
					{

						_wpnTarget = ds_list_find_value(enemies, choices)
		
						if(instance_exists(_wpnTarget) && _wpnTarget.faction_number != self.faction_number && distance_to_object(_wpnTarget) < _wpnRange && _wpnTarget.type != "asteroid")
						{
							main_weapon_list[_i][13] = _wpnTarget.x; //target_x
		
							main_weapon_list[_i][14] = _wpnTarget.y; //target_y
			
							main_weapon_list[_i][11] = true; //if_shoot
							
							main_weapon_list[_i][12] = _wpnTarget; //target
					
							atkOrder = false;
							
							choices = enemy_numbers;

						}
						else
						{
							_wpnTarget = 0;
						}
					}
		
				}
				else
				{
					main_weapon_list[_i][11] = false; //if_shoot
		
					main_weapon_list[_i][12] = 0; //target
				}
			
				ds_list_destroy(enemies);
			}
		
		}
		
		
		//reload
		if(main_weapon_list[_i][10] == 0) // if needs to be reloaded
		{
			main_weapon_list[_i][7]++; //raise the counter
	
			if(main_weapon_list[_i][7] >= 60 * main_weapon_list[_i][4]) //if counter = reload time
			{
				main_weapon_list[_i][10] = main_weapon_list[_i][6]; //set reload back to max ammo.
		
				main_weapon_list[_i][7] = 0; //counter rest
			}
		}

		//recharge burst
		if(main_weapon_list[_i][9] == 1) //if burst needs to cooldown
		{
			main_weapon_list[_i][8] += reloadSpeed; //raise counter
	
			if(main_weapon_list[_i][8] >= 60 * main_weapon_list[_i][5]) //if counter = burst delay
			{
				main_weapon_list[_i][8] = 0; //reset counter
		
				main_weapon_list[_i][9] = 0; //reset burst
			}
		}
	}
	
	//Secondaries
	for(var _i = 0; _i < array_length(weapon_list); _i++)
	{
			
		var _wpnTarget = weapon_list[_i][12];
		var _wpnIfShoot = weapon_list[_i][11];
		var _wpnRange = weapon_list[_i][1];
		var _wpnShootAngle = weapon_list[_i][3];
		var _wpnFireAngle = weapon_list[_i][2];
		var _wpnReload = weapon_list[_i][10];
		var _wpnBurst = weapon_list[_i][9];
		var _wpnInAcc = weapon_list[_i][17];

		var _wpnOffX = sqrt(sqr(weapon_list[_i][16])+sqr(weapon_list[_i][15])) * sin(degtorad((darctan2(weapon_list[_i][16], weapon_list[_i][15]) + direction)));
		var _wpnOffY = sqrt(sqr(weapon_list[_i][16])+sqr(weapon_list[_i][15])) * cos(degtorad((darctan2(weapon_list[_i][16], weapon_list[_i][15]) + direction)));
	
		if(instance_exists(_wpnTarget))
		{
			var _angleToTarget = point_direction(x +_wpnOffX, y +_wpnOffY, _wpnTarget.x, _wpnTarget.y);
			
			var _inAngle = false;
			
			if(_angleToTarget > _wpnShootAngle + direction - _wpnFireAngle && _angleToTarget < _wpnShootAngle + direction + _wpnFireAngle)
			{
				_inAngle = true;
			}
		}
		
		//shoot target 
		if(instance_exists(_wpnTarget) && _wpnReload != 0 && _wpnBurst == 0 && _inAngle)
		{
			weapon_list[_i][10]--; //if_reload
				
			var attack = instance_create_depth(x+_wpnOffX, y+_wpnOffY, depth - 1, weapon_list[_i][0]);
			
			attack.owner = self.id;
			
			attack.faction_number = faction_number;
			
			attack.move_x = _wpnTarget.x;
	
			attack.move_y = _wpnTarget.y;
	
			attack.create_x = x+_wpnOffX;
	
			attack.create_y = y+_wpnOffY;
	
			attack.if_ready = true;
			
			attack.target = _wpnTarget;
			
			attack.speed = attack.move_speed;
			
			attack.fireAngle = _wpnFireAngle;
			
			attack.shootAngle = _wpnShootAngle;
			
			attack.turOffX = weapon_list[_i][16];
			
			attack.turOffY = weapon_list[_i][15];
		
			if(attack.type == "missile")
			{
				attack.direction = direction;
			}
					
			else
			{
				attack.direction = point_direction(attack.create_x, attack.create_y, attack.target.x + random_range(-_wpnInAcc,_wpnInAcc), attack.target.y + random_range(-_wpnInAcc,_wpnInAcc));
			}
			
			attack.image_angle = attack.direction;
					
			attack.range = _wpnRange;
		
			if(weapon_list[_i][6] != 1) //[6] is burst
			{
				weapon_list[_i][9] = 1;  //[9] if_burst, set to cannot burst.
			}
					
			combatlessCounter = 0;
					
			outOfCombat = false;
		
		}
		
		else if(checkCounter == 0)
		{
			
			if(!instance_exists(_wpnTarget) || _wpnIfShoot == false || distance_to_object(_wpnTarget) >= _wpnRange || !_inAngle)
			{
				var enemies = ds_list_create();

				collision_circle_list(x +_wpnOffX, y +_wpnOffY, _wpnRange, com_unit, false, true, enemies, true)
	
				if(ds_list_size(enemies) != 0)
				{
					enemy_numbers = ds_list_size(enemies);
			
					for(var choices = 0; choices < enemy_numbers; choices++;)
					{

						_wpnTarget = ds_list_find_value(enemies, choices)
					
						_angleToTarget = point_direction(x+_wpnOffX, y +_wpnOffY, _wpnTarget.x, _wpnTarget.y);
			
						var _inAngle = false;
			
						if(_angleToTarget > _wpnShootAngle + direction - _wpnFireAngle && _angleToTarget < _wpnShootAngle + direction + _wpnFireAngle)
						{
							_inAngle = true;
						}
		
						if(instance_exists(_wpnTarget) && _wpnTarget.faction_number != self.faction_number && _inAngle && _wpnTarget.type != "asteroid")
						{
							weapon_list[_i][13] = _wpnTarget.x; //target_x
		
							weapon_list[_i][14] = _wpnTarget.y; //target_y
			
							weapon_list[_i][11] = true; //if_shoot
							
							weapon_list[_i][12] = _wpnTarget; //target
					
							atkOrder = false;
						
							choices = enemy_numbers;

						}
						else
						{
							_wpnTarget = 0;
						}
					}
		
				}
				else
				{
					weapon_list[_i][11] = false; //if_shoot
		
					weapon_list[_i][12] = 0; //target
				}
			
				ds_list_destroy(enemies);
		
			}
		}
		
		//reload
		if(weapon_list[_i][10] == 0) // if needs to be reloaded
		{
			weapon_list[_i][7] += reloadSpeed; //raise the counter
	
			if(weapon_list[_i][7] >= 60 * weapon_list[_i][4]) //if counter = reload time
			{
				weapon_list[_i][10] = weapon_list[_i][6]; //set reload back to max ammo.
		
				weapon_list[_i][7] = 0; //counter rest
			}
		}

		//recharge burst
		if(weapon_list[_i][9] == 1) //if burst needs to cooldown
		{
			weapon_list[_i][8]++; //raise counter
	
			if(weapon_list[_i][8] >= 60 * weapon_list[_i][5]) //if counter = burst delay
			{
				weapon_list[_i][8] = 0; //reset counter
		
				weapon_list[_i][9] = 0; //reset burst
			}
		}
	}
	
	// Recharge
	if(energy < maxEnergy)
	{	
		energyCounter++;
		
		if(energyCounter == 30)
		{
			energy += energy_regen;
			
			energyCounter = 0;
			
			if(energy > maxEnergy)
			{
				energy = maxEnergy;
			}
		}
	}
	
	// Healing
	if(hp < maxHp)
	{	
		hpRegenCounter++;
		
		if(hpRegenCounter == 30)
		{
			hp += hpRegen;
			
			hpRegenCounter = 0;
			
			if(hp > maxHp)
			{
				hp = maxHp;
			}
		}
	}
	
	// Levelling Up
	if(xp >= nextLevelXp)
	{
		xp -= nextLevelXp;
		level++;
		nextLevelXp *= (1 + newXpMultiplier)
		skill_points++;
	}
	
	//Skill effects
	
	if(leadership_buffs[0]) 
	{
		defBuffCounter++;
		
		if(defBuffCounter == 30)
		{
			defBuffCounter = 0;
			
			var buffList = ds_list_create();
			collision_circle_list(x, y, buff_range, com_unit, true, false, buffList, false);
			
			for(var _u = 0; _u < ds_list_size(buffList); _u++)
			{
				var cand = ds_list_find_value(buffList, _u);
				
				if(cand.faction_number == faction_number && cand.hp < cand.maxHp/2)
				{
					cand.dmgReduction -= floor(def_skill/12); 
					array_insert(cand.effects, 0, ["MechLeadershipArmourReduce", 1, -floor(def_skill/12)]);
				}
			}
			
			ds_list_destroy(buffList);
		}
	}

	if(leadership_buffs[1]) 
	{
		atkBuffCounter++;
		
		if(atkBuffCounter == 30 * 30)
		{
			atkBuffCounter = 0;
			
			var buffList = ds_list_create();
			collision_circle_list(x, y, buff_range, com_unit, true, false, buffList, false);
			
			for(var _u = 0; _u < ds_list_size(buffList); _u++)
			{
				var cand = ds_list_find_value(buffList, _u);
				
				if(cand.faction_number == faction_number)
				{
					var backReduce = (1 + floor(atk_skill/12)) * cand.reloadSpeed - cand.reloadSpeed;
					cand.reloadSpeed *= 1 + floor(atk_skill/12);
					array_insert(cand.effects, 0, ["MechLeadershipReloadSpeedIncrease", 1, -backReduce]);
				}
			}
			
			ds_list_destroy(buffList);
		}
		
	}
	
	if(leadership_buffs[2]) 
	{
		abilityBuffCounter++;
		
		if(abilityBuffCounter == 30)
		{
			abilityBuffCounter = 0;
			
			var buffList = ds_list_create();
			collision_circle_list(x, y, buff_range, com_unit, true, false, buffList, false);
			
			for(var _u = 0; _u < ds_list_size(buffList); _u++)
			{
				var cand = ds_list_find_value(buffList, _u);
				
				if(cand.faction_number == faction_number)
				{
					var backReduce = (1 + floor(ability_skill/12)) * cand.abilityChargeRate - cand.abilityChargeRate;
					cand.abilityChargeRate *= 1 + floor(ability_skill/12);
					array_insert(cand.effects, 0, ["MechLeadershipChargeIncrease", 1, backReduce]);
				}
			}
			
			ds_list_destroy(buffList);
		}
	}

	ResolveAbilities(self);
	ResolveEffects(self);
}
else if(hp <= 0)
{
	instance_destroy();
}