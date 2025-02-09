/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{
	/*
	target = owner.target;
	
	if_ready = true;
	
	faction_number = owner.faction_number;*/
	
	image_angle = direction;

}
else if(!instance_exists(owner))
{
	instance_destroy();
}

if(if_ready)
{
	_wpnOffX = sqrt(sqr(turOffX)+sqr(turOffY)) * sin(degtorad((darctan2(turOffX, turOffY) + owner.direction)));
	_wpnOffY = sqrt(sqr(turOffX)+sqr(turOffY)) * cos(degtorad((darctan2(turOffX, turOffY) + owner.direction)));

	x = owner.x + _wpnOffX;
	y = owner.y + _wpnOffY;

	move_x = x + range * cos(degtorad(owner.direction));
	move_y = y - range * sin(degtorad(owner.direction));
	
	if(dmgCounter == 0)
	{
		dmgCounter = floor(damageTime* 60);
		
		ds_list_clear(hit);
		
		collision_line_list(x, y, move_x, move_y, com_unit, false, false, hit, true);
		
		hitUnit = ds_list_find_value(hit, 0);
		
		var check = 0;
			
		if(hitUnit == undefined)
		{
			hitUnit = 0;
		}
		
		while(check < ds_list_size(hit) && hitUnit.faction_number == faction_number)
		{
			ds_list_delete(hit, 0);
			
			hitUnit = ds_list_find_value(hit, 0);			
		}
		
		//dealing damage
		if(instance_exists(hitUnit))
		{
			DealDamageLaser(self, hitUnit);
		}
		
	}
	
	if(timeAlive >= existingTime* 60)
	{
		instance_destroy();
	
	}
	
	timeAlive++;
	
	dmgCounter--;
}