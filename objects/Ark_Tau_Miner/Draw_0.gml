/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(faction_number == ds_list_find_index(global.factions, "player"))
{
	draw_rectangle_color(x - sprite_width/2, y - sprite_height - 5, x + sprite_width/2, y - 8 - sprite_height, c_white, c_white, c_white, c_white, false);

	draw_rectangle_color(x - sprite_width/2, y - sprite_height - 5, x - sprite_width/2 + sprite_width/mineralsMax * minerals, y - 8 - sprite_height, c_yellow, c_yellow, c_yellow, c_yellow, false);
}