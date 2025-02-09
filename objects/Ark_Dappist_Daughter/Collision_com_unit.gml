/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event

if(other != owner)
{
	event_inherited();

	if(other.type != "asteroid" && (!other.hasShield || other.shieldHealth <= 0))
	{
			
		array_insert(other.effects, 0, ["Decay", effect_dmg, 8, Ark_Dappist_Daughter, owner_faction_number]);
	}

	instance_destroy();
}