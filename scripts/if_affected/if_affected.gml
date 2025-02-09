// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function if_affected(effects, name){
	var ifEffected = false;
			
	for(var e = 0; e < array_length(effects); e++)
	{
		if(string_starts_with(effects[e][0], name))
		{
			ifEffected = true;
		}
	}
	
	return ifEffected;
}