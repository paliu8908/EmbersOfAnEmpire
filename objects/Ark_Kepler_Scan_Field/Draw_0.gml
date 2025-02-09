/// @description Insert description here
// You can write your code in this editor

//transform given points. 

depth = 25;

direction = owner.direction;


_wpnOffX = sqrt(sqr(turOffX)+sqr(turOffY)) * sin(degtorad((darctan2(turOffX, turOffY) + owner.direction)));
_wpnOffY = sqrt(sqr(turOffX)+sqr(turOffY)) * cos(degtorad((darctan2(turOffX, turOffY) + owner.direction)));

x = owner.x + _wpnOffX;
y = owner.y + _wpnOffY;

if(instance_exists(target))
{
	tx1 = x;
	ty1 = y;

	tx2 = tx1 + range * cos(degtorad(areaAngle + point_direction(x, y, target.x, target.y)));
	ty2 = ty1 - range * sin(degtorad(areaAngle + point_direction(x, y, target.x, target.y)));

	tx3 = tx1 + range * cos(degtorad(point_direction(x, y, target.x, target.y) - areaAngle));
	ty3 = ty1 - range * sin(degtorad(point_direction(x, y, target.x, target.y) - areaAngle));
	
	
	draw_set_alpha(0.5);

	draw_triangle_color(tx1, ty1, tx2, ty2, tx3, ty3, fieldColour, fieldColour, fieldColour, false);
	draw_set_alpha(1);
}
else
{
	instance_destroy();
}
