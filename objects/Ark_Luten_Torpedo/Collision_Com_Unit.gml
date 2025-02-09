/// @description Insert description here
// You can write your code in this editor
if(other.faction_number != faction_number)
{
	other.hp -= damage - other.block;
	
	instance_destroy();
	
	instance_create_layer(x, y, "instances", explode)
}