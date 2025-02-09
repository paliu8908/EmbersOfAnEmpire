/// @description Insert description here
// You can write your code in this editor







// Inherit the parent event
event_inherited();

if(if_ready)
{
	dmgIncreaseCounter++;
	
	if(dmgIncreaseCounter >= dmgIncreaseTime)
	{
		damage += dmgIncreaseAmount;
		
		dmgIncreaseCounter = 0;
	}
}