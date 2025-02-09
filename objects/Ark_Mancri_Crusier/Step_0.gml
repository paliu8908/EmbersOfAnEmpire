/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(outOfCombat)
{
	reload_time = standReload;
	
	main_weapon_list[0][4] = reload_time;
	main_weapon_list[1][4] = reload_time;
}

else if(main_weapon_list[0][7] == 3 || main_weapon_list[1][7] == 3)
{
	if(main_weapon_list[0][4] - reloadDecrease > reloadMin)
	{
		
		main_weapon_list[0][4] -= reloadDecrease;
		main_weapon_list[1][4] -= reloadDecrease;
	}
	else
	{
		main_weapon_list[0][4] = reloadMin;
		main_weapon_list[1][4] = reloadMin;
	}
	

}

if(shieldHealth > 0)
{
	dmgReduction = shieldReduction;
}
else
{
	dmgReduction = 1;
}

if(shieldHealth < maxShield && outOfCombat)
{
	rechargeCounter++;
	
	if(rechargeCounter == 30)
	{
		shieldHealth += rechargeRate;
		
		rechargeCounter = 0;
	}
}