/// @description Insert description here
// You can write your code in this editor
global.camera_x = camera_get_view_x(view_camera[0]);

global.camera_y = camera_get_view_y(view_camera[0]);

global.camera_right = global.camera_x + camera_get_view_width(view_camera[0]);

global.camera_bottom = global.camera_x + camera_get_view_height(view_camera[0]);

mid_camera_x = global.camera_x + camera_get_view_width(view_camera[0]) div 2;

mid_camera_y = global.camera_y + camera_get_view_height(view_camera[0]) div 2;


if(time_down > 0)
{
	
	draw_rectangle_frame_width(global.mx, global.my, x, y, c_white, 5);
	
}

draw_self();

draw_text(global.camera_x, global.camera_y, "Metal: " + string(floor(ds_list_find_value(global.metal, faction_number))));
//draw_text(global.camera_x + 300, global.camera_y, "Energy: " + string(ds_list_find_value(global.energy, faction_number)));
//draw_sprite(Minimap, 0, global.camera_x + camera_get_view_width(view_camera[0]) + 300, global.camera_y + camera_get_view_height(view_camera[0]) - 300);

minimapX = global.camera_x + 150;
minimapY = global.camera_y + camera_get_view_height(view_camera[0]) - 300;

draw_sprite_ext(Minimap, 0, minimapX + 50, minimapY + 100 , 3.5, 3.5, 0, c_white, 1);

draw_rectangle_frame_width(minimapX - 125 + global.camera_x/room_width * 300, minimapY + global.camera_y/room_height * 300 - 50, minimapX - 125 + (global.camera_x + camera_get_view_width(view_camera[0]))/room_width * 300, minimapY + (global.camera_y + camera_get_view_height(view_camera[0]))/room_height * 300 - 50, c_white, 3);

//Energy Bar
var maxE = max(ds_list_find_value(global.energy, faction_number), ds_list_find_value(global.energyUsed, faction_number));
var _energy = ds_list_find_value(global.energy, faction_number);
var _energyUsed = ds_list_find_value(global.energyUsed, faction_number);

if(maxE > 0)
{

	draw_rectangle_color(minimapX + 330, minimapY - 50, minimapX + 335, minimapY + 270, c_white, c_white, c_white, c_white, false);
	draw_rectangle_color(minimapX + 330, minimapY + 270 - 320 * _energy div maxE, minimapX + 335, minimapY + 270, c_green, c_green, c_green, c_green, false);

	draw_rectangle_color(minimapX + 340, minimapY - 50, minimapX + 345, minimapY + 270, c_white, c_white, c_white, c_white, false);
	draw_rectangle_color(minimapX + 340, minimapY + 270 - 320 * _energyUsed div maxE, minimapX + 345, minimapY + 270, c_red, c_red, c_red, c_red, false);
	
	if(point_in_rectangle(mouse_x, mouse_y, minimapX + 330, minimapY - 50, minimapX + 345, minimapY + 270))
	{
		draw_rectangle(mouse_x - 100, mouse_y - 30, mouse_x + 150, mouse_y + 30, false);
		draw_rectangle_frame_width(mouse_x - 100, mouse_y - 30, mouse_x + 150, mouse_y + 30, c_green, 3);
		draw_set_color(c_orange);
		draw_set_font(Arkeyevich_Small);
		draw_text(mouse_x - 90, mouse_y - 30, "Energy: " + string(ds_list_find_value(global.energy, faction_number)));
		draw_text(mouse_x - 90, mouse_y, "Energy Used: " + string(ds_list_find_value(global.energyUsed, faction_number)));
		draw_set_color(c_white);
		draw_set_font(Arkeyevich)
	}
}
//Units in Selection

var unitsInSelection = ds_list_size(global.selection);

if(unitsInSelection > 0)
{
	var _units_L = sqrt(iRegion_proportion * unitsInSelection);
	var _units_W = unitsInSelection div _units_L;
	var _iLength = min(iRegion_length div _units_L, 64);
	var _iWidth = min(iRegion_width div _units_W, 64);

	for(var u = 0; u < unitsInSelection ; u++)
	{
		var _unit = ds_list_find_value(global.selection, u);
		
		
		if(instance_exists(_unit))
		{
			if(ds_list_find_index(global.primarySelect, _unit) != - 1)
			{
				draw_sprite_stretched_ext(union_frame, 1, global.camera_x + iRegion_x + floor(u % _units_L) * _iLength, global.camera_y + iRegion_y + _iWidth * (floor(u / _units_L)), _iLength, _iWidth, c_white, 1);
			}
			else
			{
				draw_sprite_stretched_ext(union_frame, 0, global.camera_x + iRegion_x + floor(u % _units_L) * _iLength, global.camera_y + iRegion_y + _iWidth * (floor(u / _units_L)), _iLength, _iWidth, c_white, 1);
			}
			
			draw_sprite_stretched_ext(_unit.sprite, 0, global.camera_x + iRegion_x + floor(u % _units_L) * _iLength, global.camera_y + iRegion_y + _iWidth * (floor(u / _units_L)), _iLength, _iWidth, c_white, 1);
		}
		
	}
	
	//draw_sprite_ext(UI_Panel, 0, UI_Back.x - 670, UI_Back.y - 5, 725/824, 1, 0, c_white, 1);
	
	if(instance_exists(ds_list_find_value(global.primarySelect, 0)))
	{
		var uni = ds_list_find_value(global.primarySelect, 0)
	
		draw_sprite_ext(uni.portrait, uni.p_num, UI_Back.x - 125, UI_Back.y - 8, 1, 1, 0, c_white, 1);
		draw_sprite_ext(Portrait_frame, 0, UI_Back.x - 125, UI_Back.y - 8, 1, 1, 0, c_white, 1);
		
		if(uni.canLevelUp)
		{
			draw_rectangle_colour(UI_Back.x - 225, UI_Back.y - 0 + 125, UI_Back.x - 25, UI_Back.y + 16 + 125,  c_ltgrey, c_ltgrey, c_ltgrey, c_ltgrey, false);
			draw_rectangle_colour(UI_Back.x - 225, UI_Back.y - 0 + 125, UI_Back.x - 225 + uni.xp/uni.nextLevelXp * 200, UI_Back.y + 16 + 125,  c_teal, c_teal, c_teal, c_teal, false);
		}
		
		draw_text_color(UI_Back.x - 750, UI_Back.y - 120, uni.name, c_orange, c_orange, c_orange, c_orange, 1);
		draw_set_font(Arkeyevich_Small);
		draw_text_color(UI_Back.x - 750, UI_Back.y - 80, "Health: " + string(uni.hp) + "/" + string(uni.maxHp), c_orange, c_orange, c_orange, c_orange, 1);
		
		if(uni.hasShield)
		{
			draw_text_color(UI_Back.x - 500, UI_Back.y - 80, "Shields: " + string(uni.shieldHealth) + "/" + string(uni.maxShield), c_orange, c_orange, c_orange, c_orange, 1);
		}
			
		
		draw_text_color(UI_Back.x - 750, UI_Back.y - 60, "Armour: " + string(uni.block), c_orange, c_orange, c_orange, c_orange, 1);
		
		var lines = string_length(global.unitInfo) div 40;
		
		for(var l = 0; l < lines + 1; l++)
		{
			var whatPrint = "";
			
			for(var c = 1; c < 41 && c + l * 40 < string_length(global.unitInfo) + 1; c++)
			{
				whatPrint += string(string_char_at(global.unitInfo, l * 40 + c));
			}
			
			draw_text_color(UI_Back.x - 750, UI_Back.y - 40 + l * 20, whatPrint, c_orange, c_orange, c_orange, c_orange, 1);
		}
		
		
		
		draw_set_font(Arkeyevich);
	}
}

/*if(global.show_unit_ui == true)
{
	if(global.attack_pressed == true || collide_enemy == true)
	{
		draw_sprite(mouse_attack, 0, x, y,)
	}

	else if(global.grenade_pressed == true)
	{
		draw_sprite(mouse_attack, 0, x, y,)
	
		draw_circle_color(x, y, 25, c_blue, c_blue, true)
	}
	
	else if(global.move_pressed == true || press_unit == false)
	{
		draw_sprite(mouse_move, 0, x, y,)		
	}
	
	else
	{
		draw_self()
	}
}
else
{
	draw_self()
}*/