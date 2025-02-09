/// @description Insert description here
// You can write your code in this editor
/*var _x = x div game_fog.grid_size

var _y = y div game_fog.grid_size

if_show = ds_grid_get(game_fog.shroud_grid, _x, _y)

if(if_show == 0)
{
	
	depth = obj_minimap.depth - 1;

	if(unit_state == "attack" || if_shoot == true)
	{
		image_angle = point_direction(x, y, target_x, target_y) + 90;
	}

	if(unit_state == "move")
	{
	
		image_angle = direction + 90;
	}

	draw_self();

	draw_rectangle_color(x - 7, y - 19, x - 7 + hp, y - 17, c_green, c_green, c_green, c_green, false);
	


	

}

else
{
	depth = obj_minimap.depth + 1;
}

var _xPos = x/global.mapSizeX;
var _yPos = y/global.mapSizeY;

if(faction_number == ds_list_find_index(global.factions, "player"))
{
	draw_rectangle_color(global.minimap_X + (_xPos * 256), global.minimap_Y + (_yPos * 256), global.minimap_X + (_xPos * 256) + onMapSize, global.minimap_Y + (_yPos * 256) + onMapSize, c_blue, c_blue, c_blue, c_blue, false);
}
else
{
	draw_rectangle_color(global.minimap_X + (_xPos * 256), global.minimap_Y + (_yPos * 256), global.minimap_X + (_xPos * 256) + 2, global.minimap_Y + (_yPos * 256) + 2, c_red, c_red, c_red, c_red, false);
}*/

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

draw_rectangle_color(x - sprite_width* image_xscale/2, y - sprite_height * image_yscale, x + sprite_width * image_xscale/2, y + 6 - sprite_height * image_yscale, c_white, c_white, c_white, c_white, false);

draw_rectangle_color(x - sprite_width * image_xscale/2, y - sprite_height * image_yscale, x - sprite_width * image_xscale/2 + sprite_width/maxHp * hp * image_xscale, y + 6 - sprite_height * image_yscale, c_green, c_green, c_green, c_green, false);

if(hasShield)
{
	draw_rectangle_color(x - sprite_width* image_xscale/2, y - 6 - sprite_height * image_yscale, x + sprite_width * image_xscale/2, y - 12 - sprite_height * image_yscale, c_white, c_white, c_white, c_white, false);

	draw_rectangle_color(x - sprite_width* image_xscale/2, y - 6 - sprite_height * image_yscale, x - sprite_width * image_xscale/2 + sprite_width/maxShield * shieldHealth, y - 12 - sprite_height * image_yscale, c_blue, c_blue, c_blue, c_blue, false);
}

global.camera_x = camera_get_view_x(view_camera[0]);

global.camera_y = camera_get_view_y(view_camera[0]);

//Minimap
draw_on_minimap(self);