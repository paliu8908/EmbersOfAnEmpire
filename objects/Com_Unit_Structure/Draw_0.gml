/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if(canProduce && ds_list_size(production) > 0 || canResearch && ds_list_size(production) > 0)
{

	if(ds_list_find_value(global.energy, faction_number) >= ds_list_find_value(global.energyUsed, faction_number))
	{
	
		draw_rectangle_color(x - sprite_width/2, y - 5 - sprite_height, x + sprite_width/2, y - 8 - sprite_height, c_white, c_white, c_white, c_white, false);
	}
	else
	{
		draw_rectangle_color(x - sprite_width/2, y - 5 - sprite_height, x + sprite_width/2, y - 8 - sprite_height, c_orange, c_orange, c_orange, c_orange, false);
	}

	draw_rectangle_color(x + sprite_width/2, y - 5 - sprite_height, x + sprite_width/2 - sprite_width/ds_list_find_value(fullProduction, 0) * ds_list_find_value(productionAmount, 0), y - 8 - sprite_height, c_gray, c_gray, c_gray, c_gray, false);

}

if(ds_list_find_index(global.selection, self.id) != -1 && canProduce)
{
	draw_line(x, y, rally_x, rally_y);
}
if(ds_list_find_index(global.selection, self.id) != -1)
{
	if(canProduce || canResearch)
	{
		for(var _i = 0; _i < array_length(unitData); _i++)
		{

			if(collision_circle(mouse_x, mouse_y, 20, unitData[_i][7], false, false))
			{
		
				draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
				draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
				draw_set_font(Arkeyevich_Small);
				draw_text_color(UI_Back.x - 275, UI_Back.y - 260, unitData[_i][4], c_orange, c_orange, c_orange, c_orange, 1);
				draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
				draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
				draw_text_color(UI_Back.x, UI_Back.y - 230, "Time: " + string(unitData[_i, 1]), c_orange, c_orange, c_orange, c_orange, 1);
				
				draw_set_font(Arkeyevich);
			}
		}
	}
}

if(hasShield && shieldHealth > 0)
{
	//draw_sprite(Shield, 0, x, y,);
	
	draw_sprite_ext(shieldSprite, 0, x, y, 1.25 * sprite_height/shieldSpriteRadius, 1.25 * sprite_width/shieldSpriteRadius, direction, c_white, 0.5 * (shieldHealth/maxShield));
}