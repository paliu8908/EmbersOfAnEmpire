// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot_weapon_fighter(creator, _target, spawn_x, spawn_y){
	var attack = instance_create_layer(x, y, "instances", creator.weapon,
	{
		owner : creator.id,
		faction_number : creator.faction_number,
		move_x : _target.x,
		move_y : _target.y,
		create_x : spawn_x.x,
		create_y : spawn_y.y,
		if_ready : true,
		target : _target,
		speed : attack.move_speed,
		direction : point_direction(attack.create_x, attack.create_y, attack.target.x + random_range(-atk_off_x, atk_off_x), attack.target.y + random_range(-atk_off_y, atk_off_y)),
		image_angle : attack.direction,
		range : creator.range,
		
	});
}