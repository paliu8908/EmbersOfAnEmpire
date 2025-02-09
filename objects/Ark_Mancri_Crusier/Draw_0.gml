/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

for(var _i = 0; _i < array_length(main_weapon_list); _i++)
{
	var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	
	draw_sprite_ext(Cancri_Turret, 0, x + _wpnOffX, y + _wpnOffY, 2 * image_xscale, 2 * image_yscale, direction+ main_weapon_list[_i][3], c_white, 1);
}

if(shieldHealth > 0)
{
	//draw_sprite(Shield, 0, x, y,);
	
	draw_sprite_ext(shieldSprite, 0, x, y, 1.25 * sprite_height/shieldSpriteRadius, 1.25 * sprite_width/shieldSpriteRadius, image_angle - 90, c_white, 0.5 * (shieldHealth/maxShield));
}