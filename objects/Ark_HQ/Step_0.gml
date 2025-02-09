/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(hp >= 0 && !stun && canProduce && ds_list_size(productionAmount) > 0)
{
	if(ds_list_find_value(global.energy, faction_number) > ds_list_find_value(global.energyUsed, faction_number))
	{
		var spd = productionSpeed
	}
	else
	{
		var spd = slowProduceSpeed
	}
	
	ds_list_replace(productionAmount, 0, ds_list_find_value(productionAmount, 0) -spd);
	
	if(ds_list_find_value(productionAmount, 0) <= 0)
	{
		var produced = instance_create_layer(x, y, "instances", Ark_Constructor);
		
		produced.produced_structure = ds_list_find_value(production, 0);
		produced.producedTime = ds_list_find_value(unPackTime, 0) * 60;
		produced.fullProduceTime = ds_list_find_value(unPackTime, 0) * 60;
		produced.name = ds_list_find_value(productionName, 0);
		
		ds_list_clear(produced.moveXList);
		ds_list_clear(produced.moveYList);
		
		ds_list_add(produced.moveXList, rally_x);
		ds_list_add(produced.moveYList, rally_y);
		
		produced.move_x = rally_x;
		produced.move_y = rally_y;
		
		produced.if_move = 1;
		
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) - ds_list_find_value(energyProduction, 0));
		
		ds_list_delete(production, 0);
		ds_list_delete(productionAmount, 0);
		ds_list_delete(fullProduction, 0);
		ds_list_delete(energyProduction, 0);
		ds_list_delete(productionName, 0)
		
		if(ds_list_size(production) > 0)
		{
			ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) + ds_list_find_value(energyProduction, 0));
		}
	}

}
else if(hp <= 0)
{
	instance_destroy();
}

// Check if greyed out for each button
if(ds_list_find_index(global.selection, self.id) != -1)
{
	if(unitData[0, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[0][2])
	{
		//Fighter Bay
	
		Ark_Produce_Fighter_Bay.if_able = true;
	}
	else
	{
		Ark_Produce_Fighter_Bay.if_able = false;
	}
	
	if(unitData[1, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[1][2])
	{
		//Power Plant
	
		Ark_Produce_Power_Plant.if_able = true;
	}
	else
	{
		Ark_Produce_Power_Plant.if_able = false;
	}
	
	if(unitData[2, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[2][2])
	{
		//Refinery
	
		Ark_Produce_Refinery.if_able = true;
	}
	else
	{
		Ark_Produce_Refinery.if_able = false;
	}
	
	if(unitData[3, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[3][2])
	{
		//Shipyard
	
		Ark_Produce_Shipyard_Light.if_able = true;
	}
	else
	{
		Ark_Produce_Shipyard_Light.if_able = false;
	}
	
	if(unitData[4, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[4][2])
	{
		//Capital Docks
	
		Ark_Produce_Capital_Docks.if_able = true;
	}
	else
	{
		Ark_Produce_Capital_Docks.if_able = false;
	}
	
	if(unitData[5, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[5][2])
	{
		//Facility
	
		Ark_Produce_Facility.if_able = true;
	}
	else
	{
		Ark_Produce_Facility.if_able = false;
	}
	
	if(unitData[6, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[6][2])
	{
		//Heavy Generator
	
		Ark_Produce_Heavy_Generator.if_able = true;
	}
	else
	{
		Ark_Produce_Heavy_Generator.if_able = false;
	}
	
	if(unitData[7, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[7][2])
	{
		//Tech Lab
	
		Ark_Produce_TechLab.if_able = true;
	}
	else
	{
		Ark_Produce_TechLab.if_able = false;
	}
	
	if(unitData[8, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[8][2])
	{
		//Experimental Centre
	
		Ark_Produce_ExperimentalCentre.if_able = true;
	}
	else
	{
		Ark_Produce_ExperimentalCentre.if_able = false;
	}
	
	if(unitData[9, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[9][2])
	{
		//Arms Storage
	
		Ark_Produce_Arms_Storage.if_able = true;
	}
	else
	{
		Ark_Produce_Arms_Storage.if_able = false;
	}
	
	if(unitData[10, 4] && ds_list_find_value(global.metal, faction_number) >= unitData[10][2])
	{
		// Supply Base
	
		Ark_Produce_Supply_Base.if_able = true;
	}
	else
	{
		Ark_Produce_Supply_Base.if_able = false;
	}
	
	if(ds_list_find_value(global.plans, faction_number) == "none" && ds_list_find_value(global.energyUsed, faction_number) + planEnergy <= ds_list_find_value(global.energy, faction_number))
	{
		Ark_Plan_Production.if_able = true;
		Ark_Plan_Extraction.if_able = true;
		Ark_Plan_Construction.if_able = true;
		
		
	}
	else if(ds_list_find_value(global.plans, faction_number) == "none")
	{
		// NOT ENOUGH POWER
		Ark_Plan_Production.if_able = false;
		Ark_Plan_Extraction.if_able = false;
		Ark_Plan_Construction.if_able = false;
	}
	else if(ds_list_find_value(global.plans, faction_number) == "production")
	{
		//CAN DEACTIVATE
		Ark_Plan_Production.if_able = true;
		Ark_Plan_Extraction.if_able = false;
		Ark_Plan_Construction.if_able = false;
		
		
	}
	else if(ds_list_find_value(global.plans, faction_number) == "construction")
	{
		//OTHER PLANS ACTIVE
		Ark_Plan_Production.if_able = false;
		Ark_Plan_Extraction.if_able = false;
		Ark_Plan_Construction.if_able = true;
		
		
	}
	else if(ds_list_find_value(global.plans, faction_number) == "extraction")
	{
		//OTHER PLANS ACTIVE
		Ark_Plan_Production.if_able = false;
		Ark_Plan_Extraction.if_able = true;
		Ark_Plan_Construction.if_able = false;
		
		
	}
}

var activePlan = ds_list_find_value(global.plans, faction_number)

if(activePlan != "none" && ds_list_find_value(global.energyUsed, faction_number) > ds_list_find_value(global.energy, faction_number))
{
	if(activePlan == "production")
	{
		Ark_Plan_Production.bsprite = icon_Ark_Plan_Production
		
		ds_list_replace(global.plans, faction_number, "none")
		
		ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) - planEnergy);
		
		string_replace(blurb, " Production Plan Active.", "")
		
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
	else if(activePlan == "construction")
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
				_struct.productionSpeed /= multipliers[1];
				
			}
			
		}
		
		var structNum = instance_number(Com_Unit_Structure)
	
		for(var _i = 0; _i < structNum; _i ++)
		{
			var _struct = instance_find(Com_Unit_Structure, _i);
			
			if(_struct.faction_number = faction_number && _struct.canResearch && _struct.name != name)
			{
				_struct.productionSpeed /= multipliers[1];
				
			}
			
		}
	}
	else if(activePlan == "extraction")
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

ResolveAbilities(self);
ResolveEffects(self);