/// @description Insert description here
// You can write your code in this editor

 

// Inherit the parent event
event_inherited();

if(global.showArc && ds_list_find_index(global.selection, self.id) != -1)
{
	if(fireAngle < 180)
	{

		draw_line(x, y, x + range * cos(-degtorad(shootAngle + direction + fireAngle)), y + range * sin(-degtorad(shootAngle+ direction + fireAngle)));
		draw_line(x, y, x + range * cos(-degtorad(shootAngle + direction - fireAngle)), y + range * sin(-degtorad(shootAngle+ direction - fireAngle)));
	}
	else 
	{
		draw_circle(x, y, range, true);
	}
}