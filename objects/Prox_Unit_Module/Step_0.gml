/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(instance_exists(owner))
{
	x = owner.x + sqrt(sqr(shift_y)+sqr(shift_x)) * sin(degtorad((darctan2(shift_x, shift_y) + direction)));
	y = owner.y + sqrt(sqr(shift_y)+sqr(shift_x)) * cos(degtorad((darctan2(shift_x, shift_y) + direction)));
	image_angle = owner.direction;
	direction = image_angle;
	
	
} else {
	instance_destroy();
}