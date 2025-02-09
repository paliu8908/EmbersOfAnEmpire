/// @description Insert description here
// You can write your code in this editor
//Only add units to selection
if(keyboard_check(vk_shift))
{
	for(var i = 0; i < ds_list_size(global.selection); i++)
	{
		if(ds_list_find_index(global.squad0, ds_list_find_value(global.selection, i)) == -1)
		{
			ds_list_add(global.squad0, ds_list_find_value(global.selection, i));
		}
	}
}
//copy to selection
else if(keyboard_check(vk_control))
{
	ds_list_clear(global.squad0);
	
	ds_list_copy(global.squad0, global.selection);
}

//add to selection
if(ds_list_size(global.squad0) > 0)
{
	
	ResetSelection();
	
	for(var i = 0; i < ds_list_size(global.squad0); i++)
	{
		var _troop = ds_list_find_value(global.squad0, i);
		
		_troop.if_select = true;
		
		ds_list_add(global.selection, _troop);
	}

	ds_list_clear(global.primarySelect);
	
	if(ds_list_size(global.selection) > 1)
	{
		global.selection = sortPriorities(global.selection);
	}
	
	//choose primary selection
	if(ds_list_size(global.selection) > 0)
	{
		
		//add to primary select all units of same type
		priority = ds_list_find_value(global.selection, 0).priority;
		
		var _p = 0;
		
		while(_p < ds_list_size(global.selection) && ds_list_find_value(global.selection, _p).priority == priority)
		{
			ds_list_add(global.primarySelect, ds_list_find_value(global.selection, _p).id);
			
			_p++;
		}
		
		//show UI
		ShowButtons(ds_list_find_value(global.primarySelect, 0));
	}
	 
}