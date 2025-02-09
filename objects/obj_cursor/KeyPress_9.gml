/// @description Insert description here
// You can write your code in this editor
if(ds_list_size(global.selection) > ds_list_size(global.primarySelect))
{
	
	var _lastInstance = ds_list_find_value(global.primarySelect, ds_list_size(global.primarySelect)- 1);
	var _p = ds_list_find_index(global.selection, ds_list_find_value(global.primarySelect, ds_list_size(global.primarySelect)- 1));
	
	_p++;
	
	if(_p >= ds_list_size(global.selection))
	{
		_p = 0;
	}
	
	priority = ds_list_find_value(global.selection, _p).priority;
	
	ds_list_clear(global.primarySelect);
		
	while(ds_list_find_value(global.selection, _p).priority == priority)
	{
		ds_list_add(global.primarySelect, ds_list_find_value(global.selection, _p).id);
			
		_p++;
		
		if(_p >= ds_list_size(global.selection))
		{
			_p = 0;
		}
	}
	
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
		
	}
	
	//show UI
	ShowButtons(ds_list_find_value(global.primarySelect, 0));
}



