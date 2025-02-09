/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

for(var i = 4; i < array_length(abilities); i++)
{

	abilities[i, 5] = false

			
}

if(array_length(ammo) < 3)
{

	var stores = ds_list_create();

	collision_circle_list(x, y, supplyRange, Ark_Arms_Storage, false, false, stores, true)
	
	for(var _u = 0; _u < ds_list_size(stores); _u++)
	{
	
		var _uni = ds_list_find_value(stores, _u)
		if(_uni.faction_number == faction_number)
		{
			for(var i = 4; i < array_length(abilities); i++)
			{
			
				if(array_contains(_uni.ammo, abilities[i, 0]))
				{

					abilities[i, 5] = true

				}
			}
	
		}
	}

	ds_list_destroy(stores)
}