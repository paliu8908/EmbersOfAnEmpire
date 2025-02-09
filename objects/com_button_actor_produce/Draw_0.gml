/// @description Insert description here
// You can write your code in this editor
if(slot >= 0 && if_able)
{
	draw_sprite_ext(sprite, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
	// Unit, show the unit Icon
	if(show == 2)
	{
		var reduceRate = min((sprite_width-25)/sprite_get_width(topsprite), (sprite_height - 25)/sprite_get_height(topsprite));
		draw_sprite_ext(topsprite, 0, x, y, reduceRate, reduceRate, 0, c_white, 1);
	}
}

else if(slot >= 0 && !if_able)
{
	draw_sprite_ext(sprite, 0, x, y, image_xscale, image_yscale, 0, c_gray, 1)
	
	//Ability, show time it takes to charge up
	if(show == 1 && chargedTime >= 0)
	{
		var reduceRate = min((sprite_width-25)/sprite_get_width(topsprite), (sprite_height - 25)/sprite_get_height(topsprite));
		draw_sprite_part_ext(self.sprite, 0, 0, 0, sprite_width, sprite_height * chargedAmount/chargedTime * 0.5, x - sprite_width div 2, y - sprite_height div 2, image_xscale, image_yscale, c_white, 1);
	}
	
	// Unit, show the unit Icon
	else if(show == 2)
	{
		var reduceRate = min((sprite_width-25)/sprite_get_width(topsprite), (sprite_height - 25)/sprite_get_height(topsprite));
		draw_sprite_ext(topsprite, 0, x, y, reduceRate, reduceRate, 0, c_gray, 1);
	}
}