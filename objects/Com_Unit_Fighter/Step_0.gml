/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(hp >= 0 && !stun)
{

	//Adjust during movement
	if(if_move == 1)
	{
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
			
			speed = move_speed;
			
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
		
		if(distance_to_object(target) > range * 0.8)
		{
			
			speed = move_speed;
			
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
		
				attack.direction = point_direction(x, y, target.x + random_range(-spread, spread), target.y + random_range(-spread, spread));
				
				attack.image_angle = attack.direction;
				
				attack.range = range + 25;
				
				/*if(attack.type == "missile")
				{
					attack.existingTime = missileTime;
				}*/
		
				if(burst != 1)
				{
					if_burst = 1
				}
					
				combatlessCounter = 0;
					
				outOfCombat = false;
			}
		}
	
		
		//Choose a new target because target destroyed
		else //if(if_shoot)
		{			
			ds_list_delete(attackTargets, 0);
			
			while(ds_list_size(attackTargets) > 1 && !instance_exists(target))
			{
				ds_list_delete(attackTargets, 0);
		
				target = ds_list_find_value(attackTargets, 0);
			
				if(instance_exists(target))
				{
			
					self.target_x = target.x;
		
					self.target_y = target.y;
			
					if_shoot = true;
			
					atkOrder = true;
					
					if_move = 3;
				}
			}
			
			
			//else //no targets left
		
			if(ds_list_size(attackTargets) == 0)
			{
				atkOrder = false;
		
				if_shoot = false;
			
				target = 0;
			}
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
			}
			
			if(target.faction_number == faction_number || !instance_exists(target) || target.type == "asteroid")
			{
				target = 0;
			}
		}
		
		ds_list_destroy(enemies);
	}
	
	//shoot target 
	else if(instance_exists(target) && if_reload != 0 && if_burst == 0 && abs(distance_to_object(target)) < range &&  abs(point_direction(x, y, target.x, target.y) - (shootAngle + direction)) <= fireAngle)
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
		
		attack.direction = point_direction(x, y, target.x + random_range(-spread, spread), target.y + random_range(-spread, spread));
				
		attack.image_angle = attack.direction;
		
		attack.range = range + 25;
		
		if(burst != 1)
		{
			if_burst = 1
		}
					
		combatlessCounter = 0;
					
		outOfCombat = false;
		
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
			if_reload = burst;
		
			reload_counter = 0;
		}
	}

	//recharge burst
	if(if_burst == 1)
	{
		burst_counter++;
	
		if(burst_counter >= 60 * burst_delay)
		{
			burst_counter = 0;
		
			if_burst = 0;
		}
	}

}
else if(hp <= 0)
{
	instance_destroy();
}

ResolveAbilities(self);
ResolveEffects(self);