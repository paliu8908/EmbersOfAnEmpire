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
		
		if(speed < move_speed - acceleration)
		{
			speed += acceleration;
		}
		else if(speed < move_speed)
		{
			speed = move_speed;
		}
			
		//Turn in the right direction
		var _angleDiff = direction - point_direction(x, y, target.x, target.y);
		
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
	//chase
	else if(if_move == 4)
	{
		if(instance_exists(target))
		{
			
			if(abs(point_direction(x, y, target.x, target.y) - (direction + shootAngle)) >= fireAngle)
			{
				
				//Turn in the right direction
				var _angleDiff = direction - point_direction(x, y, target.x, target.y);
		
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
	
	if(atkOrder)
	{
		
		if(instance_exists(target))
		{
			//Distance to enemy
			dis_to_enemy = abs(distance_to_object(target));
		
			target_x = target.x;
		
			target_y = target.y;
		
			var angleDifference = abs(point_direction(x, y, target.x, target.y) - (direction + shootAngle));
			
			//choose enemy as target and fires
			if(if_reload != 0 && if_burst == 0 && dis_to_enemy < range &&  angleDifference <= fireAngle)
			{
				if_reload--;
				
				var attack = instance_create_layer(x, y, "instances", weapon);
			
				attack.owner = self.id;
			
				attack.faction_number = faction_number;
			
				attack.move_x = target.x;
	
				attack.move_y = target.y;
	
				attack.create_x = x;
	
				attack.create_y = y;
	
				attack.if_ready = true;
			
				attack.target = target;
					
				attack.speed = attack.move_speed;
				
				attack.fireAngle = fireAngle;
			
				attack.shootAngle = shootAngle;
		
				if(attack.type == "missile")
				{
					attack.direction = direction;
				}
					
				else
				{
					attack.direction = point_direction(attack.create_x, attack.create_y, attack.target.x + random_range(-atk_off_x, atk_off_x), attack.target.y + random_range(-atk_off_y, atk_off_y));
				}
					
				attack.image_angle = attack.direction;
		
				if(burst != 1)
				{
					if_burst = 1
				}
			}
		}
	
		
		//Choose a new target because target destroyed
		else if(if_shoot)
		{
			while(ds_list_size(attackTargets) > 1 && !instance_exists(target))
			{
				ds_list_delete(attackTargets, 0);
		
				target = ds_list_find_value(attackTargets, 0);
			
				if(instance_exists(target))
				{
			
					self.target_x = target.x;
		
					self.target_y = target.y;
			
					if_shoot = true;
			
					atkOrder = false;
				}
			}
		}
		else //no targets left
		{
			atkOrder = false;
		
			if_shoot = false;
			
			target = 0;
		}
	}

	//Scan for enemies; the passive scan if no targets, outside of range, or outside of fire angle
	else if(!instance_exists(target) || if_shoot == false || distance_to_object(target) >= range || abs(point_direction(x, y, target.x, target.y) - (direction + shootAngle)) >= fireAngle)
	{
		var enemies = ds_list_create();

		collision_circle_list(x, y, range, com_unit, false, true, enemies, true)
	
		if(ds_list_size(enemies) != 0)
		{
			enemy_numbers = ds_list_size(enemies);
			
			for(var choices = 0; choices < enemy_numbers; choices++;)
			{

				target = ds_list_find_value(enemies, choices)
		
				if(instance_exists(target) && target.faction_number != self.faction_number && target.type != "asteroid")
				{
					self.target_x = target.x;
		
					self.target_y = target.y;
			
					if_shoot = true;
							
					ds_list_add(attackTargets, target);
					
					atkOrder = false;
					
					choices = enemy_numbers;

				}
				else
				{
					target = 0;
				}
			}
		
		}
		
		ds_list_destroy(enemies);
		
	}
	
	//shoot target 
	else if(instance_exists(target) && if_reload != 0 && if_burst == 0 && abs(distance_to_object(target)) < range &&  abs(point_direction(x, y, target.x, target.y) - shootAngle - direction) <= fireAngle)
	{

		if_reload--;
				
		var attack = instance_create_layer(x, y, "instances", weapon);
			
		attack.owner = self.id;
			
		attack.faction_number = faction_number;
			
		attack.move_x = target.x;
	
		attack.move_y = target.y;
	
		attack.create_x = x;
	
		attack.create_y = y;
	
		attack.if_ready = true;
			
		attack.target = target;
					
		attack.speed = attack.move_speed;
		
		attack.direction = point_direction(attack.create_x, attack.create_y, attack.target.x + random_range(-atk_off_x, atk_off_x), attack.target.y + random_range(-atk_off_y, atk_off_y));
				
		attack.image_angle = attack.direction;
		
		attack.fireAngle = fireAngle;
			
		attack.shootAngle = shootAngle;
		
		if(burst != 1)
		{
			if_burst = 1
		}
		
	}
	
	else
	{
		if_shoot = false;
		
		target = 0;
		
		atkOrder = false;
	}

	//reload
	if(if_reload == 0)
	{
		reload_counter++;
	
		if(reload_counter >= 60 * reload_time)
		{
			if_reload = burst
		
			reload_counter = 0;
		}
	}

	//recharge burst
	if(if_burst == 1)
	{
		burst_counter++;
	
		if(burst_counter >= 60 * burst_delay)
		{
			burst_counter = 0
		
			if_burst = 0
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
		//shoot target 
		else if(instance_exists(_wpnTarget) && _wpnReload != 0 && _wpnBurst == 0 && _inAngle)
		{
			weapon_list[_i][10]--; //if_reload
				
			var attack = instance_create_layer(x+_wpnOffX, y+_wpnOffY, "instances", weapon_list[_i][0]);
			
			attack.owner = self.id;
			
			attack.faction_number = faction_number;
			
			attack.move_x = _wpnTarget.x;
	
			attack.move_y = _wpnTarget.y;
	
			attack.create_x = x+_wpnOffX;
	
			attack.create_y = y+_wpnOffY;
	
			attack.if_ready = true;
			
			attack.target = _wpnTarget;
		
			attack.direction = point_direction(x, y, _wpnTarget.x + random_range(-_wpnInAcc,_wpnInAcc), _wpnTarget.y + random_range(-_wpnInAcc,_wpnInAcc));
				
			attack.image_angle = attack.direction;
			
			attack.fireAngle = _wpnFireAngle;
			
			attack.shootAngle = _wpnShootAngle;
			
			attack.turOffX = weapon_list[_i][16];
			
			attack.turOffY = weapon_list[_i][15];
		
			if(weapon_list[_i][6] != 1) //[6] is burst
			{
				weapon_list[_i][9] = 1;  //[9] if_burst, set to cannot burst.
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