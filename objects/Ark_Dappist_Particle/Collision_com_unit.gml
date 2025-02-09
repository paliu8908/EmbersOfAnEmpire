/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event

if(other.faction_number != faction_number)
{
	DealDamage(self, other);
	
	if(other.type != "asteroid" && (!other.hasShield || other.shieldHealth <= 0))
	{
			
		array_insert(other.effects, 0, ["Decay", effect_dmg, 8, Ark_Dappist_Daughter, faction_number]);
	}
	
	instance_destroy();
}