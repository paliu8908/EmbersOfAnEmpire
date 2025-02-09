// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ResolveEffects(UnitID){
	for(var i = 0; i < array_length(UnitID.effects); i++)
	{
		if(i < array_length(UnitID.effects))
		{
	
			
			if(string_ends_with(UnitID.effects[i][0], "Decay"))
			{
				UnitID.hp -= UnitID.effects[i][1];
				
			}
			else
			{
				UnitID.effects[i][1]--;
			}
	
			if(UnitID.effects[i][1] <= 0)
			{
				if(string_ends_with(UnitID.effects[i][0], "EMP"))
				{
					UnitID.stun = false;
			
					array_delete(UnitID.effects, i, 1);
					i--;
				}
				else if(string_ends_with(UnitID.effects[i][0], "ArmourReduce"))
				{
					UnitID.block -= UnitID.effects[i][2];
			
					array_delete(UnitID.effects, i, 1);
					i--;
				}
				else if(string_ends_with(UnitID.effects[i][0], "DmgReductionReduce"))
				{
					UnitID.dmgReduction -= UnitID.effects[i][2];
			
					array_delete(UnitID.effects, i, 1);
					i--;
				} 
				else if(string_ends_with(UnitID.effects[i][0], "SpeedBoost"))
				{
					UnitID.move_speed -= UnitID.effects[i][2];
			
					array_delete(UnitID.effects, i, 1);
					i--;
				}
				else if(string_ends_with(UnitID.effects[i][0], "ReloadBoost") && UnitID.type == "fighter")
				{
					 UnitID.reload_time -= UnitID.effects[i][2];
			
					array_delete(UnitID.effects, i, 1);
					i--;
				}
				else if(string_ends_with(UnitID.effects[i][0], "ReloadSpeedIncrease"))
				{
					UnitID.reloadSpeed -= UnitID.effects[i][2];
			
					array_delete(UnitID.effects, i, 1);
					i--;
				}
				else if(string_ends_with(UnitID.effects[i][0], "ChargeIncrease"))
				{
					UnitID.abilityChargeRate -= UnitID.effects[i][2];
			
					array_delete(UnitID.effects, i, 1);
					i--;
				}
				else if(string_ends_with(UnitID.effects[i][0], "CannotAttack") && UnitID.type == "fighter")
				{
				
					//Would store the proper reloadtime of the unit, a Cannot Attack Effect would set the 
					//reload time to the duration of the effect + 1 count, and then set the if_reload to true/cannot attack
					UnitID.reload_time = UnitID.effects[i][2];
					array_delete(UnitID.effects, i, 1);
					i--;
				}
				else if(string_ends_with(UnitID.effects[i][0], "CannotAttack") && string_ends_with(UnitID.type, "ship"))
				{
				
					//Find the factor that would set any reload time to equal the duration. Minimum reload time is 0.1. 
					//so to restore normal reload time, divide all reload times by the factor.
				
					for(var u = 0; u < array_length(UnitID.main_weapon_list); u++)
					{
						UnitID.main_weapon_list[u][4] /= UnitID.effects[i][2];
						UnitID.main_weapon_list[u][10] = 0;
					}
				
					for(var u = 0; u < array_length(UnitID.weapon_list); u++)
					{
						UnitID.weapon_list[u][4] /= UnitID.effects[i][2];
						UnitID.weapon_list[u][10] = 0;
					}
					array_delete(UnitID.effects, i, 1);
					i--;
				
				}
			}
		}
	}
}