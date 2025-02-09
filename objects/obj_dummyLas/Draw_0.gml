/// @description Insert description here
// You can write your code in this editor

if(if_ready && instance_exists(target) && distance_to_object(target) <= range)
{
	if(instance_exists(target))
	{
		draw_set_color(colourOne);
		
		draw_sprite_pos(sprite, 0, x, y, x, y + width, target.x, target.y,target.x, target.y + width, 1);
		
		draw_set_color(c_white);
	}
} 