// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AddToProduction(unit, _i){
	if(ds_list_find_index(global.primarySelect, self.id) != -1 && unit.canResearch && _i < array_length(unit.unitData) && unit.unitData[_i, 6] && ds_list_find_value(global.metal, unit.faction_number) >= unit.unitData[_i][2] && global.upgrades[unit.faction_number][_i] == 0)
	{
		
		if(unit.unitData[_i, 0] == 95 ||  unit.unitData[_i, 0] == 100 || unit.unitData[_i, 0] == 105 || unit.unitData[_i, 0] == 110)
		{
			if(ds_list_size(unit.production) < 3)
			{
			
				ds_list_add(unit.production, unit.unitData[_i, 0]);
	
				ds_list_add(unit.productionAmount, 60 * unit.unitData[_i, 1]);
				ds_list_add(unit.fullProduction, 60 * unit.unitData[_i, 1]);
				ds_list_add(unit.unitAffected, unit.unitData[_i][8]);
	 
				ds_list_replace(global.metal, unit.faction_number, ds_list_find_value(global.metal, unit.faction_number) - unit.unitData[_i][2]);
	
				ds_list_add(unit.energyProduction, unit.unitData[_i, 3])
	
				if(ds_list_size(unit.production) == 1)
				{
					ds_list_replace(global.energyUsed, unit.faction_number, ds_list_find_value(global.energyUsed, unit.faction_number)  + ds_list_find_value(unit.energyProduction, 0));
				}
			}
		}
		else
		{
			global.upgrades[unit.faction_number][_i] = 2;
			
			ds_list_add(unit.production, unit.unitData[_i, 0]);
	
			ds_list_add(unit.productionAmount, 60 * unit.unitData[_i, 1]);
			ds_list_add(unit.fullProduction, 60 * unit.unitData[_i, 1]);
			ds_list_add(unit.unitAffected, unit.unitData[_i][8]);
	 
			ds_list_replace(global.metal, unit.faction_number, ds_list_find_value(global.metal, unit.faction_number) - unit.unitData[_i][2]);
	
			ds_list_add(unit.energyProduction, unit.unitData[_i, 3])
	
			if(ds_list_size(unit.production) == 1)
			{
				ds_list_replace(global.energyUsed, unit.faction_number, ds_list_find_value(global.energyUsed, unit.faction_number)  + ds_list_find_value(unit.energyProduction, 0));
			}
		}
	
		
	}
	else if(ds_list_find_index(global.primarySelect, self.id) != -1 && unit.canProduce && _i < array_length(unit.unitData) && unit.unitData[_i, 6] && ds_list_find_value(global.metal, unit.faction_number) >= unit.unitData[_i][2])
	{
	
		ds_list_add(unit.production, unit.unitData[_i, 0]);
	
		ds_list_add(unit.productionAmount, 60 * unit.unitData[_i, 1]);
		ds_list_add(unit.fullProduction, 60 * unit.unitData[_i, 1]);
	 
		ds_list_replace(global.metal, unit.faction_number, ds_list_find_value(global.metal, unit.faction_number) - unit.unitData[_i][2]);
	
		ds_list_add(unit.energyProduction, unit.unitData[_i, 3])
	
		if(ds_list_size(unit.production) == 1)
		{
			ds_list_replace(global.energyUsed, unit.faction_number, ds_list_find_value(global.energyUsed, unit.faction_number)  + ds_list_find_value(unit.energyProduction, 0));
		}
	}
}