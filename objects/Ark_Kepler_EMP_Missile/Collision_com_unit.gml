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
		
		array_insert(other.effects, 0, ["EMP", stunTime div other.stunResist * 60, 0]);
	
		instance_destroy();
	
		var _explode = instance_create_layer(x, y, "instances", explodeType);
		_explode.image_xscale = scaleUp;
		_explode.image_yscale = scaleUp;
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
	
	if(other.type != "asteroid")
	{
		array_insert(other.effects, 0, ["EMP", stunTime div other.stunResist * 60, 0]);
	}
	
	instance_destroy();
	
	var _explode = instance_create_layer(x, y, "instances", explodeType);
	_explode.image_xscale = scaleUp;
	_explode.image_yscale = scaleUp;
}