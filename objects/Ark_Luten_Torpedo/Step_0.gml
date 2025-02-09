 /// @description Insert description here
// You can write your code in this editor
if(outPtx == -1 && outPty == -1 && instance_exists(target))
{
	//Calculate Angle to Target
	var angleToTarget = point_direction(x, y, target.x, target.y);
	
	//Adjust Angles when over cross
	
		
	//create variation
	outAngle = random_range(20, 45);
	
	
	/*
	if(!outAngle == 90 && !outAngle == 270)
	{
		outAngle += owner.direction;
	}*/
	
	
	var tarDist = distance_to_object(target) * 0.5;
	
	if(irandom_range(0, 1) == 1)
	{
		outAngle *= -1
	}
	
	var angle_to_pt = direction + outAngle


	outPtx = x + cos(degtorad(angle_to_pt)) * tarDist
	
	outPty = y - sin(degtorad(angle_to_pt)) * tarDist
	
	/*if(outPtx > 0 && outPty > 0)
	{
		outPtx = x - tarDist * cos(degtorad(xyAngle));
	
		outPty = y - tarDist * sin(degtorad(xyAngle));
	}
	else if(outPtx < 0 && outPty < 0)
	{
		outPtx = x - tarDist * cos(degtorad(xyAngle));
	
		outPty = y - tarDist * sin(degtorad(xyAngle));
	}
	else
	{
		outPtx = x + tarDist * cos(degtorad(xyAngle));
	
		outPty = y + tarDist * sin(degtorad(xyAngle));
	}*/
}

if(if_ready && instance_exists(target))
{
	if(!reachedOutPt)
	{

		var _angleDiff = direction - point_direction(x, y, outPtx, outPty);
		
		if(_angleDiff < -180)
		{
			_angleDiff += 360;
		}
		else if(_angleDiff > 180)
		{
			_angleDiff -= 360;
		}
		
		if(abs(_angleDiff) <= turnAmount)
		{
			direction = point_direction(x, y, outPtx, outPty);
		}
		
		else if(_angleDiff < 0)
		{
			direction += turnAmount;
		}
		else if(_angleDiff > 0)
		{
			direction -= turnAmount;
		}
		
		if(distance_to_point(outPtx, outPty) < speed * 5)
		{
			reachedOutPt = true;
		}
	}
	else
	{
		var _angleDiff = direction - point_direction(x, y, target.x, target.y);
		
		if(_angleDiff < -180)
		{
			_angleDiff += 360;
		}
		else if(_angleDiff > 180)
		{
			_angleDiff -= 360;
		}
		
		if(abs(_angleDiff) <= turnAmount)
		{
			direction = point_direction(x, y, target.x, target.y);
		}
		
		else if(_angleDiff < 0)
		{
			direction += turnAmount;
		}
		else if(_angleDiff > 0)
		{
			direction -= turnAmount;
		}
	}
	
	image_angle = direction;
	
	/*if(instance_exists(target) && distance_to_object(target) < detonate_radius && faction_number != target.faction_number)
	{
		target.hp -= damage - target.block;
	
		instance_create_layer(x, y, "instances", explodeType);
	
		instance_destroy();
	}*/

	
	if(distance_to_object(target) > move_speed * (existingTime - timeAlive))
	{
		/*
		//passive scan for targets
		var enemies = ds_list_create();
	
		collision_circle_list(x, y, speed * (existingTime - timeAlive), com_unit, false, true, enemies, true)
	
		if(ds_list_size(enemies) != 0)
		{
			enemy_numbers = ds_list_size(enemies);
			
			for(var choices = 0; choices < enemy_numbers; choices++;)
			{

				var scan = ds_list_find_value(enemies, choices)
		
				if(instance_exists(scan) && scan.faction_number != self.faction_number && scan.type != "asteroid")
				{
					target = scan;
					
					self.move_x = target.x;
		
					self.move_y = target.y;

				}
			}
		}
		
		ds_list_destroy(enemies);
		*/
		
		target = 0;
	}
	
	/*
	var targetsInExplode = ds_list_create();
	
	collision_circle_list(x, y, detonate_radius, com_unit, false, true, targetsInExplode, true);

	for(var _allies = ds_list_size(targetsInExplode)-1; _allies >= 0 && ds_list_size(targetsInExplode) >0; _allies--)
	{
		if(ds_list_find_value(targetsInExplode, _allies).faction_number == faction_number)
		{
			ds_list_delete(targetsInExplode, _allies);
		}
	}

	if(ds_list_size(targetsInExplode) > 0)
	{
		for(var _units = 0; _units < ds_list_size(targetsInExplode); _units++)
		{
			var _trooper = ds_list_find_value(targetsInExplode, _units)

			if(faction_number != _trooper.faction_number)
			{
	
				if(_trooper.hasShield && _trooper.faction_number != faction_number)
				{
	
					if(_trooper.shieldHealth >= damage - _trooper.block)
					{
						_trooper.shieldHealth -= damage*_trooper.dmgReduction - _trooper.block;
					}
					else
					{
						_trooper.hp -= damage - _trooper.shieldHealth;
		
						_trooper.shieldHealth = 0;
		
					}
				}

				else if(_trooper.faction_number != faction_number && damage*_trooper.dmgReduction - _trooper.block > 0)
				{
	
					_trooper.hp -= damage*_trooper.dmgReduction - _trooper.block;
	
				}
		
			}
		
		}
		
		instance_create_layer(x, y, "instances", explodeType);
		
		instance_destroy();
		
		ds_list_destroy(targetsInExplode);
	}
	*/
}
//find targets if target does not exist
else if(if_ready)
{
	//passive scan for targets
	var enemies = ds_list_create();
	
	collision_circle_list(x, y, speed * (existingTime - timeAlive), com_unit, false, true, enemies, true)
	
	if(ds_list_size(enemies) != 0)
	{
		enemy_numbers = ds_list_size(enemies);
			
		for(var choices = 0; choices < enemy_numbers; choices++;)
		{

			var scan = ds_list_find_value(enemies, choices)
		
			if(instance_exists(scan) && scan.faction_number != self.faction_number)
			{
				target = scan;
					
				choices = enemy_numbers;

			}
		}
	}
	
	ds_list_destroy(enemies);
}


else if(if_ready == false && !instance_exists(owner))
{
	instance_destroy();
}

if(if_ready && hp <= 0)
{
	instance_destroy();

}
else if(if_ready)
{
	timeAlive++;	
	if(timeAlive >= existingTime)
	{
		instance_destroy();
	}
}



speed += speedIncrease;