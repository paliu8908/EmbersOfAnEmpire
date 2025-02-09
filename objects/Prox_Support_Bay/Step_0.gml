/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
/// @description Insert description here
// You can write your code in this editor

//Standard Actions

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

if(hp >= 0 && !stun && !constructing)
{

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
				
				target.hp += min(target.maxHp - target.hp, repair_amount);
				target.energy += min(target.maxEnergy - target.energy, energy_amount);
		
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
		var allies = ds_list_create();

		collision_circle_list(x, y, range, com_unit, false, true, allies, true)
	
		if(ds_list_size(allies) != 0)
		{
			var ally_num = ds_list_size(allies);
			
			for(var choices = 0; choices < ally_num; choices++;)
			{

				target = ds_list_find_value(allies, choices)
		
				if(instance_exists(target) && target.faction_number == self.faction_number && target.hp < target.maxHp && target.type != "asteroid")
				{
					self.target_x = target.x;
		
					self.target_y = target.y;
			
					if_shoot = true;
							
					ds_list_add(attackTargets, target);
					
					atkOrder = false;
					
					choices = ally_num;

				}
			}
			
			if(target.faction_number != faction_number || !instance_exists(target) || target.type == "asteroid")
			{
				target = 0;
			}
		}
		
		ds_list_destroy(allies);
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
		
		target.hp += min(target.maxHp - target.hp, repair_amount);
		target.energy += min(target.maxEnergy - target.energy, energy_amount);
		
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
else if(!stun && hp > 0)
{
	construct_counter++;
	hp += (maxHp-1)/construct_time;
	
	if(construct_counter >= construct_time)
	{
		constructing = false;
	}
}
else if(hp <= 0)
{
	instance_destroy();
}

ResolveAbilities(self);
ResolveEffects(self);

if(hasShield && shieldHealth < maxShield && outOfCombat)
{
	rechargeCounter++;
	
	if(rechargeCounter == 30)
	{
		shieldHealth += rechargeRate;
		
		rechargeCounter = 0;
	}
}
if(instance_exists(owner))
{
	x = owner.x + sqrt(sqr(shift_y)+sqr(shift_x)) * sin(degtorad((darctan2(shift_x, shift_y) + direction)));
	y = owner.y + sqrt(sqr(shift_y)+sqr(shift_x)) * cos(degtorad((darctan2(shift_x, shift_y) + direction)));
	image_angle = owner.direction;
	direction = image_angle;
	
	
} else {
	instance_destroy();
}
