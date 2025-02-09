 /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(combatlessCounter >= 60 * 8)
{
	outOfCombat = true;
	
	combatlessCounter = 0;
}


if(collision_circle(x, y, unitSpread * 10, com_projectile, false, false))
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
		if(speed == move_speed)
		{
			if_move = 2;
		}
		else if(speed < move_speed - acceleration)
		{
			speed += acceleration;
		}
		else if(speed < move_speed)
		{
			speed = move_speed;
		}

		direction = point_direction(x, y, move_x, move_y);

	}

	//Adjust during movement
	else if(if_move == 2)
	{
	
		if(abs(distance_to_point(move_x, move_y)) <= stopDis)
		{
		
			if(ds_list_size(moveXList) > 1 && !patrol)
			{
				ds_list_delete(moveXList, 0);
				ds_list_delete(moveYList, 0);
			
				move_x = ds_list_find_value(moveXList, 0);
				move_y = ds_list_find_value(moveYList, 0);
			                
				direction = point_direction(x, y, move_x, move_y);
	 		}
			else if(ds_list_size(moveXList) > 1)
			{
				ds_list_add(moveXList, ds_list_find_value(moveXList, 0));
				ds_list_add(moveYList, ds_list_find_value(moveYList, 0));
			
				ds_list_delete(moveXList, 0);
				ds_list_delete(moveYList, 0);
			
				move_x = ds_list_find_value(moveXList, 0);
				move_y = ds_list_find_value(moveYList, 0);
			                
				direction = point_direction(x, y, move_x, move_y);
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
		
			//Turn in the right direction
			direction = point_direction(x, y, move_x, move_y);
		}

	}
	
	//accelerate for chase
	else if(if_move == 3 && instance_exists(target))
	{
		if(speed == move_speed)
		{
			if_move = 4;
		}
		else if(speed < move_speed - acceleration)
		{
			speed += acceleration;
		}
		else if(speed < move_speed)
		{
			speed = move_speed;
		}
		
		if(abs(point_direction(x, y, target.x, target.y) - (direction + turretAngle)) >= fireAngle || distance_to_object(target) < range)
		{
				
			var offsetX = dcos(target.direction + turretAngle + angle) * range;
			
			var offsetY = -dsin(target.direction + angle + turretAngle) * range;
			
			direction = point_direction(x, y, target.x - offsetX, target.y - offsetY);
		}
	}
	
	//chase
	else if(if_move == 4)
	{
		if(instance_exists(target))
		{
			if(abs(point_direction(x, y, target.x, target.y) - (direction + turretAngle)) >= fireAngle || abs(distance_to_object(target)) > range)
			{
				
				var offsetX = dcos(target.direction + turretAngle + angle) * range;
			
				var offsetY = -dsin(target.direction + angle + turretAngle) * range;
				
				direction = point_direction(x, y, target.x - offsetX, target.y - offsetY);
			}
		}
		else
		{
			move_x = x;

			move_y = y;
				
			if_move = 0;
			
			direction = point_direction(x, y, x, y);
			
			speed = 0;
		}
	}
	else if(if_move == 5)
	{
		
		move_x = x;

		move_y = y;
				
		if_move = 0;
			
		speed = 0;
	}
	else if(if_move == 6)
	{
		
		move_x = x;

		move_y = y;
			
		speed = 0;
			
		if(instance_exists(target))
		{
			var _angleDiff = turretAngle + direction - point_direction(x, y, target.x, target.y);
		
			if(abs(_angleDiff) > fireAngle)
			{
		
				if(_angleDiff < -180)
				{
					_angleDiff += 360;
				}
				else if(_angleDiff > 180)
				{
					_angleDiff -= 360;
				}
		
				if(_angleDiff < 0 && turretAngle + turretRotation <= turretTurnAngle)
				{
					turretAngle += turretRotation;
				}
				else if(_angleDiff > 0 && turretAngle - turretRotation >= -turretTurnAngle)
				{
					turretAngle -= turretRotation;
				}
			}
		}
	}

	//ATTACKING

	//AtkOrder given.
	//Shoot if has target and because
	
	if(atkOrder && if_move == 6)
	{
		
		if(instance_exists(target))
		{
			//Distance to enemy
			dis_to_enemy = abs(distance_to_object(target));
		
			target_x = target.x;
		
			target_y = target.y;
		
			var _angleDiff = turretAngle + direction - point_direction(x, y, target.x, target.y);
			
			if(_angleDiff < -180)
			{
				_angleDiff += 360;
			}
			else if(_angleDiff > 180)
			{
				_angleDiff -= 360;
			}
			
			//choose enemy as target and fires
			if(if_reload != 0 && if_burst == 0 && dis_to_enemy < range && abs(_angleDiff) <= fireAngle)
			{
				if_reload--;
				
				shoot_weapon_fighter(self, target, x, y);
		
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
		}
		//else //no targets left
		
		if(ds_list_size(attackTargets) == 0)
		{
			atkOrder = false;
		
			if_shoot = false;
			
			target = 0;
		}
	}

	//Scan for enemies; the passive scan if no targets, outside of range, or outside of fire angle
	else if(!instance_exists(target) || if_shoot == false || distance_to_object(target) >= range)// || abs(turretAngle + direction - point_direction(x, y, target.x, target.y)) >= fireAngle)
	{
		var enemies = ds_list_create();

		collision_circle_list(x, y, range, com_unit, false, true, enemies, true)
	
		if(ds_list_size(enemies) != 0)
		{
			enemy_numbers = ds_list_size(enemies);
			
			for(var choices = 0; choices < enemy_numbers; choices++;)
			{

				target = ds_list_find_value(enemies, choices)
		
				if(instance_exists(target) && target.faction_number != self.faction_number )
				{
					self.target_x = target.x;
		
					self.target_y = target.y;
			
					if_shoot = true;
							
					ds_list_add(attackTargets, target);
					
					atkOrder = false;

				}
			}
		
		}
	
		ds_list_destroy(enemies);
	}
	
	//shoot target 
	else if(if_move == 6 && instance_exists(target) && if_reload != 0 && if_burst == 0 && abs(distance_to_object(target)) < range)
	{
		_angleDiff = abs(turretAngle + direction - point_direction(x, y, target.x, target.y));
		
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

			if_reload--;
				
			shoot_weapon_fighter(self, target, x, y);
		
			if(burst != 1)
			{
				if_burst = 1
			}
					
			combatlessCounter = 0;
					
			outOfCombat = false;
		}
		
	}
	
	else
	{
		if_shoot = false;
		
		target = 0;
		
		atkOrder = false;
	}

	//reload
	if(if_reload == 0 && if_move == 6)
	{
		reload_counter++;
	
		if(reload_counter >= 60 * reload_time)
		{
			if_reload = burst
		
			reload_counter = 0;
		}
	}

	//recharge burst
	if(if_burst == 1 && if_move == 6)
	{
		burst_counter++;
	
		if(burst_counter >= 60 * burst_delay)
		{
			burst_counter = 0
		
			if_burst = 0
		}
	}

}
else if(hp <= 0)
{
	instance_destroy();
}

ResolveAbilities(self);
ResolveEffects(self);