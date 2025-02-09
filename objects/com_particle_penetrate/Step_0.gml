/// @description Insert description here
// You can write your code in this editor

if(if_ready)
{
	var hit = ds_list_create();
	
	var _cos = speed * dcos(direction);
	var _sin = speed * dsin(direction);
		
	collision_line_list(x, y, x+ _cos, y - _sin, com_unit, false, false, hit, true);

	for(var _i = ds_list_size(hit) - 1; _i >= 0 && _i < ds_list_size(hit); _i--)
	{
		damage = baseDmg; 
		
		hitUnit = ds_list_find_value(hit, _i);
		
		if(instance_exists(hitUnit) && hitUnit.faction_number != faction_number && ds_exists(hasDamaged, ds_type_list) && ds_list_find_index(hasDamaged, hitUnit) == -1)
		{
			ds_list_add(hasDamaged, hitUnit);
			
			DealDamageLaser(self, hitUnit);
		}

	}
	
	ds_list_destroy(hit);
}
 
if(if_ready && distance_to_point(create_x, create_y) > range)
{
	instance_destroy();
	
}

else if(if_ready == false && !instance_exists(owner))
{
	instance_destroy();
}
