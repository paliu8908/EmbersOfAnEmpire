/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{
	/*
	move_x = owner.target_x + spread;
	
	move_y = owner.target_y + spread;
	
	create_x = owner.x;
	
	create_y = owner.y;

	image_angle = point_direction(x, y, move_x, move_y) + 90;

	direction = point_direction(x, y, move_x, move_y);

	speed = move_speed;
	
	if_ready = true;
	
	faction_number = owner.faction_number;*/

}
else if(if_ready == false && !instance_exists(owner))
{
	instance_destroy();
}
 
if(if_ready && distance_to_point(create_x, create_y) > range)
{
	instance_destroy();
}
else if(if_ready)
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