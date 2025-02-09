// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sortPriorities(listToSort){
	
	for(var i = 0; i < ds_list_size(listToSort)-1; i++)
	{
		var prev = ds_list_find_value(listToSort, i);
			
		var next = ds_list_find_value(listToSort, i+1);
			
		if(prev.priority < next.priority)	
		{
			ds_list_replace(listToSort, i, next);
			ds_list_replace(listToSort, i + 1, prev);
		}
			
		for(var u = i-1; u >= 0; u--)
		{
			var prev = ds_list_find_value(listToSort, u);
			
			var next = ds_list_find_value(listToSort, u+1);
			
			if(prev.priority < next.priority)
			{
				ds_list_replace(listToSort, u, next);
				ds_list_replace(listToSort, u + 1, prev);
			}
		}
	}
	
	return listToSort;
}