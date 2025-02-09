/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event

if(slot >= 0 && if_able)
{
	draw_sprite_ext(sprite, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
	
	if(show == 2)
	{
		var reduceRate = min((sprite_width-25)/sprite_get_width(top), (sprite_height - 25)/sprite_get_height(top));
		draw_sprite_ext(top, 0, x, y, reduceRate, reduceRate, 0, c_white, 1);
	}
}

else if(slot >= 0 && !if_able)
{
	draw_sprite_ext(self.sprite, 0, x, y, image_xscale, image_yscale, 0, c_grey, 1)
	
	if(show == 1)
	{
		draw_sprite_part_ext(self.sprite, 0, 0, sprite_height * chargedAmount/chargedTime * 0.5, sprite_width, sprite_height, x - sprite_width div 2, y - sprite_height div 2 + sprite_height * chargedAmount/chargedTime, 2, 2, c_grey, 1);
	}
	else if(show == 2)
	{
		var reduceRate = min((sprite_width-25)/sprite_get_width(top), (sprite_height - 25)/sprite_get_height(top));
		draw_sprite_ext(top, 0, x, y, reduceRate, reduceRate, 0, c_white, 1);
	}
}