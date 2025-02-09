/// @description Insert description here
// You can write your code in this editor
if(ds_list_find_index(global.selection, self.id) != -1 && keyboard_check(ord("E")))
{
	var enemies = ds_list_create();
	
	collision_circle_list(mouse_x, mouse_y, 20, com_unit, false, true, enemies, true);

	if(ds_list_size(enemies) != 0)
	{
		var _checkTarget = ds_list_find_value(enemies, 0)
		
		if(_checkTarget.faction_number != self.faction_number)
		{
			
			if(keyboard_check(vk_shift) == false)
			{
				ds_list_clear(attackTargets);
			}
			
			ds_list_add(attackTargets, _checkTarget);
			
			if(ds_list_size(attackTargets) == 1)
			{
				target = _checkTarget;
				
				self.target_x = _checkTarget.x;
		
				self.target_y = _checkTarget.y;
			
				if_shoot = true;
				
				atkOrder = true;
				
				patrol = false;
				
				lasAbility = true;
				
			}
		}
	}
	
	ds_list_destroy(enemies);
}

else if(keyboard_check(vk_shift) == false && collision_circle(mouse_x, mouse_y, 20, com_button, false, false))
{
	ds_list_delete(global.selection, ds_list_find_index(global.selection, self));


}

//Select 

else if(point_in_circle(x, y, mouse_x, mouse_y, 10))
{
	if(ds_list_find_index(global.factions, "player") == faction_number)
	{
			
		ds_list_add(global.selection, self);
	}
}