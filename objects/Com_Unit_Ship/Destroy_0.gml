/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

var string_equals = function(_element, _index)
{
    return (_element[0] == "Decay");
}

index = array_find_index(effects, string_equals)

if(index != -1)
{
	for(var _i = 0; _i < effects[index][2]; _i++)
	{
		
		var _attack = instance_create_layer(x, y, "instances", effects[index][3],
		{
			owner_faction_number : effects[index][4]
		}
		);
	
		_attack.owner = self.id;
		_attack.faction_number = -1;
	
		_attack.direction = direction + (360/effects[index][2]) * _i;
		_attack.speed = _attack.move_speed;
	}
}