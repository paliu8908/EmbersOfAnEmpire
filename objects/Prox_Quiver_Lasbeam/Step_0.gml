/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{
	
	target = owner.target;
	
	if_ready = true;
	
	faction_number = owner.faction_number;
	
	damage *= damageTime;

}
else if(!instance_exists(owner))
{
	instance_destroy();
}
else if(if_ready && !instance_exists(target))
{
	instance_destroy();
}
else if(if_ready && abs(point_direction(owner.x, owner.y, target.x, target.y) - owner.direction) > fireAngle)
{
	instance_destroy();
}

else if(if_ready)
{
	
	x = owner.x;
	
	y = owner.y;
	
	if(dmgCounter == 0)
	{
		dmgCounter = damageTime* 60;
		
		ds_list_clear(hit);
		
		collision_line_list(x, y, target.x, target.y, com_unit, false, false, hit, true);
		
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
		
		if(instance_exists(hitUnit))
		{
			if(hitUnit.hasShield && hitUnit.faction_number != faction_number)
			{
	
				damage *= hitUnit.dmgReduction;
	
				if(hitUnit.shieldHealth >= damage)
				{
					hitUnit.shieldHealth -= damage;
				}
				else
				{
					hitUnit.hp -= damage - hitUnit.shieldHealth;
		
					hitUnit.shieldHealth = 0;
		
				}
	
				instance_create_layer(hitUnit.x, hitUnit.y, "instances", explodeType)
			}

			else if(hitUnit.faction_number != faction_number)
			{
	
				damage *= hitUnit.dmgReduction;
				
				hitUnit.hp -= damage;
	
				instance_create_layer(hitUnit.x, hitUnit.y, "instances", explodeType)
			}
		}
		else if(instance_exists(target) && target.faction_number != faction_number)
		{
			if(target.hasShield && target.faction_number != faction_number)
			{
	
				damage *= target.dmgReduction;
	
				if(target.shieldHealth >= damage)
				{
					target.shieldHealth -= damage;
				}
				else
				{
					target.hp -= damage - target.shieldHealth;
		
					target.shieldHealth = 0;
		
				}
	
				instance_create_layer(target.x, target.y, "instances", explodeType)
			}

			else if(target.faction_number != faction_number)
			{
	
				damage *= target.dmgReduction;
	
				target.hp -= damage;
	
				instance_create_layer(target.x, target.y, "instances", explodeType)
			}
		}
		
	}
	
	if(timeAlive >= existingTime* 60)
	{
		instance_destroy();
		
		ds_list_destroy(hit);
	}
	
	timeAlive++;
	dmgCounter--; 
}