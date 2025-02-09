/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{
	/*
	move_x = owner.target_x;
	
	move_y = owner.target_y;
	
	create_x = owner.x;
	
	create_y = owner.y;



	direction = point_direction(x, y, move_x, move_y);

	speed = move_speed;
	
	if_ready = true;
	
	faction_number = owner.faction_number;
	*/

}
else if(if_ready == false && !instance_exists(owner))
{
	instance_destroy();
}
 
if(if_ready && distance_to_point(create_x, create_y) > range)
{
	instance_destroy();
}