// Inherit the parent event
if(if_affected(effects, "EMP"))
{
	draw_sprite_ext(shock_effect, _shockFrame/10, x, y, sprite_width/(150), sprite_height/(150), direction, c_white, 1);
	
	_shockFrame++;
	
	if(_shockFrame == 30)
	{
		_shockFrame = 0;
	}
}

if(if_affected(effects, "Quiver"))
{
	draw_sprite_ext(shock_effect, supframe/15, x, y, sprite_width/(150), sprite_height/(150), direction, c_red, 1);
	
	supframe ++;
	
	if(supframe == 45)
	{
		supframe = 0;
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



image_angle = direction;

	
img++;
	
if(img >= maxSprites * 15)
{
	img = 0;
}

//drawing weapon arcs.

if(global.showArc && ds_list_find_index(global.selection, self.id) != -1)
{
	for(var _i = 0; _i < array_length(main_weapon_list); _i++)
	{
		var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
		var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
		var _wpnTarget = main_weapon_list[_i][12];
		var _wpnShootAngle = main_weapon_list[_i][3];
		var _wpnFireAngle = main_weapon_list[_i][2];
	
		var _wpnRange = main_weapon_list[_i][1];

		//draw_line(x+_wpnOffX, y+_wpnOffY, x+_wpnOffX + _wpnRange * cos(-degtorad(weapon_list[_i][3] + direction)), y+_wpnOffY + _wpnRange * sin(-degtorad(weapon_list[_i][3]+ direction)));
		
		//actual rotation
		draw_line(x+_wpnOffX, y+_wpnOffY, x+_wpnOffX + _wpnRange * cos(-degtorad(_wpnShootAngle + direction + _wpnFireAngle)), y+_wpnOffY + _wpnRange * sin(-degtorad(_wpnShootAngle + direction + _wpnFireAngle)));
		draw_line(x+_wpnOffX, y+_wpnOffY, x+_wpnOffX + _wpnRange * cos(-degtorad(_wpnShootAngle + direction - _wpnFireAngle)), y+_wpnOffY + _wpnRange * sin(-degtorad(_wpnShootAngle + direction - _wpnFireAngle)));
		
		//draw max turn
		
		draw_line(x, y, x + range * cos(-degtorad(direction + turretTurnAngle)), y + range * sin(-degtorad(direction + turretTurnAngle)));
		draw_line(x, y, x + range * cos(-degtorad(direction - turretTurnAngle)), y + range * sin(-degtorad(direction - turretTurnAngle)));
		
		/*if(instance_exists(_wpnTarget))
		{
			var _angleToTarget = point_direction(x+_wpnOffX, y +_wpnOffY, _wpnTarget.x, _wpnTarget.y);
			
			var _inAngle = false;
			
			if(_angleToTarget > _wpnShootAngle + direction - _wpnFireAngle && _angleToTarget < _wpnShootAngle + direction + _wpnFireAngle)
			{
				_inAngle = true;
			}
		
			if(_inAngle)
			{
				draw_line_color(x+_wpnOffX, y+_wpnOffY, _wpnTarget.x, _wpnTarget.y, c_lime, c_lime);
			
			}
		}*/
	
	}
}

//drawing path lines, and itself.

if(ds_list_find_index(global.selection, self.id) != -1)
{
	
	if(ds_list_size(moveXList) > 0 && if_move == 1 && keyboard_check(vk_shift) || ds_list_size(moveXList) > 0 && if_move == 2 && keyboard_check(vk_shift))
	{
	
		draw_line_color(x, y, ds_list_find_value(moveXList, 0), ds_list_find_value(moveYList, 0), c_green, c_green);
	
		for(var dest = 1; dest < ds_list_size(moveXList); dest++)
		{
			draw_line_color(ds_list_find_value(moveXList, dest - 1), ds_list_find_value(moveYList, dest - 1), ds_list_find_value(moveXList, dest), ds_list_find_value(moveYList, dest), c_green, c_green);
		}
	}
	
	if(atkOrder && instance_exists(target) && keyboard_check(vk_shift))
	{
		draw_line_color(x, y, target.x, target.y, c_red, c_red);
	}
	
	if(if_affected(effects, "TauCeti"))
	{
		draw_sprite_ext(selectSprite, img/(15/maxSprites), x, y, image_xscale, image_yscale, image_angle, c_orange, 1);
	}
	if(if_affected(effects, "KeplerArmourReduce"))
	{
		draw_sprite_ext(selectSprite, img/(15/maxSprites), x, y, image_xscale, image_yscale, image_angle, c_orange , 1);
	}
	else
	{
		draw_sprite_ext(selectSprite, img/(15/maxSprites), x, y, image_xscale, image_yscale, image_angle, c_white, 1);
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

//health bar
draw_rectangle_color(x - sprite_width/2, y - 19 - sprite_height, x + sprite_width/2, y - 17 - sprite_height, c_white, c_white, c_white, c_white, false);

draw_rectangle_color(x - sprite_width/2, y - 19 - sprite_height, x - sprite_width/2 + sprite_width/maxHp * hp, y - 17 - sprite_height, c_green, c_green, c_green, c_green, false);

//shield effect
if(hasShield)
{
	draw_rectangle_color(x - sprite_width/2, y - 38 - sprite_height, x + sprite_width/2, y - 32 - sprite_height, c_white, c_white, c_white, c_white, false);

	draw_rectangle_color(x - sprite_width/2, y - 38 - sprite_height, x - sprite_width/2 + sprite_width/maxShield * shieldHealth, y - 32 - sprite_height, c_blue, c_blue, c_blue, c_blue, false);
}

/*if(instance_exists(target))
{
	draw_line_color(x, y, target.x, target.y, c_red, c_red);
}*/

/*for(var _i = 0; _i < array_length(weapon_list); _i++)
{
	var _wpnOffX = sqrt(sqr(weapon_list[_i][16])+sqr(weapon_list[_i][15])) * sin(degtorad((darctan2(weapon_list[_i][16], weapon_list[_i][15]) + direction)));
	var _wpnOffY = sqrt(sqr(weapon_list[_i][16])+sqr(weapon_list[_i][15])) * cos(degtorad((darctan2(weapon_list[_i][16], weapon_list[_i][15]) + direction)));
	var _wpnTarget = weapon_list[_i][12];
	var _wpnShootAngle = weapon_list[_i][3];
	var _wpnFireAngle = weapon_list[_i][2];
	
	draw_circle_color(x+_wpnOffX, y+_wpnOffY, 8, c_green, c_green, false);
	
	draw_text(x - 200, y-200, string(_wpnOffX));
	draw_text(x - 100, y-200, string(_wpnOffY));
	draw_text(x, y-200, string(darctan2(weapon_list[_i][16], weapon_list[_i][15]) + direction));
	draw_text(x+100, y-200, string(direction));
	
	var _wpnRange = weapon_list[_i][1];

	//draw_line(x+_wpnOffX, y+_wpnOffY, x+_wpnOffX + _wpnRange * cos(-degtorad(weapon_list[_i][3] + direction)), y+_wpnOffY + _wpnRange * sin(-degtorad(weapon_list[_i][3]+ direction)));
	draw_line(x+_wpnOffX, y+_wpnOffY, x+_wpnOffX + _wpnRange * cos(-degtorad(weapon_list[_i][3] + direction + weapon_list[_i][2])), y+_wpnOffY + _wpnRange * sin(-degtorad(weapon_list[_i][3]+ direction + weapon_list[_i][2])));
	draw_line(x+_wpnOffX, y+_wpnOffY, x+_wpnOffX + _wpnRange * cos(-degtorad(weapon_list[_i][3] + direction - weapon_list[_i][2])), y+_wpnOffY + _wpnRange * sin(-degtorad(weapon_list[_i][3]+ direction - weapon_list[_i][2])));
	
	if(instance_exists(_wpnTarget))
	{
		var _angleToTarget = point_direction(x+_wpnOffX, y +_wpnOffY, _wpnTarget.x, _wpnTarget.y);
			
		var _inAngle = false;
			
		if(_angleToTarget > _wpnShootAngle + direction - _wpnFireAngle && _angleToTarget < _wpnShootAngle + direction + _wpnFireAngle)
		{
			_inAngle = true;
		}
		
		if(_inAngle)
		{
			draw_line_color(x+_wpnOffX, y+_wpnOffY, _wpnTarget.x, _wpnTarget.y, c_lime, c_lime);
			
		}
	}
	
}*/

global.camera_x = camera_get_view_x(view_camera[0]);

global.camera_y = camera_get_view_y(view_camera[0]);

//Minimap
draw_on_minimap(self);
