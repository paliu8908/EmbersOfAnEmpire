 /// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

for(var _i = 0; _i < array_length(main_weapon_list); _i++)
{
	var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	
	draw_sprite_ext(Kepler_Turret, 0, x + _wpnOffX, y + _wpnOffY, 1, 1, direction + main_weapon_list[_i][3], c_white, 1);
}

for(var _i = -1; _i + 1 < array_length(ammo); _i++)
{
	
	var yHeight = _i * 45
	var _wpnOffX = sqrt(sqr(yHeight)) * sin(degtorad((darctan2(0, yHeight) + direction)));
	var _wpnOffY = sqrt(sqr(yHeight)) * cos(degtorad((darctan2(0, yHeight) + direction)));
	
	if(ammo[_i + 1] == Ark_Kepler_EMP_Missile)
	{
		var missile_sprite = EMP_Missile
	}
	else if(ammo[_i + 1] == Ark_Kepler_AntiShield)
	{
		var missile_sprite = Anti_Shield_Missile
	}
	else if(ammo[_i + 1] == Ark_Kepler_Plasma_Missile)
	{
		var missile_sprite = Plasma_Missile
	}
	else if(ammo[_i + 1] == Ark_Kepler_SlowField)
	{
		var missile_sprite = Force_Missile
	}
	
	draw_sprite_ext(missile_sprite, 0, x + _wpnOffX, y + _wpnOffY, 1, 1, direction, c_white, 1);
}