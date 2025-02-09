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

			if(faction_number != _trooper.faction_number)
			{
	
				if(_trooper.hasShield && _trooper.faction_number != faction_number)
				{
	
					if(_trooper.shieldHealth >= damage - _trooper.block)
					{
						_trooper.shieldHealth -= damage*_trooper.dmgReduction - _trooper.block;
					}
					else
					{
						_trooper.hp -= damage - _trooper.shieldHealth;
		
						_trooper.shieldHealth = 0;
		
					}
				}

				else if(_trooper.faction_number != faction_number && damage*_trooper.dmgReduction - _trooper.block > 0)
				{
	
					_trooper.hp -= damage*_trooper.dmgReduction - _trooper.block;
	
				}
		
			}
		
		}
		
		instance_create_layer(x, y, "instances", explodeType);
		
		instance_destroy();
	}
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

