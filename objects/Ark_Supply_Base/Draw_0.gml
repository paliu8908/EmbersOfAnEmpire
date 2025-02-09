/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

draw_rectangle_color(x - sprite_width/2, y - 5 - sprite_height, x + sprite_width/2 , y - 8 - sprite_height, c_white, c_white, c_white, c_white, false);


if(ds_list_find_value(global.energy, faction_number) >= ds_list_find_value(global.energyUsed, faction_number))
{
	
	draw_rectangle_color(x - sprite_width/2, y - 5 - sprite_height, x + sprite_width/2 - sprite_width/spawn_time * spawn_counter, y - 8 - sprite_height, c_gray, c_gray, c_gray, c_gray, false);
}
else
{
	draw_rectangle_color(x - sprite_width/2, y - 5 - sprite_height, x + sprite_width/2 - sprite_width/spawn_time * spawn_counter, y - 8 - sprite_height, c_orange, c_orange, c_orange, c_orange, false);
}


if(ds_list_find_index(global.selection, self.id) != -1)
{
	
	
	draw_line_color(x, y, rally_x, rally_y, c_green, c_green)
	
	draw_sprite_ext(icon_rally_pt, 0, global.camera_x + 25 + rally_x/room_width * 300, global.camera_y + camera_get_view_height(view_camera[0]) - 350 + rally_y/room_height * 300, 1, 1, 0, c_green, 1);
}