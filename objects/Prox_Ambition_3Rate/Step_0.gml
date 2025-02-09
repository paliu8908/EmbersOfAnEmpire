/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

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