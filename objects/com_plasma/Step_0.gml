/// @description Insert description here
// You can write your code in this editor

timeCounter++;

if(timeCounter >= existingTime)
{
	instance_destroy();
}
else if(timeCounter % damageTime == 0)
{
	var enemies = ds_list_create();
	
	collision_circle_list(x, y, plasma_radius, com_unit, false, true, enemies, false);
	
	for(var i = 0; i < ds_list_size(enemies); i++)
	{
		var _unit = ds_list_find_value(enemies, i);
			
		if(instance_exists(_unit) && _unit.faction_number != faction_number)
		{
				
			if(_unit.hasShield )
			{
	
				damage *= _unit.dmgReduction;
	
				if(_unit.shieldHealth >= damage)
				{
					_unit.shieldHealth -= damage;
				}
				else
				{
					_unit.hp -= damage - _unit.shieldHealth;
		
					_unit.shieldHealth = 0;
		
				}
				
				_unit.combatlessCounter = 0;
				_unit.outOfCombat = false;
			}

			else if(instance_exists(_unit))
			{
	
				damage *= _unit.dmgReduction;
				
				_unit.hp -= damage;
			}
		}
			
	}
	

	ds_list_destroy(enemies);
}