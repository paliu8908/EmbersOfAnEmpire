 if(if_affected(effects, "Quiver"))
{
	draw_sprite_ext(shock_effect, supframe/15, x, y, sprite_width/(150), sprite_height/(150), direction, c_red, 1);
	
	supframe ++;
	
	if(supframe == 45)
	{
		supframe = 0;
	}
	
}

if(if_affected(effects, "EMP"))
{
	draw_sprite_ext(shock_effect, _shockFrame/10, x, y, sprite_width/(150), sprite_height/(150), direction, c_white, 1);
	
	_shockFrame++;
	
	if(_shockFrame == 30)
	{
		_shockFrame = 0;
	}
}

if(if_affected(effects, "Decay"))
{
	draw_sprite_ext(shock_effect, _shockFrame/10, x, y, sprite_width/(150), sprite_height/(150), direction, c_yellow, 1);
	
	_shockFrame++;
	
	if(_shockFrame == 30)
	{
		_shockFrame = 0;
	}
}

image_angle = direction + 90;

	
img++;
	
if(img >= maxSprites * 15)
{
	img = 0;
}

if(ds_list_find_index(global.selection, self.id) != -1)
{
	if(if_affected(effects, "TauCeti"))
	{
		draw_sprite_ext(selectSprite, img/(15/maxSprites), x, y, image_xscale, image_yscale, image_angle, c_orange , 1);
	}
	if(if_affected(effects, "KeplerArmourReduce"))
	{
		draw_sprite_ext(selectSprite, img/(15/maxSprites), x, y, image_xscale, image_yscale, image_angle, c_orange , 1);
	}
	else
	{
		draw_sprite_ext(selectSprite, img/(15/maxSprites), x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	}
	
	if(if_move == 1 || if_move == 2)
	{
		if(ds_list_size(moveXList) > 0 && keyboard_check(vk_shift))
		{
	
			draw_line_color(x, y, ds_list_find_value(moveXList, 0), ds_list_find_value(moveYList, 0), c_green, c_green);
	
			for(var dest = 1; dest < ds_list_size(moveXList); dest++)
			{
				draw_line_color(ds_list_find_value(moveXList, dest - 1), ds_list_find_value(moveYList, dest - 1), ds_list_find_value(moveXList, dest), ds_list_find_value(moveYList, dest), c_green, c_green);
			}
		}
	}
	
	if(atkOrder && instance_exists(target) && ds_list_size(attackTargets) > 0 && keyboard_check(vk_shift))
	{
		
		draw_line_color(x, y, target.x, target.y, c_red, c_red);
		
		for(var dest = 1; dest < ds_list_size(attackTargets)-1; dest++)
		{
			if(instance_exists(ds_list_find_value(attackTargets, dest - 1)) && instance_exists(ds_list_find_value(attackTargets, dest)))
			{
				draw_line_color(ds_list_find_value(attackTargets, dest - 1).x, ds_list_find_value(attackTargets, dest - 1).y, ds_list_find_value(attackTargets, dest).x, ds_list_find_value(attackTargets, dest).y, c_red, c_red);
			}
		}
	}
}
else
{
	
	if(if_affected(effects, "TauCeti"))
	{
		draw_sprite_ext(sprite, img/(15/maxSprites), x, y, image_xscale, image_yscale, image_angle, c_orange, 1);
	}
	if(if_affected(effects, "KeplerArmourReduce"))
	{
		draw_sprite_ext(sprite, img/(15/maxSprites), x, y, image_xscale, image_yscale, image_angle, c_orange , 1);
	}
	else
	{
		draw_sprite_ext(sprite, img/(15/maxSprites), x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	}
}

draw_rectangle_color(x - sprite_width* image_xscale/2, y - sprite_height * image_yscale, x + sprite_width * image_xscale/2, y - 3 - sprite_height * image_yscale, c_white, c_white, c_white, c_white, false);

draw_rectangle_color(x - sprite_width * image_xscale/2, y - sprite_height * image_yscale, x - sprite_width * image_xscale/2 + sprite_width/maxHp * hp * image_xscale, y - 3 - sprite_height * image_yscale, c_green, c_green, c_green, c_green, false);

if(hasShield)
{
	draw_rectangle_color(x - sprite_width* image_xscale/2, y - 38 - sprite_height * image_yscale, x + sprite_width * image_xscale/2, y - 32 - sprite_height * image_yscale, c_white, c_white, c_white, c_white, false);

	draw_rectangle_color(x - sprite_width* image_xscale/2, y - 38 - sprite_height * image_yscale, x - sprite_width * image_xscale/2 + sprite_width/maxShield * shieldHealth, y - 32 - sprite_height * image_yscale, c_blue, c_blue, c_blue, c_blue, false);
}

global.camera_x = camera_get_view_x(view_camera[0]);

global.camera_y = camera_get_view_y(view_camera[0]);

//Minimap
draw_on_minimap(self);

if(ds_list_size(production) > 0)
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
	if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Fighter_Bay, false, false))
	{
		var _i = 0;
		
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Fighter Bay", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);

	}
	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Power_Plant, false, false))
	{
		var _i = 1;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Power Plant", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}

	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Refinery, false, false))
	{
		var _i = 2;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Metal Refinery", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}
	
	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Shipyard_Light, false, false))
	{
		var _i = 3;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Shipyard", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}
	
	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Capital_Docks, false, false))
	{
		var _i = 4;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Capital Docks", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}
	
	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Facility, false, false))
	{
		var _i = 5;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Facility", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}
	
	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Heavy_Generator, false, false))
	{
		var _i = 6;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Heavy Generator", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}
	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_TechLab, false, false))
	{
		var _i = 7;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Tech Lab", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}
	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_ExperimentalCentre, false, false))
	{
		var _i = 8;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Experimental Centre", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}
	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Arms_Storage, false, false))
	{
		var _i = 9;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Arms Storage", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}
	else if(collision_circle(mouse_x, mouse_y, 20, Ark_Produce_Supply_Base, false, false))
	{
		var _i = 10;
	
		draw_rectangle(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, false);
		draw_rectangle_frame_width(UI_Back.x - 300, UI_Back.y - 280, UI_Back.x + 300, UI_Back.y - 150, c_green, 10);
		
		draw_text_color(UI_Back.x - 275, UI_Back.y - 260, "Supply Base", c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 230, "Metal Cost: " + string(unitData[_i, 2]), c_orange, c_orange, c_orange, c_orange, 1);
		draw_text_color(UI_Back.x - 275, UI_Back.y - 200, "Energy Cost: " + string(unitData[_i, 3]), c_orange, c_orange, c_orange, c_orange, 1);
	
	}
}

if(hasShield && shieldHealth > 0)
{
	//draw_sprite(Shield, 0, x, y,);
	
	draw_sprite_ext(shieldSprite, 0, x, y, 1.25 * sprite_height/shieldSpriteRadius, 1.25 * sprite_width/shieldSpriteRadius, image_angle - 90, c_white, 0.5 * (shieldHealth/maxShield));
}