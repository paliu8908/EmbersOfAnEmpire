/// @description Insert description here
// You can write your code in this editor
if(slot >= 0 && if_able && visible)
{
	draw_sprite_ext(sprite, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

else if(slot >= 0 && !if_able && visible)
{
	draw_sprite_ext(self.sprite, 0, x, y, image_xscale, image_yscale, 0, c_grey, 1)
	
}