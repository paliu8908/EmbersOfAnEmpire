/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(point_distance(owner.x, owner.y, x, y) > point_distance(owner.x, owner.y, move_x, move_y))
{
	instance_destroy();
}