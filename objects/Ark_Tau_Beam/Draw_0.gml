/// @description Insert description here
// You can write your code in this editor

var dist = distance_to_object(target);

if(if_ready && instance_exists(target) && distance_to_object(target) <= range)
{
	if(instance_exists(target) && target.faction_number != faction_number)
	{
		
		draw_line_width_color(x, y, target.x, target.y, width, c_yellow, c_yellow);
	}
}