/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(self_repair && hp < maxHp)
{
	repair_counter++;
	
	if(repair_counter >= repair_time)
	{
		repair_counter = 0;
		
		hp += min(repair_amount, maxHp - hp);
	}
}

if(hasShield)
{
	

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
}