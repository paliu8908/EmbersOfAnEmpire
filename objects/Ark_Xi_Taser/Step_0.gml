/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{
	
	if_ready = true;
	
	faction_number = owner.faction_number;

}
else if(!instance_exists(owner))
{
	instance_destroy();
}
else if(if_ready && !instance_exists(target))
{
	instance_destroy();
}
else if(if_ready && abs(point_direction(owner.x, owner.y, target.x, target.y) - owner.direction) > fireAngle)
{
	instance_destroy();
}

else if(if_ready)
{
	
	x = owner.x;
	
	y = owner.y;
	
	if(timeAlive >= existingTime* 60)
	{
		instance_destroy();
	}
	
	timeAlive++;
}