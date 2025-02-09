/// @description Insert description here
// You can write your code in this editor
var _i = 5;

if(unitData[_i, 4] && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[_i][2])
{
	//building fighter bay
	ds_list_add(production, Ark_Facility);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) + ds_list_find_value(energyProduction, 0));
	}
}


