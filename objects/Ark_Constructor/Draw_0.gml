 /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(unpacking)
{
	draw_rectangle_color(x - sprite_width/2, y - 5 - sprite_height, x + sprite_width/2, y - 8 - sprite_height, c_gray, c_gray, c_gray, c_gray, false);

	draw_rectangle_color(x + sprite_width/2, y - 5 - sprite_height, x + sprite_width/2 - sprite_width/fullProduceTime * producedTime, y - 8 - sprite_height, c_white, c_white, c_white, c_white, false);
}