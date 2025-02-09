/// @description Insert description here
// You can write your code in this editor

if(ds_list_find_index(global.selection, self.id) != -1)
{
	if(ds_list_find_value(global.plans, faction_number) == "none"  && ds_list_find_value(global.energyUsed, faction_number) + planEnergy <= ds_list_find_value(global.energy, faction_number))
	{
		Ark_Plan_Extraction.bsprite = icon_Ark_Plan_Extraction_Active
		
		ds_list_replace(global.plans, faction_number, "extraction")
		
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) + planEnergy);
		
		blurb += " Extraction Plan Active."
	
		var structNum = instance_number(Ark_Power_Plant)
		for(var _i = 0; _i < structNum; _i++)
		{
			var _struct = instance_find(Ark_Power_Plant, _i);
			
			if(_struct.faction_number = faction_number)
			{
				var eBonus = _struct.energyProvided * multipliers[1] - _struct.energyProvided
				
				ds_list_replace(global.energy, faction_number, ds_list_find_value(global.energy, faction_number) + eBonus)
				_struct.energyProvided *= multipliers[1];
				
			}
			
		}
		
		var structNum = instance_number(Ark_Heavy_Generator)
	
		for(var _i = 0; _i < structNum; _i++)
		{
			var _struct = instance_find(Ark_Heavy_Generator, _i);
			
			if(_struct.faction_number = faction_number && _struct.canResearch && _struct.name != name)
			{
				var eBonus = _struct.energyProvided * multipliers[1] - _struct.energyProvided
				
				ds_list_replace(global.energy, faction_number, ds_list_find_value(global.energy, faction_number) + eBonus)
				_struct.energyProvided *= multipliers[1];
				
			}
			
		}
		
		var uniNum = instance_number(Ark_Tau_Miner)
	
		for(var _i = 0; _i < uniNum; _i++)
		{
			var _harvester = instance_find(Ark_Tau_Miner, _i);
			
			if(_harvester.faction_number = faction_number && _harvester.name != name)
			{
				
				_harvester.move_speed *= multipliers[1];
				
			}
			
		}
	}
	else if(ds_list_find_value(global.plans, faction_number) == "extraction")
	{
		Ark_Plan_Extraction.bsprite = icon_Ark_Plan_Extraction
		
		ds_list_replace(global.plans, faction_number, "none")
		
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) - planEnergy);
		
		blurb = string_replace(blurb, " Extraction Plan Active.", "")
		
		var structNum = instance_number(Ark_Power_Plant)
		
		for(var _i = 0; _i < structNum; _i++)
		{
			var _struct = instance_find(Ark_Power_Plant, _i);
			
			if(_struct.faction_number = faction_number)
			{
				var eBonus = _struct.energyProvided - _struct.energyProvided / multipliers[1]
				
				ds_list_replace(global.energy, faction_number, ds_list_find_value(global.energy, faction_number) - eBonus)
				_struct.energyProvided /= multipliers[2];
				
			}
			
		}
		
		var structNum = instance_number(Ark_Heavy_Generator)
	
		for(var _i = 0; _i < structNum; _i++)
		{
			var _struct = instance_find(Ark_Heavy_Generator, _i);
			
			if(_struct.faction_number = faction_number && _struct.canResearch && _struct.name != name)
			{
				var eBonus = _struct.energyProvided - _struct.energyProvided / multipliers[1]
				
				ds_list_replace(global.energy, faction_number, ds_list_find_value(global.energy, faction_number) - eBonus)
				_struct.energyProvided /= multipliers[2];
				
			}
			
		}
		
		var uniNum = instance_number(Ark_Tau_Miner)
	
		for(var _i = 0; _i < uniNum; _i++)
		{
			var _harvester = instance_find(Ark_Tau_Miner, _i);
			
			if(_harvester.faction_number = faction_number && _harvester.name != name)
			{
				_harvester.move_speed /= multipliers[2];
				
				if(_harvester.speed > _harvester.move_speed)
				{
					_harvester.speed = _harvester.move_speed
				}
				
			}
			
		}
	}
	
}


