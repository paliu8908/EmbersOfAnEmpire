/// @description Insert description here
// You can write your code in this editor

if(speed < maxSpeed)
{
	speed = power(speed, 1.03);
	
	/*if(speed < 15)
	{
		turnAmount += 5 div 30;
	}
	else
	{
		turnAmount += 2;
	}*/
}


if(timeAlive >= existingTime div 4)
{
	turnAmount = 360;
}
else if(turnAmount < 360)
{
	turnAmount += 5 div 30;
}

// Inherit the parent event
/// @description Insert description here
// You can write your code in this editor
if(if_ready == true)
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
		
	if(abs(_angleDiff) <= turnAmount)
	{
		direction = point_direction(x, y, move_x, move_y);
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
	
	/*if(instance_exists(target) && distance_to_object(target) < detonate_radius && faction_number != target.faction_number)
	{
		target.hp -= damage - target.block;
	
		instance_create_layer(x, y, "instances", explodeType);
	
		instance_destroy();
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

	if(ds_list_size(targetsInExplode) > 0 || distance_to_point(move_x, move_y) < detonate_radius)
	{
		for(var _units = 0; _units < ds_list_size(targetsInExplode); _units++)
		{
			var _trooper = ds_list_find_value(targetsInExplode, _units)

			_trooper.shieldHealth = 0;
		
		}
		
		var _ex = instance_create_layer(x, y, "instances", explodeType);
		
		_ex.image_xscale = scaleUp;
		_ex.image_yscale = scaleUp;
		
		instance_destroy();
		
		ds_list_destroy(targetsInExplode);
	}
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
else if(if_ready == false && !instance_exists(owner))
{
	instance_destroy();
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


