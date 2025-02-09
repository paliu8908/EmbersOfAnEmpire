/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

if(ds_list_find_value(global.energy, faction_number) >= ds_list_find_value(global.energyUsed, faction_number))
{
	
	spawn_counter--; 

	if(spawn_counter == 0)
	{
		var produced = instance_create_layer(rally_x, rally_y, "instances", spawn_type)
	
		produced.faction_number = faction_number;
		
		produced.moveXList = ds_list_create();
		produced.moveYList = ds_list_create();
		
		ds_list_clear(produced.moveXList);
		ds_list_clear(produced.moveYList);
		
		ds_list_add(produced.moveXList, x);
		ds_list_add(produced.moveYList, y);
		
		produced.move_x = x;
		produced.move_y = y;
		
		produced.if_move = 1;
		produced.fund = round(power(1.001,  point_distance(x, y, rally_x, rally_y)))
		
		if(ds_list_find_value(global.plans, faction_number) == "extraction")
		{
			produced.fund *= 1.5
		}
	
		produced.killReward = produced.fund * 2
	
		spawn_counter = spawn_time
	}
}

