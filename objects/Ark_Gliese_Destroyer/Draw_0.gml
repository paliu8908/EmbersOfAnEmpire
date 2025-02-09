/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

for(var _i = 0; _i < array_length(main_weapon_list); _i++)
{
	var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	var _wpnReload = main_weapon_list[_i][7];
	
	var _angle = direction+ main_weapon_list[_i][3];
	
	if(_angle < -180)
	{
		_angle += 360;
	}
	else if(_angle > 180)
	{
		_angle -= 360;
	}
	
	if(_wpnReload >= 1 && _wpnReload < 3.5 * 60)
	{
		draw_sprite_ext(spr_Gliese_Turret_charged, 0, x + _wpnOffX, y + _wpnOffY, image_xscale, image_yscale, _angle, c_white, 1);
	}
	else
	{
	
		draw_sprite_ext(spr_Gliese_Turret, 0, x + _wpnOffX, y + _wpnOffY, image_xscale, image_yscale, _angle, c_white, 1);
	}
}

