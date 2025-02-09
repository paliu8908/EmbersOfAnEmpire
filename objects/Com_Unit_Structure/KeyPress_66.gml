/// @description Insert description here
// You can write your code in this editor

if(ds_list_find_index(global.primarySelect, self.id) != -1 && ds_list_size(production) > 0)
{  
	var string_equals = function(_element, _index)
	{
	    return (_element[0] == ds_list_find_value(production, 0));
	}

	index = array_find_index(unitData, string_equals)
	
	var metal = unitData[index, 2]
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) + metal);
	
	ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) - ds_list_find_value(energyProduction, 0));
	ds_list_delete(production, 0);
	ds_list_delete(productionAmount, 0);
	ds_list_delete(fullProduction, 0);
	ds_list_delete(energyProduction, 0);
	
	if(canResearch)
	{
		global.upgrades[faction_number][ds_list_find_value(production, 0)] = 0;
	}

}


