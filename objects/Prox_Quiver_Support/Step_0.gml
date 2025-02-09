/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

/* var quivers = ds_list_create();

collision_circle_list(x, y, 500, Prox_Quiver_Support, false, false, quivers, false);

var q = ds_list_find_value(quivers, 0);		

while(0 < ds_list_size(quivers) && instance_exists(q) && q.faction_number != faction_number)
{
	ds_list_delete(quivers, 0);
			
	var q = ds_list_find_value(quivers, 0);			
}

if(instance_exists(q) && q.faction_number == faction_number)
{
	var quiv = ds_list_find_value(quivers, 0);
		
	if(quiv.faction_number == faction_number)
	{
		acceleration = max(q.move_speed, quiv.accelerationIncreaseTo);
			
		move_speed = max(q.move_speed, quiv.speedIncreaseTo);
			
		reload_time = standReload - reload_time * quiv.reloadIncrease;
		
		ifQuivSup = true;
	}

}

else
{
	reload_time = standReload;
	
	move_speed =standMoveSpeed;
	
	acceleration = standAcceleration;
	
	ifQuivSup = false;
}

ds_list_destroy(quivers);*/

boostCounter++;

if(boostCounter == boostTime)
{
	boostCounter = 0;

	var unitsToSupport = ds_list_create();

	collision_circle_list(x, y, 500, com_unit, false, false, unitsToSupport, false);

	for(var u = 0; u < ds_list_size(unitsToSupport); u++)
	{
		var unit = ds_list_find_value(unitsToSupport, u);
	
		if(instance_exists(unit) && unit.faction_number == faction_number && !if_affected(unit.effects, "Quiver") && unit.type != "asteroid")
		{
			
			array_insert(unit.effects, 0, ["QuiverSpeedBoost", boostTime * 60, max(0, unit.move_speed - move_speed)]);
			unit.move_speed += max(0, unit.move_speed - move_speed);
			
			if(string_ends_with(unit.type, "fighter") )
			{
				unit.reload_time -= unit.reload_time * reloadIncrease; //(reduced by 10%)
				
				array_insert(unit.effects, 0, ["QuiverReloadBoost", boostTime * 60, unit.reload_time * reloadIncrease]);
			}
		}
	}
}

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
		
		if(abs(point_direction(x, y, target.x, target.y) - (direction + shootAngle)) >= fireAngle || distance_to_object(target) < range)
		{
				
			var _range = 0;
				
			if(lasAbility)
			{
				_range = lasAbilityRng;
			}
			else 
			{
				_range = range;
			}
				
			var offsetX = dcos(target.direction + shootAngle + angle) * _range;
			
			var offsetY = -dsin(target.direction + angle + shootAngle) * _range;
			
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
				var _range = 0;
				
				if(lasAbility)
				{
					_range = lasAbilityRng;
				}
				else 
				{
					_range = range;
				}
				
				var offsetX = dcos(target.direction + shootAngle + angle) * _range;
			
				var offsetY = -dsin(target.direction + angle + shootAngle) * _range;
				
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

	//ATTACKING

	//AtkOrder given.
	//Shoot if has target and because
	
	if(atkOrder)
	{
		var _range = 0;
				
		if(lasAbility)
		{
			_range = lasAbilityRng;
		}
		else 
		{
			_range = range;
		}
		
		if(instance_exists(target) && distance_to_object(target) > _range)
		{
			if_move = 3;
		}
		else if(instance_exists(target))
		{
			if_move = 0;
			
			point_direction(x, y, target.x, target.y);
		}
		
		if(lasAbility && instance_exists(target))
		{
			//Distance to enemy
			dis_to_enemy = abs(distance_to_object(target));
		
			target_x = target.x;
		
			target_y = target.y;
		
			var angleDifference = abs(point_direction(x, y, target.x, target.y) - (direction + shootAngle));
			
			//choose enemy as target and fires
			if(if_reload > 0 && if_burst == 0 && dis_to_enemy < lasAbilityRng &&  angleDifference <= fireAngle)
			{
				var dmgBonus = 0;
				
				var swords = ds_list_create();
			
				collision_circle_list(x, y, 250, Prox_Sword_Fighter, false, false, swords, false);
			
				for(var s = 0; s < ds_list_size(swords); s++)
				{
					var fighter = ds_list_find_value(swords, s);
				
					if(fighter.faction_number == faction_number && !fighter.stun && abs(point_direction(fighter.x, fighter.y, x, y) - (fighter.direction + fighter.shootAngle)) <= fighter.fireAngle)
					{
						dmgBonus += 2;
						
						fighter.stun = true;
						
						fighter.if_reload = true;
						
						fighter.stunnedCounter = stunTime;
						
						var effect = instance_create_layer(x, y, "instances", obj_dummyLas);
						
						effect.owner = fighter;
						
						effect.target = self;
						
						fighter.if_reload = 0;
					}
				}
				
				ds_list_destroy(swords);
				
				if(dmgBonus > 0)
				{
			
					if_reload--;
				
					var attack = instance_create_layer(x, y, "instances", lasWeapon);
			
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
					
					attack.damage += dmgBonus;
					//attack.target = target;
					//attack.range += dmgBonus * 50;
		
					if(burst != 1)
					{
						if_burst = 1
					}
					
					combatlessCounter = 0;
					
					outOfCombat = false;
				}
			}
		}
		else if(lasAbility)
		{
			lasAbility = false;
			
			atkOrder = false;
		
			if_shoot = false;
			
			target = 0;
		}
		
		else if(instance_exists(target))
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
	if(if_reload == 0 )
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
else if(hp <= 0)
{
	instance_destroy();
}

ResolveAbilities(self);
ResolveEffects(self);