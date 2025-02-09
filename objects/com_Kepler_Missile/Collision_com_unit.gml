if(other.hasShield && other.faction_number != faction_number)
{
	if(string_ends_with(other.type, bonusType))
	{
		damage *= bonusMultiplier;

	
		damage *= other.dmgReduction;
	
		damage -= other.block;
	
		if(other.shieldHealth >= damage && damage > 0)
		{
			other.shieldHealth -= damage;
		}
		else if (damage > 0)
		{
			other.hp -= damage - other.shieldHealth;
		
			other.shieldHealth = 0;
		
		}
	
		instance_destroy();
	
		instance_create_layer(x, y, "instances", explodeType)
	}
}

else if(other.faction_number != faction_number)
{
	if(string_ends_with(other.type, bonusType))
	{
		damage *= bonusMultiplier;
		
		damage += bonusDamage;
	}
	
	
	damage *= other.dmgReduction;
	
	if(damage - other.block > 0)
	{
		other.hp -= damage - other.block;
	}
	
	instance_destroy();
	
	instance_create_layer(x, y, "instances", explodeType)
}