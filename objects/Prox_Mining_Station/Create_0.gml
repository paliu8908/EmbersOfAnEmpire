/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2			3
	<unit>, <production amount>, <metal price>, <energy price>
*/
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

maxSprites = 0;

hasShield = false;

sprite = Mining_Station;

selectSprite = Mining_Station_Select;

weapon = Prox_Mining_Beam;

image_xscale = 0.5;
image_yscale = 0.5;