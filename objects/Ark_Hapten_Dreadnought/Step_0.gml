/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Decimating Barrage
if(abilities[0][9])
{
	var _angleDiff = direction - point_direction(x , y, abilityTargetx, abilityTargety);
	
	if(_angleDiff < -180)
	{
		_angleDiff += 360;
	}
	else if(_angleDiff > 180)
	{
		_angleDiff -= 360;
	}
			
	if(abs(_angleDiff) > 0)
	{
		if(abs(_angleDiff) < turnRadius)
		{
			direction = point_direction(x , y, abilityTargetx, abilityTargety);
		}
		else if(_angleDiff < 0)
		{
			direction += turnRadius;
		}
		else if(_angleDiff > 0)
		{
			direction -= turnRadius;
		}
	}
	else
	{
		direction = point_direction(x, y, abilityTargetx, abilityTargety);
	
		shootCounter++;
	
		if(shootCounter == abilities[0][7] * 60)
		{
			abilities[0][9] = false;
		
			shootCounter = 0;
			if_move = 0;
			
			abilityTargetx = 0;
			abilityTargety = 0;
		}
		else if(shootCounter % 15 == 0)
		{
			var _i = shootCounter % 60;
			_i /= 15;
			
			var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
			var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
			
			var radius = random_range(0, abilities[0][10]);
			var angle = random_range(0, 360);
		
			var target_x = abilityTargetx + cos(degtorad(angle)) * radius;
			var target_y = abilityTargety + sin(degtorad(angle)) * radius;
		
			shoot_ability(abilities[0][0], self, target_x, target_y, _wpnOffX, _wpnOffY);
		}
	}
}

//Creeping Barrage
else if(abilities[1][9])
{
	var _angleDiff = direction - point_direction(x , y, abilityTargetx, abilityTargety);
	
	if(_angleDiff < -180)
	{
		_angleDiff += 360;
	}
	else if(_angleDiff > 180)
	{
		_angleDiff -= 360;
	}
			
	if(abs(_angleDiff) > 0)
	{
		if(abs(_angleDiff) < turnRadius)
		{
			direction = point_direction(x , y, abilityTargetx, abilityTargety);
		}
		else if(_angleDiff < 0)
		{
			direction += turnRadius;
		}
		else if(_angleDiff > 0)
		{
			direction -= turnRadius;
		}
	}
	else
	{
		direction = point_direction(x, y, abilityTargetx, abilityTargety);
	
		shootCounter++;
	
		if(shootCounter == abilities[1][7] * 60)
		{
			abilities[1][9] = false;
		
			shootCounter = 0;
			if_move = 0;
			
			abilityTargetx = 0;
			abilityTargety = 0;
		}
		else if(shootCounter % 30 == 0)
		{
			var _distance = distance_to_point(abilityTargetx, abilityTargety) + 200 * ((shootCounter div 30) - 5);
		
			var target_x = abilityTargetx + _distance * cos(degtorad(direction));
			var target_y = abilityTargety - _distance * sin(degtorad(direction));
				
			for(var _i = 0; _i < 4; _i++)
			{
			
				var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
				var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
			
				var spread = (_i - 2) * 25;
				var inAngle = darctan2(spread, _distance);
				inAngle = point_direction(x, y, target_x, target_y) - inAngle;
				
				var _h = sqrt(sqr(spread) + sqr(_distance));
		
				var shoot_x = x + cos(degtorad(inAngle)) * _h;
				var shoot_y = y - sin(degtorad(inAngle)) * _h;
		
				shoot_ability(abilities[1][0], self, shoot_x, shoot_y, _wpnOffX, _wpnOffY);
			}
		}
	}
}

//Concetrated Barrage
else if(abilities[2][9])
{
	var _angleDiff = direction - point_direction(x , y, abilityTargetx, abilityTargety);
	
	if(_angleDiff < -180)
	{
		_angleDiff += 360;
	}
	else if(_angleDiff > 180)
	{
		_angleDiff -= 360;
	}
			
	if(abs(_angleDiff) > 0)
	{
		if(abs(_angleDiff) < turnRadius)
		{
			direction = point_direction(x , y, abilityTargetx, abilityTargety);
		}
		else if(_angleDiff < 0)
		{
			direction += turnRadius;
		}
		else if(_angleDiff > 0)
		{
			direction -= turnRadius;
		}
	}
	else
	{
		direction = point_direction(x, y, abilityTargetx, abilityTargety);
	
		shootCounter++;
	
		if(shootCounter == abilities[2][7] * 60)
		{
			abilities[2][9] = false;
		
			shootCounter = 0;
			if_move = 0;
			
			abilityTargetx = 0;
			abilityTargety = 0;
		}
		else if(shootCounter % 15 == 0)
		{
			var _i = shootCounter % 60;
			_i /= 15;
			
			var _wpnOffX = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * cos(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
			var _wpnOffY = sqrt(sqr(main_weapon_list[_i][16])+sqr(main_weapon_list[_i][15])) * sin(degtorad((darctan2(main_weapon_list[_i][16], main_weapon_list[_i][15]) + direction)));
			
			var radius = random_range(0, abilities[2][10]);
			var angle = random_range(0, 360);
		
			var target_x = abilityTargetx + cos(degtorad(angle)) * radius;
			var target_y = abilityTargety + sin(degtorad(angle)) * radius;
		
			shoot_ability(abilities[2][0], self, target_x, target_y, _wpnOffX, _wpnOffY);
		}
	}
}