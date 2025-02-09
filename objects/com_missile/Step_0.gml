/// @description Insert description here
// You can write your code in this editor



if(if_ready == true && instance_exists(target))
{

	var _angleDiff = direction - point_direction(x, y, target.x, target.y);
		
	if(_angleDiff < -180)
	{
		_angleDiff += 360;
	}
	else if(_angleDiff > 180)
	{
		_angleDiff -= 360;
	}
		
	if(abs(_angleDiff) <= turnAmount)
	{
		direction = point_direction(x, y, target.x, target.y);
	}
		
	else if(_angleDiff < 0)
	{
		direction += turnAmount;
	}
	else if(_angleDiff > 0)
	{
		direction -= turnAmount;
	}
	
	image_angle = direction;
	
	speed = move_speed;
	
	/*if(instance_exists(target) && distance_to_object(target) < detonate_radius && faction_number != target.faction_number)
	{
		target.hp -= damage - target.block;
	
		instance_create_layer(x, y, "instances", explodeType);
	
		instance_destroy();
	}*/

	//Search for new target if target is out of range, currently inactive
	/*if(distance_to_object(target) > move_speed * (existingTime - timeAlive))
	{
	
		//passive scan for targets
		var enemies = ds_list_create();
	
		collision_circle_list(x, y, speed * (existingTime - timeAlive), com_unit, false, true, enemies, true)
	
		if(ds_list_size(enemies) != 0)
		{
			enemy_numbers = ds_list_size(enemies);
			
			for(var choices = 0; choices < enemy_numbers; choices++;)
			{

				var scan = ds_list_find_value(enemies, choices)
		
				if(instance_exists(scan) && scan.faction_number != self.faction_number && scan.type != "asteroid")
				{
					target = scan;
					
					self.move_x = target.x;
		
					self.move_y = target.y;

				}
			}
		}
		
		ds_list_destroy(enemies);
	}*/
	
	var targetsInExplode = ds_list_create();
	
	collision_circle_list(x, y, detonate_radius, com_unit, false, true, targetsInExplode, true);

	for(var _allies = ds_list_size(targetsInExplode)-1; _allies >= 0 && ds_list_size(targetsInExplode) >0; _allies--)
	{
		if(ds_list_find_value(targetsInExplode, _allies).faction_number == faction_number)
		{
			ds_list_delete(targetsInExplode, _allies);
		}
	}

	if(ds_list_size(targetsInExplode) > 0)
	{
		for(var _units = 0; _units < ds_list_size(targetsInExplode); _units++)
		{
			var _trooper = ds_list_find_value(targetsInExplode, _units)

			DealDamage(self, _trooper);
		
		}
	}
		
	ds_list_destroy(targetsInExplode);
}
else if(if_ready)
{
	//passive scan for targets
	var enemies = ds_list_create();
	
	collision_circle_list(x, y, speed * (existingTime - timeAlive), com_unit, false, true, enemies, true)
	
	if(ds_list_size(enemies) > 0)
	{
		enemy_numbers = ds_list_size(enemies);
			
		for(var choices = 0; choices < enemy_numbers; choices++;)
		{

			var scan = ds_list_find_value(enemies, choices)
		
			if(instance_exists(scan) && scan.faction_number != faction_number)
			{
				target = scan;
				
				choices = enemy_numbers;

			}
		}
	}
	
	ds_list_destroy(enemies);
}

if(if_ready = false && instance_exists(owner))
{
	/*
	target = owner.target;

	direction = owner.direction; 
	
	image_angle = direction;

	speed = move_speed;
	
	if_ready = true;
	
	faction_number = owner.faction_number;*/

}

if(if_ready && hp <= 0)
{
	instance_destroy();
	

}
else if(if_ready)
{
	timeAlive++;	
	if(timeAlive >= existingTime)
	{
		instance_destroy();
	}
}

