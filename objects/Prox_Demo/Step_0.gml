

if(timePassed % (frames * sec_per_min * waveTimes) == 0 && timePassed >= 0) //every minute
{
	
	for(var u = 0; u < ds_list_size(spawn_units) && instance_exists(Prox_Hegemon_Carrier); u++)
	{
		var mate = instance_create_layer(room_width - u * 100, room_height - floor(sqrt(u)) * 100, "instances", ds_list_find_value(spawn_units, u));
	
		ds_list_add(global.battlegroup1, mate);

		ds_list_clear(mate.moveXList);
		ds_list_clear(mate.moveYList);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x - 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y - 50);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x + 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y - 50);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x + 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y + 50);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x - 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y + 50);
		
		mate.if_move = 1;
		mate.patrol = true;
		mate.faction_number = ai_faction;
		
	}
	
	waveTimes -= 0.01;
	
	if(waveTimes <= 0.05)
	{
		waveTimes = 0.05;
	}
}

if(timePassed % (frames * sec_per_min * 2 * waveTimes) == 0 && timePassed >= frames * sec_per_min * 2) //every minute
{
	
	for(var u = 0; u < ds_list_size(spawn_units_wave2) && instance_exists(Prox_Hegemon_Carrier); u++)
	{
		var mate = instance_create_layer(500 + u * 100, room_height - floor(sqrt(u)) * 100, "instances", ds_list_find_value(spawn_units_wave2, u));
	
		ds_list_add(global.battlegroup1, mate);
		
		ds_list_clear(mate.moveXList);
		ds_list_clear(mate.moveYList);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x - 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y - 50);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x + 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y - 50);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x + 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y + 50);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x - 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y + 50);
		
		mate.if_move = 1;
		mate.patrol = true;
		mate.faction_number = ai_faction;
		
	}
}

if(timePassed % (frames * sec_per_min * 1.5 * waveTimes) == 0 && timePassed >= frames * sec_per_min * 1) //every minute
{
	
	for(var u = 0; u < ds_list_size(spawn_units_wave3); u++)
	{
		var mate = instance_create_layer(u * 100 + room_width div 2, room_height - floor(sqrt(u)) * 100, "instances", ds_list_find_value(spawn_units_wave3, u));
	
		ds_list_add(global.battlegroup2, mate);
		ds_list_clear(mate.moveXList);
		ds_list_clear(mate.moveYList);
		
		if(instance_exists(Prox_Mining_Station))
		{
			ds_list_add(mate.moveXList, Prox_Mining_Station.x);
			ds_list_add(mate.moveYList, Prox_Mining_Station.y);
		
			ds_list_add(mate.attackTargets, Prox_Mining_Station);
			mate.target = Prox_Mining_Station;
		
			mate.atkOrder = true;
		
			mate.if_move = 3;
			mate.patrol = false;
			mate.faction_number = ai_faction;
		}
		else if(instance_exists(Ark_HQ))
		{
			ds_list_clear(mate.moveXList);
			ds_list_clear(mate.moveYList);
		
			ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x - 50);
			ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y - 50);
		
			ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x + 50);
			ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y - 50);
		
			ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x + 50);
			ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y + 50);
		
			ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x - 50);
			ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y + 50);
		
			mate.if_move = 1;
			mate.patrol = true;
			mate.faction_number = ai_faction;
			ds_list_add(global.battlegroup1, mate);
		}
		
	}
}

if(timePassed % (frames * sec_per_min * 1.5 * waveTimes) == 0 && timePassed >= frames * sec_per_min * 3) //every minute
{
	
	for(var u = 0; u < ds_list_size(spawn_units_wave4) && instance_exists(Prox_Hegemon_Carrier); u++)
	{
		var mate = instance_create_layer(u * 100 + room_width div 2, room_height - floor(sqrt(u)) * 100, "instances", ds_list_find_value(spawn_units_wave4, u));
	
		ds_list_add(global.battlegroup1, mate);
		
		ds_list_clear(mate.moveXList);
		ds_list_clear(mate.moveYList);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x - 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y - 50);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x + 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y - 50);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x + 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y + 50);
		
		ds_list_add(mate.moveXList, Prox_Hegemon_Carrier.x - 50);
		ds_list_add(mate.moveYList, Prox_Hegemon_Carrier.y + 50);
		
		mate.if_move = 1;
		mate.patrol = true;
		mate.faction_number = ai_faction;
		
	}
}

if(timePassed % (frames * sec_per_min * 3) == 0 && timePassed > frames * sec_per_min * 3.5)
{
	ds_list_clear(spawn_units);

	ds_list_add(spawn_units,  Prox_Morningstar_Fighter, Prox_Morningstar_Fighter, Prox_Morningstar_Fighter, Prox_Morningstar_Fighter);
	ds_list_add(spawn_units_wave3, Prox_Reaper_3Rate, Prox_Ambition_3Rate, Prox_Reaper_3Rate, Prox_Ambition_3Rate);
	ds_list_add(spawn_units_wave4, Prox_Catalyst_Raider);
}

else if(timePassed % (frames * sec_per_min * 2) == 0 && timePassed > frames * sec_per_min) //every three minutes, additional 2 swords spawn;
{
	ds_list_add(spawn_units, Prox_Sword_Fighter, Prox_Sword_Fighter, Prox_Sword_Fighter, Prox_Sword_Fighter);
	
	randomize();
	
	if(irandom(2) < 0.5)
	{
		ds_list_add(spawn_units, Prox_Sld_Tanker, Prox_Sld_Tanker);
	}
	
	if(irandom(2) < 0.5)
	{
		ds_list_add(spawn_units, Prox_Broadsword_Gunship, Prox_Broadsword_Gunship);
	}
	
}

for(var e = 0; e < ds_list_size(global.battlegroup1); e++)
{
		
	var unit = ds_list_find_value(global.battlegroup1, e);
	
	if(!instance_exists(unit.target) && instance_exists(Prox_Hegemon_Carrier))
	{
		ds_list_clear(unit.moveXList);
		ds_list_clear(unit.moveYList);
		
		ds_list_add(unit.moveXList, Prox_Hegemon_Carrier.x - 50);
		ds_list_add(unit.moveYList, Prox_Hegemon_Carrier.y - 50);
		
		ds_list_add(unit.moveXList, Prox_Hegemon_Carrier.x + 50);
		ds_list_add(unit.moveYList, Prox_Hegemon_Carrier.y - 50);
		
		ds_list_add(unit.moveXList, Prox_Hegemon_Carrier.x + 50);
		ds_list_add(unit.moveYList, Prox_Hegemon_Carrier.y + 50);
		
		ds_list_add(unit.moveXList, Prox_Hegemon_Carrier.x - 50);
		ds_list_add(unit.moveYList, Prox_Hegemon_Carrier.y + 50);
		
		unit.if_move = 1;
		unit.patrol = true;
		unit.faction_number = ai_faction;
	}
		
	var possibleTargets = ds_list_create();
		
	collision_circle_list(unit.x, unit.y, unit.range * 3, com_unit, false, false, possibleTargets, false);
		
	var _ce = ds_list_size(possibleTargets);
		
	while(ds_list_size(possibleTargets) > 0 && unit.atkOrder = false)
	{
		var _checkU = ds_list_find_value(possibleTargets, 0);
			
		if(_checkU.type == "structure" || _checkU.type == "asteroid" || _checkU.faction_number == unit.faction_number)
		{
			ds_list_delete(possibleTargets, ds_list_find_index(possibleTargets, _checkU.id));
		}
		else
		{
			unit.target = _checkU;
				
			unit.atkOrder = true;
				
			unit.if_move = 3;
		}
	}
	
	ds_list_destroy(possibleTargets);
		
}



timePassed++;

if(!instance_exists(Prox_Hegemon_Carrier))
{
	room_goto(Defeat);
}
else if(timePassed >= frames * sec_per_min * 25)
{
	room_goto(win);
}