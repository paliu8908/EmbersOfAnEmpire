// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DealDamage(_projectile, _unit){
	
	if(instance_exists(_unit))
	{
		if(_unit.hasShield && _unit.shieldHealth > 0 && _projectile.type == "particle")
		{
			instance_destroy(_projectile);
		}
		else if(_unit.hasShield && _unit.faction_number != _projectile.faction_number)
		{
			
			randomize();
			
			var dodge_check = random_range(0, 1);
			
			if(dodge_check >= _unit.dodgeChance)
			{
	
				if(string_ends_with(_unit.type, _projectile.bonusType))
				{
					_projectile.damage *= _projectile.bonusMultiplier;
		
					_projectile.damage += _projectile.bonusDamage;
				}
	
				_projectile.damage *= _unit.dmgReduction;
	
				if(_projectile.damage - _unit.block >=  0)
				{
					_unit.hp -= _projectile.damage - _unit.block;
				}
				else
				{
					_projectile.damage = 0;
				}
	
				if(_unit.shieldHealth >= _projectile.damage)
				{
					if(damage > 0)
					{
						_unit.shieldHealth -= _projectile.damage;
					}
				}
				else
				{
					if(_projectile.damage > 0)
					{
						_unit.hp -= _projectile.damage - _unit.shieldHealth;
		
						_unit.shieldHealth = 0;
					}
				}
		
				_unit.combatlessCounter = 0;
				_unit.outOfCombat = false;
		
				if(_unit.hp <= 0 && _projectile.dataIndex >=0)
				{
					global.combatData[_projectile.faction_number][_projectile.dataIndex] += _unit.killXP;
					instance_destroy(_unit);
				
					//ds_list_replace(global.metal, _projectile.faction_number, ds_list_find_value(global.metal, _projectile.faction_number))
				
				}
				else if(_projectile.dataIndex >= 0)
				{
					global.combatData[_projectile.faction_number][_projectile.dataIndex] += _projectile.dataProvided;
				}
				else if(_unit.hp <= 0 && instance_exists(_projectile.owner) && _projectile.owner.canLevelUp)
				{
					_projectile.owner.xp += _unit.killXP;
					instance_destroy(_unit);
				
					//ds_list_replace(global.metal, _projectile.faction_number, ds_list_find_value(global.metal, _projectile.faction_number))
				
				}
				else if(instance_exists(_projectile.owner) && _projectile.owner.canLevelUp)
				{
					_projectile.owner.xp += _projectile.dataProvided;
				}
	
				instance_destroy();
	
				instance_create_layer(x, y, "instances", _projectile.explodeType);
				
			}
			else {
				if(string_pos("mech", _unit.type) >= 0)
				{
					_unit.if_move = 7;
					
					randomize();
					
					_unit.direction = random_range(0, 360);
					
					_unit.speed *= 2;
					
					_unit.dodgeCounter = 10;
				}
			}
		}

		else if(_unit.faction_number != _projectile.faction_number)
		{
			
			randomize();
			
			var dodge_check = random_range(0, 1);
			
			if(dodge_check >= _unit.dodgeChance)
			{
			
				if(string_ends_with(_unit.type, bonusType))
				{
					_projectile.damage *= _projectile.bonusMultiplier;
		
					_projectile.damage += _projectile.bonusDamage;
				}
	
				_projectile.damage *= _unit.dmgReduction;
	
	
				if(_projectile.damage - _unit.block >=  0)
				{
					_unit.hp -= _projectile.damage - _unit.block;
				}
				else
				{
					_projectile.damage = 0;
				}
	
				_unit.combatlessCounter = 0;
				_unit.outOfCombat = false;
		
				if(_unit.hp <= 0 && _projectile.dataIndex >= 0)
				{
					global.combatData[_projectile.faction_number][_projectile.dataIndex] += _unit.killXP;
					instance_destroy(_unit);
				
					//ds_list_replace(global.metal, _projectile.faction_number, ds_list_find_value(global.metal, _projectile.faction_number))
				}
				else if(_projectile.dataIndex >= 0)
				{
					global.combatData[_projectile.faction_number][_projectile.dataIndex] += _projectile.dataProvided;
				}
				else if(_unit.hp <= 0 && instance_exists(_projectile.owner) && _projectile.owner.canLevelUp)
				{
					_projectile.owner.xp += _unit.killXP;
					instance_destroy(_unit);
				
					//ds_list_replace(global.metal, _projectile.faction_number, ds_list_find_value(global.metal, _projectile.faction_number))
				
				}
				else if(instance_exists(_projectile.owner) && _projectile.owner.canLevelUp)
				{
					_projectile.owner.xp += _projectile.dataProvided;
				}

				instance_destroy();
	
				instance_create_layer(x, y, "instances", _projectile.explodeType);
			}
			
			else if(string_pos("mech", _unit.type) >= 0 && _unit.if_move != 7)
			{
				_unit.if_move = 7;
					
				randomize();
					
				_unit.direction = random_range(0, 360);
					
				_unit.speed *= 2;
					
				_unit.dodgeCounter = 10;
					
			}
			
		}
	}
}