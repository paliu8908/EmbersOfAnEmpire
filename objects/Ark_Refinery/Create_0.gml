/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

/*		0			1					2			3
	<unit>, <production amount>, <metal price>, <energy price>
*/

unitData = [
			[Ark_Tau_Miner, 50, 400, 20, "Tau Miner", Tau_Miner, true, com_button_ability1.id]
			];
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

ds_list_add(buttons, com_button_ability1.id);

maxSprites = 0;

sprite = Refinery;

selectSprite = Refinery_Select;

rally_x = x;

rally_y = y - 100;

//Spawn Miner
var produced = instance_create_layer(x, y, "instances", Ark_Tau_Miner);
		
ds_list_clear(produced.moveXList);
ds_list_clear(produced.moveYList);
		
ds_list_add(produced.moveXList, rally_x);
ds_list_add(produced.moveYList, rally_y);
		
produced.move_x = rally_x;
produced.move_y = rally_y;
		
produced.if_move = 1;

//Update Tech Requirements for all HQs	
for(var i = 0; i < instance_number(Ark_HQ); i++)
{
	
	var _u = instance_find(Ark_HQ, i);
	
	if(_u.faction_number == faction_number)
	{
		_u.unitData[0, 4] = true;
		_u.unitData[3, 4] = true;
	}
}