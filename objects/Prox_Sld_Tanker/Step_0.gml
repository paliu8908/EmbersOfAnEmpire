/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(shieldHealth > 0)
{
	dmgReduction = shieldReduction;
}
else
{
	dmgReduction = 1;
}

if(shieldHealth < maxShield && outOfCombat)
{
	rechargeCounter++;
	
	if(rechargeCounter == 30)
	{
		shieldHealth += rechargeRate;
		
		rechargeCounter = 0;
	}
}


if(shieldHealth > 0)
{
	var _projectiles = ds_list_create();

	collision_circle_list(x, y, shieldRadius, com_projectile, true, false, _projectiles, true);

	if(ds_list_size(_projectiles) > 0)
	{
		for(var _p = 0; _p < ds_list_size(_projectiles); _p++)
		{
			var _bullet = ds_list_find_value(_projectiles, _p);
		
			if(_bullet.faction_number != faction_number && abs(point_direction(x, y, _bullet.x, _bullet.y) - direction) < 90)
			{
				outOfCombat = false;
				
				if(_bullet.type == "particle")
				{
					
					instance_destroy(_bullet);
				}
			
				else if(_bullet.type != "laser")
				{
					_bullet.damage *= dmgReduction;
	
					_bullet.damage -= other.block;
	
					if(shieldHealth >= _bullet.damage && _bullet.damage > 0)
					{
						shieldHealth -= _bullet.damage;
					}
					else if(_bullet.damage > 0)
					{
		
						shieldHealth = 0;
		
					}
					
					instance_create_layer(_bullet.x, _bullet.y, "instances", explode);
					
					instance_destroy(_bullet);	

				}
			}
		}
	}
	
	ds_list_destroy(_projectiles);
}
