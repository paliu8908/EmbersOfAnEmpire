/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{
	/*
	target = owner.target;
	
	if_ready = true;
	
	faction_number = owner.faction_number;*/
	
	image_angle = direction;

}
else if(!instance_exists(owner))
{
	instance_destroy();
}

if(if_ready && instance_exists(target))
{
	
	_wpnOffX = sqrt(sqr(turOffX)+sqr(turOffY)) * sin(degtorad((darctan2(turOffX, turOffY) + owner.direction)));
	_wpnOffY = sqrt(sqr(turOffX)+sqr(turOffY)) * cos(degtorad((darctan2(turOffX, turOffY) + owner.direction)));

	x = owner.x + _wpnOffX;
	y = owner.y + _wpnOffY;
	
	direction = owner.direction;

	tx1 = x;
	ty1 = y;

	tx2 = tx1 + range * cos(degtorad(areaAngle + point_direction(x, y, target.x, target.y)));
	ty2 = ty1 - range * sin(degtorad(areaAngle + point_direction(x, y, target.x, target.y)));

	tx3 = tx1 + range * cos(degtorad(point_direction(x, y, target.x, target.y) - areaAngle));
	ty3 = ty1 - range * sin(degtorad(point_direction(x, y, target.x, target.y) - areaAngle));
	
	if(dmgCounter == 0)
	{
		dmgCounter = floor(damageTime* 60);
		
		for(var i = 0; i < instance_number(com_unit); i++)
		{
			var _unit = instance_find(com_unit, i);
			
			if(instance_exists(_unit) && _unit.faction_number != faction_number && point_in_triangle(_unit.x, _unit.y, tx1, ty1, tx2, ty2, tx3, ty3))
			{
				if( _unit.type != "asteroid" && !if_affected(_unit.effects, "KeplerArmourReduce"))
				{
			
					array_insert(_unit.effects, 0, ["KeplerArmourReduce", (damageTime + 2) * 60, armourReduce]);
					_unit.block += armourReduce;
				}
				
				if(_unit.hasShield )
				{
					if(string_ends_with(_unit.type, bonusType))
					{
						damage *= bonusMultiplier;
		
						damage += bonusDamage;
					}
	
					damage *= _unit.dmgReduction;
	
					if(_unit.shieldHealth >= damage)
					{
						_unit.shieldHealth -= damage;
					}
					else
					{
						_unit.hp -= damage - _unit.shieldHealth;
		
						_unit.shieldHealth = 0;
		
					}
	
					//instance_create_layer(_unit.x, _unit.y, "instances", explodeType)
				}

				else if(instance_exists(_unit))
				{
					if(string_ends_with(_unit.type, bonusType))
					{
						damage *= bonusMultiplier;
		
						damage += bonusDamage;
					}
	
					damage *= _unit.dmgReduction;
				
					_unit.hp -= damage;
	
					//instance_create_layer(_unit.x, _unit.y, "instances", explodeType)
				}
			}
			
		}
		
	}
	
	if(timeAlive >= existingTime* 60)
	{
		instance_destroy();
	}
	
	timeAlive++;
	
	dmgCounter--;
}
else
{
	instance_destroy();
}