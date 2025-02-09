/// @description Insert description here
// You can write your code in this editor

if(other.hasShield && other.faction_number != faction_number)
{
	
	damage *= other.dmgReduction;
	
	damage -= other.block;
	
	if(other.shieldHealth >= damage && damage > 0)
	{
		other.shieldHealth -= damage;
	}
	else if(damage > 0)
	{
		other.hp -= damage - other.shieldHealth;
		
		other.shieldHealth = 0;
		
	}
	
	instance_destroy();
	
	for(var _i = 0; _i < bursts; _i++)
	{
		var _attack = instance_create_layer(x, y, "instances", burstProjectile);
	
		_attack.direction = direction + (360/bursts) * _i;
		_attack.speed = _attack.move_speed;
	
		_attack.owner = self.id;
		_attack.faction_number = faction_number;
	}
}

else if(other.faction_number != faction_number)
{

	
	damage *= other.dmgReduction;
	
	if(damage - other.block > 0)
	{
	
		other.hp -= damage - other.block;
	}
	
	instance_destroy();
	
	for(var _i = 0; _i < bursts; _i++)
	{
		var _attack = instance_create_layer(x, y, "instances", burstProjectile);
	
		_attack.direction = direction + (360/bursts) * _i;
		_attack.speed = _attack.move_speed;
	
		_attack.owner = self.id;
		_attack.faction_number = faction_number;
	}
}
