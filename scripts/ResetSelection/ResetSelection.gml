// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ResetSelection(){
	for(var j = 0; j < ds_list_size(global.selection); j++)
	{
		var _unit = ds_list_find_value(global.selection, j);
		
		_unit.if_select = false;
		global.unitInfo = "";
		
		for (var reset = 0 ; reset < instance_number(com_button_actor); reset++)
		{
			com_button_actor.slot = -1;
		}
		
		for (var reset = 0 ; reset < instance_number(com_button_actor_produce); reset++)
		{
			com_button_actor_produce.topsprite = 0;
			
			if(ds_list_find_index(global.factions, "player") == 1)
			{
				com_button_actor_produce.sprite = icon_Prox_Base;
			}

			else {
				com_button_actor_produce.sprite = icon_Ark_Base;
			}
			
			com_button_actor_produce.if_able = true;
		
		}
		
	}
	
	ds_list_clear(global.selection);
}