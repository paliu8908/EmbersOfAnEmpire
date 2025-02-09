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
			
		if(instance_exists(_unit) && _unit.faction_number != faction_number && !if_affected(_unit.effects, effectName)  && _unit.type != "asteroid")
		{
			
			var reduceAmount = max(-speedReduction, -_unit.move_speed + 0.1);
				
			array_insert(_unit.effects, 0, [effectName, damageTime * 60, max(-speedReduction, -_unit.move_speed + 0.1)]);

			_unit.speed = max(0.1, _unit.speed - speedReduction);
			_unit.move_speed = max(_unit.move_speed - speedReduction, 0.1);
		}
			
	}
	

	ds_list_destroy(enemies);
}