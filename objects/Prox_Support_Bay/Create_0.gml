   /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2				3			4			5	     6			7
	<Unit>, <production amount>, <metal price>, <energy price>	<Unit Name>	<Sprite> <Available> <Icon>
*/

unitData = [
			
			];
			
minimapIcon = icon_light_structure;


ds_list_clear(buttons);
/*
ds_list_add(buttons, com_button_ability1.id, com_button_ability2.id, com_button_ability3.id, com_button_ability4.id);
*/
maxSprites = 0;

sprite = support_bay;

selectSprite = support_bay_select;

rally_x = x+ 75; 

rally_y = y;

if(module_num % 2 == 1)
{
	image_xscale = -1;	
}

repair_amount = 15;
energy_amount = 1;

weapon = Prox_Support_Taser