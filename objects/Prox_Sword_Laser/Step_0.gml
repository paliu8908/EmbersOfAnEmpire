/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{
	/*
	target = owner.target;
	
	if_ready = true;
	
	faction_number = owner.faction_number;*/
	
	image_angle = direction;

}
else if(!instance_exists(owner))
{
	instance_destroy(  );
}

if(if_ready)
{
	if(!instance_exists(owner))
	{
		instance_destroy();
	}

	else
	{
	
		x = owner.x;
	
		y = owner.y;
		
		if(instance_exists(target)) 
		{
			move_x = target.x;
			move_y = target.y;
		}
		
		else if(instance_exists(owner.target)) 
		{
			target = owner.target;
			move_x = target.x;
			move_y = target.y;
		}
		
		else
		{
			move_x = x + range * cos(degtorad(owner.direction));
			move_y = y - range * sin(degtorad(owner.direction));
		}
	
		if(dmgCounter == 0)
		{
			dmgCounter = floor(damageTime* 60);
		
			ds_list_clear(hit);
		
			if(instance_exists(target))
			{
				collision_line_list(x, y, target.x, target.y, com_unit, false, false, hit, true);
			}
			else
			{
				collision_line_list(x, y, move_x, move_y, com_unit, false, false, hit, true);
			}
		
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
				DealDamageLaser(self, hitUnit);
				
				if(!instance_exists(target))
				{
					hitUnit = target;
				}
			}
			else if(instance_exists(target) && target.faction_number != faction_number)
			{
				DealDamageLaser(self, target);
			}
		
		}
	
		if(timeAlive >= existingTime* 60)
		{
			instance_destroy();
	
		}
	
		timeAlive++;
	
		dmgCounter--;
	}
}