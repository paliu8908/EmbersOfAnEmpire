/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

for(var _i = 0; _i < array_length(main_weapon_list); _i++)
{
	var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	
	var _angle = direction+ main_weapon_list[_i][3];
	
	if(_angle < -180)
	{
		_angle += 360;
	}
	else if(_angle > 180)
	{
		_angle -= 360;
	}
	
	if(abilities[0][9] || abilities[1][9] || abilities[2][9])
	{
		draw_sprite_ext(Hapten_Turret, 0, x + _wpnOffX, y + _wpnOffY, 1, 1, 90 + point_direction(x + _wpnOffX, y + _wpnOffY, abilityTargetx, abilityTargety), c_white, 1);
	}
	else
	{
		draw_sprite_ext(Hapten_Turret, 0, x + _wpnOffX, y + _wpnOffY, 1, 1, _angle + 90, c_white, 1);
	}
}

if(abilities[0][9] || abilities[1][9] || abilities[2][9])
{
	draw_sprite(marked, 0, abilityTargetx, abilityTargety);
}