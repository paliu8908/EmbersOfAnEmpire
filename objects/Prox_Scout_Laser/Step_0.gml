 /// @description Insert description here
// You can write your code in this editor
if(!if_ready && instance_exists(owner))
{
	
	target = owner.target;
	
	if_ready = true;
	
	faction_number = owner.faction_number;
	
	if(target != 0 && instance_exists(target) && target.isProjectile)
	{
		instance_create_layer(target.x, target.y, "instances", missileEndType);
	}

}
else if(!instance_exists(owner))
{
	instance_destroy();
}
else if(if_ready && !instance_exists(target))
{
	instance_destroy();
}
else if(if_ready && abs(point_direction(x, y, target.x, target.y) - owner.direction) > fireAngle)
{
	instance_destroy();
}

else if(if_ready)
{
	
	timeAlive++;
	
	x = owner.x;
	
	y = owner.y;
	
	if(dmgCounter == 0)
	{
		dmgCounter = damageTime* 60;
		
		ds_list_clear(hit);
		
		collision_line_list(x, y, target.x, target.y, com_unit, false, false, hit, true);
		
		var missileList = ds_list_create();
		
		collision_line_list(x, y, target.x, target.y, com_missile, false, false, missileList, true);
		
		for(var m = 0; m < ds_list_size(missileList); m++)
		{
			ds_list_add(hit, ds_list_find_value(missileList, m));
		}
		
		var bombList = ds_list_create();
		
		collision_line_list(x, y, target.x, target.y, com_bomb, false, false, bombList, true);
		
		for(var m = 0; m < ds_list_size(bombList); m++)
		{
			ds_list_add(hit, ds_list_find_value(bombList, m));
		}
		
		hitUnit = ds_list_find_value(hit, 0);
		
		for(var u = 0; u < ds_list_size(hit); u++)
		{
			if(distance_to_object(ds_list_find_value(hit, u)) < distance_to_object(hitUnit) && hitUnit.faction_number != faction_number)
			{
				hitUnit = ds_list_find_value(hit, u);
			}
		}
		
		if(instance_exists(hitUnit) && ds_list_size(hit) > 0 && hitUnit.isUnit)
		{
			
			if(hitUnit.hasShield && hitUnit.faction_number != faction_number)
			{
	
				damage *= hitUnit.dmgReduction;
	
				damage -= hitUnit.block;
	
				if(hitUnit.shieldHealth >= damage && damage > 0)
				{
					hitUnit.shieldHealth -= damage;
				}
				else if(damage > 0)
				{
					hitUnit.hp -= damage - hitUnit.shieldHealth;
		
					hitUnit.shieldHealth = 0;
		
				}
	
				dmgCounter = 0;
	
				instance_create_layer(hitUnit.x, hitUnit.y, "instances", explodeType)
			}

			else if(hitUnit.faction_number != faction_number)
			{
				damage *= hitUnit.dmgReduction;
				
				if(damage  - hitUnit.block > 0)
				{
	
					hitUnit.hp -= damage - hitUnit.block;
				}
	
				dmgCounter = 0;
	
				instance_create_layer(hitUnit.x, hitUnit.y, "instances", explodeType)
			}
			
		}

		else if(ds_list_size(hit) > 0 && hitUnit.isProjectile)
		{
			instance_create_layer(hitUnit.x, hitUnit.y, "instances", missileEndType);
			
			instance_destroy(hitUnit);
			
			instance_destroy();
			

		}
	
		ds_list_destroy(bombList);
		ds_list_destroy(missileList);
	}
	
	if(timeAlive == existingTime* 60)
	{
		instance_destroy();
	}
	
	dmgCounter--; 
}