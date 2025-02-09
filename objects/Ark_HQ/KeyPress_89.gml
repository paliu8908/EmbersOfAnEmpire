/// @description Insert description here
// You can write your code in this editor
if(ds_list_find_index(global.selection, self.id) != -1)
{
	if(ds_list_find_value(global.plans, faction_number) == "none"  && ds_list_find_value(global.energyUsed, faction_number) + planEnergy <= ds_list_find_value(global.energy, faction_number))
	{
		Ark_Plan_Production.bsprite = icon_Ark_Plan_Production_Active
		
		ds_list_replace(global.plans, faction_number, "production")
		
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) + planEnergy);
		
		blurb += " Production Plan Active."
	
		var structNum = instance_number(Com_Unit_Structure)
		for(var _i = 0; _i < structNum; _i ++)
		{
			var _struct = instance_find(Com_Unit_Structure, _i);
			
			if(_struct.faction_number = faction_number && _struct.canProduce && _struct.name != name)
			{
				_struct.productionSpeed *= multipliers[0];
				
			}
			
		}
	}
	else if(ds_list_find_value(global.plans, faction_number) == "production")
	{
		Ark_Plan_Production.bsprite = icon_Ark_Plan_Production
		
		ds_list_replace(global.plans, faction_number, "none")
		
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) - planEnergy);
		
		blurb = string_replace(blurb, " Production Plan Active.", "")
		
		var structNum = instance_number(Com_Unit_Structure)
	
		for(var _i = 0; _i < structNum; _i ++)
		{
			var _struct = instance_find(Com_Unit_Structure, _i);
			
			if(_struct.faction_number = faction_number && _struct.canProduce && _struct.name != name)
			{
				_struct.productionSpeed /= multipliers[0];
				
			}
			
		}
	}
	
}



