if(ds_list_find_index(global.selection, self.id) != -1)
{
	if(ds_list_find_value(global.plans, faction_number) == "none"  && ds_list_find_value(global.energyUsed, faction_number) + planEnergy <= ds_list_find_value(global.energy, faction_number))
	{
		Ark_Plan_Construction.bsprite = icon_Ark_Plan_Construction_Active
		
		ds_list_replace(global.plans, faction_number, "construction")
		
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) + planEnergy);
		
		blurb += " Construction Plan Active."
	
		var structNum = instance_number(Ark_HQ)
		for(var _i = 0; _i < structNum; _i ++)
		{
			var _struct = instance_find(Ark_HQ, _i);
			
			if(_struct.faction_number = faction_number)
			{
				_struct.productionSpeed *= multipliers[0];
				
			}
			
		}
		
		var structNum = instance_number(Com_Unit_Structure)
	
		for(var _i = 0; _i < structNum; _i ++)
		{
			var _struct = instance_find(Com_Unit_Structure, _i);
			
			if(_struct.faction_number = faction_number && _struct.canResearch && _struct.name != name)
			{
				_struct.productionSpeed *= multipliers[0];
				
			}
			
		}
	}
	else if(ds_list_find_value(global.plans, faction_number) == "construction")
	{
		Ark_Plan_Construction.bsprite = icon_Ark_Plan_Construction
		
		ds_list_replace(global.plans, faction_number, "none")
		
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) - planEnergy);
		
		blurb = string_replace(blurb, " Construction Plan Active.", "")
		
		var structNum = instance_number(Ark_HQ)
	
		for(var _i = 0; _i < structNum; _i ++)
		{
			var _struct = instance_find(Ark_HQ, _i);
			
			if(_struct.faction_number = faction_number)
			{
				_struct.productionSpeed /= multipliers[0];
				
			}
			
		}
		
		var structNum = instance_number(Com_Unit_Structure)
	
		for(var _i = 0; _i < structNum; _i ++)
		{
			var _struct = instance_find(Com_Unit_Structure, _i);
			
			if(_struct.faction_number = faction_number && _struct.canResearch && _struct.name != name)
			{
				_struct.productionSpeed /= multipliers[0];
				
			}
			
		}
	}
	
}