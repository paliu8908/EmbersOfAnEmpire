// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ResolveAbilities(UnitID){
	for(var i = 0; i < array_length(UnitID.abilities); i++)
	{
		
		//recharging the ability
		if(!UnitID.abilities[i][5] && UnitID.abilities[i][array_length(UnitID.abilities[i]) - 1])
		{
			UnitID.abilities[i][3] = UnitID.abilities[i][3] + UnitID.abilityChargeRate;
	
			if(UnitID.abilities[i][3] == UnitID.abilities[i][2])
			{
				UnitID.abilities[i][5] = true;
		
				UnitID.abilities[i][3] = 0;
			}
		}
		
		
		if(ds_list_find_index(global.primarySelect, UnitID.id) != -1 && UnitID.abilities[i][1] == "LevelUp" && UnitID.skill_points < UnitID.abilities[i][8])
		{
			ds_list_find_value(UnitID.buttons, i + 4).if_able = false;
		}
		else if(ds_list_find_index(global.primarySelect, UnitID.id) != -1 && !UnitID.abilities[i][5])
		{
			ds_list_find_value(UnitID.buttons, i + 4).if_able = false;
			
			ds_list_find_value(UnitID.buttons, i + 4).chargedAmount = UnitID.abilities[i][3];
			
			ds_list_find_value(UnitID.buttons, i + 4).chargedTime = UnitID.abilities[i][2];
		}
		else if(ds_list_find_index(global.primarySelect, UnitID.id) != -1)
		{
			ds_list_find_value(UnitID.buttons, i + 4).if_able = true;
		}
	}
}