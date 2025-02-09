/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();



if(hasShield && shieldHealth > 0)
{
	//draw_sprite(Shield, 0, x, y,);
	
	draw_sprite_ext(shieldSprite, 0, x, y, 1.25 * sprite_height/shieldSpriteRadius, 1.25 * sprite_width/shieldSpriteRadius, image_angle - 90, c_white, 0.5 * (shieldHealth/maxShield));
}
