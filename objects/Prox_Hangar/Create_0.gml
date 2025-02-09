  /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2				3			4			5	     6			7
	<Unit>, <production amount>, <metal price>, <energy price>	<Unit Name>	<Sprite> <Available> <Icon>
*/

unitData = [
			[Prox_Mech_Blitzer, 12, 90, 0, "Blitzer Mech", Blitzer, true, com_button_ability1.id,],					// 0
			[Prox_Mech_Brusier, 12, 100, 0, "Brusier Mech", Brusier, true, com_button_ability2.id,],
			[Prox_Mech_Gunner, 15, 120, 0, "Gunner Mech", Gunner, true, com_button_ability3.id,],					// 0
			[Prox_Mech_Arbalester, 15, 150, 0, "Arbalester Mech", Arbalester, true, com_button_ability4.id,]				// 1
			];
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

ds_list_add(buttons, com_button_ability1.id, com_button_ability2.id, com_button_ability3.id, com_button_ability4.id);

maxSprites = 0;

sprite = hangar;

selectSprite = hangar_select;

rally_x = x+ 75; 

rally_y = y;

if(module_num % 2 == 1)
{
	image_xscale = -1;	
}