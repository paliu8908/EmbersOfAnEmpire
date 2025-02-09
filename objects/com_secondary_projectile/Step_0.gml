/// @description Insert description here
// You can write your code in this editor
if(if_ready && !if_move && instance_exists(owner))
{
	image_angle = point_direction(x, y, move_x, move_y);

	direction = point_direction(x, y, move_x, move_y);

	speed = move_speed;
	
	if_ready = true;
	
	create_x = x;
	
	create_y = y;
	
	if_move = true;
	
	faction_number = owner.faction_number;
}
else if(if_move == false && !instance_exists(owner))
{
	instance_destroy();
}
 
if(if_move && distance_to_point(create_x, create_y) > range)
{
	instance_destroy();
}

else if(!instance_exists(target))
{
	instance_destroy();
}