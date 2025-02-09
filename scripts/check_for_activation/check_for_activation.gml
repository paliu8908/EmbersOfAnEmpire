// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_for_activation(_i){
	
	for(var _u = 0; _u < ds_list_size(global.primarySelect); _u++)
	{
		if(_i < array_length(ds_list_find_value(global.primarySelect, 0).abilities) )
		{
			var _uni = ds_list_find_value(global.primarySelect, _u);
		
			if(_uni.abilities[_i][1] == "speedbuff" || _uni.abilities[_i][1] == "LevelUp")
			{
				use_abilities(_i);
				obj_cursor.keyDown[_i] = false;
			
				break;
			}
		}
	}
}