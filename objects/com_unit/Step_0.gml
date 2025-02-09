/// @description Insert description here
// You can write your code in this editor

//Standard Actions

/*var quivers = ds_list_create();

collision_circle_list(x, y, 300, Prox_Quiver_Support, false, false, quivers, false);

var q = ds_list_find_value(quivers, 0);		

while(0 < ds_list_size(quivers) && instance_exists(q) && q.faction_number != faction_number)
{
	ds_list_delete(quivers, 0);
			
	var q = ds_list_find_value(quivers, 0);
}

if(instance_exists(q) && q.faction_number == faction_number)
{
	var quiv = ds_list_find_value(quivers, 0);
		
	if(quiv.faction_number == faction_number)
	{
		acceleration = max(q.move_speed, quiv.accelerationIncreaseTo);
			
		move_speed = max(q.move_speed, quiv.speedIncreaseTo);
			
		reload_time = standReload - reload_time * quiv.reloadIncrease;
		
		ifQuivSup = true;
	}

}

else
{
	reload_time = standReload;
	
	move_speed =standMoveSpeed;
	
	acceleration = standAcceleration;
	
	ifQuivSup = false;
}

ds_list_destroy(quivers);*/

if(combatlessCounter >= 30 * 5)
{
	outOfCombat = true;
	
	combatlessCounter = 0;
}


if(collision_circle(x, y, max(sprite_width, sprite_height) * 5, com_projectile, false, false))
{
	outOfCombat = false;
	
	combatlessCounter = 0;
}
else
{
	combatlessCounter++;
}

/*if(stun)
{
	stunnedCounter--;
	
	if(stunnedCounter == 0)
	{
		stunnedCounter = 0;
		stun = false; 
	}
}*/

ResolveAbilities(self);
ResolveEffects(self);