/// @description Insert description here
// You can write your code in this editor
if(splash_radius > 0)
{

	var enemies = ds_list_create()
	
	collision_circle_list(x, y, splash_radius, com_unit, false, true, enemies, true);

	for(var _units = 0; _units < ds_list_size(enemies); _units++)
	{
		var _trooper = ds_list_find_value(enemies, _units)
		
		DealDamage(self, _trooper);
		
	}
	
	ds_list_destroy(enemies);
}

for(var _i = 0; _i < bursts; _i++)
{
	var _attack = instance_create_layer(x, y, "instances", burstProjectile);
	
	_attack.direction = direction + (360/bursts) * _i;
	_attack.speed = _attack.move_speed;
	
	_attack.owner = self.id;
	_attack.faction_number = faction_number;
}