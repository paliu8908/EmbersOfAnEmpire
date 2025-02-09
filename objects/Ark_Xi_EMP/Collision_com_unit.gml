/// @description Insert description here
// You can write your code in this editor
if(other.faction_number != faction_number && other.type != "asteroid")
{

	array_insert(other.effects, 0, ["EMP", stunTime div other.stunResist * 60, 0]);
	other.stun = true;
	
	/*other.stun = true;
	
	other.stunnedCounter = stunTime;*/
	
	if(other.hasShield)
	{
		other.shieldHealth = 0;
	}

	other.combatlessCounter = 0;
	other.outOfCombat = false;
	
	global.combatData[faction_number][dataIndex] += hitXP;
}





