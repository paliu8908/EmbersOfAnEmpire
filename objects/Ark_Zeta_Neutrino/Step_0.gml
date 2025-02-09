/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{
	move_x = owner.target_x;
	
	move_y = owner.target_y;
	
	create_x = owner.x;
	
	create_y = owner.y;
	
	target = owner.target;

	image_angle = point_direction(x, y, move_x, move_y) + 90;

	direction = point_direction(x, y, move_x, move_y);

	speed = move_speed;
	
	if_ready = true;
	
	faction_number = owner.faction_number;

}
else if(if_ready == false && !instance_exists(owner))
{
	instance_destroy();
}
 
if(if_ready && distance_to_point(create_x, create_y) > range)
{
	instance_destroy();
}

else if(if_ready && !hasDamaged)
{
	
	ds_list_clear(hit);
		
	collision_line_list(x, y, move_x, move_y, com_unit, false, false, hit, true);
		
	hitUnit = ds_list_find_value(hit, 0);
		
	var check = 0;
			
	if(hitUnit == undefined)
	{
		hitUnit = 0;
	}
		
	while(check < ds_list_size(hit) && hitUnit.faction_number == faction_number)
	{
		ds_list_delete(hit, 0);
			
		hitUnit = ds_list_find_value(hit, 0);			
	}
		
	if(instance_exists(hitUnit) && distance_to_object(hitUnit) < speed)
	{
		if(hitUnit.hasShield && hitUnit.faction_number != faction_number && hitUnit.shieldHealth > 0)
		{
			
			instance_destroy();
			
		}

		else if(hitUnit.faction_number != faction_number)
		{
			
			if(hitUnit.faction_number != faction_number && string_ends_with(hitUnit.type, "ship"))
			{
				damage += hitUnit.block * bonusMultiplier;
			}
	
			damage *= hitUnit.dmgReduction;
				
			hitUnit.hp -= damage;
	
			instance_create_layer(hitUnit.x, hitUnit.y, "instances", explodeType)
			
			hasDamaged = true;
			
			instance_destroy();
		}
	}
	else if(instance_exists(target) && target.faction_number != faction_number && distance_to_object(target) < speed)
	{
		if(target.hasShield && target.faction_number != faction_number && target.shieldHealth > 0)
		{
			
			instance_destroy();
		}

		else if(target.faction_number != faction_number)
		{
			
			if(target.faction_number != faction_number && string_ends_with(target.type, "ship"))
			{
				damage += target.block * bonusMultiplier;
			}
	
			damage *= target.dmgReduction;
	
			target.hp -= damage;
	
			instance_create_layer(target.x, target.y, "instances", explodeType)
			
			hasDamaged = true;
			
			instance_destroy();
		}
	}
}