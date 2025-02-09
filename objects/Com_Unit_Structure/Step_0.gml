 /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(combatlessCounter >= 30 * 5)
{
	outOfCombat = true;
	
	combatlessCounter = 0;
}


if(collision_circle(x, y, max(sprite_width, sprite_height) * 5, com_projectile, false, false))
{
	outOfCombat = false;
	
	combatlessCounter = 0;
}
else
{
	combatlessCounter++;
}

if(hp >= 0 && !stun)
{
	if(canProduce && ds_list_size(productionAmount) > 0)
	{
	
		if(ds_list_find_value(global.energy, faction_number) >= ds_list_find_value(global.energyUsed, faction_number))
		{
	
			ds_list_replace(productionAmount, 0, ds_list_find_value(productionAmount, 0) - productionSpeed);
		}
		else
		{
			ds_list_replace(productionAmount, 0, ds_list_find_value(productionAmount, 0) - slowProduceSpeed);
		}
	
		if(ds_list_find_value(productionAmount, 0) <= 0)
		{
			var produced = instance_create_layer(x, y, "instances", ds_list_find_value(production, 0));
			produced.faction_number = faction_number;
		
			produced.moveXList = ds_list_create();
			produced.moveYList = ds_list_create();
		
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
		
			if(ds_list_size(production) > 0)
			{
				ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) + ds_list_find_value(energyProduction, 0));
			}
		}
	}
	
	else if(canResearch && ds_list_size(productionAmount) > 0)
	{
		if(ds_list_find_value(global.energy, faction_number) >= ds_list_find_value(global.energyUsed, faction_number))
		{
	
			ds_list_replace(productionAmount, 0, ds_list_find_value(productionAmount, 0) - productionSpeed);
		}
		else
		{
			ds_list_replace(productionAmount, 0, ds_list_find_value(productionAmount, 0) - slowProduceSpeed);
		}
		
		if(ds_list_find_value(productionAmount, 0) <= 0)
		{

			global.upgrades[faction_number][ds_list_find_value(production, 0)] = 1;
			
			UpdateStats(ds_list_find_value(production, 0), ds_list_find_value(unitAffected, 0), faction_number);
		
			ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) - ds_list_find_value(energyProduction, 0));
		
			ds_list_delete(production, 0);
			ds_list_delete(productionAmount, 0);
			ds_list_delete(fullProduction, 0);
			ds_list_delete(energyProduction, 0);
			ds_list_delete(unitAffected, 0);

			if(ds_list_size(production) > 0)
			{
				ds_list_replace(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) + ds_list_find_value(energyProduction, 0));
			}
		}
	}

}
else if(hp <= 0)
{
	instance_destroy();
}

/*if(unitData[0, 6] && ds_list_find_value(global.metal, faction_number) >= unitData[0][2] && ds_list_find_value(global.energy, faction_number) >= unitData[0][3] && global.upgrades[faction_number][0] == 0)
{
	//Backup Generators
	
	com_button_ability1.if_able = true;
}
else
{
	com_button_ability1.if_able = false;
}

if(unitData[1, 6] && ds_list_find_value(global.metal, faction_number) >= unitData[1][2] && ds_list_find_value(global.energy, faction_number) >= unitData[1][3] && global.upgrades[faction_number][1] == 0)
{
	//Backup Generators
	
	com_button_ability1.if_able = true;
}
else
{
	com_button_ability1.if_able = false;
}*/


if(ds_list_find_index(global.primarySelect, self.id) != -1)
{ 

	for(var i = 0; i < array_length(unitData); i++)
	{
		if(canResearch && unitData[i, 6] && ds_list_find_value(global.metal, faction_number) >= unitData[i][2] && global.upgrades[faction_number][i] == 0)
		{
			unitData[i][7].if_able = true;
		}
		else if(canResearch)
		{
			unitData[i][7].if_able = false;
		}
		else if(canProduce && unitData[i, 6] && ds_list_find_value(global.metal, faction_number) >= unitData[i][2])
		{
			unitData[i][7].if_able = true;
		}
		else if(canProduce)
		{
			unitData[i][7].if_able = false;
		}
	}
}

ResolveAbilities(self);
ResolveEffects(self);

if(hasShield && shieldHealth > 0)
{
	dmgReduction = shieldReduction;
}
else
{
	dmgReduction = 1;
}

if(hasShield && shieldHealth < maxShield && outOfCombat)
{
	rechargeCounter++;
	
	if(rechargeCounter == 30)
	{
		shieldHealth += rechargeRate;
		
		rechargeCounter = 0;
	}
}