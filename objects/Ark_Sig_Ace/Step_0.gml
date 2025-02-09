/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(hasShield && shieldHealth < maxShield && outOfCombat)
{
	rechargeCounter++;
	
	if(rechargeCounter == 30)
	{
		shieldHealth += rechargeRate;
		
		rechargeCounter = 0;
	}
}