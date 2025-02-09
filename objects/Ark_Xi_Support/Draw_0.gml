/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(hasShield && shieldHealth > 0)
{
	//draw_sprite(Shield, 0, x, y,);
	
	draw_sprite_ext(shieldSprite, 0, x, y, shieldWidth/shieldSpriteRadius, shieldHeight/shieldSpriteRadius, direction-90, c_white, 1 * (shieldHealth/maxShield));
} 