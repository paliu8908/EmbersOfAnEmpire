/// @description Insert description here
// You can write your code in this editor

if(faction_number == ds_list_find_index(global.factions, "ai"))
{
	ds_list_delete(global.battlegroup1, ds_list_find_index(global.battlegroup1, self.id));
	ds_list_delete(global.battlegroup2, ds_list_find_index(global.battlegroup2, self.id));
}

if(ds_list_find_index(global.selection, self.id) != -1 && ds_list_size(global.selection) > 1)
{
	for(var reset = 0 ; reset < instance_number(com_button_actor); reset++)
	{
		com_button_actor.slot = -1;
		
	}
	
	for(var reset = 0 ; reset < instance_number(com_button_actor_produce); reset++)
	{
		com_button_actor_produce.topsprite = 0;
		com_button_actor_produce.sprite = icon_Ark_Base;
		
	}
	
	ds_list_delete(global.selection, ds_list_find_index(global.selection, self.id));
	ds_list_delete(global.primarySelect, ds_list_find_index(global.primarySelect, self.id));
	
	if(ds_list_size(global.selection) > 0)
	{
	
		ShowButtons(ds_list_find_value(global.primarySelect,0));
	}
}

ds_list_delete(global.squad0, ds_list_find_index(global.squad0, self.id));
ds_list_delete(global.squad1, ds_list_find_index(global.squad1, self.id));
ds_list_delete(global.squad2, ds_list_find_index(global.squad2, self.id));
ds_list_delete(global.squad3, ds_list_find_index(global.squad3, self.id));
ds_list_delete(global.squad4, ds_list_find_index(global.squad4, self.id));
ds_list_delete(global.squad5, ds_list_find_index(global.squad5, self.id));
ds_list_delete(global.squad6, ds_list_find_index(global.squad6, self.id));
ds_list_delete(global.squad7, ds_list_find_index(global.squad7, self.id));
ds_list_delete(global.squad8, ds_list_find_index(global.squad8, self.id));
ds_list_delete(global.squad9, ds_list_find_index(global.squad9, self.id));

ds_list_destroy(moveXList);
ds_list_destroy(moveYList);
ds_list_destroy(attackTargets);
ds_list_destroy(buttons);
ds_list_destroy(placement);