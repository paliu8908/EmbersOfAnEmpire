/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

for(var _i = 0; _i < array_length(main_weapon_list); _i++)
{
	var _wpnTarget = main_weapon_list[_i][12];
	var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
	var _wpnRange = main_weapon_list[_i][1];
	var _wpnShootAngle = main_weapon_list[_i][3];
	var _wpnFireAngle = main_weapon_list[_i][2];
	var _wpnReload = main_weapon_list[_i][7];
		
	if(slowShot && _wpnReload >= 1 && _wpnReload <= 50)
	{
		draw_sprite_ext(Ross_Cannon, _wpnReload, x + _wpnOffX, y + _wpnOffY, image_xscale, image_yscale, direction + main_weapon_list[_i][3], c_white, 1);
		
		if(instance_exists(_wpnTarget))
		{
		
			var _angleToTarget = point_direction(x +_wpnOffX, y +_wpnOffY, _wpnTarget.x, _wpnTarget.y);
			
			var _inAngle = false;
			
			if(_angleToTarget > _wpnShootAngle + direction - _wpnFireAngle && _angleToTarget < _wpnShootAngle + direction + _wpnFireAngle)
			{
				_inAngle = true;
			}
		}
		else
		{
			var _inAngle = false;
		}
		
		if(_wpnReload == 50 && _inAngle)
		{
			
			//create our projectile, then pass the information to it
			var attack = instance_create_layer(x+_wpnOffX, y+_wpnOffY, "instances", weapon);
			
			attack.owner = self.id;
			
			attack.faction_number = faction_number;
			
			attack.move_x = _wpnTarget.x;
	
			attack.move_y = _wpnTarget.y;
	
			attack.create_x = x+_wpnOffX;
	
			attack.create_y = y+_wpnOffY;
	
			attack.if_ready = true;
			
			attack.target = target;
					
			attack.speed = attack.move_speed;
			
			attack.direction = point_direction(attack.create_x, attack.create_y, _wpnTarget.x, _wpnTarget.y);
			
			attack.image_angle = attack.direction;
		}
		else if(_wpnReload  == 50)
		{
			//create our projectile, then pass the information to it
			var attack = instance_create_layer(x+_wpnOffX, y+_wpnOffY, "instances", weapon);
			
			attack.owner = self.id;
			
			attack.faction_number = faction_number;
	
			attack.create_x = x+_wpnOffX;
	
			attack.create_y = y+_wpnOffY;
	
			attack.if_ready = true;
			
			attack.target = target;
					
			attack.speed = attack.move_speed;
			
			attack.direction = direction + _wpnShootAngle;
			
			attack.image_angle = attack.direction;
		}
	}
	else if(!slowShot && _wpnReload >= 1 && _wpnReload <= 14)
	{
		draw_sprite_ext(RossCannonFast, _wpnReload, x + _wpnOffX, y + _wpnOffY, image_xscale, image_yscale, direction + main_weapon_list[_i][3], c_white, 1);
		
		if(instance_exists(_wpnTarget))
		{
		
			var _angleToTarget = point_direction(x +_wpnOffX, y +_wpnOffY, _wpnTarget.x, _wpnTarget.y);
			
			var _inAngle = false;
			
			if(_angleToTarget > _wpnShootAngle + direction - _wpnFireAngle && _angleToTarget < _wpnShootAngle + direction + _wpnFireAngle)
			{
				_inAngle = true;
			}
		}
		else
		{
			var _inAngle = false;
		}
		
		if(_wpnReload == 2 && _inAngle)
		{
			
			//create our projectile, then pass the information to it
			var attack = instance_create_layer(x+_wpnOffX, y+_wpnOffY, "instances", weapon);
			
			attack.owner = self.id;
			
			attack.faction_number = faction_number;
			
			attack.move_x = _wpnTarget.x;
	
			attack.move_y = _wpnTarget.y;
	
			attack.create_x = x+_wpnOffX;
	
			attack.create_y = y+_wpnOffY;
	
			attack.if_ready = true;
			
			attack.target = target;
					
			attack.speed = attack.move_speed;
			
			attack.direction = point_direction(attack.create_x, attack.create_y, _wpnTarget.x, _wpnTarget.y);
			
			attack.image_angle = attack.direction;
		}
		else if(_wpnReload  == 2)
		{
			//create our projectile, then pass the information to it
			var attack = instance_create_layer(x+_wpnOffX, y+_wpnOffY, "instances", weapon);
			
			attack.owner = self.id;
			
			attack.faction_number = faction_number;
	
			attack.create_x = x+_wpnOffX;
	
			attack.create_y = y+_wpnOffY;
	
			attack.if_ready = true;
			
			attack.target = target;
					
			attack.speed = attack.move_speed;
			
			attack.direction = direction + _wpnShootAngle;
			
			attack.image_angle = attack.direction;
		}
	}
	else
	{	
		draw_sprite_ext(Ross_Cannon, 0, x + _wpnOffX, y + _wpnOffY, image_xscale, image_yscale, direction+ main_weapon_list[_i][3], c_white, 1);
		
		/*
		//frame flips every 15 counts, so twice a second up to a total of 5, so 2.5 seconds to charge up?
		draw_sprite_ext(Ross_Cannon, floor(main_weapon_list[_i][18]/10), x + _wpnOffX, y + _wpnOffY, 1, 1, direction+ main_weapon_list[_i][3], c_white, 1);
		
		main_weapon_list[_i][18] = main_weapon_list[_i][18] + 1;
		
		if(instance_exists(_wpnTarget))
		{
		
			var _angleToTarget = point_direction(x +_wpnOffX, y +_wpnOffY, _wpnTarget.x, _wpnTarget.y);
			
			var _inAngle = false;
			
			if(_angleToTarget > _wpnShootAngle + direction - _wpnFireAngle && _angleToTarget < _wpnShootAngle + direction + _wpnFireAngle)
			{
				_inAngle = true;
			}
		}
		else
		{
			var _inAngle = false;
		}
		
		if(main_weapon_list[_i][18] == 50*10 && _inAngle)
		{
			
			//create our projectile, then pass the information to it
			var attack = instance_create_layer(x+_wpnOffX, y+_wpnOffY, "instances", main_weapon_list[_i][0]);
			
			attack.owner = self.id;
			
			attack.faction_number = faction_number;
			
			attack.range += 10 * main_weapon_list[_i][18];
			
			attack.move_speed += main_weapon_list[_i][18]/10;
			
			attack.damage += main_weapon_list[_i][18]/5;
			
			attack.move_x = _wpnTarget.x;
	
			attack.move_y = _wpnTarget.y;
	
			attack.create_x = x+_wpnOffX;
	
			attack.create_y = y+_wpnOffY;
	
			attack.if_ready = true;
			
			attack.target = target;
					
			attack.speed = attack.move_speed;
			
			attack.direction = point_direction(attack.create_x, attack.create_y, _wpnTarget.x, _wpnTarget.y);
			
			attack.image_angle = attack.direction;
			
			main_weapon_list[_i][17] = -1;
		}
		else if(main_weapon_list[_i][17] == 50*10)
		{
			//create our projectile, then pass the information to it
			var attack = instance_create_layer(x+_wpnOffX, y+_wpnOffY, "instances", main_weapon_list[_i][0]);
			
			attack.owner = self.id;
			
			attack.faction_number = faction_number;
			
			attack.range += 10 * main_weapon_list[_i][18];
			
			attack.move_speed += main_weapon_list[_i][18]/10;
			
			attack.damage += main_weapon_list[_i][18]/5;
	
			attack.create_x = x+_wpnOffX;
	
			attack.create_y = y+_wpnOffY;
	
			attack.if_ready = true;
			
			attack.target = target;
					
			attack.speed = attack.move_speed;
			
			attack.direction = _wpnShootAngle + 90;
			
			attack.image_angle = attack.direction;
			
			main_weapon_list[_i][17] = -1;
		}
		*/
	}
}

if(hasShield && shieldHealth > 0)
{
	//draw_sprite(Shield, 0, x, y,);
	
	draw_sprite_ext(shieldSprite, 0, x, y, 1.25 * sprite_height/shieldSpriteRadius, 1.25 * sprite_width/shieldSpriteRadius, image_angle - 90, c_white, 0.5 * (shieldHealth/maxShield));
}