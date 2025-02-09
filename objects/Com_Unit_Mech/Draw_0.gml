/// @description Insert description here
// You can write your code in this editor

// Effects

//Quiver
if(if_affected(effects, "Quiver"))
{
	draw_sprite_ext(shock_effect, supframe/15, x, y, sprite_width/(150), sprite_height/(150), direction, c_red, 1);
	
	supframe ++;
	
	if(supframe == 45)
	{
		supframe = 0;
	}
	
}


// EMP
if(if_affected(effects, "EMP"))
{
	draw_sprite_ext(shock_effect, _shockFrame/10, x, y, sprite_width/(150), sprite_height/(150), direction, c_white, 1);
	
	_shockFrame++;
	
	if(_shockFrame == 30)
	{
		_shockFrame = 0;
	}
}


// Decay
if(if_affected(effects, "Decay"))
{
	draw_sprite_ext(shock_effect, _shockFrame/10, x, y, sprite_width/(150), sprite_height/(150), direction, c_yellow, 1);
	
	_shockFrame++;
	
	if(_shockFrame == 30)
	{
		_shockFrame = 0;
	}
}

//Determine direction

// -45 to 45: 0, 45 to 135: 1, 135 to 225 : 2, 225 to -45: 3


//For basic pilots, they face the direction they are moving. 
if(def_skill <= 2)
{
	img = floor((direction + 45) / 90);

	if(img >= 4)
	{
		img = 0;
	}
}

else { //elite pilots can pilot their mech backwards
	
	//likely will need to change to reflect the target of the main weapon
	if(instance_exists(target))
	{
		img = floor(shootAngle + 45 / 90);

		if(img >= 4)
		{
			img = 0;
		}
		
	}
	
	else
	{
		//When moving normally, just follow direction
		img = floor((direction + 45) / 90);

		if(img >= 4)
		{
			img = 0;
		}
	}
}

if(ds_list_find_index(global.selection, self.id) != -1)
{
	if(if_affected(effects, "TauCeti"))
	{
		draw_sprite_ext(selectSprite, img, x, y, image_xscale, image_yscale, image_angle, c_orange , 1);
	}

	if(if_affected(effects, "KeplerArmourReduce"))
	{
		draw_sprite_ext(selectSprite, img, x, y, image_xscale, image_yscale, image_angle, c_orange , 1);
	}
	else
	{
		draw_sprite_ext(selectSprite, img, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
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
		
		//draw_sprite_ext(line, 0, x, y, 1, 3, direction + 90, c_white, 1);
		
		//draw_sprite_ext(line, 0, x, y, 1, 3, point_direction(x, y, move_x, move_y) + 90, c_white, 1);
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
		draw_sprite_ext(sprite, img, x, y, image_xscale, image_yscale, image_angle, c_orange, 1);
	}
	if(if_affected(effects, "KeplerArmourReduce"))
	{
		draw_sprite_ext(sprite, img, x, y, image_xscale, image_yscale, image_angle, c_orange , 1);
	}
	else
	{
		draw_sprite_ext(sprite, img, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	}
}

draw_rectangle_color(x - sprite_width* image_xscale/2, y - sprite_height * image_yscale, x + sprite_width * image_xscale/2, y + 6 - sprite_height * image_yscale, c_white, c_white, c_white, c_white, false);

draw_rectangle_color(x - sprite_width * image_xscale/2, y - sprite_height * image_yscale, x - sprite_width * image_xscale/2 + sprite_width/maxHp * hp * image_xscale, y + 6 - sprite_height * image_yscale, c_green, c_green, c_green, c_green, false);

draw_set_font(Proximae_Tiny);

draw_text(x + sprite_width * image_xscale/2 + 4, y - sprite_height * image_yscale, string(level));

draw_set_font(Arkeyevich);

if(hasShield)
{
	draw_rectangle_color(x - sprite_width* image_xscale/2, y - 6 - sprite_height * image_yscale, x + sprite_width * image_xscale/2, y - 12 - sprite_height * image_yscale, c_white, c_white, c_white, c_white, false);

	draw_rectangle_color(x - sprite_width* image_xscale/2, y - 6 - sprite_height * image_yscale, x - sprite_width * image_xscale/2 + sprite_width/maxShield * shieldHealth, y - 12 - sprite_height * image_yscale, c_blue, c_blue, c_blue, c_blue, false);
}

if(maxEnergy > 0)
{
	draw_rectangle_color(x - sprite_width* image_xscale/2, y - 12 - sprite_height * image_yscale, x + sprite_width * image_xscale/2, y - 18 - sprite_height * image_yscale, c_white, c_white, c_white, c_white, false);

	draw_rectangle_color(x - sprite_width* image_xscale/2, y - 12 - sprite_height * image_yscale, x - sprite_width * image_xscale/2 + sprite_width/maxEnergy * energy, y - 18 - sprite_height * image_yscale, c_yellow, c_yellow, c_yellow, c_yellow, false);
}

global.camera_x = camera_get_view_x(view_camera[0]);

global.camera_y = camera_get_view_y(view_camera[0]);

//Minimap
draw_on_minimap(self);

if(global.showArc && ds_list_find_index(global.selection, self.id) != -1)
{
	if(fireAngle < 180)
	{

		draw_line(x, y, x + range * cos(-degtorad(shootAngle + direction + fireAngle)), y + range * sin(-degtorad(shootAngle+ direction + fireAngle)));
		draw_line(x, y, x + range * cos(-degtorad(shootAngle + direction - fireAngle)), y + range * sin(-degtorad(shootAngle+ direction - fireAngle)));
	}
	else 
	{
		draw_circle(x, y, range, true);
	}
}