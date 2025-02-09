/// @description Insert description here
// You can write your code in this editor

if(other.faction_number == faction_number)
{
	explodeSprite = invisible
	
	instance_destroy(self)
	
	ds_list_replace(global.metal, faction_number, ds_list_find_value(global.metal, faction_number) + fund)
}


