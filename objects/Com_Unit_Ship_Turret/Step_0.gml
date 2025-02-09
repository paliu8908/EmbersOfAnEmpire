/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(combatlessCounter >= 30 * 5)
{
	outOfCombat = true;
	
	combatlessCounter = 0;
}


if(collision_circle(x, y, max(sprite_width, sprite_height) * 5, com_projectile, false, false))
{
	outOfCombat = false;
	
	combatlessCounter = 0;
}
else
{
	combatlessCounter++;
}

if(hp >= 0 && !stun)
{
	
	if(instance_exists(target))
	{
		for(var _i = 0; _i < array_length(main_weapon_list); _i++)
		{
			if(!instance_exists(main_weapon_list[_i][12]) || atkOrder)
			{
				main_weapon_list[_i][12] = target;
			}
		}
		
	}
	
	//rotate turret
	for(var _i = 0; _i < array_length(main_weapon_list); _i++)
	{
			
		var _wpnTarget = main_weapon_list[_i][12];
		var _wpnShootAngle = main_weapon_list[_i][3];
		var _wpnFireAngle = main_weapon_list[_i][2];
		var _wpnRange = main_weapon_list[_i][1];
			
		if(_wpnShootAngle != 0 && !instance_exists(_wpnTarget) && outOfCombat)
		{
			if(abs(_wpnShootAngle) < turretRotation)
			{
				main_weapon_list[_i][3] = 0;
			}
			else if(_wpnShootAngle < 0 && _wpnShootAngle + turretRotation <= turretTurnAngle)
			{
				main_weapon_list[_i][3] += turretRotation;
			}
			else if(_wpnShootAngle > 0 && _wpnShootAngle - turretRotation >= -turretTurnAngle)
			{
				main_weapon_list[_i][3] -= turretRotation;
			}
		}
		
		else if(_wpnShootAngle != 0 && distance_to_object(_wpnTarget) > _wpnRange && outOfCombat)
		{
			if(abs(_wpnShootAngle) < turretRotation)
			{
				main_weapon_list[_i][3] = 0;
			}
			else if(_wpnShootAngle < 0 && _wpnShootAngle + turretRotation <= turretTurnAngle)
			{
				main_weapon_list[_i][3] += turretRotation;
			}
			else if(_wpnShootAngle > 0 && _wpnShootAngle - turretRotation >= -turretTurnAngle)
			{
				main_weapon_list[_i][3] -= turretRotation;
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
		
				if(abs(_angleDiff) < turretRotation && turretTurnAngle > point_direction(x + _wpnOffX, y + _wpnOffY, _wpnTarget.x, _wpnTarget.y))
				{
					main_weapon_list[_i][3] = point_direction(x + _wpnOffX, y + _wpnOffY, _wpnTarget.x, _wpnTarget.y);
				}
				else if(_angleDiff < 0 && _wpnShootAngle + turretRotation <= turretTurnAngle)
				{
					main_weapon_list[_i][3] += turretRotation;
				}
				else if(_angleDiff > 0 && _wpnShootAngle - turretRotation >= -turretTurnAngle)
				{
					main_weapon_list[_i][3] -= turretRotation;
				}
			  
				shootAngle = main_weapon_list[_i][3]; 
			} 
		}
	}
	
	//Moving, acceleration
	if(if_move == 1)
	{
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
		
				if(abs(_angleDiff) <= turnRadius)
				{
					direction = point_direction(x, y, move_x, move_y);
				}
		
				else if(_angleDiff < 0)
				{
					direction += turnRadius;
				}
				else if(_angleDiff > 0)
				{
					direction -= turnRadius;
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
		
				if(abs(_angleDiff) <= turnRadius)
				{
					direction = point_direction(x, y, move_x, move_y);
				}
		
				else if(_angleDiff < 0)
				{
					direction += turnRadius;
				}
				else if(_angleDiff > 0)
				{
					direction -= turnRadius;
				}
			}
			else
			{
				ds_list_delete(moveXList, 0);
				ds_list_delete(moveYList, 0);
			
				move_x = x;
		
				move_y = y;
				
				if_move = 5;
			
				speed = 0;
			}
		}
		else
		{
			if(speed < move_speed - acceleration)
			{
				speed += acceleration;
			}
			else if(speed < move_speed)
			{
				speed = move_speed;
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
		
			if(abs(_angleDiff) <= turnRadius)
			{
				direction = point_direction(x, y, move_x, move_y);
			}
		
			else if(_angleDiff < 0)
			{
				direction += turnRadius;
			}
			else if(_angleDiff > 0)
			{
				direction -= turnRadius;
			}
		}
	}

	//Adjust during movement
/*	else if(if_move == 2)
	{
		
			//Turn in the right direction
			var _angleDiff = direction - point_direction(x, y, move_x, move_y);
		
			if(_angleDiff < -180)
			{
				_angleDiff += 360;
			}
			else if(_angleDiff > 180)
			{
				_angleDiff -= 360;
			}
		
			if(abs(_angleDiff) <= turnRadius)
			{
				direction = point_direction(x, y, move_x, move_y);
			}
		
			else if(_angleDiff < 0)
			{
				direction += turnRadius;
			}
			else if(_angleDiff > 0)
			{
				direction -= turnRadius;
			}
		
	}*/
	
	//accelerate for chase
	else if(if_move == 3 && instance_exists(target))
	{
		var offsetX = dcos(target.direction + shootAngle + angle) * range;
			
		var offsetY = -dsin(target.direction + angle + shootAngle) * range;
		
		var _angleDiff = direction - point_direction(x, y, target.x, target.y);
			
		if(_angleDiff < -180)
		{
			_angleDiff += 360;
		}
		else if(_angleDiff > 180)
		{
			_angleDiff -= 360;
		}
		
		if(distance_to_object(target) > range || _angleDiff > fireAngle)
		{
			
			if(speed < move_speed - acceleration)
			{
				speed += acceleration;
			}
			else if(speed < move_speed)
			{
				speed = move_speed;
			}
			
			//var _angleDiff = direction - point_direction(x, y, target.x - offsetX, target.y - offsetY);
		
			if(abs(_angleDiff) <= fireAngle)
			{
				direction = point_direction(x, y, target.x, target.y);
			}
		
			else if(_angleDiff < 0)
			{
				direction += turnRadius;
			}
			else if(_angleDiff > 0)
			{
				direction -= turnRadius;
			}
		}
		/*else if(x - target.x - offsetX < move_speed && y - target.y - offsetY < move_speed)
		{
			//direction = point_direction(x, y, target.x - offsetX, target.y - offsetY);
			
			direction = point_direction(x, y, target.x, target.y)
			
			speed = move_speed;
		}*/
		else
		{
			
			speed = min(move_speed, target.speed);
			
			//speed = move_speed;
			
			var _angleDiff = direction - point_direction(x, y, target.x, target.y);
		
			if(_angleDiff < -180)
			{
				_angleDiff += 360;
			}
			else if(_angleDiff > 180)
			{
				_angleDiff -= 360;
			}
		
			if(abs(_angleDiff) <= fireAngle)
			{
				direction = point_direction(x, y, target.x, target.y);
			}
		
			else if(_angleDiff < 0)
			{
				direction += turnRadius;
			}
			else if(_angleDiff > 0)
			{
				direction -= turnRadius;
			}
			
		}
		
		
		
	}
	//chase
	else if(if_move == 4)
	{
		if(instance_exists(target))
		{
			
			if(distance_to_object(target) > range)
			{
			
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
		
				if(abs(_angleDiff) <= fireAngle)
				{
					direction = point_direction(x, y, target.x, target.y);
				}
		
				else if(_angleDiff < 0)
				{
					direction += turnRadius;
				}
				else if(_angleDiff > 0)
				{
					direction -= turnRadius;
				}
			}
			/*else if(x - target.x - offsetX < move_speed && y - target.y - offsetY < move_speed)
			{
				//direction = point_direction(x, y, target.x - offsetX, target.y - offsetY);
			
				direction = point_direction(x, y, target.x, target.y)
			
				speed = move_speed;
			}*/
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
		
				if(abs(_angleDiff) <= fireAngle)
				{
					direction = point_direction(x, y, target.x, target.y);
				}
		
				else if(_angleDiff < 0)
				{
					direction += turnRadius;
				}
				else if(_angleDiff > 0)
				{
					direction -= turnRadius;
				}
			
			}
		}
		else
		{
			move_x = x;

			move_y = y;
				
			if_move = 1;
			
			speed = 0;
		}
	}
	else if(if_move == 5)
	{
		speed = 0;
		
		move_x = x;

		move_y = y;
				
		if_move = 0;
			
		speed = 0;
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
			main_weapon_list[_i][8]++; //raise counter
	
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
			weapon_list[_i][7]++; //raise the counter
	
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

}
else if(hp <= 0)
{
	instance_destroy();
}

ResolveAbilities(self);
ResolveEffects(self);
