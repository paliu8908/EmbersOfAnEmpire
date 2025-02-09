/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();


if(shieldHealth > 0)
{
	//draw_sprite(Shield, 0, x, y,);
	
	draw_sprite_ext(shieldSprite, 0, x, y, sprite_height/shieldSpriteRadius, sprite_width/shieldSpriteRadius, direction-90, c_white, 0.5 * (shieldHealth/maxShield));
}

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
	
	draw_sprite_ext(TC_Turret, 0, x + _wpnOffX, y + _wpnOffY, 3 * image_xscale, 3 * image_yscale, _angle, c_white, 1);

}