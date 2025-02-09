/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{

	image_angle = direction;
	
	if_ready = true;

}
 
if(distance_to_point(create_x, create_y) > range)
{
	instance_destroy();
}
else
{

	image_angle = direction
}