/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if(other.faction_number != faction_number)
{
	
	
	other.markedDamage = markingBonus;
	other.markedCounter = markedTime;
	
	randomize();
	
	if(random(1) < stunChance)
	{
		other.stun = true;
		other.stunnedCounter = stunnedTime;
	}
}