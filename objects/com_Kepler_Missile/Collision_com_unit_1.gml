if(other.hasShield && other.faction_number != faction_number)
{
	damage *= other.dmgReduction;
	
	damage -= other.block;
	
	if(other.shieldHealth >= damage)
	{
		other.shieldHealth -= damage;
	}
	else
	{
		other.hp -= damage - other.shieldHealth;
		
		other.shieldHealth = 0;
		
	}
	
	instance_destroy();
	
	instance_create_layer(x, y, "instances", explodeType)
}

else if(other.faction_number != faction_number)
{
	damage *= other.dmgReduction;
	
	other.hp -= damage - other.block;
	
	instance_destroy();
	
	instance_create_layer(x, y, "instances", explodeType)
}