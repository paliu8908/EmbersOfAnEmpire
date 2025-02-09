/// @description Insert description here
// You can write your code in this editor


/*
// Inherit the parent event
if(instance_exists(target))
{
	var _angleDiff = turretAngle + direction - point_direction(x, y, target.x, target.y);

	if(_angleDiff < -180)
	{
		_angleDiff += 360;
	}
	else if(_angleDiff > 180)
	{
		_angleDiff -= 360;
	}

	if(abs(distance_to_object(target)) < range && abs(_angleDiff) <= fireAngle)
	{
		draw_sprite(marked, 0, x, y);
	}

	draw_text(x - 100, y - 200, string(point_direction(x, y, target.x, target.y)));

	draw_text(x, y - 200, "angleDiff" + string(_angleDiff));

}

draw_text(x - 100, y - 100, string(abs(turretAngle + direction)));
draw_text(x - 100, y - 200, string(abs(turretTurnAngle + direction)));

*/

if(global.showArc && ds_list_find_index(global.selection, self.id) != -1)
{

	draw_line(x, y, x + range * cos(-degtorad(turretAngle + direction + fireAngle)), y + range * sin(-degtorad(turretAngle+ direction + fireAngle)));
	draw_line(x, y, x + range * cos(-degtorad(turretAngle + direction - fireAngle)), y + range * sin(-degtorad(turretAngle+ direction - fireAngle)));
}
/*draw_set_color(c_red);
	
draw_line(x, y, x + range * cos(-degtorad(direction + turretTurnAngle)), y + range * sin(-degtorad(direction + turretTurnAngle)));
draw_line(x, y, x + range * cos(-degtorad(direction - turretTurnAngle)), y + range * sin(-degtorad(direction - turretTurnAngle)));
draw_set_color(c_white);	*/

event_inherited();

draw_sprite_ext(zeta_turret, 0, x + dsin(direction + 90) * -15, y + dcos(direction + 90) * -15, 1, 1, direction+ turretAngle + 90, c_white, 1)