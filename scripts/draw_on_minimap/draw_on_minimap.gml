// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_on_minimap(UnitID){
	//Minimap
	if(UnitID.faction_number == ds_list_find_index(global.factions, "player") && UnitID.visible)
	{

		draw_sprite_ext(minimapIcon, 0, global.camera_x + 25 + UnitID.x/room_width * 300, global.camera_y + camera_get_view_height(view_camera[0]) - 350 + UnitID.y/room_height * 300, 1, 1, UnitID.direction - 90, c_green, 1);
	}
	else if(UnitID.visible)
	{
		draw_sprite_ext(minimapIcon, 0, global.camera_x + 25 + UnitID.x/room_width * 300, global.camera_y + camera_get_view_height(view_camera[0]) - 350 + UnitID.y/room_height * 300, 1, 1, UnitID.direction - 90, c_red, 1);
	}
}