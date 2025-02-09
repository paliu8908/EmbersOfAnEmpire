/// @description Insert description here
// You can write your code in this editor

if(ds_list_find_index(global.primarySelect, self.id) != -1)
{
	for(var _i = 4; _i < array_length(abilities); _i++)
	{
		if(abilities[_i][1] == "Arm" && collision_circle(mouse_x, mouse_y, 20, ds_list_find_value(buttons, _i + 4), false, false) && abilities[_i][5] && !if_affected(effects, "CannotAttack") && !if_affected(effects, "EMP") && abilities[_i][9])
		{
			var stores = ds_list_create();

			collision_circle_list(x, y, supplyRange, Ark_Arms_Storage, false, false, stores, true)
	
			for(var _u = 0; _u < ds_list_size(stores); _u++)
			{
	
				var _store = ds_list_find_value(stores, _u)
				if(faction_number == _store.faction_number)
				{
					missile = abilities[_i][0]
			
					var _f = function(_element, _index)
					{
					    return (_element == missile);
					}
			
					array_delete(_store.ammo, array_find_index(_store.ammo, _f), 1);
			
					if(!array_contains(_store.ammo, missile))
					{
						_store.abilities[_i - 4, 5] = false
					}
	
				}
			}

			ds_list_destroy(stores)
			
			array_insert(ammo, 0, abilities[_i][0]);
			abilities[_i - 4, 5] = true;
			
		}
	}

}

