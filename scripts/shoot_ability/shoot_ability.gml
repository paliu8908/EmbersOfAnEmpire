// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot_ability(_weapon, creator, target_x, target_y, spawn_x, spawn_y){
	var attack = instance_create_layer(x, y, "instances", _weapon,
	{
		owner : creator.id,
		faction_number : creator.faction_number,
		move_x : target_x,
		move_y : target_y,
		create_x : creator.x + spawn_x,
		create_y : creator.y + spawn_y,
		if_ready : true,
		image_angle : point_direction(spawn_x, spawn_y, target_x, target_y),
		
	});
	attack.direction = point_direction(attack.create_x, attack.create_y, attack.move_x, attack.move_y);
	
	attack.speed = attack.move_speed;
}