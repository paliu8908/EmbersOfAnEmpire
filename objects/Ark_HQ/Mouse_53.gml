/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
//event_inherited();

if(unitData[0, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Fighter_Bay, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[0][2])
{
	var _i = 0;
	
	ds_list_add(production, Ark_Fighter_Bay);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}

	
}
else if(unitData[1, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Power_Plant, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[1][2])
{
	var _i = 1;
	
	ds_list_add(production, Ark_Power_Plant);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}

else if(unitData[2, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Refinery, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[2][2])
{
	var _i = 2;
	
	ds_list_add(production, Ark_Refinery);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}

else if(unitData[5, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Facility, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[5][2])
{
	var _i = 5;
	
	ds_list_add(production, Ark_Facility);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}

else if(unitData[3, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Shipyard_Light, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[3][2])
{
	var _i = 3;
	
	ds_list_add(production, Ark_Shipyard_Light);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}

else if(unitData[4, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Capital_Docks, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[4][2])
{
	var _i = 4;
	
	ds_list_add(production, Ark_Capital_Docks);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}

else if(unitData[6, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Heavy_Generator, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[6][2])
{
	var _i = 6;
	
	ds_list_add(production, Ark_Heavy_Generator);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}
else if(unitData[7, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_TechLab, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[7][2])
{
	var _i = 7;
	
	ds_list_add(production, Ark_Tech_Lab);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}
else if(unitData[8, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_ExperimentalCentre, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[8][2])
{
	var _i = 8;
	
	ds_list_add(production, Ark_Experimental_Centre);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}
else if(unitData[9, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Arms_Storage, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[9][2])
{
	var _i = 9;
	
	ds_list_add(production, Ark_Arms_Storage);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}
else if(unitData[10, 4] && collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Supply_Base, false, false) && ds_list_find_index(global.selection, self.id) != -1 && ds_list_find_value(global.metal, faction_number) >= unitData[10][2])
{
	var _i = 10;
	
	ds_list_add(production, Ark_Supply_Base);
	
	ds_list_add(productionAmount, 60 * 5); //5 seconds for the constructor
	ds_list_add(fullProduction, 60 * 5);
	ds_list_add(unPackTime, unitData[_i, 1]);
	ds_list_add(productionName, unitData[_i, 5]);
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) - unitData[_i][2]);
	ds_list_add(energyProduction, unitData[_i, 3])
	
	if(ds_list_size(production) == 1)
	{
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number)  + ds_list_find_value(energyProduction, 0));
	}
	
}
else if(collision_circle(mouse_x, mouse_y, 20, Ark_Plan_Production, false, false) && ds_list_find_index(global.selection, self.id) != -1)
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

else if(collision_circle(mouse_x, mouse_y, 20, Ark_Plan_Construction, false, false) && ds_list_find_index(global.selection, self.id) != -1)
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


else if(collision_circle(mouse_x, mouse_y, 20, Ark_Plan_Extraction, false, false) && ds_list_find_index(global.selection, self.id) != -1)
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