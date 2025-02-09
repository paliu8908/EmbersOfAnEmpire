 /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if(combatlessCounter >= 60 * 8)
{
	outOfCombat = true;
	
	combatlessCounter = 0;
}
else
{
	combatlessCounter++;
}

if(collision_circle(x, y, unitSpread, com_projectile, false, false))
{
	outOfCombat = false;
}

if(hp >= 0 && !stun)
{
	if(minerals >= mineralsMax)   
	{
		
		if(!instance_exists(dropSpot))
		{
		
			var possible_dropoff = ds_list_create();
			
			collision_circle_list(x, y , max(room_width, room_height), Ark_Refinery, false, false, possible_dropoff, true);
			
			dropSpot = ds_list_find_value(possible_dropoff, 0);
			
			while(dropSpot.faction_number != faction_number && ds_list_size(possible_dropoff) > 0)
			{
				ds_list_delete(possible_dropoff, 0);
				
				dropSpot = ds_list_find_value(possible_dropoff, 0);
			}
			
			ds_list_destroy(possible_dropoff);
		}
		else
		{
			direction = point_direction(x, y, dropSpot.x, dropSpot.y);
			
			if_move = 6;
		}
	}
	
	if(if_move == 0 && instance_exists(com_asteroid))
	{
		
		target = instance_nearest(x, y, com_asteroid);
		
		if_move = 7;
		
		atkOrder = true;
		
		ds_list_add(attackTargets, target);
	}
	
	//Moving, acceleration
	else if(if_move == 1)
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
		
		if(abs(point_direction(x, y, target.x, target.y) - (direction + shootAngle)) >= fireAngle || distance_to_object(target) < range)
		{
				
			var offsetX = dcos(target.direction + shootAngle + angle) * range;
			
			var offsetY = -dsin(target.direction + angle + shootAngle) * range;
			
			direction = point_direction(x, y, target.x - offsetX, target.y - offsetY);
		}
	}
	
	//chase
	else if(if_move == 4)
	{
		if(instance_exists(target))
		{
			if(abs(point_direction(x, y, target.x, target.y) - (direction + shootAngle)) >= fireAngle || abs(distance_to_object(target)) > range)
			{
				
				var offsetX = dcos(target.direction + shootAngle + angle) * range;
			
				var offsetY = -dsin(target.direction + angle + shootAngle) * range;
				
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
		
		if(!instance_exists(dropSpot) || dropSpot.faction_number != faction_number)
		{
		
			var possible_dropoff = ds_list_create();
			
			collision_rectangle_list(0, 0 , room_width, room_height, Ark_Refinery, false, false, possible_dropoff, true);
			
			dropSpot = ds_list_find_value(possible_dropoff, 0);
			
			while(dropSpot.faction_number != faction_number && ds_list_size(possible_dropoff) > 0)
			{
				ds_list_delete(possible_dropoff, 0);
				
				dropSpot = ds_list_find_value(possible_dropoff, 0);
			}
			
			ds_list_destroy(possible_dropoff);
		}
		else
		{
			if(distance_to_object(dropSpot) > acceleration)
			{
				
				if(speed < move_speed - acceleration)
				{
					speed += acceleration;
				}
				else if(speed < move_speed)
				{
					speed = move_speed;
				}
				
				direction = point_direction(x, y, dropSpot.x, dropSpot.y);
			}

			if(collision_point(dropSpot.x, dropSpot.y, self, false, false))
			{
				ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) + minerals);
				
				minerals = 0;
				
				if_move = 0;
				
				speed = 0;
			}		
		}
		
	}
	else if(if_move == 7 && minerals < mineralsMax)
	{
		if(instance_exists(target) && distance_to_object(target) > range)
		{
				
			if(speed < move_speed - acceleration)
			{
				speed += acceleration;
			}
			else if(speed < move_speed)
			{
				speed = move_speed;
			}
				
			direction = point_direction(x, y, target.x, target.y);
		}
		else
		{
			target = instance_nearest(x, y, com_asteroid);
		
			atkOrder = true;
		
			ds_list_add(attackTargets, target);
		}
		
	}
	
	else if(if_move == 7 && minerals < mineralsMax)
	{
		if_move = 6;
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
		
				attack.direction = point_direction(x, y, target.x, target.y);
				
				attack.image_angle = attack.direction;
		
				if(burst != 1)
				{
					if_burst = 1
				}
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
		
		attack.direction = point_direction(x, y, target.x, target.y);
				
		attack.image_angle = attack.direction;
		
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

}
else if(stun && speed != 0)
{
	speed= 0;
}
else if(hp <= 0)
{
	instance_destroy();
}

ResolveAbilities(self);
ResolveEffects(self);