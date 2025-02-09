/// @description Insert description here
// You can write your code in this editor







// Inherit the parent event
event_inherited();

for(var _i = 0; _i < bursts; _i++)
{
	var _attack = instance_create_layer(x, y, "instances", burstProjectile);
	
	randomize();
	
	_attack.direction = direction + irandom(360);
	_attack.speed = _attack.move_speed;
	
	_attack.owner = self.id;
	_attack.faction_number = faction_number;
}